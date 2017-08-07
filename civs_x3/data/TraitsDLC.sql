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
SET Combat = 52
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
WHERE ModifierId = 'TRAIT_COMBAT_BONUS_PER_LUXURY';

---------------------------------------------------------
---------------------------------------------------------
--Australia
---------------------------------------------------------
---------------------------------------------------------

--Digger: +20 STR, +100 on coat, +50 abroad
UPDATE Units 
SET Combat = 76
WHERE UnitType = 'UNIT_DIGGER';

UPDATE ModifierArguments
SET Value = 30
WHERE ModifierId = 'DIGGER_BONUS_ON_COAST';

UPDATE ModifierArguments
SET Value = 15
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
AND ModifierId = 'TRAIT_CHARMING_COMMERCIAL_HUB';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_CHARMING_CAMPUS';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_CHARMING_HOLY_SITE';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_CHARMING_THEATER_DISTRICT';

UPDATE ModifierArguments
SET Value = 9
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_BREATHTAKING_CAMPUS';

UPDATE ModifierArguments
SET Value = 9
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_BREATHTAKING_COMMERCIAL_HUB';

UPDATE ModifierArguments
SET Value = 9
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_BREATHTAKING_HOLY_SITE';

UPDATE ModifierArguments
SET Value = 9
WHERE Name = 'YieldChange'
AND ModifierId = 'TRAIT_BREATHTAKING_THEATER_DISTRICT';

UPDATE ModifierArguments
SET Value = 9
WHERE ModifierId = 'TRAIT_COASTAL_HOUSING';

--Citadel of Civ +1000% Production
UPDATE ModifierArguments
SET Value = 300
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION';

UPDATE ModifierArguments
SET Value = 300
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_CITADELCIVILIZATION_DEFENSIVE_PRODUCTION';

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
SET Combat = 69
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
AND ModifierId = 'TRAIT_HELLENISTIC_FUSION_ENCAMPMENT_EUREKA_MODIFIER';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_HELLENISTIC_FUSION_CAMPUS_EUREKA_MODIFIER';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_HELLENISTIC_FUSION_HOLY_SITE_INSPIRATION_MODIFIER';

UPDATE ModifierArguments
SET Value = 3
WHERE Name = 'Amount'
AND ModifierId = 'TRAIT_HELLENISTIC_FUSION_THEATER_INSPIRATION_MODIFIER';

--Hypapist siege bunus and support bonus 
UPDATE ModifierArguments
SET Value = 150
WHERE Name = 'Percent'
AND ModifierId = 'HYPASPIST_SUPPORT_BONUS';

UPDATE ModifierArguments
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'HYPASPIST_SIEGE_BONUS';

--Hetaroy 50 bnus with gerneral, 50 general points
UPDATE ModifierArguments
SET Value = 15
WHERE Name = 'Amount'
AND ModifierId = 'HETAIROI_GREAT_GENERAL_POINTS';

UPDATE ModifierArguments
SET Value = 15
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
SET Combat = 50
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
AND ModifierId = 'TRAIT_FALLBABYLON_SURPRISE_MOVEMENT';
WHERE ImprovementType = 'IMPROVEMENT_CONS_KACHOUFUUGETSU';

UPDATE Improvement_YieldChanges
SET YieldChange = 3
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
