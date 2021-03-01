
---------------------------------------------------------
---------------------------------------------------------
--MOD CIVS
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
---------------------------------------------------------
--Campus Metropolitan
---------------------------------------------------------
---------------------------------------------------------



--science and gold bonus
UPDATE ModifierArguments
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAKUINTOSHI_SCIENCE_BONUS';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAKUINTOSHI_CITY_GOLD';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CIVILIZATION_GAKUINTOSHI_CITY_SCIENCE';

--KENKYUJO
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_KENKYUJO';

INSERT INTO AdJacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentFeature)
SELECT 'KENKYUJO_JUNGLE_GOLD' , 'LOC_DISTRICT_JUNGLE_GOLD' , 'YIELD_GOLD' , 2 , 2 , 'FEATURE_JUNGLE'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO AdJacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentFeature)
SELECT 'KENKYUJO_JUNGLE_PRODUCTION' , 'LOC_DISTRICT_JUNGLE_PRODUCTION' , 'YIELD_PRODUCTION' , 2 , 2 , 'FEATURE_JUNGLE'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO AdJacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, OtherDistrictAdjacent)
SELECT 'KENKYUJO_DISTRICT_PRODUCTION' , 'LOC_DISTRICT_JUNGLE_PRODUCTION' , 'YIELD_PRODUCTION' , 2 , 2 , 1
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT 'DISTRICT_KENKYUJO', 'KENKYUJO_JUNGLE_GOLD'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)	
SELECT 'DISTRICT_KENKYUJO', 'KENKYUJO_JUNGLE_PRODUCTION'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId)	
SELECT 'DISTRICT_KENKYUJO', 'KENKYUJO_DISTRICT_PRODUCTION'
WHERE EXISTS  (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAKUINTOSHI');	

UPDATE AdJacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Mountains_Production1'
OR ID = 'Mountains_Production2'
OR ID = 'Mountains_Production3'
OR ID = 'Mountains_Production4'
OR ID = 'Mountains_Production5';

UPDATE AdJacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Mountains_Gold1'
OR ID = 'Mountains_Gold2'
OR ID = 'Mountains_Gold3'
OR ID = 'Mountains_Gold4'
OR ID = 'Mountains_Gold5';

UPDATE District_CitizenYieldChanges
SET YieldChange = 3
WHERE YieldType = 'YIELD_PRODUCTION'
AND DistrictType = 'DISTRICT_KENKYUJO'; 

--Lv 5 Judgement
UPDATE Units 
SET BaseSightRange = 5 , BaseMoves = 6
WHERE UnitType = 'UNIT_LV5_JUDGEMENT';

--Imouto
UPDATE Units 
SET Maintenance = 3 , Cost = 370
WHERE UnitType = 'UNIT_MIKASA_SISTERS';


--Misaka
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'MIKASA_LONG_RANGE';

---------------------------------------------------------
---------------------------------------------------------
--Konosuba Aqua
---------------------------------------------------------
---------------------------------------------------------

--combat buffs
UPDATE ModifierArguments
SET Value = 19
WHERE ModifierId = 'CONS_AXIS_CULT_RELIGIOUS_COMBAT_BUFF';

UPDATE ModifierArguments
SET Value = 19
WHERE ModifierId = 'CONS_AXIS_CULT_APOSTLE_UNIT_COMBAT';

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'CONS_AXIS_CULT_MISSIONARY_UNIT_COMBAT';

--Arch Priest
UPDATE ModifierArguments
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId LIKE 'CONS_AXIS_CULT_PRIEST_STRENGTH_%';

--Kachoufuugetsu
UPDATE Improvements
SET Appeal = 3 
WHERE ImprovementType = 'IMPROVEMENT_CONS_KACHOUFUUGETSU';

UPDATE AdJacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Farms_Cons_Kachoufuugetsu1Adjacency';

UPDATE AdJacency_YieldChanges
SET YieldChange = 6
WHERE ID = 'Farms_Cons_Kachoufuugetsu2Adjacency';

--Aqua
UPDATE ModifierArguments
SET Value = 6
WHERE ModifierId = 'TRAIT_LEADER_CONS_AQUA_ADJACENT_RIVER_HOUSING_BONUS_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--Konosuba Megumin
---------------------------------------------------------
---------------------------------------------------------

--Crimson Magic Clan's Magic Talent
UPDATE ModifierArguments
SET Value = 150
WHERE ModifierId = 'TRAIT_CIVILIZATION_CONS_CRIMSON_MAGIC_CLAN_RANGED_UNIT_XP_BONUS_MOD';

UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'TRAIT_CIVILIZATION_CONS_CRIMSON_MAGIC_CLAN_RANGED_UNIT_INCREASE_STRENGTH_MOD';

--Arch Wizard
UPDATE ModifierArguments
SET Value = 23
WHERE Name = 'Amount'
AND ModifierId LIKE 'CONS_CMC_WIZARD_STRENGTH_%';

--Crimson Magic Village
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_CONS_CMC_VILLAGE';

UPDATE ModifierArguments
SET Value = 75
WHERE ModifierId = 'TRAIT_DISTRICT_CONS_CMC_VILLAGE_UNIT_XP_BONUS';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Cons_CMC_Village_District_Gold';

--Make Magic Stuff
UPDATE Project_YieldConversions
SET PercentOfProductionRate = 90
WHERE ProjectType = 'PROJECT_ENHANCE_DISTRICT_CONS_CMC_VILLAGE';

--Cast Explosion Magic
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'PROJECT_COMPLETION_MODIFIER_CREATE_CONS_EXPLOSION_MAGIC';

--Megumin
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId LIKE 'TRAIT_LEADER_CONS_MEGUMIN_CREATE_EXPLOSION_MAGIC_AT_%';

---------------------------------------------------------
---------------------------------------------------------
--No Game No Live Imanity
---------------------------------------------------------
---------------------------------------------------------

--Production Bonus
UPDATE ModifierArguments 
SET Value = 500
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_CIVILIZATION_CONS_IMANITY_INCREASE_SETTLER_PRODUCTION'
OR ModifierId = 'TRAIT_CIVILIZATION_CONS_IMANITY_INCREASE_RANGER_PRODUCTION'
OR ModifierId = 'TRAIT_CIVILIZATION_CONS_IMANITY_INCREASE_SCOUT_PRODUCTION');

--Scout
UPDATE Units 
SET BaseSightRange = 5 , BaseMoves = 6
WHERE UnitType = 'UNIT_CONS_IMANITY_SCOUT';

--Elchea
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'CONS_ELCHEA_LIBRARY_GRANT_RANDOM_TECHNOLOGY_BOOST';

--Sora
UPDATE ModifierArguments 
SET Value = 38
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SORA_INCREASE_ENEMY_WAR_WEARINESS';

UPDATE ModifierArguments 
SET Value = -48
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SORA_DECREASE_WAR_WEARINESS';

INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_SORA' , 'TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_SORA');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1' , 'ReplacedGovernmentSlotType' , 'SLOT_MILITARY' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2' , 'ReplacedGovernmentSlotType' , 'SLOT_MILITARY' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1' , 'ReplacedGovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2' , 'ReplacedGovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_1' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' ),
	('TRAIT_LEADER_CONS_SORA_REPLACE_DIPLOMATIC_SLOT_WITH_WILDCARD_2' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD' );

--Shiro
UPDATE ModifierArguments 
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SHIRO_TECHNOLOGY_BOOST';

UPDATE ModifierArguments 
SET Value = 150
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEADER_CONS_SHIRO_DOUBLE_SCIENTIST_POINTS';

--Stephanie 
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_LEADER_CONS_STEPHANIE_ADJUST_INFLUENCE_POINTS_AT_POLITICAL_PHILOSOPHY'
OR ModifierId = 'TRAIT_LEADER_CONS_STEPHANIE_ADJUST_INFLUENCE_POINTS_AT_DIPLOMATIC_SERVICE');

--will not add the +10 slots on diplomatic service, because no way to fill 20 slots
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_CONS_STEPHANIE' , 'TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_CONS_STEPHANIE');


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_1' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_POLITICAL_PHILOSOPHY_2' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_1' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('TRAIT_LEADER_CONS_STEPHANIE_GRANT_DIPLOMATIC_SLOT_AT_DIPLOMATIC_SERVICE_2' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' );

---------------------------------------------------------
---------------------------------------------------------
--CotR
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
---------------------------------------------------------
--Gondor
---------------------------------------------------------
---------------------------------------------------------

--stoneworks 50 + 10*3 = 80 defense, +3 culture per era
UPDATE Buildings
SET OuterDefenseHitPoints = 73
WHERE  BuildingType = 'BUILDING_NUMENORIAN_STONEWORK';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId LIKE 'NUMENORIANSTONEWORK_%_CULTURE';

--Guard: 10x def bonus, atk lower, cost = 200 + 50*10=750, STR= 41+4*10, garrison bonus
UPDATE Units 
SET Cost = 350 , Combat = 53
WHERE UnitType =  'UNIT_CITADEL_GUARD';

UPDATE ModifierArguments 
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'COTR_UNIT_STRONG_WHEN_DEFENDING';

UPDATE ModifierArguments 
SET Value = -15
WHERE Name = 'Amount'
AND ModifierId = 'COTR_UNIT_WEAK_WHEN_ATTACKING';

UPDATE ModifierArguments 
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId = 'GARRISON_BONUS_DISTRICTS';


--legacy o N: 10 housing for walls, districts 250% faster 
UPDATE ModifierArguments 
SET Value = 75
WHERE Name = 'Amount'
AND ModifierId LIKE 'NUMENORLEGACY_BOOST_%_PRODUCTION';


UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId LIKE 'NUMENORLEGACY_%_HOUSING';

--aragorn II: 3 dipl slot, dunedain ranger, STR = 10+5*10
UPDATE Units 
SET Combat = 23
WHERE UnitType =  'UNIT_DUNEDAIN_RANGER';

--For some Reasoin the mod author seems to add military slot and then converts it to diplomatic
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_REUNITED_KINGDOM' , 'ARAGORN_MILITARY_GOVERNMENT_SLOT_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_REUNITED_KINGDOM');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_REUNITED_KINGDOM' , 'ARAGORN_MILITARY_GOVERNMENT_SLOT_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_LEADER_REUNITED_KINGDOM');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_1' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_2' , 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_1' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' ),
	('ARAGORN_MILITARY_GOVERNMENT_SLOT_2' , 'GovernmentSlotType' , 'SLOT_DIPLOMATIC' );

---------------------------------------------------------
---------------------------------------------------------
--Rohan
---------------------------------------------------------
---------------------------------------------------------

--Stables
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'ROYAL_STABLE_PROVIDE_HORSES'
OR ModifierId = 'ROYAL_STABLE_PASTURE_GOLD');

--HouseLords
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'HORSELORD_FARM_PRODUCTION'
OR ModifierId = 'HORSELORD_FARM_FOOD'
OR ModifierId = 'THEODEN_CAVALRY_MOVEMENT');

--Rohirrim Rider Cost=180*(150/180)^3, Combat= 48+4*3
UPDATE Units
SET Cost = 104 , Combat = 58 , BuildCharges = 6
WHERE UnitType = 'UNIT_ROHIRRIM';


---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_SILVAN
---------------------------------------------------------
---------------------------------------------------------

--Sanctuaries
UPDATE ModifierArguments 
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'SILVAN_BREATHTAKING_CITY_CULTURE';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'YieldChange'
AND ModifierId = 'SILVAN_CHARMING_CITY_CULTURE';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'SILVAN_FOREST_FAITH';

--Treehouse
UPDATE ModifierArguments 
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TREEHOUSE_RIVERADJACENCY_FAITH';

UPDATE Improvements
SET DefenseModifier = 12
WHERE ImprovementType = 'IMPROVEMENT_TREEHOUSE';

UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_TREEHOUSE';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_TREEHOUSE';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Treehouse_DistrictCulture_early'
OR ID = 'Treehouse_DistrictCulture_late';

--Galadhrim +30 ranged and melee
UPDATE Units
SET RangedCombat = 48 , Combat = 38
WHERE UnitType = 'UNIT_GALADHRIM';

UPDATE Units
SET RangedCombat = 48 , Combat = 38
WHERE UnitType = 'UNIT_SENTINEL';

UPDATE ModifierArguments 
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'GALADHRIM_DOMESTIC_BONUS';

--Galadriel
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'GOLDENLADY_FOREST_APPEAL';

UPDATE Buildings
SET OuterDefenseStrength = 13 , OuterDefenseHitPoints = 24
WHERE BuildingType = 'BUILDING_LORIENDEFENSE';

--Thranduil
UPDATE ModifierArguments 
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'MIRKWOOD_UNIT_FOREST_HEAL_MODIFIER';

UPDATE ModifierArguments 
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'MIRKWOOD_RANGED_UNITS_BONUS';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_ISENGARD
---------------------------------------------------------
---------------------------------------------------------

--Machine of War
UPDATE ModifierArguments 
SET Value = 150
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SIEGE_UNIT_PRODUCTION'
OR ModifierId = 'TRAIT_SUPPORT_UNIT_PRODUCTION'
OR ModifierId = 'MACHINE_OF_WAR_BOOST_INDUSTRIAL_ZONE_PRODUCTION';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'MACHINE_OF_WAR_STRATEGIC_RESOURCE_SCIENCE';

UPDATE ModifierArguments 
SET Value = 'CIVIC_MILITARY_TRADITION'
WHERE Name = 'CivicType'
AND ModifierId = 'TRAIT_LAND_ARMIES_EARLY';

UPDATE ModifierArguments 
SET Value = 'CIVIC_MILITARY_TRAINING'
WHERE Name = 'CivicType'
AND ModifierId = 'TRAIT_LAND_CORPS_EARLY';

--Ballista +13 STR, +8 Bombard
UPDATE Units
SET Combat = 38, Bombard = 44
WHERE UnitType = 'UNIT_BALLISTA';

--Pits
UPDATE Building_YieldChanges
SET YieldChange = 6
WHERE BuildingType = 'BUILDING_URUKPITS';

--Saruman
UPDATE ModifierArguments 
SET Value = 75
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL';

UPDATE ModifierArguments 
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_CLASSICAL_SCALING';

UPDATE ModifierArguments 
SET Value = 60
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_MEDIEVAL_SCALING';

UPDATE ModifierArguments 
SET Value = 75
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_CLASSICAL_SCALING';

UPDATE ModifierArguments 
SET Value = 90
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_RENAISSANCE_SCALING';

UPDATE ModifierArguments 
SET Value = 90
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_BARBARIAN_FAITH_DISPERSAL_INDUSTRIAL_SCALING';

UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SPY_OFFENSE_LEVEL';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_MORDOR
---------------------------------------------------------
---------------------------------------------------------

--Where Shadows lie
/*
UPDATE ModifierArguments 
SET Value = 100
WHERE Name = 'Amount'
AND ModifierId = 'WHERE_THE_SHADOWS_LIE_UNIT_MAINTENANCE_DISCOUNT';

UPDATE ModifierArguments 
SET Value = 250
WHERE Name = 'Amount'
AND ModifierId = 'WHERE_THE_SHADOWS_LIE_UNIT_PRODUCTION';
*/
--Mumak 
UPDATE Units 
SET Combat = 68
WHERE UnitType = 'UNIT_OLOG_HAI';
--Wasteland
UPDATE District_CitizenYieldChanges
SET YieldChange = 3
WHERE DistrictType = 'DISTRICT_WASTELAND';

--nazgul (1-0,8^10 heal)
UPDATE ModifierArguments 
SET Value = Value*3
WHERE Name = 'Amount'
AND (ModifierId = 'DARK_LIEUTENANT_AOE_BUFF_MODIFIER'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_1'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_2'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_3');

UPDATE ModifierArguments 
SET Value = 23
WHERE Name = 'Amount'
AND (ModifierId = 'NAZGUL_SCALING_CLASSICAL'
OR ModifierId = 'NAZGUL_SCALING_MEDIEVAL'
OR ModifierId = 'NAZGUL_SCALING_RENAISSANCE'
OR ModifierId = 'NAZGUL_SCALING_INDUSTRIAL'
OR ModifierId = 'NAZGUL_SCALING_ATOMIC'
OR ModifierId = 'NAZGUL_SCALING_MODERN'
OR ModifierId = 'NAZGUL_SCALING_INFORMATION');

UPDATE ModifierArguments 
SET Value = 19
WHERE ModifierId = 'MORGULBLADE_BONUS_VS_DAMAGED';


UPDATE ModifierArguments 
SET Value = 49
WHERE Name = 'Amount'
AND ModifierId = 'NAZGUL_HEAL_ON_KILL';

UPDATE ModifierArguments 
SET Value = 24
WHERE Name = 'Amount'
AND ModifierId = 'MORGUL_SORCERY_AOE_HEAL_ON_KILL_MODIFIER';

--Slaves to his will
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'SAURON_CAPTURED_CITY_GRANT_ENVOY_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_GOBLINS
---------------------------------------------------------
---------------------------------------------------------

--Hordes
UPDATE ModifierArguments 
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'COTR_GOBLINS_EXTRA_MEELE_UNIT'
OR ModifierId = 'COTR_GOBLINS_EXTRA_ANTICAV_UNIT'
OR ModifierId = 'COTR_GOBLINS_EXTRA_WARG_PACK');

--Marauder 20+3*10
UPDATE Units 
SET Combat = 28
WHERE UnitType = 'UNIT_MARAUDER';

UPDATE ModifierArguments 
SET Value = 300
WHERE Name = 'PercentDefeatedStrength'
AND ModifierId = 'COTR_MARAUDER_GOLD_KILLS_MODIFIER';

--Warg 35+1*10
UPDATE Units 
SET Combat = 38
WHERE UnitType = 'UNIT_WARG_PACK';

UPDATE ModifierArguments 
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'COTR_WARG_ANTI_CAVALRY_BONUS';

--Goblin Caves
UPDATE Buildings
SET Housing = 0
WHERE BuildingType = 'BUILDING_GOBLIN_CAVES';

UPDATE Building_YieldChanges
SET YieldChange = 3
WHERE YieldType = 'YIELD_PRODUCTION'
AND BuildingType = 'BUILDING_GOBLIN_CAVES';

UPDATE ModifierArguments 
SET Value = 165
WHERE Name = 'UnitProductionPercent'
AND (ModifierId = 'COTR_GOBLIN_CAVES_UNIT_FAITH'
OR ModifierId = 'COTR_GOBLIN_CAVES_UNIT_CULTURE');

--Azog
UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'COTR_AZOG_CITY_CAPTURE_AOE_STRENGTH_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_DWARVES
---------------------------------------------------------
---------------------------------------------------------

--Smithing Quarters
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_SMITHING_QUATERS';

--Forge Cost=175*120/175^3, Prod=2+1*3
UPDATE Buildings
SET Cost = 4
WHERE BuildingType = 'BUILDING_DWARVEN_FORGE';

UPDATE Building_YieldChanges
SET YieldChange = 5
WHERE BuildingType = 'BUILDING_DWARVEN_FORGE';

UPDATE Building_GreatPersonPoints
SET PointsPerTurn = 3
WHERE BuildingType = 'BUILDING_DWARVEN_FORGE'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_MERCHANT';

UPDATE District_CitizenYieldChanges
SET YieldChange = 6
WHERE DistrictType = 'DISTRICT_SMITHING_QUATERS'
AND YieldType = 'YIELD_GOLD';

--Guardian STR=36+2*10
UPDATE Units
SET Combat = 42 
WHERE UnitType = 'UNIT_GUARDIAN';

UPDATE ModifierArguments
SET Value = 10
WHERE Name = 'Amount'
AND ModifierId = 'COTR_GUARDIAN_HILL_AND_MOUNTAIN_COMBAT_BONUS';

--Durin
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'DURIN_FREE_BUILDER';

--Dain
--Axethrower Cost=50+15*3, STR=15+f(10), ranged=25+f(5))
UPDATE Units
SET Cost = 95, Combat = 38 , RangedCombat = 38
WHERE UnitType = 'UNIT_AXETHROWER';

UPDATE ModifierArguments
SET Value = 300
WHERE Name = 'Percent'
AND ModifierId = 'COTR_MODIFIER_PLAYER_UNITS_ADJUST_SUPPORT_BONUS_MODIFIER';

--Thror
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'THROR_TRADE_ROUTE_INTERNATIONAL_GOLD';

UPDATE ModifierArguments
SET Value = 60
WHERE Name = 'Amount'
AND ModifierId = 'THROR_GOLD_FROM_MOUNTAIN_CITIES';

UPDATE Building_GreatWorks
SET NumSlots = 3
WHERE BuildingType = 'BUILDING_THRORRELICSLOT'
AND GreatWorkSlotType ='GREATWORKSLOT_PALACE';	

---------------------------------------------------------
---------------------------------------------------------
--JFD's Leader Packs
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
--India
---------------------------------------------------------
--Ajatasattu: +29 Combat near 
UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JFD_RELICS_BLESSED_COMBAT_VS_SAME_RELIGION_MODIFIER';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'JFD_RELICS_BLESSED_ONE_SHRINE_SLOTS';

---------------------------------------------------------
--Germany
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND ModifierId = 'JFD_NOBLE_ACADEMIES_%';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JFD_LANDWEHR_COMBAT_BONUS';

UPDATE ModifierArguments
SET Value = 60
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_BLITZKRIEG_WAR_PRODUCTION';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_BLITZKRIEG_WAR_UNIT_MOVES';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JFD_PANZER_COMBAT_BONUS';

---------------------------------------------------------
--France
---------------------------------------------------------

UPDATE ModifierArguments
SET Value = Value*3
WHERE Name = 'Amount'
AND (ModifierId = 'JFD_FREE_FRANCE_GENERAL_MOVES'
OR ModifierId = 'JFD_FREE_FRANCE_GENERAL_POINTS_FROM_KILLS');

UPDATE ModifierArguments
SET Value = 17
WHERE Name = 'Amount'
AND ModifierId = 'JFD_CHAR_B1_DEFENDING_BONUS';

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_SUN_KING_WONDER_CULTURE_MODIFIER';

--seems to be not implemented yet
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_JFD_SUN_KING_WONDER_ENVOY';

/*
UPDATE Units
SET Maintenance = Maintenance + 20
WHERE UnitType = 'UNIT_JFD_VIEUX';
*/

UPDATE ModifierArguments
SET Value = 17
WHERE Name = 'Amount'
AND ModifierId = 'JFD_VIEUX_CITY_CENTRE_COMBAT';

---------------------------------------------------------
---------------------------------------------------------
-- Ms. Human from Humanity has Declined
---------------------------------------------------------
---------------------------------------------------------

UPDATE Buildings
SET Cost = 10
WHERE BuildingType='BUILDING_DESSERT_HOUSE';

UPDATE Districts
SET Cost = 7
WHERE DistrictType="DISTRICT_FAIRYCO";

UPDATE Building_YieldChanges
SET YieldChange=YieldChange*3
WHERE BuildingType="BUILDING_GODDESS_STATUE" AND YieldType="YIELD_FAITH";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "BUILDING_DESSERT_HOUSE_DESSERT_%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "TRAIT_FAIRY_WONDER%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "TRAIT_FAIRY_DISTRICT%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "TRAIT_FAIRY_BUILDING_PRODUCTION%";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "FAIRYCO_EXTRA%";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="Mine_Food";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="Quarry_Food";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="District_Food";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="FairyCo_CityCenter_Production";

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange*3
WHERE ID="FairyCo_CityCenter_Food";

UPDATE District_TradeRouteYields
SET  YieldChangeAsOrigin=YieldChangeAsOrigin*3, YieldChangeAsDomesticDestination=(YieldChangeAsDomesticDestination-1)*3
WHERE DistrictType="DISTRICT_FAIRYCO" AND YieldType="YIELD_PRODUCTION" ;


UPDATE District_TradeRouteYields
SET  YieldChangeAsOrigin=YieldChangeAsOrigin*3, YieldChangeAsDomesticDestination=YieldChangeAsDomesticDestination*3
WHERE DistrictType="DISTRICT_FAIRYCO" AND YieldType="YIELD_FOOD" ;

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId = "MSHUMAN_ADD_VISIBILITY";

UPDATE ModifierArguments
SET Value=Value*3
WHERE Name="Amount" AND ModifierId LIKE "PROJECT_FINISH_THE_FAIRIES_ADD_CHARGE%";
---------------------------------------------------------
---------------------------------------------------------
--Other modifications
---------------------------------------------------------
---------------------------------------------------------

--diplomatic civics for imanity, aragorn, greece   
INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
VALUES
    ('POLICY_BLANK_DIPL_1', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_DIPLOMATIC' ),
    ('POLICY_BLANK_DIPL_2', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_DIPLOMATIC' ),
    ('POLICY_BLANK_DIPL_3', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_DIPLOMATIC' );
    
INSERT INTO Types (Type, Kind)
VALUES
    ('POLICY_BLANK_DIPL_1', 'KIND_POLICY'),
    ('POLICY_BLANK_DIPL_2', 'KIND_POLICY'),
    ('POLICY_BLANK_DIPL_3', 'KIND_POLICY');
