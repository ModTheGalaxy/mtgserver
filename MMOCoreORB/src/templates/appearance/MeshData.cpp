/*
 * MeshData.h
 *
 *  Created on: 04/22/2016
 *      Author: gslomin
 */

#include "MeshData.h"

AABB MeshData::buildAABB() const {
	float minx = 100000;
	float miny = 100000;
	float minz = 100000;

	float maxx = -1000000;
	float maxy = -1000000;
	float maxz = -1000000;

	for (int i = 0; i < vertices.size(); i++) {
		const Vector3& vert = vertices.getUnsafe(i);
		const float x = vert.getX();
		const float y = vert.getY();
		const float z = vert.getZ();

		if (x < minx)
			minx = x;

		if (y < miny)
			miny = y;

		if (z < minz)
			minz = z;

		if (x > maxx)
			maxx = x;

		if (y > maxy)
			maxy = y;

		if (z > maxz)
			maxz = z;
	}

	return AABB(Vector3(minx, miny, minz), Vector3(maxx, maxy, maxz));
}

Vector <MeshTriangle>* MeshData::getMeshWithinBounds(AABB& bounds) const {
	float bminx = bounds.getXMin();
	float bminy = bounds.getYMin();
	float bminz = bounds.getZMin();

	float bmaxx = bounds.getXMax();
	float bmaxy = bounds.getYMax();
	float bmaxz = bounds.getZMax();

	Vector <MeshTriangle>* tris = new Vector<MeshTriangle>();

	for (int i = 0; i < triangles.size(); i++) {
		const MeshTriangle& tri = triangles.getUnsafe(i);
		const int* v = tri.getVerts();
		float minx = 30000;
		float miny = 30000;
		float minz = 30000;

		float maxx = -30000;
		float maxy = -30000;
		float maxz = -30000;

		for (int i = 0; i < 3; i++) {
			const Vector3& vert = vertices.get(v[i]);
			const float x = vert.getX();
			const float y = vert.getY();
			const float z = vert.getZ();

			if (x > maxx)
				maxx = x;

			if (y > maxy)
				maxy = y;

			if (z > maxz)
				maxz = z;

			if (x < minx)
				minx = x;

			if (y < miny)
				miny = y;

			if (z < minz)
				minz = z;
		}
		if (maxx >= bminx && minx <= bmaxx && maxy >= bminy && miny <= bmaxy && maxz >= bminz && minz <= bmaxz)
			tris->add(tri);
	}

	return tris;
}

void MeshData::readObject(IffStream* iffStream) {
	iffStream->openForm('VTXA');
	uint32 version = iffStream->getNextFormType();
	if (version != '0002' && version != '0003')
		throw Exception("Unsupported VTXA version in " + iffStream->getFileName());
	iffStream->openForm(version);
	iffStream->openChunk('INFO');

	iffStream->getInt(); //unk

	int numVertices = iffStream->getInt();

	iffStream->closeChunk();

	Chunk* vertexDataChunk = iffStream->openChunk('DATA');

	int vertexDataChunkSize = vertexDataChunk->getChunkSize();

	int intBytesPerVertex = vertexDataChunkSize / numVertices;

	vertices.removeAll(numVertices);

	for (int i = 0; i < numVertices; ++i) {
		vertices.emplace(iffStream->getVector3());

		vertexDataChunk->shiftOffset(intBytesPerVertex - 12);
	}

	iffStream->closeChunk('DATA');
	iffStream->closeForm(version);
	iffStream->closeForm('VTXA');

	Chunk* indexData = iffStream->openChunk('INDX');

	// VTXA 0002 meshes have uncounted 32-bit indices; 0003 uses counted 16-bit indices.
	bool legacyIndices = version == '0002';
	if (legacyIndices && indexData->getChunkSize() % (3 * sizeof(uint32)) != 0)
		throw Exception("Invalid legacy mesh index data in " + iffStream->getFileName());
	int indexCount = legacyIndices ? indexData->getChunkSize() / sizeof(uint32) : iffStream->getInt();

	triangles.removeAll(indexCount / 3);

	for (int i = 1; i <= indexCount; i += 3) {
		int a = legacyIndices ? iffStream->getInt() : indexData->readShort();
		int b = legacyIndices ? iffStream->getInt() : indexData->readShort();
		int c = legacyIndices ? iffStream->getInt() : indexData->readShort();

		MeshTriangle triangle;
		triangle.verts[0] = a;
		triangle.verts[1] = b;
		triangle.verts[2] = c;

		triangles.add(triangle);
	}

	iffStream->closeChunk();
}
