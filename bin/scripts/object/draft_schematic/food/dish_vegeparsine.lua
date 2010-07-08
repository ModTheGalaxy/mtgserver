--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 


object_draft_schematic_food_dish_vegeparsine = object_draft_schematic_food_shared_dish_vegeparsine:new {

   groupName = "craftFoodDishGroupD", -- Group schematic is awarded in (See skills table)

   craftingToolTab = 4, -- (See DraftSchemticImplementation.h)
   complexity = 12, 
   size = 1, 

   xpType = "crafting_food_general", 
   xp = 80, 

   assemblySkill = "food_assembly", 
   experimentingSkill = "food_experimentation", 

   ingredientTemplateNames = {"craft_food_ingredients_n", "craft_food_ingredients_n", "craft_food_ingredients_n", "craft_food_ingredients_n"},
   ingredientTitleNames = {"veghash", "tuber_filling", "shell_glaze", "additive"},
   ingredientSlotType = {2, 0, 2, 4},
   resourceTypes = {"object/tangible/food/crafted/shared_dish_veghash.iff", "vegetable_tubers", "object/tangible/component/food/shared_ingredient_carbosyrup.iff", "object/tangible/food/crafted/additive/shared_additive_heavy.iff"},
   resourceQuantities = {1, 20, 1, 1},
   combineTypes = {1, 0, 1, 1},
   contribution = {100, 100, 100, 100},

   numberExperimentalProperties = {1, 1, 1, 2, 2, 2, 2},
   experimentalProperties = {"XX", "XX", "XX", "OQ", "PE", "FL", "OQ", "DR", "PE", "DR", "OQ"},
   experimentalWeights = {1, 1, 1, 1, 2, 2, 1, 1, 3, 3, 1},
   experimentalGroupTitles = {"null", "null", "null", "exp_nutrition", "exp_flavor", "exp_quantity", "exp_filling"},
   experimentalSubGroupTitles = {"null", "null", "hitpoints", "nutrition", "flavor", "quantity", "filling"},
   experimentalMin = {0, 0, 1000, 75, 60, 60, 80},
   experimentalMax = {0, 0, 1000, 120, 120, 100, 120},
   experimentalPrecision = {0, 0, 0, 10, 10, 10, 10},

   tanoCRC = 3165654623, -- Script: 'object/tangible/food/crafted/dish_vegeparsine.iff'
}
ObjectTemplates:addTemplate(object_draft_schematic_food_dish_vegeparsine, "object/draft_schematic/food/dish_vegeparsine.iff")
