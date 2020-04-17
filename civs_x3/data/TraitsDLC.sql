---------------------------------------------------------
---------------------------------------------------------
--DLC Civs
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
---------------------------------------------------------
--Aztec
---------------------------------------------------------
---------------------------------------------------------

--five suns
UPDATE ModifierArguments
SET Value = 49
WHERE ModifierId = 'TRAIT_BUILDER_DISTRICT_PERCENT';

--Tlachtli
UPDATE Building_YieldChanges 
SET YieldChange = 6
WHERE BuildingType='BUILDING_TLACHTLI';

UPDATE Building_GreatPersonPoints
SET PointsPerTurn = 3
WHERE BuildingType='BUILDING_TLACHTLI';

--Eagle Warrior
UPDATE Units 
SET Combat = 39
WHERE UnitType='UNIT_AZTEC_EAGLE_WARRIOR';

UPDATE Units 
SET Cost = 110
WHERE UnitType='UNIT_AZTEC_EAGLE_WARRIOR';

--Montezuma
UPDATE ModifierArguments
SET Value = 6
WHERE ModifierId = 'TRAIT_OWNED_LUXURY_EXTRA_AMENITIES';

UPDATE ModifierArguments
SET Value = 3
WHERE ModifierId = 'MONTEZUMA_COMBAT_BONUS_PER_LUXURY';

---------------------------------------------------------
---------------------------------------------------------
--Australia
---------------------------------------------------------
---------------------------------------------------------

--Digger: +6 STR, +23 on coat, +13 abroad
UPDATE Units 
SET Combat = 76
WHERE UnitType = 'UNIT_DIGGER';

UPDATE ModifierArguments
SET Value = 23
WHERE ModifierId = 'DIGGER_BONUS_ON_COAST';

UPDATE ModifierArguments
SET Value = 13
WHERE ModifierId = 'DIGGER_NON_DOMESTIC_BONUS';

--Outback Station: 10 food, 10 production, 5 housing, 10 food per pasture, 10 food and production per adj. station
UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_OUTBACK_STATION';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Outback_Pasture_Food';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID = 'Pasture_Outback_Production';

UPDATE Improvements
SET Housing = 5
WHERE ImprovementType = 'IMPROVEMENT_OUTBACK_STATION';

--Down Under: 30 Housing on Coast, +10 district bonus for Charming, +30 for breathtaking
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'YieldChange'
AND (ModifierId = 'TRAIT_CHARMING_COMMERCIAL_HUB'
OR ModifierId = 'TRAIT_CHARMING_HOLY_SITE'
OR ModifierId = 'TRAIT_CHARMING_CAMPUS'
OR ModifierId = 'TRAIT_CHARMING_THEATER_DISTRICT');

UPDATE ModifierArguments
SET Value = 9
WHERE Name = 'YieldChange'
AND (ModifierId = 'TRAIT_BREATHTAKING_CAMPUS'
OR ModifierId = 'TRAIT_BREATHTAKING_HOLY_SITE'
OR ModifierId = 'TRAIT_BREATHTAKING_COMMERCIAL_HUB'
OR ModifierId = 'TRAIT_BREATHTAKING_THEATER_DISTRICT');

UPDATE ModifierArguments
SET Value = 9
WHERE ModifierId = 'TRAIT_COASTAL_HOUSING';

--Citadel of Civ +300% Production
UPDATE ModifierArguments
SET Value = Value * 3
WHERE (Name = 'Amount' OR Name = 'TurnsActive')
AND ModifierId LIKE 'TRAIT_CITADELCIVILIZATION_%_PRODUCTION';

---------------------------------------------------------
---------------------------------------------------------
--Poland
---------------------------------------------------------
---------------------------------------------------------

--golden Liberty: 10 Military to wildcard
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY' , 'TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY');
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY' , 'TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2'
WHERE EXISTS  (SELECT * FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1','MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS'),
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2','MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1','ReplacedGovernmentSlotType','SLOT_MILITARY'),
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_1','AddedGovernmentSlotType','SLOT_WILDCARD'),
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2','ReplacedGovernmentSlotType','SLOT_MILITARY'),
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD_2','AddedGovernmentSlotType','SLOT_WILDCARD');
    
--Hussar, compare STR to Knight
UPDATE Units 
SET Combat = 65
WHERE UnitType = 'UNIT_POLISH_HUSSAR';

--Sukiennice
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'SUKIENNICE_INTERNATIONALPRODUCTION';

UPDATE ModifierArguments
SET Value = 12
WHERE Name = 'YieldChange'
AND ModifierId = 'SUKIENNICE_DOMESTICGOLD';

--Lithuanian Union
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_LITHUANIANUNION_FAITH_RELIC';

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_LITHUANIANUNION_CULTURE_RELIC';

UPDATE ModifierArguments
SET Value = 12
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_LITHUANIANUNION_GOLD_RELIC';

---------------------------------------------------------
---------------------------------------------------------
--Macedonia
---------------------------------------------------------
---------------------------------------------------------

--Hellinistic Fusion
UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_HELLENISTIC_FUSION_ENCAMPMENT_EUREKA_MODIFIER'
OR ModifierId = 'TRAIT_HELLENISTIC_FUSION_CAMPUS_EUREKA_MODIFIER'
OR ModifierId = 'TRAIT_HELLENISTIC_FUSION_HOLY_SITE_INSPIRATION_MODIFIER'
OR ModifierId = 'TRAIT_HELLENISTIC_FUSION_THEATER_INSPIRATION_MODIFIER');

--Hypapist siege bunus and support bonus 
UPDATE ModifierArguments
SET Value = 150
WHERE Name = 'Percent'
AND ModifierId = 'HYPASPIST_SUPPORT_BONUS';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'HYPASPIST_SIEGE_BONUS';

--Hetaroy 50 bnus with gerneral, 50 general points
UPDATE ModifierArguments
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'HETAIROI_GREAT_GENERAL_POINTS';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'HETAIROI_GREAT_GENERAL_COMBAT_BONUS';

--Basilikoi, 250% science
UPDATE ModifierArguments
SET Value = 75
WHERE Name = 'UnitProductionPercent'
AND ModifierId = 'BASILIKOI_PAIDES_SCIENCE_TRAINED_UNIT';

--Alexander worlds end, nothing really to x10

---------------------------------------------------------
---------------------------------------------------------
--Persia
---------------------------------------------------------
---------------------------------------------------------

--Satrapies
UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SATRAPIES_INTERNAL_TRADE_GOLD';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_SATRAPIES_POLITICAL_PHILOSOPHY_TRADE_ROUTE';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'ImprovedRouteLevel'
AND ModifierId = 'TRAIT_SATRAPIES_IMPROVED_ROUTE_LEVEL';

--Immortal essentially an archer with stromnger melee, so 10 times stronger melee
UPDATE Units 
SET Cost = 120
WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL';

UPDATE Units 
SET Combat = 46
WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL';

--Paridaeza
UPDATE Adjacency_YieldChanges
SET YieldChange = 3 
WHERE ID = 'Pairidaeza_CityCenterAdjacency';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3 
WHERE ID = 'Pairidaeza_CommercialHubAdjacency';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3 
WHERE ID = 'Pairidaeza_HolySiteAdjacency';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3 
WHERE ID = 'Pairidaeza_TheaterAdjacency';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_PAIRIDAEZA';

UPDATE Improvements 
SET Appeal = 6 
WHERE ImprovementType = 'IMPROVEMENT_PAIRIDAEZA';

UPDATE Improvement_YieldChanges 
SET YieldChange = 6 
WHERE YieldType = 'YIELD_GOLD'
AND ImprovementType= 'IMPROVEMENT_PAIRIDAEZA';

UPDATE Improvement_YieldChanges 
SET YieldChange = 3 
WHERE YieldType = 'YIELD_CULTURE'
AND ImprovementType= 'IMPROVEMENT_PAIRIDAEZA';

--Cyrus

UPDATE ModifierArguments
SET Value = 6
WHERE Name = 'Amount'
AND (Name = 'Amount' OR Name = 'TurnsActive');


---------------------------------------------------------
---------------------------------------------------------
--Nubia
---------------------------------------------------------
---------------------------------------------------------

--Ta Seti
UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_RANGED_EXPERIENCE_MODIFIER'
OR ModifierId LIKE 'TRAIT_%_RANGED_UNIT_PRODUCTION'
OR ModifierId = 'TRAIT_BONUS_MINE_GOLD'
OR ModifierId = 'TRAIT_LUXURY_MINE_GOLD'
OR ModifierId = 'TRAIT_STRATEGIC_MINE_PRODUCTION');

--Pyramid
UPDATE Improvement_YieldChanges 
SET YieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_PYRAMID'
AND YieldType = 'YIELD_FAITH';

UPDATE Adjacency_YieldChanges
SET YieldChange = 3
WHERE ID LIKE 'Pyramid_%Adjacency';

--Pitati
UPDATE Units
SET Cost = 60 + (10 * 3) , Combat = 15 + 6 , RangedCombat = 25 + 13 , BaseMoves = 2 + 3 , MandatoryObsoleteTech = NULL
WHERE UnitType = 'UNIT_NUBIAN_PITATI';

--Aminatore
UPDATE ModifierArguments
SET Value = Value * 3
WHERE Name = 'Amount'
AND (ModifierId = 'TRAIT_BASE_DISTRICT_PRODUCTION_MODIFIER'
OR ModifierId = 'TRAIT_PYRAMID_DISTRICT_PRODUCTION_MODIFIER');

	
---------------------------------------------------------
---------------------------------------------------------
--Indonesia
---------------------------------------------------------
---------------------------------------------------------

-- UU

UPDATE Units
SET BaseMoves = 4 + 3
WHERE UnitType = 'UNIT_INDONESIAN_JONG';

UPDATE ModifierArguments
SET Value = 13
WHERE Name = 'Amount'
AND ModifierId = 'JONG_BONUS_IN_FORMATION';

-- UI

UPDATE Improvements
SET Housing = 6
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG';

UPDATE Improvement_YieldChanges
SET YieldChange = 3 * YieldChange
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG';

UPDATE Improvement_BonusYieldChanges
SET BonusYieldChange = BonusYieldChange * 3
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG';

UPDATE Improvement_Tourism
SET ScalingFactor = ScalingFactor * 3
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG';

UPDATE Adjacency_YieldChanges
SET YieldChange = YieldChange * 3
WHERE ID = 'Kampung_FoodFishingBoats';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'KAMPUNG_HOUSING_WITHTECH';

-- UCA

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId LIKE 'TRAIT_NUSANTARA_COAST%' AND Name = 'Amount';

-- ULA

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'TRAIT_FAITH_CITY_CENTER' AND Name = 'Amount';

---------------------------------------------------------
---------------------------------------------------------
--Khmer
---------------------------------------------------------
---------------------------------------------------------

-- UCA

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'TRAIT_AQUEDUCT_AMENITY';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'TRAIT_AQUEDUCT_FAITH' AND Name = 'Amount';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'TRAIT_FARM_AQUEDUCT_ADJECENCY_FOOD' AND Name = 'Amount';

-- ULA

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'TRAIT_HOLY_SITE_RIVER_FOOD' AND Name = 'Amount';

UPDATE ModifierArguments
SET Value = Value * 3
WHERE ModifierId = 'TRAIT_HOLY_SITE_RIVER_HOUSING';

-- UB

UPDATE Building_GreatWorks
SET NumSlots = 9
WHERE BuildingType = 'BUILDING_PRASAT';

-- UU
--Basically it's stronger catapult, bombard 35+23, strength 23+23

UPDATE Units
SET Bombard = 58
WHERE  UnitType = 'UNIT_KHMER_DOMREY';

UPDATE Units
SET Combat = 46
WHERE  UnitType = 'UNIT_KHMER_DOMREY';
