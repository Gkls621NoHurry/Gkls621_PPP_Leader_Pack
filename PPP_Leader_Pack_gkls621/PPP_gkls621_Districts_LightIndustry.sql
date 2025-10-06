-- Saaya's Unique District with Light Industrial Zone Active

INSERT INTO Types
(Type,  Kind)
VALUES
('MODIFIER_PPP_SINGLE_CITY_ADJUST_ALL_PROJECTS_PRODUCTION_gkls621', 'KIND_MODIFIER'),
('DISTRICT_YAMABUKI_BAKERY_gkls621',    'KIND_DISTRICT'),
('TRAIT_DISTRICT_YAMABUKI_BAKERY_gkls621',    'KIND_TRAIT');

INSERT INTO Traits
(TraitType, Name,   Description)
VALUES
('TRAIT_DISTRICT_YAMABUKI_BAKERY_gkls621',  'LOC_DISTRICT_YAMABUKI_BAKERY_gkls621_NAME',    'LOC_DISTRICT_YAMABUKI_BAKERY_gkls621_DESCRIPTION');

INSERT INTO DynamicModifiers (ModifierType, EffectType, CollectionType)
VALUES
('MODIFIER_PPP_SINGLE_CITY_ADJUST_ALL_PROJECTS_PRODUCTION_gkls621', 'EFFECT_ADJUST_ALL_PROJECTS_PRODUCTION', 'COLLECTION_OWNER');

INSERT INTO DistrictReplaces
(CivUniqueDistrictType, ReplacesDistrictType)
VALUES
('DISTRICT_YAMABUKI_BAKERY_gkls621',    'DISTRICT_LIGHT_INDUSTRIAL_ZONE');

INSERT INTO Districts 
(   DistrictType,
    Name,
    PrereqCivic,
    Coast,
    Description,
    Cost,
    RequiresPlacement,
    RequiresPopulation,
    NoAdjacentCity,
    CityCenter,
    Aqueduct,
    InternalOnly,
    ZOC,
    FreeEmbark,
    HitPoints,
    CaptureRemovesBuildings,
    CaptureRemovesCityDefenses,
    PlunderType,
    PlunderAmount,
    TradeEmbark,
    MilitaryDomain,
    CostProgressionModel,
    CostProgressionParam1,
    TraitType,
    Appeal,
    Housing,
    Entertainment,
    OnePerCity,
    AllowsHolyCity,
    Maintenance,
    AirSlots,
    CitizenSlots,
    TravelTime,
    CityStrengthModifier,
    AdjacentToLand,
    CanAttack,
    AdvisorType,
    CaptureRemovesDistrict,
    MaxPerPlayer
)SELECT
    'DISTRICT_YAMABUKI_BAKERY_gkls621',
    'LOC_DISTRICT_YAMABUKI_BAKERY_gkls621_NAME',
    'CIVIC_CRAFTSMANSHIP',
    Coast,
    'LOC_DISTRICT_YAMABUKI_BAKERY_gkls621_DESCRIPTION',
    Cost *0.5,
    RequiresPlacement,
    RequiresPopulation,
    NoAdjacentCity,
    CityCenter,
    Aqueduct,
    InternalOnly,
    ZOC,
    FreeEmbark,
    HitPoints,
    CaptureRemovesBuildings,
    CaptureRemovesCityDefenses,
    'PLUNDER_GOLD',
    PlunderAmount,
    TradeEmbark,
    MilitaryDomain,
    CostProgressionModel,
    CostProgressionParam1,
    'TRAIT_DISTRICT_YAMABUKI_BAKERY_gkls621',
    1,
    3,
    1,
    0,
    AllowsHolyCity,
    Maintenance,
    AirSlots,
    7,
    TravelTime,
    CityStrengthModifier,
    AdjacentToLand,
    CanAttack,
    AdvisorType,
    CaptureRemovesDistrict,
    MaxPerPlayer
FROM Districts WHERE DistrictType = 'DISTRICT_LIGHT_INDUSTRIAL_ZONE';

INSERT INTO District_Adjacencies
(DistrictType,  YieldChangeId)
VALUES
('DISTRICT_CAMPUS',    'Campus_Yamabuki_Bakery_Science'),
('DISTRICT_HOLY_SITE',    'Holy_Site_Yamabuki_Bakery_Faith'),
('DISTRICT_THEATER',    'Theater_Yamabuki_Bakery_Culture'),
('DISTRICT_INDUSTRIAL_ZONE',    'Industry_Yamabuki_Bakery_Production'),
('DISTRICT_SPACEPORT',  'Spaceport_Yamabuki_Bakery_Science');

INSERT INTO District_Adjacencies
(DistrictType,  YieldChangeId)
SELECT DistrictType,    'Yamabuki_Bakery_Gold'
FROM Districts WHERE TraitType IS NULL;

INSERT INTO District_CitizenYieldChanges
(DistrictType,  YieldType,  YieldChange)
VALUES
('DISTRICT_YAMABUKI_BAKERY_gkls621',    'YIELD_GOLD',   2),
('DISTRICT_YAMABUKI_BAKERY_gkls621',    'YIELD_FOOD',   2);

INSERT INTO District_GreatPersonPoints
(DistrictType,  GreatPersonClassType,   PointsPerTurn)
SELECT DISTINCT 'DISTRICT_YAMABUKI_BAKERY_gkls621',  GreatPersonClassType,   1
FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_LIGHT_INDUSTRIAL_ZONE' OR DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' OR DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' OR DistrictType = 'DISTRICT_C_AGRICULTURE';

INSERT INTO District_TradeRouteYields
(DistrictType,  YieldType,  YieldChangeAsOrigin,    YieldChangeAsDomesticDestination,   YieldChangeAsInternationalDestination)
SELECT 'DISTRICT_YAMABUKI_BAKERY_gkls621',  YieldType,  YieldChangeAsOrigin,    YieldChangeAsDomesticDestination,   YieldChangeAsInternationalDestination
FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_LIGHT_INDUSTRIAL_ZONE';

INSERT INTO Improvement_Adjacencies
(ImprovementType,	YieldChangeId)
VALUES
('IMPROVEMENT_FARM',	'Farm_Yamabuki_Bakery_Production');

INSERT INTO Adjacency_YieldChanges
(ID,    Description,    YieldType,  YieldChange,    TilesRequired,  AdjacentDistrict)
VALUES
('Farm_Yamabuki_Bakery_Production',   'LOC_FARM_YAMABUKI_BAKERY_PRODUCTION_gkls621_DESCRIPTION', 'YIELD_PRODUCTION', 2, 1, 'DISTRICT_YAMABUKI_BAKERY_gkls621'),
('Campus_Yamabuki_Bakery_Science',    'LOC_CAMPUS_YAMABUKI_BAKERY_SCIENCE_gkls621_DESCRIPTION', 'YIELD_SCIENCE',   2,  1,  'DISTRICT_YAMABUKI_BAKERY_gkls621'),
('Holy_Site_Yamabuki_Bakery_Faith',    'LOC_HOLY_SITE_YAMABUKI_BAKERY_FAITH_gkls621_DESCRIPTION', 'YIELD_FAITH',   2,  1,  'DISTRICT_YAMABUKI_BAKERY_gkls621'),
('Theater_Yamabuki_Bakery_Culture',    'LOC_THEATER_YAMABUKI_BAKERY_CULTURE_gkls621_DESCRIPTION', 'YIELD_CULTURE',   2,  1,  'DISTRICT_YAMABUKI_BAKERY_gkls621'),
('Industry_Yamabuki_Bakery_Production',    'LOC_INDUSTRY_YAMABUKI_BAKERY_PRODUCTION_gkls621_DESCRIPTION', 'YIELD_PRODUCTION',   3,  1,  'DISTRICT_YAMABUKI_BAKERY_gkls621'),
('Spaceport_Yamabuki_Bakery_Science',    'LOC_CAMPUS_YAMABUKI_BAKERY_SCIENCE_gkls621_DESCRIPTION', 'YIELD_SCIENCE',   4,  1,  'DISTRICT_YAMABUKI_BAKERY_gkls621'),
('Yamabuki_Bakery_Gold',    'LOC_YAMABUKI_BAKERY_GOLD_gkls621_DESCRIPTION', 'YIELD_GOLD',   1,  1,  'DISTRICT_YAMABUKI_BAKERY_gkls621');

INSERT INTO DistrictModifiers
(DistrictType,  ModifierId)
VALUES
('DISTRICT_YAMABUKI_BAKERY_gkls621',    'COLOSSUS_ADDTRADEROUTE'),
('DISTRICT_YAMABUKI_BAKERY_gkls621', 'YAMABUKI_BAKERY_ADJUST_PROJECT_PRODUCTION_gkls621');

INSERT INTO Modifiers(ModifierId, ModifierType)
VALUES
('YAMABUKI_BAKERY_ADJUST_PROJECT_PRODUCTION_gkls621', 'MODIFIER_PPP_SINGLE_CITY_ADJUST_ALL_PROJECTS_PRODUCTION_gkls621');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
('YAMABUKI_BAKERY_ADJUST_PROJECT_PRODUCTION_gkls621', 'Amount', 8);

-- Saaya Trait adjustment
UPDATE LeaderTraits
SET TraitType = 'TRAIT_DISTRICT_YAMABUKI_BAKERY_gkls621'
WHERE LeaderType = 'LEADER_SAAYA_gkls621' AND TraitType = 'TRAIT_DISTRICT_SHOPPING_STREET_gkls621';

UPDATE AiFavoredItems
SET Item = 'DISTRICT_YAMABUKI_BAKERY_gkls621'
WHERE ListType = 'SAAYA_gkls621_DISTRICT' AND Item = 'DISTRICT_SHOPPING_STREET_gkls621';

INSERT INTO AiFavoredItems
(ListType,  Item,   Favored)
VALUES
('SAAYA_gkls621_DISTRICT',  'DISTRICT_NEIGHBORHOOD',    1);