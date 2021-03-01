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

UPDATE LocalizedText
SET Text = 'Replaces campus. Gain 3 [ICON_Gold] gold and 3 [ICON_Production] production adjacenry bonus equal to 3 times [ICON_Science] science bonus. Each working citizen provides 3 extra [ICON_Production] production.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_GAKUINTOSHI_DISTRICT_KENKYUJO_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Replaces campus. Gain 3 [ICON_Gold] gold and 3 [ICON_Production] production adjacenry bonus equal to 3 times [ICON_Science] science bonus. Each working citizen provides 3 extra [ICON_Production] production.'
WHERE Language = 'en_US'
AND Tag = 'LOC_DISTRICT_KENKYUJO_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Special recon unit which replaces rangers. Have much better [ICON_Movement] movement and sight range than rangers.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_GAKUINTOSHI_UNIT_LV5_JUDGEMENT_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Replica of Misaka Mikoto, clone units. Replaces Infantry, but much cheaper to build and maintain.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_MIKASA_UNIT_MIKASA_SISTERS_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Cities earn 30% more [ICON_Science] science. Each city earn +3 [ICON_Science] science and +3 [ICON_Gold] gold.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_GAKUINTOSHI_CHONOURYOKU_KAIHATSU_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Range units earn +3 [ICON_Range] range bonus.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_MIKASA_RANGE_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--Konosuba Aqua
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'Missionary and Apostles are +19 [ICON_Religion] Religious Strength in Theological Combat. Missionaries and Apostles grant +10 and +19 [ICON_Strength] Combat Strength respectively to units that shares the tile with them.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_CONS_AXIS_CULT_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+19 [ICON_Religion] Religious Strength from the Axis Cult''s Fanatics ability.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CONS_AXIS_CULT_RELIGIOUS_COMBAT_BUFF_MODIFIER_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+10 [ICON_Strength] Combat Strength when there is an Missionary in the same hex'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CONS_AXIS_CULT_MISSIONARY_UNIT_COMBAT_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+19 [ICON_Strength] Combat Strength when there is an Apostle in the same hex.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CONS_AXIS_CULT_APOSTLE_UNIT_COMBAT_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+19 [ICON_Religion] Religious Strength from the Axis Cult''s Fanatics ability'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CONS_AXIS_CULT_RELIGIOUS_COMBAT_BUFF_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unlocks the Builder ability to construct a Kachoufuugetsu, unique to Axis Cult.[NEWLINE][NEWLINE]+3 [ICON_Gold] Gold, [ICON_Faith] Faith and Appeal. +3 [ICON_Food] Food to adjacent farm. Additional +3 [ICON_Food] Food to adjacent farm when researched Sanitation. Cannot be built adjacent to another Kachoufuugetsu.'
WHERE Language = 'en_US'
AND Tag = 'LOC_IMPROVEMENT_CONS_KACHOUFUUGETSU_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Arch Priests are special units that must be unlocked with the Launch Inquisition action on an Apostle. Can use Remove Heresy. If this unit adjacent to a city when it''s captured, the city will automatically convert to the player''s majority Religion. +24 [ICON_Strength] Combat Strength each era from medieval era. Only purchase in the capital city.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_CONS_AXIS_CULT_PRIEST_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Cities have full [ICON_Housing] Housing from water, as if they were all next to a River. +6 [ICON_Housing] Housing to cities if they adjacent to a River, Lake, Oasis.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_CONS_AQUA_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--Konosuba Megumin
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = '+13 [ICON_Strength] Combat Strength for ranged unit. +150% combat experience for all ranged land units trained in city.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_CONS_CRIMSON_MAGIC_CLAN_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+23 [ICON_Strength] Combat Strength each era from medieval era'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_UNIT_CONS_CMC_WIZARD_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+23 [ICON_Strength] Combat Strength each era from medieval era'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_UNIT_CONS_CMC_WIZARD_STRENGTH_PER_ERA_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Crimson Magic Clan unique district that replace Neighborhood. Can be built from the beginning of the game. However, but provides +3 [ICON_Housing] Housing regardless of Appeal. +75% combat experience for all units trained in this city. Unlocks the Cast Explosion Magic and Make Magic Item project.'
WHERE Language = 'en_US'
AND Tag = 'LOC_DISTRICT_CONS_CMC_VILLAGE_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+{3_num} [ICON_Gold] Gold from the adjacent {1_Num : plural 1?district; other?districts;}.'
WHERE Language = 'en_US'
AND Tag = 'LOC_DISTRICT_CONS_CMC_VILLAGE_GOLD';

UPDATE LocalizedText
SET Text = 'Crimson Magic Clan unique project which provides a large amount of [ICON_Gold] Gold and [ICON_Science] Science every turn.'
WHERE Language = 'en_US'
AND Tag = 'LOC_PROJECT_ENHANCE_DISTRICT_CONS_CMC_VILLAGE_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--No Game No Live Imanity
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = '+150% [ICON_Production] Production toward Settlers and Recon units. Settler and Recon unit gain Sentry and Camouflage promotion effect.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_CONS_IMANITY_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Imanity unique building that replace Library. Triggers the [ICON_TechBoosted] Eureka moment for 3 random technologies from the Ancient to Renaissance era.'
WHERE Language = 'en_US'
AND Tag = 'LOC_BUILDING_CONS_ELCHEA_LIBRARY_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Imanity unique Ancient era unit that replace Scout. 6 Movement. +3 sight range. Even without Open Borders, this unit can enter foreign territory.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_CONS_IMANITY_SCOUT_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Each of 3 Military policy and Diplomatic policy slots in the current government are converted to  Wildcard slots. Opposing civilizations receive +75% the war weariness for fighting against Sora. Accumulate 48% less war weariness than usual.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_CONS_SORA_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Receive 4.5 [ICON_GreatScientist] Great Scientist points. [ICON_TechBoosted] Eurekas provide 74% of technologies instead of 50%.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_CONS_SHIRO_DESCRIPTION';

UPDATE LocalizedText
SET Text = '3 extra Diplomatic policy and +3 Influence points per turn toward earning city-state [ICON_Envoy] Envoys with Political Philosophy and +3 [ICON_Envoy] with Diplomatic Service civic'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_CONS_STEPHANIE_DESCRIPTION';

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

UPDATE LocalizedText
SET Text = 'A streong Unique Scout replacement that has a ranged attack and heals at the start of every turn.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_UNIT_ARAGORN_DUNEDAIN_RANGER_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Build all Districts 75% faster.[NEWLINE]+3[ICON_HOUSING]Housing for Ancient, Medieval and Renaissance Walls'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_GONDOR_LEGACY_OF_NUMENOR_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique gondorian replacement for Ancient Walls. Costs no Maintenance and provides +3[ICON_CULTURE]Culture per era passed.'
WHERE Language = 'en_US'
AND Tag = 'LOC_BUILDING_NUMENORIAN_STONEWORK_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique gondorian replacement for the Pikeman.[NEWLINE]Weak when attacking, strong when defending. [NEWLINE]19 Bonus combat strength when fighting in Districts.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_CITADEL_GUARD_DESCRIPTION';

UPDATE LocalizedText
SET Text = '-13[ICON_STRENGTH] from being weak when attacking'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CITADEL_GUARD_WEAK_WHEN_ATTACKING';

UPDATE LocalizedText
SET Text = '+13[ICON_STRENGTH] from being strong when defending'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CITADEL_GUARD_STRONG_WHEN_DEFENDING';

UPDATE LocalizedText
SET Text = '+19[ICON_STRENGTH] from fighting in or next to a District'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_CITADEL_GUARD_DISTRICT_COMBAT';

---------------------------------------------------------
---------------------------------------------------------
--Rohan
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'All Cavalry Units push enemies back if they are victorious in combat. Defenders that cannot retreat suffer additional damage.[NEWLINE][ICON_FOOD]Food and [ICON_PRODUCTION]Production Yields increased by 150% for 15 Turns after liberating a City.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_GLORIOUS_CHARGE_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Farms provide +3[ICON_PRODUCTION]Production if next to a Pasture and +3[ICON_FOOD]Food if next to a Camp. Pastures trigger a Culture Bomb.[NEWLINE]+3[ICON_MOVEMENT]Movement for Cavalry Units.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_ROHAN_HORSE_LORDS_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique rohirric replacement for the Stable. It is build in the City Center instead of the Encampment and provides 3 Copy of [ICON_RESOURCE_HORSES]Horses as well as +3[ICON_GOLD]Gold to all Pastures in this City in addition to the usual benefits of a Stable'
WHERE Language = 'en_US'
AND Tag = 'LOC_BUILDING_ROYAL_STABLE_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique rohirric replacement for the Knight. Light Cavalry Unit that can build certain improvements and is much stronger than the Knight.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_ROHIRRIM_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_SILVAN
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'Forests provide an additional +3 Appeal to all adjacent Tiles.[NEWLINE]All Cities start with a large amount of Outer Defence'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_LADY_OF_THE_GOLDEN_FOREST_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+13[ICON_STRENGTH]for all Ranged Units. Units in Forests and Jungle heal faster[NEWLINE]Elven Treehouses trigger a Culture Bomb'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_LORD_OF_MIRKWOOD_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+13[ICON_STRENGTH] for beeing lead by Thranduil<'
WHERE Language = 'en_US'
AND Tag = 'LOC_THRADUIL_RANGED_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'All Units can see and move through forests and jungle.[NEWLINE]Cities on tiles with charming appeal provide +3[ICON_CULTURE]Culture(+6[ICON_CULTURE] on breathtaking).[NEWLINE]+3[ICON_FAITH]from forests.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_CIVILIZATION_WOODELVEN_SANCTUARIES_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unlocks the Builder ability to construct an Elven Treehouse, unique to the Silvan Elves.[NEWLINE][NEWLINE]+3[ICON_FOOD]Food and +3[ICON_CULTURE]Culture.[NEWLINE]+6[ICON_FAITH]if next to a River and additional Food and Culture as you advance through the Tech and Civiv Tree.[NEWLINE]Can only be build on forests with at least charming Appeal and can''t be adjacent to each other.[NEWLINE]Also acts as a Fort.'
WHERE Language = 'en_US'
AND Tag = 'LOC_IMPROVEMENT_TREEHOUSE_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Significantly stronger silvan replacement for the Crossbowman. +13[ICON_STRENGTH]in friendly territory'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_GALADHRIM_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+13[ICON_STRENGTH] from being in friendly territory'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_GALADHRIM_MODIFIER_DESCRIPTION';
---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_ISENGARD
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'All Apostles gain the ''Heathen Conversion'' Ability. [NEWLINE]Receive 3 Faith for clearing a Barbarian Camp (scaling with Era).[NEWLINE]Spy level increased by 3 for offensive operations.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_VOICE_OF_CURUNIR_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Units may form Corps and Armies very early.[NEWLINE] Build Industrial Zones and Encampments as well as Siege and Support Units 150% faster.[NEWLINE]+1[ICON_SCIENCE]Science from Strategic Resources.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_ISENGARD_MACHINE_OF_WAR_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique isengard replacement for the Catapult. Stronger on defence and  stronger at bombarding.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_BALLISTA_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique isengard replacement for the Barracks.[NEWLINE]All units trained in this City don''t lose strength when damaged. More Production.'
WHERE Language = 'en_US'
AND Tag = 'LOC_BUILDING_URUKPITS_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_MORDOR
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'Can''t recruit Great Generals, but receives the Nazgûl unique Unit. Number of Nazgûl increases when you advance through Eras.[NEWLINE] Capturing a City grants 3 [ICON_ENVOY]Envoys.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_SLAVES_TO_HIS_WILL_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Units cost no maintenance'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_MORDOR_WHERE_THE_SHADOWS_LIE_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique mordor replacement for the Encampment District. [NEWLINE]Does not require Population to be build.'
WHERE Language = 'en_US'
AND Tag = 'LOC_DISTRICT_WASTELAND_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique mordor heavy cavalry unit, unlocked with Siege Tactics. Acts as a Battering Ram, allowing melee units to deal full damage to city walls. +8 [ICON_STRENGTH]'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_OLOG_HAI_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'A powerful unit to lead and support your armies. Heals 49hp on kills.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_NAZGUL_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_GOBLINS
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'Units in range of 3 tiles of a City you captured get +13[ICON_STRENGTH]Combat Strength.[NEWLINE]All Units only use one movement point to pillage.[NEWLINE]Gain the Warg Pack unique Unit after researching Horseback riding.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_THE_DEFILER_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+13[ICON_STRENGTH] from being near a captured City'
WHERE Language = 'en_US'
AND Tag = 'LOC_AZOG_CITY_AOE_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Receive 3 Units whenever you train a regular infantry unit (melee or anti-cavalry) or one of your unique Units.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_GOBLINS_ENDLESS_HORDES_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique goblin replacement for the Granary that is unlocked with Mining.[NEWLINE]Grants a small amount of [ICON_CULTURE]Culture and [ICON_FAITH]Faith whenever a Unit is trained in the City.'
WHERE Language = 'en_US'
AND Tag = 'LOC_BUILDING_GOBLIN_CAVES_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'A Unique Horseman replacement that has a large bonus against other cavalry units and is much cheaper to produce.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_WARG_PACK_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique goblin replacement for the Warrior.[NEWLINE]Yields a lot of [ICON_GOLD]Gold from defeated enemy Units.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_MARAUDER_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--CIVILIZATION_DWARVES
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'All units receive 300% support Bonus. May declare war on anyone at war with their allies without warmonger penalties. [NEWLINE]1 copy of a Strategic resource allows you to produce and purchase units requiring it in any city. Receives the Axe Thrower unique Unit.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_LORD_OF_THE_IRON_HILLS_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Cities founded on Mountains yield +60%[ICON_GOLD]Gold and recieve an additional Great Work Slot.[NEWLINE]+6[ICON_GOLD]Gold from international Trade Routes.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_KING_UNDER_THE_MOUNTAIN_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Founding a city claims all surrounding Mountain Tiles for that city. Gets 3 free Builders after researching Mining. Builders receive 3 additional charges.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_HALLS_OF_MORIA_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique dwarven replacement for the Workshop.[NEWLINE]Cheaper to produce and provides bonus [ICON_GOLD] Gold equal to the adjacency bonus of the Industrial district, 3 [ICON_GreatMerchant] and 5 [ICON_PRODUCTION].'
WHERE Language = 'en_US'
AND Tag = 'LOC_BUILDING_DWARVEN_FORGE_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique dwarven replacement for the Swordsman.  +10[ICON_STRENGTH] when fighting on Hills or Mountain Tiles.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_GUARDIAN_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+10[ICON_STRENGTH] from fighting on Hills or Mountain Tiles.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_GUARDIAN_MODIFIER_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Unique replacement for the Archer. More expensive and with only a one tile range, but with higher ranged and melee strength.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_AXETHROWER_DESCRIPTION';

---------------------------------------------------------
---------------------------------------------------------
--JFD's Leader Packs
---------------------------------------------------------
---------------------------------------------------------

---------------------------------------------------------
--India
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'Combat units gain +13 [ICON_STRENGTH] Combat Strength near foreign cities following your Religion and receive a [ICON_GREATWORK_RELIC] Relic upon conquest of a city with a Holy Site. Shrines have a slot for 9 [ICON_GREATWORK_RELIC] Relics.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_JFD_RELICS_BLESSED_ONE_DESCRIPTION';

---------------------------------------------------------
--Germany
---------------------------------------------------------

UPDATE LocalizedText
SET Text = '+60% [ICON_PRODUCTION] Military Production and +3 [ICON_MOVEMENT] Movement for Units during wartime with a major civilization. Gain the Panzer unique unit when they research the Combustion technology.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_JFD_BLITZKRIEG_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'German unique Modern era unit that replaces the Tank when Hitler is their leader. Has +13 [ICON_Strength] Combat Strength when attacking and can move after attacking.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_JFD_PANZER_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+13 [ICON_Strength] Combat Strength when attacking. Can move after attacking.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_JFD_PANZER_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Encampment Buildings yield 3 times [ICON_GOLD] Gold and [ICON_SCIENCE] Science equal to their intrinsic [ICON_PRODUCTION] Production output. Gain the Landwehr unique unit when they research the Rifling technology.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_JFD_NOBLE_ACADEMIES_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'German unique Industrial era unit when Frederick is their leader. Is unaffected by ZOC. Has +13 [ICON_STRENGTH] Combat Strength when adjacent to another Landwehr unit.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_JFD_LANDWEHR_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+13 [ICON_Strength] Combat Strength when adjacent to another Landwehr. Not affected by ZOC.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_JFD_LANDWEHR_DESCRIPTION';

---------------------------------------------------------
--France
---------------------------------------------------------

UPDATE LocalizedText
SET Text = 'Earns many [ICON_GREATGENERAL] Great General Points when defeating an enemy unit within their own territory and [ICON_GREATGENERAL] Great Generals have +6 [ICON_MOVEMENT] Movement. Gain the Char B1 unique unit when they research the Combustion technology.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_JFD_FREE_FRANCE_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+6 [ICON_MOVEMENT] Movement for Great Generals.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_JFD_FREE_FRANCE_GENERAL_MOVES_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+30 [ICON_GREATGENERAL] Great General points for killing units in your own territory.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_JFD_FREE_FRANCE_GENERAL_POINTS_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+17 [ICON_Strength] Combat Strength when defending.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_JFD_CHAR_B1_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'French unique Modern era unit that replaces the Tank when Charles de Gaulle is their leader. Has +17 [ICON_Strength] Combat Strength when defending.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_JFD_CHAR_B1_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Receives +3 [ICON_ENVOY] Envoy and +6 [ICON_CULTURE] Culture Per Turn for each Wonder constructed in the [ICON_CAPITAL] Capital. Gain the Vieux Corps unique unit when they research the Gunpowder technology.'
WHERE Language = 'en_US'
AND Tag = 'LOC_TRAIT_LEADER_JFD_SUN_KING_DESCRIPTION';

UPDATE LocalizedText
SET Text = '+17 [ICON_STRENGTH] Combat Strength when defending vs. city attacks. Can move after attacking.'
WHERE Language = 'en_US'
AND Tag = 'LOC_ABILITY_JFD_VIEUX_CITY_CENTER_COMBAT_DESC';

UPDATE LocalizedText
SET Text = 'French unique Renaissance era unit when Louis XIV is their leader. Has +17 [ICON_STRENGTH] Combat Strength when defending vs. city attacks and can move after attacking. Costs 2 more Maintenance than the contemporary Musketman.'
WHERE Language = 'en_US'
AND Tag = 'LOC_UNIT_JFD_VIEUX_DESCRIPTION';


---------------------------------------------------------
---------------------------------------------------------
-- Ms. Human from Humanity has Declined
---------------------------------------------------------
---------------------------------------------------------

UPDATE LocalizedText
SET Text="The fairies are very productive when they're energetic. +90% [ICON_Production] production when constructing buildings. When building wonders and districts you may spend Builder charges to complete 60% of the original wonder cost (Only for ancient and classical era wonders. But fairies stays on a wonder under construction will be spend on accelerating with all its charges before next turn, amount of acceleration is not greater than 60% of the prodction cost of the most expensive classic era wonder). However, anything built quickly is very unstable, and the exterior garrison health of all cities is reduced by 100 points, and -10 [ICON_Strength] city strength. After finishing {LOC_TECH_SAILING_NAME}, automatically grants {LOC_TECH_SHIPBUILDING_NAME}."
WHERE Language = 'en_US' AND Tag="LOC_TRAIT_ONE_NIGHT_CITY_DESCRIPTION";

UPDATE LocalizedText
SET Text="The place where Ms. Human makes delicious desserts, replacing the Granary. Depending on the ingredients of each place only local unique desserts can be made. The first six established dessert house will offer 3 copies of one of six dessert luxuries, which +6 [ICON_Amenities] amenities."
WHERE Language = 'en_US' AND Tag="LOC_BUILDING_DESSERT_HOUSE_DESCRIPTION";


UPDATE LocalizedText
SET Text="Statues the fairies made for Ms. Human. Replace Monument. Provides +6 extra [ICON_Faith] faith."
WHERE Language = 'en_US' AND Tag="LOC_BUILDING_GODDESS_STATUE_DESCRIPTION";

UPDATE LocalizedText
SET Text="Inside her pretty looking, Ms. Human has a harakuro character. Fortunately she don't do bad things with it. She is just able to see through people's real thoughts underneath the facade. +6 [ICON_VisLimited] Diplomatic visibility."
WHERE Language = 'en_US' AND Tag="LOC_TRAIT_INSIDE_PINK_ITS_ALL_BLACK_DESCRIPTION";

UPDATE LocalizedText
SET Text="妖精们鼓起干劲的时候，工作效率是很高的。在建造建筑时，+90% [ICON_Production] 生产力。可以消耗建造者劳动力的一次劳动力来来推进60%的区域和奇观建造进程（后者仅对远古及古典奇观有效，不过如果将建造者置于建造中的奇观上，其全部劳动力都将在下一回合被用做建造加速，每点劳动力加速值不高于当前速度下古典时代最贵的奇观的消耗的60%）。然而快速建造出来的东西都很不稳固，所有城市的外部防御减100点，并 -10 [ICON_Strength] 防御力。研究了{LOC_TECH_SAILING_NAME}科技之后，自动给予{LOC_TECH_SHIPBUILDING_NAME}科技。"
WHERE Language = 'zh_Hans_CN' 
AND Tag="LOC_TRAIT_ONE_NIGHT_CITY_DESCRIPTION";

UPDATE LocalizedText
SET Text="人类小姐制作美味点心的地方，替代谷仓。根据各地食材不同只能制作当地特有的点心。前六个建立的点心作坊会提供六种点心奢侈品中的一种3份，+6 [ICON_Amenities] 宜居度。"
WHERE Language = 'zh_Hans_CN' 
AND Tag="LOC_BUILDING_DESSERT_HOUSE_DESCRIPTION";


UPDATE LocalizedText
SET Text="妖精桑们为人类小姐树立的雕像，替代纪念碑。额外+6 [ICON_Faith] 信仰值。"
WHERE Language = 'zh_Hans_CN' 
AND Tag="LOC_BUILDING_GODDESS_STATUE_DESCRIPTION";

UPDATE LocalizedText
SET Text="在可爱的外表下面，人类小姐实际上拥有一颗腹黑的心。不过好在她也不会用来干坏事，她只是能够看穿别人外表下的真实想法罢了。+6 [ICON_VisLimited] 外交可见度。"
WHERE Language = 'zh_Hans_CN' 
AND Tag="LOC_TRAIT_INSIDE_PINK_ITS_ALL_BLACK_DESCRIPTION";
