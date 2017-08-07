---------------------------------------------------------
---------------------------------------------------------
--AMERICA
---------------------------------------------------------
---------------------------------------------------------

--Founding Fathers
UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'BonusRate'
AND ModifierId LIKE '%BONUS_RATE%');

--FILM_STUDIO
UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Modifier'
AND ModifierId = 'FILMSTUDIO_ENHANCEDLATETOURISM');

--P51    
UPDATE Units
SET BaseMoves = 10
WHERE UnitType = 'UNIT_AMERICAN_P51';

UPDATE Units
SET Combat = 93
WHERE UnitType = 'UNIT_AMERICAN_P51';

UPDATE Units
SET RangedCombat = 93
WHERE UnitType = 'UNIT_AMERICAN_P51';

UPDATE ModifierArguments
SET Value = 150
WHERE ModifierId = 'MUSTANG_MORE_EXPERIENCE';


--LEADER Teddy
--Corollary
UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'COMBAT_BONUS_HOME_CONTINENT_MODIFIER';

UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'TRAIT_NATIONAL_PARK_APPEAL_BONUS';

--rough rider as replacement for cavalry  
UPDATE Units
SET Combat = 75
WHERE UnitType = 'UNIT_AMERICAN_ROUGH_RIDER';

UPDATE ModifierArguments
SET Value = 23
WHERE ModifierId = 'ROUGH_RIDER_BONUS_ON_HILLS';

UPDATE ModifierArguments
SET Value = 30
WHERE Name = 'PercentDefeatedStrength'
AND ModifierId = 'ROUGH_RIDER_POST_COMBAT_CULTURE';

---------------------------------------------------------
---------------------------------------------------------
--ARABIA
---------------------------------------------------------
---------------------------------------------------------

--Last Prophet
--TODO maybe Prophet at start, but then name stupid? or spawn 9 apostles?
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION');

--Madrasa
--TODO faith bonus
UPDATE Building_YieldChanges
SET YieldChange = 7
WHERE BuildingType = 'BUILDING_MADRASA';

--Mamluk
--TODO MAMLUK_HEAL_EVERY_MOVE to heal after combat?
--MODIFIER_PLAYER_UNIT_GRANT_HEAL_AFTER_ACTION -> EFFECT_GRANT_HEAL_AFTER_ACTION or MODIFIER_PLAYER_UNITS_ADJUST_HEAL_FROM_COMBAT
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
VALUES ('ABILITY_MAMLUK', 'MEDIC_INCREASE_HEAL_RATE');


--LEADER Saladin
UPDATE ModifierArguments
SET Value = 97
WHERE ModifierId = 'TRAIT_RELIGIOUS_BUILDING_DISCOUNT';

UPDATE ModifierArguments
SET Value = 30
WHERE (Name = 'Multiplier'
AND ModifierId = 'TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_SCIENCE');

UPDATE ModifierArguments
SET Value = 30
WHERE (Name = 'Multiplier'
AND ModifierId = 'TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_FAITH');

UPDATE ModifierArguments
SET Value = 30
WHERE (Name = 'Multiplier'
AND ModifierId = 'TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_CULTURE');

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_BRAZIL
---------------------------------------------------------
---------------------------------------------------------

--TRAIT_CIVILIZATION_AMAZON
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_COMMERCIALHUB_ADJACENCY';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_HOLYSITE_ADJACENCY';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_THEATER_ADJACENCY';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_CAMPUS_ADJACENCY';

UPDATE ModifierArguments
SET Value = 4
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_AMAZON_RAINFOREST_EXTRA_APPEAL';

--MINAS_GERAES
UPDATE Units
SET Combat = 83 , RangedCombat = 73 , AntiAirCombat = 88
WHERE UnitType = 'UNIT_BRAZILIAN_MINAS_GERAES';



--"CIVILIZATION_BRAZIL"	"TRAIT_CIVILIZATION_STREET_CARNIVAL"
--GPP
UPDATE Project_GreatPersonPoints
SET Points = Points * 3
WHERE ProjectType = 'PROJECT_CARNIVAL';

--cost 0.5^3 *60 = 7,5
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_STREET_CARNIVAL';

--Bonus
UPDATE Districts
SET Entertainment = 4
WHERE DistrictType = 'DISTRICT_STREET_CARNIVAL';

--LEADER Pedro
--refund 1-0,2^3
UPDATE ModifierArguments
SET Value = 51
WHERE ModifierId = 'TRAIT_GREAT_PERSON_REFUND';

---------------------------------------------------------
---------------------------------------------------------
--CHINA
---------------------------------------------------------
---------------------------------------------------------

--DYNASTIC_CYCLE"
--10% extra eureka -> 150% eureka nonsense, therefore  decrease leftover exponential 1−0,5×0,8^3=~74% 
UPDATE ModifierArguments
SET Value = 24
WHERE ModifierId = 'TRAIT_CIVIC_BOOST';

UPDATE ModifierArguments
SET Value = 24
WHERE ModifierId = 'TRAIT_TECHNOLOGY_BOOST';

--TRAIT_CIVILIZATION_IMPROVEMENT_GREAT_WALL
UPDATE Improvements
SET DefenseModifier = 12
WHERE ImprovementType = 'IMPROVEMENT_GREAT_WALL';

--adjacent
UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'GreatWall_Gold';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'GreatWall_Culture';

--"TRAIT_CIVILIZATION_UNIT_CHINESE_CROUCHING_TIGER
UPDATE Units
SET RangedCombat = 63
WHERE UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';
--cost reduction (exponential, 160/180^3 *180 = 126 )
UPDATE Units
SET Cost = 126
WHERE UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';

--LEADER Qin
--3 Charges 
UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'TRAIT_ADJUST_BUILDER_CHARGES';

--Wonder Production, exponential 15% to 1-0.85^3 = 39%
UPDATE ModifierArguments
SET Value = 80
WHERE ModifierId = 'TRAIT_BUILDER_WONDER_PERCENT';

---------------------------------------------------------
---------------------------------------------------------
--Egypt
---------------------------------------------------------
---------------------------------------------------------

--Iteru
UPDATE ModifierArguments
SET Value = 152
WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT';

UPDATE ModifierArguments
SET Value = 152
WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_WONDER';

--TRAIT_CIVILIZATION_IMPROVEMENT_SPHINX
UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE (ImprovementType = 'IMPROVEMENT_SPHINX'
AND YieldType = 'YIELD_FAITH');

UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE (ImprovementType = 'IMPROVEMENT_SPHINX'

AND YieldType = 'YIELD_CULTURE');
UPDATE Improvements
SET Appeal = 3
WHERE ImprovementType = 'IMPROVEMENT_SPHINX';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_SPHINX';

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'Amount'
AND ModifierId = 'SPHINX_WONDERADJACENCY_FAITH');

--TRAIT_CIVILIZATION_UNIT_EGYPTIAN_CHARIOT_ARCHER, Movement Bonus x10 and 
UPDATE ModifierArguments
SET Value = 5
WHERE (Name = 'Amount'
AND ModifierId = 'LIGHTCHARIOT_FASTER_CLEAR_TERRAIN');

--TRAIT_LEADER_MEDITERRANEAN
UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD');

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCOMING_TRADE_GAIN_GOLD');

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCOMING_TRADE_GAIN_FOOD');


---------------------------------------------------------
---------------------------------------------------------
--England
---------------------------------------------------------
---------------------------------------------------------

--Museum
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_DOUBLE_ARCHAEOLOGY_SLOTS';

UPDATE ModifierArguments
SET Value = 2
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SUPPORT_TWO_ARCHAEOLOGISTS';

--SEADOG, but more moves for now, prize ship chance=100% maybe?
UPDATE Units
SET BaseMoves = 3
WHERE UnitType = 'UNIT_ENGLISH_SEADOG';

--TRAIT_CIVILIZATION_ROYAL_NAVY_DOCKYARD"
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'ROYAL_NAVY_DOCKYARD_GOLD_FROM_FOREIGN_CONTINENT';

UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'ROYAL_NAVY_DOCKYARD_GRANT_MOVEMENT_BONUS';

UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD';

--TRAIT_LEADER_PAX_BRITANNICA"
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_1'),
    ('TRAIT_LEADER_PAX_BRITANNICA', 'TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_2');


INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_1', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_2', 'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_1', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE'),
    ('TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT_2', 'UnitPromotionClassType', 'PROMOTION_CLASS_MELEE');


--REDCOAT 
UPDATE ModifierArguments
SET Value = 23
WHERE ModifierId = 'REDCOAT_FOREIGN_COMBAT';



---------------------------------------------------------
---------------------------------------------------------
--France
---------------------------------------------------------
---------------------------------------------------------

--TRAIT_CIVILIZATION_IMPROVEMENT_CHATEAU
UPDATE Improvements
SET Appeal = 3
WHERE ImprovementType = 'IMPROVEMENT_CHATEAU';

UPDATE Improvement_YieldChanges
SET YieldChange = 6
WHERE ImprovementType = 'IMPROVEMENT_CHATEAU';

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'CHATEAU_LUXURYADJACENCY_GOLD');

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'Amount'
AND ModifierId = 'CHATEAU_WONDERADJACENCY_CULTURE');

--10x tourism
UPDATE ModifierArguments
SET Value = 600
WHERE (Name = 'ScalingFactor'
AND ModifierId = 'TRAIT_WONDER_DOUBLETOURISM');

--ress. Wonders 20% to 49%, exponential scaling
UPDATE ModifierArguments
SET Value = 49
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_ALHAMBRAPRODUCTION'
OR ModifierId = 'TRAIT_CHICHENITZAPRODUCTION'
OR ModifierId = 'TRAIT_FORBIDDENCITYPRODUCTION'
OR ModifierId = 'TRAIT_GREATZIMBABWEPRODUCTION'
OR ModifierId = 'TRAIT_HAGIASOPHIAPRODUCTION'
OR ModifierId = 'TRAIT_VENETIANARSENALPRODUCTION'
OR ModifierId = 'TRAIT_MONTSTMICHELPRODUCTION'
OR ModifierId = 'TRAIT_POTALAPALACEPRODUCTION'
OR ModifierId = 'TRAIT_BOLSHOITHEATREPRODUCTION'
OR ModifierId = 'TRAIT_HERMITAGEPRODUCTION'
OR ModifierId = 'TRAIT_RUHRVALLEYPRODUCTION'
OR ModifierId = 'TRAIT_OXFORDUNIVERSITYPRODUCTION'
OR ModifierId = 'TRAIT_BIGBENPRODUCTION');

--GARDE_IMPERIALE" combat bonus
UPDATE ModifierArguments
SET Value = 23
WHERE ModifierId = 'GARDE_CONTINENT_COMBAT';

--"FLYING_SQUADRON_TRAIT", 10 spy and 10 vis
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'UNIQUE_LEADER_ADD_VISIBILITY');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'UNIQUE_LEADER_ADD_SPY');

---------------------------------------------------------
---------------------------------------------------------
--Germany
---------------------------------------------------------
---------------------------------------------------------

--TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES"
UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'TRAIT_EXTRA_DISTRICT_EACH_CITY';

--"TRAIT_CIVILIZATION_DISTRICT_HANSA"
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_HANSA';

UPDATE Adjacency_YieldChanges
SET YieldChange = 6
WHERE ID = 'Commerical_Hub_Production';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Resource_Production';

--scale cost exponetially (430/480)^3*480
UPDATE Units
SET Cost = 345
WHERE UnitType = 'UNIT_GERMAN_UBOAT';

UPDATE Units
SET BaseSightRange = 5
WHERE UnitType = 'UNIT_GERMAN_UBOAT';

UPDATE ModifierArguments
SET Value = 23
WHERE ModifierId = 'UBOAT_OCEAN_COMBAT';

--LEADER BABAROSSA
UPDATE ModifierArguments
SET Value = 17
WHERE (Name = 'Amount'
AND ModifierId = 'COMBAT_BONUS_VS_CITY_STATES_MODIFIER');

--Militatry slots
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_1'),
    ('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 'TRAIT_MILITARY_GOVERNMENT_SLOT_2');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_1', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_2', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_1', 'GovernmentSlotType', 'SLOT_MILITARY'),
    ('TRAIT_MILITARY_GOVERNMENT_SLOT_2', 'GovernmentSlotType', 'SLOT_MILITARY');

---------------------------------------------------------
---------------------------------------------------------
--Greece
---------------------------------------------------------
---------------------------------------------------------

--PLATOS_REPUBLIC
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_1'),
    ('TRAIT_CIVILIZATION_PLATOS_REPUBLIC', 'TRAIT_WILDCARD_GOVERNMENT_SLOT_2');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_1', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_2', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_1', 'GovernmentSlotType', 'SLOT_WILDCARD'),
    ('TRAIT_WILDCARD_GOVERNMENT_SLOT_2', 'GovernmentSlotType', 'SLOT_WILDCARD');

--acropolis
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_ACROPOLIS';

UPDATE Adjacency_YieldChanges
SET YieldChange = 6
WHERE ID = 'District_Culture_City_Center';

--HOPLITE
UPDATE ModifierArguments
SET Value = 30
WHERE ModifierId = 'HOPLITE_NEIGHBOR_COMBAT';

--gorgo
UPDATE ModifierArguments
SET Value = 150
WHERE (Name = 'PercentDefeatedStrength'
AND ModifierId = 'UNIQUE_LEADER_CULTURE_KILLS');

--pericles
UPDATE ModifierArguments
SET Value = 15
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_CULTURE_PER_CITY_STATE_TRIBUTARY');

---------------------------------------------------------
---------------------------------------------------------
--india
---------------------------------------------------------
---------------------------------------------------------
--"TRAIT_CIVILIZATION_DHARMA"
-- TRAIT_GAINS_ALL_FOLLOWER_BELIEFS bool, so no x10

--STEPWELL"
UPDATE Improvements
SET Housing = 6
WHERE ImprovementType = 'IMPROVEMENT_STEPWELL';

UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE (YieldType = 'YIELD_FOOD'
AND ImprovementType = 'IMPROVEMENT_STEPWELL');

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_STEPWELL';

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'STEPWELL_FARMADJACENCY_FOOD');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'STEPWELL_HOLYSITEADJACENCY_FAITH');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'STEPWELL_HOUSING_WITHTECH');


--"TRAIT_CIVILIZATION_UNIT_INDIAN_VARU"
UPDATE Units
SET BaseMoves = 1
WHERE UnitType = 'UNIT_INDIAN_VARU';

UPDATE Units
SET Cost = 200
WHERE UnitType = 'UNIT_INDIAN_VARU';

UPDATE Units
SET Combat = 48
WHERE UnitType = 'UNIT_INDIAN_VARU';

UPDATE Units
SET BaseSightRange = 5
WHERE UnitType = 'UNIT_INDIAN_VARU';

UPDATE ModifierArguments
SET Value = -13
WHERE (Name = 'Amount'
AND ModifierId = 'VARU_NEGATIVE_COMBAT_MODIFIER');

--TRAIT_LEADER_SATYAGRAHA 
UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASE_ENEMY_WAR_WEARINESS');

UPDATE ModifierArguments
SET Value = 15
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_FAITH_PEACEFUL_FOUNDERS');


---------------------------------------------------------
---------------------------------------------------------
--Japan
---------------------------------------------------------
---------------------------------------------------------

--"TRAIT_CIVILIZATION_ADJACENT_DISTRICTS"
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_CAMPUS_ADJACENCYSCIENCE');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HARBOR_ADJACENCYGOLD');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_COMMERCIALHUB_ADJACENCYGOLD');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_THEATER_ADJACENCYCULTURE');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_INDUSTRIALZONE_ADJACENCYPRODUCTION');

--FACTORY
UPDATE Building_YieldChanges
SET YieldChange = 6
WHERE BuildingType = 'BUILDING_ELECTRONICS_FACTORY';

UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'Amount'
AND ModifierId = 'ELECTRONICSFACTORY_CULTURE');

--SAMURAI
UPDATE Units
SET Cost = 131 , Combat = 53
WHERE UnitType = 'UNIT_JAPANESE_SAMURAI';

--DIVINE_WIND
UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_BOOST_ENCAMPMENT_PRODUCTION');

UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_BOOST_HOLY_SITE_PRODUCTION');

UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_BOOST_THEATER_DISTRICT_PRODUCTION');

UPDATE ModifierArguments
SET Value = 15
WHERE ModifierId = 'COMBAT_BONUS_LAND_ON_COAST_MODIFIER';

UPDATE ModifierArguments
SET Value = 15
WHERE ModifierId = 'COMBAT_BONUS_NAVAL_SHALLOW_WATER_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--Kongo
---------------------------------------------------------
---------------------------------------------------------

--NKISI
UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS');

UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS');

UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS');
UPDATE ModifierArguments
SET Value = 300
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS');

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_FOOD_SCULPTURE';

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_SCULPTURE';

UPDATE ModifierArguments
SET Value = 12
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_GOLD_SCULPTURE';

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_FOOD_ARTIFACT';

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_ARTIFACT');

UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_GOLD_ARTIFACT');

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_RELIC');

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_FOOD_RELIC');

UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'YieldChange'
AND ModifierId = 'TRAIT_GREAT_WORK_GOLD_RELIC');

--palace slots, 9 max, or UI is fucked
UPDATE ModifierArguments
SET Value = 8
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_EXTRA_PALACE_SLOTS');

--MBANZA
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_MBANZA';

UPDATE Districts 
SET Housing=15 
WHERE DistrictType='DISTRICT_MBANZA';

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'Amount'
AND ModifierId = 'MBANZA_FOOD');

UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'Amount'
AND ModifierId = 'MBANZA_GOLD');



--SHIELD_BEARER 
--not sure, if 10 Movement work like that
--UPDATE ModifierArguments SET Value=10 WHERE (Name='Ignore' AND ModifierId='NAGAO_FOREST_MOVEMENT');

UPDATE ModifierArguments
SET Value = 30
WHERE ModifierId = 'NAGAO_RANGED_DEFENSE';

--TRAIT_LEADER_RELIGIOUS_CONVERT
INSERT INTO TraitModifiers (TraitType , ModifierId)
VALUES
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_1'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_MBANZA_2');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_1' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_2' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT');
INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_1' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_1' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_2' , 'DistrictType' , 'DISTRICT_MBANZA'),
	('TRAIT_FREE_APOSTLE_FINISH_MBANZA_2' , 'UnitType' , 'UNIT_APOSTLE');

INSERT INTO TraitModifiers (TraitType , ModifierId)
VALUES
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1'),
	('TRAIT_LEADER_RELIGIOUS_CONVERT' , 'TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2' , 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_1' , 'UnitType' , 'UNIT_APOSTLE'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2' , 'DistrictType' , 'DISTRICT_THEATER'),
	('TRAIT_FREE_APOSTLE_FINISH_THEATER_DISTRICT_2' , 'UnitType' , 'UNIT_APOSTLE');

---------------------------------------------------------
---------------------------------------------------------
--Norway
---------------------------------------------------------
---------------------------------------------------------
--TRAIT_CIVILIZATION_BUILDING_STAVE_CHURCH
UPDATE ModifierArguments
SET Value = 10
WHERE (Name = 'Amount'
AND ModifierId = 'STAVE_CHURCH_FAITHWOODSADJACENCY');

--"TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER"
UPDATE ModifierArguments
SET Value = 20
WHERE ModifierId = 'BERSERKER_FASTER_ENEMY_TERRITORY';

UPDATE ModifierArguments
SET Value = 70
WHERE ModifierId = 'UNIT_STRONG_WHEN_ATTACKING';

UPDATE ModifierArguments
SET Value = -70
WHERE ModifierId = 'UNIT_WEAK_WHEN_DEFENDING';


--"TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION"
--"TRAIT_EARLY_OCEAN_NAVIGATION" BOOL
--"TRAIT_MELEE_NAVAL_HEAL_NEUTRAL" BOOL
--"TRAIT_IGNORE_EMBARK_DISEMBARK_COST" BOOL

--LEADER Harald
--TRAIT_GRANT_COASTAL_RAID_ABILITY BOOL
UPDATE Units
SET Combat = 40
WHERE UnitType = 'UNIT_NORWEGIAN_LONGSHIP';

UPDATE ModifierArguments
SET Value = 10
WHERE ModifierId = 'LONGSHIP_FASTER_COAST';

---------------------------------------------------------
---------------------------------------------------------
--Rome
---------------------------------------------------------
---------------------------------------------------------

--Bath
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_BATH';

UPDATE Districts
SET Housing = 6
WHERE DistrictType = 'DISTRICT_BATH';

UPDATE Districts
SET Entertainment = 3
WHERE DistrictType = 'DISTRICT_BATH';

--Legion
UPDATE Units
SET Combat = 48
WHERE UnitType = 'UNIT_ROMAN_LEGION';

UPDATE Units
SET BuildCharges = 3
WHERE UnitType = 'UNIT_ROMAN_LEGION';

UPDATE Units
SET Cost = 150
WHERE UnitType = 'UNIT_ROMAN_LEGION';

--Fort
UPDATE Improvements
SET DefenseModifier = 12
WHERE ImprovementType = 'IMPROVEMENT_ROMAN_FORT';

--TRAIT_FREE_ROADS_TO_CAPITAL BOOL
--TRAIT_FREE_TRADING_POSTS BOOL
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_GOLD_FROM_DOMESTIC_TRADING_POSTS');

--TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING

UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';

---------------------------------------------------------
---------------------------------------------------------
--Russia
---------------------------------------------------------
---------------------------------------------------------

--Rodina
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_FAITH');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_PRODUCTION');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_HILLS_FAITH');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TUNDRA_HILLS_PRODUCTION');

UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INCREASED_TILES');

--TRAIT_CIVILIZATION_DISTRICT_LAVRA
UPDATE Districts
SET Cost = 8
WHERE DistrictType = 'DISTRICT_LAVRA';

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 4
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET');

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 3
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_WRITER');

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 3
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_ARTIST');

UPDATE District_GreatPersonPoints
SET PointsPerTurn = 3
WHERE (DistrictType = 'DISTRICT_LAVRA'
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_WRITER');


--COSSACK"
UPDATE Units
SET Combat = 77
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE Units
SET Cost = 360
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE ModifierArguments
SET Value = 15
WHERE ModifierId = 'COSSACK_LOCAL_COMBAT';

--peter 
--Grand Embassy, not working as intended
/*
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_3'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_4'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_5'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_6'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_7'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_8'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_9');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_3' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_4' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_4'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_5' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_5'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_6' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_6'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_7' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_7'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_8' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_8'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_9' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_9');

INSERT INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES 
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_3' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_4' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_5' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_6' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_7' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_8' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_9' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3');

INSERT INTO DynamicModifiers (ModifierType , CollectionType , EffectType)
VALUES
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_3' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_4' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_5' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_6' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_7' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_8' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_9' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS');

INSERT INTO Types (Type , Kind)
VALUES 
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_3' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_4' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_5' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_6' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_7' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_8' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_9' , 'KIND_MODIFIER');
    */
---------------------------------------------------------
---------------------------------------------------------
--Scythia
---------------------------------------------------------
---------------------------------------------------------

--Extra Cavalry 
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_EXTRALIGHTCAVALRY');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_EXTRASAKAHORSEARCHER');

--Kurgan
UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_KURGAN';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_KURGAN';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Kurgan_Faith';

--Saka Horse Archer, more reach, more expensive
UPDATE Units
SET Cost = 140
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

UPDATE Units
SET Combat = 3
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

UPDATE Units
SET Range = 3
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

--Killer of Cyros
UPDATE ModifierArguments
SET Value = 15
WHERE ModifierId = 'BONUS_VS_WOUNDED_UNITS';

UPDATE ModifierArguments
SET Value = 87
WHERE ModifierId = 'HEAL_AFTER_DEFEATING_UNIT';

---------------------------------------------------------
---------------------------------------------------------
--Spain
---------------------------------------------------------
---------------------------------------------------------
--MISSION
UPDATE Improvement_YieldChanges
SET YieldChange = 6
WHERE ImprovementType = 'IMPROVEMENT_MISSION';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 6
WHERE ImprovementType = 'IMPROVEMENT_MISSION';

UPDATE ModifierArguments
SET Value = 6
WHERE (Name = 'Amount'
AND ModifierId = 'MISSION_NEWCONTINENT_FAITH');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'MISSION_CAMPUSADJACENCY_SCIENCE');

--CONQUISTADOR
UPDATE ModifierArguments
SET Value = 30
WHERE ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT';

--TRAIT_CIVILIZATION_TREASURE_FLEET"
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD');

UPDATE ModifierArguments
SET Value = 12
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD');

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION');

--Nobody expects 
UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'TRAIT_ADJUST_INQUISITOR_CHARGES';

UPDATE ModifierArguments
SET Value = 12
WHERE ModifierId = 'COMBAT_BONUS_OTHER_RELIGION_MODIFIER';

---------------------------------------------------------
---------------------------------------------------------
--Sumeria
---------------------------------------------------------
---------------------------------------------------------

--First Civilization
UPDATE ModifierArguments
SET Value = 87
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_LEVY_DISCOUNT';

--goody huts not working
/*
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_1' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_2' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_3' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_4' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_5' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_6' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_7' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_8' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_9' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_IMPROVEMENT_GOODY_HUT');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('TRAIT_BARBARIAN_CAMP_GOODY_1' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_1'),
	('TRAIT_BARBARIAN_CAMP_GOODY_2' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_2'),
	('TRAIT_BARBARIAN_CAMP_GOODY_3' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_3'),
	('TRAIT_BARBARIAN_CAMP_GOODY_4' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_4'),
	('TRAIT_BARBARIAN_CAMP_GOODY_5' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_5'),
	('TRAIT_BARBARIAN_CAMP_GOODY_6' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_6'),
	('TRAIT_BARBARIAN_CAMP_GOODY_7' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_7'),
	('TRAIT_BARBARIAN_CAMP_GOODY_8' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_8'),
	('TRAIT_BARBARIAN_CAMP_GOODY_9' , 'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_9');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('TRAIT_BARBARIAN_CAMP_GOODY_1' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_2' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_3' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_4' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_5' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_6' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_7' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_8' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_GOODY_9' , 'ImprovementType' , 'IMPROVEMENT_BARBARIAN_CAMP');

INSERT INTO Types (Type, Kind)
VALUES
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_1' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_2' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_3' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_4' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_5' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_6' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_7' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_8' , 'KIND_EFFECT'),
	('MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT_9' , 'KIND_EFFECT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_1' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_2' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_3' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_4' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_5' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_6' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_7' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_8' , 'KIND_TRAIT'),
	('TRAIT_BARBARIAN_CAMP_GOODY_9' , 'KIND_TRAIT');

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_1'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_2'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_3'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_4'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_5'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_6'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_7'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_8'),
	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION' , 'TRAIT_BARBARIAN_CAMP_GOODY_9');
*/

--ZIGGURAT
UPDATE Improvement_YieldChanges
SET YieldChange = 6
WHERE (YieldType = 'YIELD_SCIENCE'
AND ImprovementType = 'IMPROVEMENT_ZIGGURAT');

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_ZIGGURAT';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'ZIGGURAT_RIVERADJACENCY_CULTURE';

--TRAIT_CIVILIZATION_UNIT_SUMERIAN_WAR_CART Rush early, so reduced cost for 10x the early rush
UPDATE Units
SET Cost = 40
WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';

--LEADER Gilgamesh
UPDATE ModifierArguments
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_ADJUST_JOINTWAR_EXPERIENCE';


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
SET Value = 15
WHERE ModifierId = 'TRAIT_CIVILIZATION_CONS_CRIMSON_MAGIC_CLAN_RANGED_UNIT_INCREASE_STRENGTH_MOD';

--Arch Wizard
UPDATE ModifierArguments
SET Value = 30
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
SET OuterDefenseHitPoints = 80
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
SET Combat = 25
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
SET Cost = 104 , Combat = 60 , BuildCharges = 6
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
SET RangedCombat = 49 , Combat = 39
WHERE UnitType = 'UNIT_GALADHRIM';

UPDATE Units
SET RangedCombat = 49 , Combat = 39
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
SET OuterDefenseStrength = 15 , OuterDefenseHitPoints = 45
WHERE BuildingType = 'BUILDING_LORIENDEFENSE';

--Thranduil
UPDATE ModifierArguments 
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'MIRKWOOD_UNIT_FOREST_HEAL_MODIFIER';

UPDATE ModifierArguments 
SET Value = 15
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

--Ballista +15 STR, +9 Bombard
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
SET Combat = 64
WHERE UnitType = 'UNIT_OLOG_HAI';
--Wasteland
UPDATE District_CitizenYieldChanges
SET YieldChange = 3
WHERE DistrictType = 'DISTRICT_WASTELAND';

--nazgul (1-0,8^10 heal)
UPDATE ModifierArguments 
SET Value = Value*3
WHERE Name = 'Amount'
AND (ModifierId = 'WHERE_THE_SHADOWS_LIE_UNIT_PRODUCTION'
OR ModifierId = 'MORGULBLADE_BONUS_VS_DAMAGED'
OR ModifierId = 'DARK_LIEUTENANT_AOE_BUFF_MODIFIER'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_1'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_2'
OR ModifierId = 'NAZGUL_BLACK_BREATH_AOE_NO_HEAL_3'
OR ModifierId = 'NAZGUL_SCALING_CLASSICAL'
OR ModifierId = 'NAZGUL_SCALING_MEDIEVAL'
OR ModifierId = 'NAZGUL_SCALING_RENAISSANCE'
OR ModifierId = 'NAZGUL_SCALING_INDUSTRIAL'
OR ModifierId = 'NAZGUL_SCALING_ATOMIC'
OR ModifierId = 'NAZGUL_SCALING_MODERN'
OR ModifierId = 'NAZGUL_SCALING_INFORMATION');

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
SET Combat = 15
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
SET Value = 15
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
SET Value = 15
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
SET Value = 12
WHERE Name = 'Amount'
AND ModifierId = 'COTR_GUARDIAN_HILL_AND_MOUNTAIN_COMBAT_BONUS';

--Durin
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'DURIN_FREE_BUILDER';

--Dain
--Axethrower Cost=50+15*10, STR=15+10*10, ranged=25+5*10
UPDATE Units
SET Cost = 95, Combat = 45 , RangedCombat = 40
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
--Other modifications
---------------------------------------------------------
---------------------------------------------------------

--3 blank civics for germany and greece
INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
VALUES
    ('POLICY_BLANK_1', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_2', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' ),
    ('POLICY_BLANK_3', 'LOC_POLICY_BLANK_NAME', 'LOC_POLICY_BLANK_DESCRIPTION', 'CIVIC_CODE_OF_LAWS', 'SLOT_MILITARY' );
    
INSERT INTO Types (Type, Kind)
VALUES
    ('POLICY_BLANK_1', 'KIND_POLICY'),
    ('POLICY_BLANK_2', 'KIND_POLICY'),
    ('POLICY_BLANK_3', 'KIND_POLICY');
    

