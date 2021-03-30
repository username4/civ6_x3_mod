---------------------------------------------------------
---------------------------------------------------------
-- Babylon
---------------------------------------------------------
---------------------------------------------------------

-- SABUM_KIBITTUM

UPDATE ModifierArguments
SET Value = 34
WHERE Name = 'Amount'
AND ModifierId = 'SABUM_KIBITTUM_ANTI_CAVALRY';

UPDATE Units
SET BaseMoves=5, BaseSightRange=5
WHERE UnitType="UNIT_BABYLONIAN_SABUM_KIBITTUM";

-- Palgum 

UPDATE Buildings
SET Housing = Housing*3
WHERE BuildingType="BUILDING_PALGUM";

UPDATE Building_YieldChanges
SET YieldChange = (YieldChange-1)*3+1
WHERE BuildingType="BUILDING_PALGUM";

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'PALGUM_ADDFOOD';

-- Ninu Ilu Sirum, some of its function is implemented with lua

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_FREE_ENVOY_WHEN_DISTRICT_MADE_SPECIFIC';


---------------------------------------------------------
---------------------------------------------------------
-- Ethiopian
---------------------------------------------------------
---------------------------------------------------------

-- Aksumite Legacy

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_FAITH_RESOURCES';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId LIKE 'TRAIT_FAITH_%_RESOURCES_TRADE_INTERNATIONAL';

-- Oromo Cavalry
UPDATE Units
SET BaseSightRange=(BaseSightRange-2)*3+2, Combat=44+5
WHERE UnitType="UNIT_ETHIOPIAN_OROMO_CAVALRY";

UPDATE Units_XP2
SET ResourceCost="2"
WHERE UnitType="UNIT_ETHIOPIAN_OROMO_CAVALRY";

-- Rock-Hewn Church
UPDATE Adjacency_YieldChanges
SET YieldChange=YieldChange*3
WHERE ID LIKE "Hills_Faith%";

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange*3
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH";

UPDATE Improvement_Tourism
SET ScalingFactor=ScalingFactor*3
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH";

UPDATE Improvements
SET Appeal=Appeal*3
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH";

-- Council of Ministers

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId LIKE 'TRAIT_FAITH_INTO_%_HILLS';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'MENELIK_HILLS_COMBAT';

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain)
VALUES ("Mountain_Faith10","Placeholder","YIELD_FAITH","3","1","TERRAIN_GRASS_MOUNTAIN"),
("Mountain_Faith20","Placeholder","YIELD_FAITH","3","1","TERRAIN_PLAINS_MOUNTAIN"),
("Mountain_Faith30","Placeholder","YIELD_FAITH","3","1","TERRAIN_DESERT_MOUNTAIN"),
("Mountain_Faith40","Placeholder","YIELD_FAITH","3","1","TERRAIN_TUNDRA_MOUNTAIN"),
("Mountain_Faith50","Placeholder","YIELD_FAITH","3","1","TERRAIN_SNOW_MOUNTAIN");

UPDATE Improvement_Adjacencies
SET YieldChangeId="Mountain_Faith10"
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH" AND YieldChangeId="Mountain_Faith1";

UPDATE Improvement_Adjacencies
SET YieldChangeId="Mountain_Faith20"
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH" AND YieldChangeId="Mountain_Faith2";

UPDATE Improvement_Adjacencies
SET YieldChangeId="Mountain_Faith30"
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH" AND YieldChangeId="Mountain_Faith3";

UPDATE Improvement_Adjacencies
SET YieldChangeId="Mountain_Faith40"
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH" AND YieldChangeId="Mountain_Faith4";

UPDATE Improvement_Adjacencies
SET YieldChangeId="Mountain_Faith50"
WHERE ImprovementType="IMPROVEMENT_ROCK_HEWN_CHURCH" AND YieldChangeId="Mountain_Faith5";

---------------------------------------------------------
---------------------------------------------------------
-- Byzantine
---------------------------------------------------------
---------------------------------------------------------
--Taxis
UPDATE ModifierArguments
SET Value = 8
WHERE Name = 'Amount'
AND ModifierId = 'BYZANTIUM_COMBAT_HOLY_CITIES';

UPDATE ModifierArguments
SET Value = 8
WHERE Name = 'Amount'
AND ModifierId = 'BYZANTIUM_RELIGIOUS_COMBAT_HOLY_CITIES';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'BYZANTIUM_GREATPROPHETPOINTS';


-- Tagma 

UPDATE Units_XP2
SET ResourceCost="1"
WHERE UnitType="UNIT_BYZANTINE_TAGMA";

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'TAGMA_RELIGIOUS_COMBAT';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'TAGMA_COMBAT_STRENGTH';

-- DROMON

UPDATE Units
SET Range=(Range-1)*3+1
WHERE UnitType="UNIT_BYZANTINE_DROMON";

UPDATE ModifierArguments
SET Value = 23
WHERE Name = 'Amount'
AND ModifierId = 'DROMON_COMBAT_STRENGTH_AGAINST_UNITS';

-- Hippodrome 
UPDATE Districts
SET Entertainment = (Entertainment-1)*3+1
WHERE DistrictType="DISTRICT_HIPPODROME";

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ("TRAIT_CIVILIZATION_DISTRICT_HIPPODROME", "TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY1"),
("TRAIT_CIVILIZATION_DISTRICT_HIPPODROME", "TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY2"),
("TRAIT_CIVILIZATION_DISTRICT_HIPPODROME", "TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY3");

INSERT INTO Modifiers(ModifierId, ModifierType)
VALUES("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY1","MODIFIER_PLAYER_DISTRICT_ADJUST_PLAYER_DISTRICT_AND_BUILDINGS_CREATE_UNIT_WITH_ABILITY_BY_CLASS"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY2","MODIFIER_PLAYER_DISTRICT_ADJUST_PLAYER_DISTRICT_AND_BUILDINGS_CREATE_UNIT_WITH_ABILITY_BY_CLASS"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY3","MODIFIER_PLAYER_DISTRICT_ADJUST_PLAYER_DISTRICT_AND_BUILDINGS_CREATE_UNIT_WITH_ABILITY_BY_CLASS");

INSERT INTO ModifierArguments(ModifierId, Name, Value)
VALUES("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY1", "DistrictType", "DISTRICT_HIPPODROME"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY1", "UnitPromotionClass", "PROMOTION_CLASS_HEAVY_CAVALRY"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY1", "UnitAbilityType", "ABILITY_FREE_RESOURCE_MAITENANCE_HIPPODROME"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY2", "DistrictType", "DISTRICT_HIPPODROME"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY2", "UnitPromotionClass", "PROMOTION_CLASS_HEAVY_CAVALRY"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY2", "UnitAbilityType", "ABILITY_FREE_RESOURCE_MAITENANCE_HIPPODROME"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY3", "DistrictType", "DISTRICT_HIPPODROME"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY3", "UnitPromotionClass", "PROMOTION_CLASS_HEAVY_CAVALRY"),
("TRAIT_CREATE_HIPPODROME_HEAVY_CAVALRY3", "UnitAbilityType", "ABILITY_FREE_RESOURCE_MAITENANCE_HIPPODROME");

---------------------------------------------------------
---------------------------------------------------------
-- Gaul
---------------------------------------------------------
---------------------------------------------------------

-- Hallstatt Culture

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'ScalingFactor'
AND ModifierId = 'GAUL_MINE_TOURISM';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'GAUL_MINE_CULTURE';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAUL_%_ADJACENCY%';

-- King of the Eburones


UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'UnitProductionPercent'
AND ModifierId = 'TRAIT_GRANT_CULTURE_UNIT_TRAINED';


UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'AMBIORIX_NEIGHBOR_COMBAT';

-- Oppidum 

UPDATE Districts
SET Cost="7", HitPoints = HitPoints*3
WHERE DistrictType="DISTRICT_OPPIDUM";

UPDATE Adjacency_YieldChanges
SET YieldChange=(YieldChange-1)*3+1
WHERE ID="Quarry_Production2" OR ID="Strategic_Production2";

-- Gaesatae 
UPDATE ModifierArguments
SET Value = 23
WHERE Name = 'Amount'
AND ModifierId = 'GAESATAE_STRONG_AGAINST_STRONGER_UNITS';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'GAESATAE_STRONG_AGAINST_DISTRICTS';


---------------------------------------------------------
---------------------------------------------------------
-- Gran Colombian
---------------------------------------------------------
---------------------------------------------------------

-- Ejército Patriota

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'EJERCITO_PATRIOTA_EXTRA_MOVEMENT';

-- Campaña Admirable

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL1", "EraType", "ERA_CLASSICAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL2", "EraType", "ERA_CLASSICAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL3", "EraType", "ERA_CLASSICAL");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_CLASSICAL3");

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL1", "EraType", "ERA_MEDIEVAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL2", "EraType", "ERA_MEDIEVAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL3", "EraType", "ERA_MEDIEVAL");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MEDIEVAL3");

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE1", "EraType", "ERA_RENAISSANCE"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE2", "EraType", "ERA_RENAISSANCE"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE3", "EraType", "ERA_RENAISSANCE");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_RENAISSANCE3");


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL1", "EraType", "ERA_INDUSTRIAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL2", "EraType", "ERA_INDUSTRIAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL3", "EraType", "ERA_INDUSTRIAL");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INDUSTRIAL3");


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN1", "EraType", "ERA_MODERN"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN2", "EraType", "ERA_MODERN"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN3", "EraType", "ERA_MODERN");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_MODERN3");


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC1", "EraType", "ERA_ATOMIC"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC2", "EraType", "ERA_ATOMIC"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC3", "EraType", "ERA_ATOMIC");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_ATOMIC3");


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION1", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION2", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE"),
("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION3", "MODIFIER_PLAYER_ADJUST_GREAT_PERSON_GUARANTEE");

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION1", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION1", "EraType", "ERA_INFORMATION"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION2", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION2", "EraType", "ERA_INFORMATION"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION3", "GreatPersonClassType", "GREAT_PERSON_CLASS_COMANDANTE_GENERAL"),
 ("TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION3", "EraType", "ERA_INFORMATION");

INSERT INTO TraitModifiers(TraitType, ModifierId)
VALUES("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION1"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION2"),
("TRAIT_LEADER_CAMPANA_ADMIRABLE","TRAIT_LEADER_COMANDANTE_GENERAL_GUARANTEE_INFORMATION3");

-- Comandante General
UPDATE GreatPersonIndividuals
SET ActionCharges = ActionCharges*3
WHERE GreatPersonIndividualType LIKE "GREAT_PERSON_INDIVIDUAL_COMMANDANTE_%";

-- Llanero 

-- Gaesatae 
UPDATE ModifierArguments
SET Value = 5
WHERE Name = 'Amount'
AND ModifierId = 'LLANERO_ADJACENCY_STRENGTH';

UPDATE Units
SET Maintenance = 1
WHERE UnitType="UNIT_COLOMBIAN_LLANERO";

-- Hacienda 

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange*3
WHERE ImprovementType="IMPROVEMENT_HACIENDA";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID LIKE "%Hacienda%";

UPDATE Improvements
SET Housing = Housing*3
WHERE ImprovementType="IMPROVEMENT_HACIENDA";

---------------------------------------------------------
---------------------------------------------------------
-- Mayan 
---------------------------------------------------------
---------------------------------------------------------

-- Mayab
UPDATE RequirementArguments
SET Value = Value*3
WHERE Name = "MaxDistance"
AND RequirementId IN ("REQUIRES_OBJECT_6_TILES_FROM_CAPITAL", "REQUIRES_OBJECT_6_TILES_FROM_CAPITAL");

UPDATE RequirementArguments
SET Value = (Value-1)*3+1
WHERE Name = "MinDistance"
AND RequirementId = "REQUIRES_OBJECT_7_OR_MORE_TILES_FROM_CAPITAL";

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_MAYA_FARMS_PRODUCTION';

UPDATE ModifierArguments
SET Value = (Value-0.5)*3+0.5
WHERE Name = 'Amount'
AND ModifierId = 'FARM_HOUSING_WITH_MAYAB_TRAIT';

INSERT INTO Modifiers(ModifierId, ModifierType)
VALUES ("TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY1", "MODIFIER_PLAYER_UNITS_GRANT_ABILITY_GRANCOLOMBIA_MAYA"),
 ("TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY2", "MODIFIER_PLAYER_UNITS_GRANT_ABILITY_GRANCOLOMBIA_MAYA"),
 ("TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY3", "MODIFIER_PLAYER_UNITS_GRANT_ABILITY_GRANCOLOMBIA_MAYA");

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES("TRAIT_CIVILIZATION_MAYAB", "TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY1"),
("TRAIT_CIVILIZATION_MAYAB", "TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY2"),
("TRAIT_CIVILIZATION_MAYAB", "TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY3");

INSERT INTO ModifierArguments(ModifierId, Name, Value)
VALUES("TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY1","AddAmenity","True"),
("TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY2","AddAmenity","True"),
("TRAIT_ADD_AMENITY_PER_ADJACENT_LUXURY3","AddAmenity","True");

-- Ix Mutal Ajaw
UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_GAIN_YIELDS';


UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'MUTAL_NEAR_CAPITAL_COMBAT';

-- Hul'che
UPDATE Units
SET RangedCombat=25+8
WHERE UnitType = "UNIT_MAYAN_HULCHE";

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'HULCHE_BONUS_VS_WOUNDED_UNITS';

-- Observatory 
UPDATE Districts
SET Cost = "7"
WHERE DistrictType="DISTRICT_OBSERVATORY";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="Plantation_Science" or ID="Farm_Science";

---------------------------------------------------------
---------------------------------------------------------
-- Vietnamese 
---------------------------------------------------------
---------------------------------------------------------

-- Nine Dragon River Delta


UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION';

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE';

-- Drive Out The Aggressors

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId LIKE 'TRIEU_%_MOVEMENT';

UPDATE ModifierArguments
SET Value = 23
WHERE Name = 'Amount'
AND ModifierId = 'TRIEU_FRIENDLY_COMBAT';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'TRIEU_UNFRIENDLY_COMBAT';

-- Thành
UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="District_Culture_Major" ;

UPDATE Districts
SET Cost = "7"
WHERE DistrictType="DISTRICT_THANH";

-- Voi Chiến 

UPDATE Units
SET BaseMoves = (BaseMoves-2)*3+2, BaseSightRange=(BaseSightRange-2)*3+2, Combat = 30+13
WHERE UnitType="UNIT_VIETNAMESE_VOI_CHIEN";

---------------------------------------------------------
---------------------------------------------------------
-- Kublai Khan
---------------------------------------------------------
---------------------------------------------------------

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ("TRAIT_LEADER_KUBLAI", "TRAIT_ECONOMIC_GOVERNMENT_SLOT1"),
 ("TRAIT_LEADER_KUBLAI", "TRAIT_ECONOMIC_GOVERNMENT_SLOT2");

INSERT INTO Modifiers(ModifierId, ModifierType)
VALUES ("TRAIT_ECONOMIC_GOVERNMENT_SLOT1", "MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER"),
 ("TRAIT_ECONOMIC_GOVERNMENT_SLOT2", "MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER");

INSERT INTO ModifierArguments(ModifierId, Name, Value)
VALUES ("TRAIT_ECONOMIC_GOVERNMENT_SLOT1", "GovernmentSlotType", "SLOT_ECONOMIC"),
 ("TRAIT_ECONOMIC_GOVERNMENT_SLOT2", "GovernmentSlotType", "SLOT_ECONOMIC");

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId LIKE 'TRAIT_TRADING_POST_%_BOOST';

---------------------------------------------------------
---------------------------------------------------------
-- T_ROOSEVELT
---------------------------------------------------------
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId LIKE 'TRAIT_LEADER_ANTIQUES_AND_PARKS%';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'TRAIT_ROOSEVELT_COROLLARY_TRADE_ROUTE_TOKEN';

---------------------------------------------------------
---------------------------------------------------------
-- Catherine de Medici (Magnificence)
---------------------------------------------------------
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'MAGNIFICENCES_CULTURE_LUXURY_ADJACENT_TO_THEATER_SQUARE_OR_CHATEAU';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId LIKE 'PROJECT_COMPLETION_GRANT_%_BASED_ON_EXCESS_LUXURIES';

---------------------------------------------------------
---------------------------------------------------------
-- Portuguese 
---------------------------------------------------------
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = '150, 150, 150, 150, 150, 150'
WHERE Name="Amount"
AND ModifierId = 'TRAIT_INTERNATIONAL_TRADE_GAIN_ALL_YIELDS';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'TRAIT_WATER_TRADE_ROUTE_RANGE';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'TRAIT_JOAO_TRADE_ROUTE_ON_MEET';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'PORTA_DO_CERCO_EXTRA_SIGHT';

UPDATE Units
SET Maintenance = 1, BuildCharges = 6
WHERE UnitType="UNIT_PORTUGUESE_NAU";

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ImprovementType="IMPROVEMENT_FEITORIA";

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId LIKE 'TRADE_%_FROM_FEITORIA';

UPDATE Building_GreatPersonPoints
SET PointsPerTurn = PointsPerTurn * 3
WHERE BuildingType = "BUILDING_NAVIGATION_SCHOOL" 
AND GreatPersonClassType = "GREAT_PERSON_CLASS_ADMIRAL";

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'NAVIGATION_SCHOOL_NAVAL_UNIT_PRODUCTION';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name="Amount"
AND ModifierId = 'NAVIGATION_SCHOOL_NAVAL_COAST_SCIENCE';
