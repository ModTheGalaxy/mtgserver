#include "gtest/gtest.h"
#include "templates/appearance/MeshAppearanceTemplate.h"

#include <cstring>
#include <string>

namespace {
std::string littleEndian(uint32 value, int bytes = 4) {
	std::string result;
	for (int i = 0; i < bytes; ++i)
		result += static_cast<char>((value >> (8 * i)) & 0xff);
	return result;
}

std::string chunk(const std::string& tag, const std::string& contents) {
	uint32 size = contents.size();
	std::string result = tag;
	for (int i = 3; i >= 0; --i)
		result += static_cast<char>((size >> (8 * i)) & 0xff);
	return result + contents;
}

std::string form(const std::string& tag, const std::string& contents) {
	return chunk("FORM", tag + contents);
}

std::string meshFile(bool legacy, const std::string& vertexVersion) {
	std::string vertices;
	const float coordinates[] = {0, 0, 0, 1, 0, 0, 0, 1, 0};
	for (float coordinate : coordinates) {
		uint32 bits;
		std::memcpy(&bits, &coordinate, sizeof(bits));
		vertices += littleEndian(bits);
	}
	std::string vertexArray = form("VTXA", form(vertexVersion,
			chunk("INFO", littleEndian(1) + littleEndian(3)) + chunk("DATA", vertices)));
	std::string indices = legacy
			? littleEndian(0) + littleEndian(1) + littleEndian(2)
			: littleEndian(3) + littleEndian(0, 2) + littleEndian(1, 2) + littleEndian(2, 2);
	std::string shader = chunk("NAME", std::string("test.sht\0", 9)) + chunk("INFO", littleEndian(1))
			+ form("0001", chunk("INFO", littleEndian(9)) + vertexArray + chunk("INDX", indices));
	std::string shaders = form("SPS ", form(legacy ? "0000" : "0001",
			chunk("CNT ", littleEndian(1)) + form("0001", shader)));
	std::string appearance = legacy ? "" : form("APPR", form("0003",
			form("NULL", "") + form("NULL", "") + form("HPTS", "")
			+ form("FLOR", chunk("DATA", std::string(1, '\0')))));
	std::string bounds = chunk("CNTR", std::string(12, '\0')) + chunk("RADI", littleEndian(0));
	return form("MESH", form(legacy ? "0003" : "0005", appearance + shaders + (legacy ? bounds : "")));
}

void checkMesh(bool legacy) {
	std::string data = meshFile(legacy, legacy ? "0002" : "0003");
	IffStream stream;
	ASSERT_TRUE(stream.parseChunks(reinterpret_cast<uint8*>(&data[0]), data.size(), "test.msh"));
	MeshAppearanceTemplate mesh;
	ASSERT_NO_THROW(mesh.readObject(&stream));
	ASSERT_EQ(1, mesh.getMeshes().size());
	const MeshData* geometry = mesh.getMeshes().get(0);
	ASSERT_EQ(3, geometry->getVerts()->size());
	EXPECT_FLOAT_EQ(1, geometry->getVerts()->get(1).getX());
	EXPECT_FLOAT_EQ(1, geometry->getVerts()->get(2).getY());
	ASSERT_EQ(1, geometry->getTriangles()->size());
	const int* indices = geometry->getTriangles()->get(0).getVerts();
	EXPECT_EQ(0, indices[0]);
	EXPECT_EQ(1, indices[1]);
	EXPECT_EQ(2, indices[2]);
	ASSERT_NE(nullptr, mesh.getAABBTree());
	ASSERT_NE(nullptr, mesh.getBoundingSphere());
	EXPECT_FLOAT_EQ(0.5f, mesh.getBoundingSphere()->getCenter().getX());
	EXPECT_FLOAT_EQ(0.5f, mesh.getBoundingSphere()->getCenter().getY());
	EXPECT_EQ(0, stream.getRemainingSubChunksNumber());
}
}

TEST(MeshAppearanceTemplateTest, ReadsLegacyMeshGeometryAndBuildsCollisionBounds) {
	checkMesh(true);
}

TEST(MeshAppearanceTemplateTest, PreservesModernMeshGeometryAndCollisionBounds) {
	checkMesh(false);
}

TEST(MeshAppearanceTemplateTest, RejectsUnsupportedVertexLayout) {
	std::string data = meshFile(true, "9999");
	IffStream stream;
	ASSERT_TRUE(stream.parseChunks(reinterpret_cast<uint8*>(&data[0]), data.size(), "unsupported.msh"));
	MeshAppearanceTemplate mesh;
	EXPECT_THROW(mesh.readObject(&stream), Exception);
}
