--Combat Modiers according to: Modifier_x3 = 25 ln( 3 * exp( Modifier_Vanilla / 25) - 2 )

/*
As follows:

1  3
2  6
3  8
5  13 
7  17
10 23
15 31
*/

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
WHERE ModifierId = 'ROOSEVELT_COMBAT_BONUS_HOME_CONTINENT';

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

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION');

INSERT INTO Types (Type, Kind)
VALUES 
    ('BUILDING_CLAIM_PROPHETS', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, PrereqDistrict, Cost, MaxPlayerInstances, Description, TraitType, RequiresReligion)
VALUES
	('BUILDING_CLAIM_PROPHETS', 'LOC_CLAIM_PROPHETS_NAME', 'DISTRICT_CITY_CENTER', 1, 1, 'LOC_CLAIM_PROPHETS_DESC', 'TRAIT_CIVILIZATION_LAST_PROPHET', 1);
	
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
VALUES
	('LAST_NINE_PRHOPHETS', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 1);
	
INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('LAST_NINE_PRHOPHETS', 'UnitType', 'UNIT_APOSTLE');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('LAST_NINE_PRHOPHETS', 'Amount', 3);
	
INSERT INTO BuildingModifiers (BuildingType, ModifierId)
VALUES 
    ('BUILDING_CLAIM_PROPHETS', 'LAST_NINE_PRHOPHETS');
	

--Madrasa

UPDATE Building_YieldChanges
SET YieldChange = 7
WHERE BuildingType = 'BUILDING_MADRASA';


--Mamluk
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId)
VALUES ('ABILITY_MAMLUK', 'MAMLUK_INCREASE_HEAL_RATE');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('MAMLUK_INCREASE_HEAL_RATE', 'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('MAMLUK_INCREASE_HEAL_RATE', 'Amount', 100);

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
    ('MAMLUK_INCREASE_HEAL_RATE', 'Type', 'ALL');


--LEADER Saladin
UPDATE ModifierArguments
SET Value = 99
WHERE ModifierId = 'TRAIT_RELIGIOUS_BUILDING_DISCOUNT';

UPDATE ModifierArguments
SET Value = 30
WHERE (Name = 'Multiplier'
AND ModifierId LIKE 'TRAIT_RELIGIOUS_BUILDING_MULTIPLIER_%');

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
SET Combat = 60 + 23 , RangedCombat = 70 + 23 , AntiAirCombat = 70 + 23
WHERE UnitType = 'UNIT_BRAZILIAN_MINAS_GERAES';



--"CIVILIZATION_BRAZIL"	"TRAIT_CIVILIZATION_STREET_CARNIVAL"
--GPP
UPDATE Project_GreatPersonPoints
SET Points = Points * 3
WHERE ProjectType = 'PROJECT_CARNIVAL';

--cost 0.5^3 *57 = 7,1
UPDATE Districts
SET Cost = 7
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
AND ModifierId = 'TRAIT_INCOMING_TRADE_OFFER_FOOD');


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

UPDATE ModifierArguments
SET Value = 30
WHERE Name = 'Amount'
AND ModifierId = 'GARDE_GREAT_GENERAL_POINTS';

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

--HOPLITE crashes on windows
UPDATE ModifierArguments 
SET Value = 23
WHERE ModifierId = 'HOPLITE_NEIGHBOR_COMBAT_MODIFIER';

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
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_CAMPUS_ADJACENCYSCIENCE'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HARBOR_ADJACENCYGOLD'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_COMMERCIALHUB_ADJACENCYGOLD'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_THEATER_ADJACENCYCULTURE'
OR ModifierId = 'TRAIT_ADJACENT_DISTRICTS_INDUSTRIALZONE_ADJACENCYPRODUCTION');

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
SET Cost = 131 , Combat = 51
WHERE UnitType = 'UNIT_JAPANESE_SAMURAI';

--DIVINE_WIND
UPDATE ModifierArguments
SET Value = 300
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_BOOST_ENCAMPMENT_PRODUCTION'
OR ModifierId = 'TRAIT_BOOST_HOLY_SITE_PRODUCTION'
OR ModifierId = 'TRAIT_BOOST_THEATER_DISTRICT_PRODUCTION');

UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'TRAIT_COMBAT_BONUS_LAND_ON_COAST'
OR ModifierId = 'HOJO_TOKIMUNE_SHALLOW_WATER_COMBAT_BONUS';


---------------------------------------------------------
---------------------------------------------------------
--Kongo
---------------------------------------------------------
---------------------------------------------------------

--NKISI
UPDATE ModifierArguments
SET Value = 150
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS'
OR ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS'
OR ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS'
OR ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS');


UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'YieldChange'
AND (ModifierId = 'TRAIT_GREAT_WORK_FOOD_SCULPTURE'
OR ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_SCULPTURE'
OR ModifierId = 'TRAIT_GREAT_WORK_FOOD_ARTIFACT'
OR ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_ARTIFACT'
OR ModifierId = 'TRAIT_GREAT_WORK_PRODUCTION_RELIC'
OR ModifierId = 'TRAIT_GREAT_WORK_FOOD_RELIC');

UPDATE ModifierArguments
SET Value = 12
WHERE Name = 'YieldChange'
AND (ModifierId = 'TRAIT_GREAT_WORK_GOLD_SCULPTURE'
OR ModifierId = 'TRAIT_GREAT_WORK_GOLD_ARTIFACT'
OR ModifierId = 'TRAIT_GREAT_WORK_GOLD_RELIC');


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
SET Value = 23
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
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'STAVE_CHURCH_FAITHWOODSADJACENCY');

--"TRAIT_CIVILIZATION_UNIT_NORWEGIAN_BERSERKER"
UPDATE ModifierArguments
SET Value = 6
WHERE ModifierId = 'BERSERKER_FASTER_ENEMY_TERRITORY';

UPDATE ModifierArguments
SET Value = 17
WHERE ModifierId = 'UNIT_STRONG_WHEN_ATTACKING';

UPDATE ModifierArguments
SET Value = -17
WHERE ModifierId = 'UNIT_WEAK_WHEN_DEFENDING';


--"TRAIT_CIVILIZATION_EARLY_OCEAN_NAVIGATION"
--"TRAIT_EARLY_OCEAN_NAVIGATION" BOOL
--"TRAIT_MELEE_NAVAL_HEAL_NEUTRAL" BOOL
--"TRAIT_IGNORE_EMBARK_DISEMBARK_COST" BOOL

--LEADER Harald
UPDATE ModifierArguments
SET Value = 150
WHERE ModifierId LIKE 'TRAIT_%_NAVAL_MELEE_PRODUCTION';


UPDATE Units
SET Combat = 38
WHERE UnitType = 'UNIT_NORWEGIAN_LONGSHIP';

UPDATE ModifierArguments
SET Value = 6
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
SET Combat = 46
WHERE UnitType = 'UNIT_ROMAN_LEGION';

UPDATE Units
SET BuildCharges = 3
WHERE UnitType = 'UNIT_ROMAN_LEGION';

UPDATE Units
SET Cost = 150
WHERE UnitType = 'UNIT_ROMAN_LEGION';

--Fort
UPDATE Improvements
SET DefenseModifier = 10
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
AND GreatPersonClassType = 'GREAT_PERSON_CLASS_MUSICIAN');

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
SET Combat = 75
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE Units
SET Cost = 360
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';

UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'COSSACK_LOCAL_COMBAT';

--peter 
--Grand Embassy, not working as intended
/*
INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES 
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1'),
    ('TRAIT_LEADER_GRAND_EMBASSY', 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES 
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' , 'MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2'));

INSERT INTO ModifierArguments (ModifierId, Name, Type, Value)
VALUES 
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3'),
    ('TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' ,'TechCivicsPerYield','ARGTYPE_IDENTITY','3');

INSERT INTO DynamicModifiers (ModifierType , CollectionType , EffectType)
VALUES
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' , 'COLLECTION_OWNER' , 'EFFECT_ADJUST_PLAYER_PROGRESS_DIFF_TRADE_BONUS');

INSERT INTO Types (Type , Kind)
VALUES 
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_1' , 'KIND_MODIFIER'),
    ('MODIFIER_PLAYER_ADJUST_PROGRESS_DIFF_TRADE_BONUS_2' , 'KIND_MODIFIER');
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
SET Cost = 180
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

UPDATE Units
SET Combat = 3
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

UPDATE Units
SET Range = 3
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

--Killer of Cyros
UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'TOMYRIS_BONUS_VS_WOUNDED_UNITS';

UPDATE ModifierArguments
SET Value = 87
WHERE ModifierId = 'TOMYRIS_HEAL_AFTER_DEFEATING_UNIT';

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
SET Value = Value * 3
WHERE ModifierId = 'MISSION_NEWCONTINENT_%'
AND Name LIKE 'Amount';

UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'MISSION_CAMPUSADJACENCY_SCIENCE');

--CONQUISTADOR
UPDATE ModifierArguments
SET Value = 23
WHERE ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT';

--TRAIT_CIVILIZATION_TREASURE_FLEET"
UPDATE ModifierArguments
SET Value = 3
WHERE (Name = 'Amount'
AND ModifierId = 'TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD');

UPDATE ModifierArguments
SET Value = 18
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
SET Value = 10
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
SET Cost = 40, Combat = 28 + 6, BaseMoves = 2 + 3
WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';

--LEADER Gilgamesh
UPDATE ModifierArguments
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_ADJUST_JOINTWAR_EXPERIENCE';


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
    

