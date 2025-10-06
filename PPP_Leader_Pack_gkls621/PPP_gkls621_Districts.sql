-- Saaya's Unique District in default situation
INSERT INTO Types
(Type,  Kind)
VALUES
('DISTRICT_SHOPPING_STREET_gkls621',    'KIND_DISTRICT'),
('TRAIT_DISTRICT_SHOPPING_STREET_gkls621',  'KIND_TRAIT');

INSERT INTO Traits
(TraitType, Name,   Description)
VALUES
('TRAIT_DISTRICT_SHOPPING_STREET_gkls621',  'LOC_DISTRICT_SHOPPING_STREET_gkls621_NAME',    'LOC_DISTRICT_SHOPPING_STREET_gkls621_DESCRIPTION');

INSERT INTO DistrictReplaces
(CivUniqueDistrictType, ReplacesDistrictType)
VALUES
('DISTRICT_SHOPPING_STREET_gkls621',    'DISTRICT_NEIGHBORHOOD');

INSERT INTO Districts 
(   DistrictType,
    Name,
    PrereqTech,
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
    'DISTRICT_SHOPPING_STREET_gkls621',
    'LOC_DISTRICT_SHOPPING_STREET_gkls621_NAME',
    PrereqTech,
    'CIVIC_MEDIEVAL_FAIRES',
    Coast,
    'LOC_DISTRICT_SHOPPING_STREET_gkls621_DESCRIPTION',
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
    PlunderType,
    PlunderAmount,
    TradeEmbark,
    MilitaryDomain,
    CostProgressionModel,
    CostProgressionParam1 *0.5,
    'TRAIT_DISTRICT_SHOPPING_STREET_gkls621',
    Appeal,
    3,
    Entertainment,
    OnePerCity,
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
FROM Districts WHERE DistrictType = 'DISTRICT_NEIGHBORHOOD';

INSERT INTO District_Adjacencies
(DistrictType,  YieldChangeId)
VALUES
('DISTRICT_SHOPPING_STREET_gkls621',    'Shopping_street_City_Center_Food'),
('DISTRICT_SHOPPING_STREET_gkls621',    'Shopping_street_City_Center_Gold'),
('DISTRICT_SHOPPING_STREET_gkls621',    'Shopping_street_Commercial_Hub_Gold'),
('DISTRICT_SHOPPING_STREET_gkls621',    'Shopping_street_Entertainment_Gold'),
('DISTRICT_SHOPPING_STREET_gkls621',    'Shopping_street_Shopping_Street_Gold'),
('DISTRICT_SHOPPING_STREET_gkls621',    'Shopping_street_Shopping_Street_Food');

INSERT INTO District_CitizenYieldChanges
(DistrictType,  YieldType,  YieldChange)
VALUES
('DISTRICT_SHOPPING_STREET_gkls621',    'YIELD_GOLD',   2),
('DISTRICT_SHOPPING_STREET_gkls621',    'YIELD_FOOD',   3);

INSERT INTO Adjacency_YieldChanges
(ID,    Description,    YieldType,  YieldChange,    TilesRequired,  AdjacentDistrict)
VALUES
('Shopping_street_City_Center_Food',    'LOC_SHOPPING_STREET_CITY_CENTER_FOOD_gkls621_DESCRIPTION', 'YIELD_FOOD',   1,  1,  'DISTRICT_CITY_CENTER'),
('Shopping_street_City_Center_Gold',    'LOC_SHOPPING_STREET_CITY_CENTER_GOLD_gkls621_DESCRIPTION', 'YIELD_GOLD',   1,  1,  'DISTRICT_CITY_CENTER'),
('Shopping_street_Commercial_Hub_Gold',    'LOC_SHOPPING_STREET_COMMERCIAL_HUB_GOLD_gkls621_DESCRIPTION', 'YIELD_GOLD',   2,  1,  'DISTRICT_COMMERCIAL_HUB'),
('Shopping_street_Entertainment_Gold',    'LOC_SHOPPING_STREET_ENTERTAINMENT_GOLD_gkls621_DESCRIPTION', 'YIELD_GOLD',   2,  1,  'DISTRICT_ENTERTAINMENT_COMPLEX'),
('Shopping_street_Shopping_Street_Gold',    'LOC_SHOPPING_STREET_SHOPPING_STREET_GOLD_gkls621_DESCRIPTION', 'YIELD_GOLD',   1,  1,  'DISTRICT_SHOPPING_STREET_gkls621'),
('Shopping_street_Shopping_Street_Food',    'LOC_SHOPPING_STREET_SHOPPING_STREET_FOOD_gkls621_DESCRIPTION', 'YIELD_FOOD',   2,  1,  'DISTRICT_SHOPPING_STREET_gkls621');

INSERT INTO DistrictModifiers
(DistrictType,  ModifierId)
VALUES
('DISTRICT_SHOPPING_STREET_gkls621',    'SHOPPING_STREET_CITY_CENTER_HOUSING_gkls621'),
('DISTRICT_SHOPPING_STREET_gkls621',    'SHOPPING_STREET_MUTUAL_ADJACENCY_HOUSING_gkls621');

INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId)
VALUES
('SHOPPING_STREET_CITY_CENTER_HOUSING_gkls621', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',  'REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_CITY_CENTER_gkls621'),
('SHOPPING_STREET_MUTUAL_ADJACENCY_HOUSING_gkls621',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',  'REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_SHOPPING_STREET_gkls621');

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
VALUES
('SHOPPING_STREET_CITY_CENTER_HOUSING_gkls621', 'Amount',   2),
('SHOPPING_STREET_MUTUAL_ADJACENCY_HOUSING_gkls621', 'Amount',   2);

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
('REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_CITY_CENTER_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_SHOPPING_STREET_gkls621', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
('REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_CITY_CENTER_gkls621',  'PPP_PLOT_HAS_SHOPPING_STREET_gkls621'),
('REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_CITY_CENTER_gkls621', 'PPP_PLOT_ADJACENT_TO_CITY_CENTER_gkls621'),
('REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_SHOPPING_STREET_gkls621',  'PPP_PLOT_HAS_SHOPPING_STREET_gkls621'),
('REQSET_PPP_SHOPPING_STREET_ADJACENT_TO_SHOPPING_STREET_gkls621', 'PPP_PLOT_ADJACENT_TO_SHOPPING_STREET_gkls621');

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType)
VALUES
('PPP_PLOT_HAS_SHOPPING_STREET_gkls621', 'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES'),
('PPP_PLOT_ADJACENT_TO_CITY_CENTER_gkls621', 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES'),
('PPP_PLOT_ADJACENT_TO_SHOPPING_STREET_gkls621', 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value)
VALUES
('PPP_PLOT_HAS_SHOPPING_STREET_gkls621', 'DistrictType', 'DISTRICT_SHOPPING_STREET_gkls621'),
('PPP_PLOT_ADJACENT_TO_CITY_CENTER_gkls621', 'DistrictType', 'DISTRICT_CITY_CENTER'),
('PPP_PLOT_ADJACENT_TO_CITY_CENTER_gkls621', 'MaxRange', '1'),
('PPP_PLOT_ADJACENT_TO_CITY_CENTER_gkls621', 'MinRange', '1'),
('PPP_PLOT_ADJACENT_TO_CITY_CENTER_gkls621', 'MustBeFunctioning', '1'),
('PPP_PLOT_ADJACENT_TO_SHOPPING_STREET_gkls621', 'DistrictType', 'DISTRICT_SHOPPING_STREET_gkls621'),
('PPP_PLOT_ADJACENT_TO_SHOPPING_STREET_gkls621', 'MaxRange', '1'),
('PPP_PLOT_ADJACENT_TO_SHOPPING_STREET_gkls621', 'MinRange', '1'),
('PPP_PLOT_ADJACENT_TO_SHOPPING_STREET_gkls621', 'MustBeFunctioning', '1');

-- The first shopping street can grant traders
INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId)
VALUES
('SHOPPING_STREET_TRADE_ROUTE_CAPACITY_gkls621',    'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',  'REQSET_PPP_PLAYER_HAS_SHOPPING_STREET_gkls621'),
('SHOPPING_STREET_GRANT_TRADERS_gkls621',           'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',  'REQSET_PPP_PLAYER_HAS_SHOPPING_STREET_gkls621');

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
VALUES
('SHOPPING_STREET_TRADE_ROUTE_CAPACITY_gkls621',    'Amount',              3),
('SHOPPING_STREET_GRANT_TRADERS_gkls621',           'AllowUniqueOverride', 0),
('SHOPPING_STREET_GRANT_TRADERS_gkls621',           'Amount',              3),
('SHOPPING_STREET_GRANT_TRADERS_gkls621',           'UnitType',            'UNIT_TRADER');

INSERT OR IGNORE INTO TraitModifiers
(TraitType, ModifierId)
VALUES
('TRAIT_DISTRICT_SHOPPING_STREET_gkls621',  'SHOPPING_STREET_TRADE_ROUTE_CAPACITY_gkls621'),
('TRAIT_DISTRICT_SHOPPING_STREET_gkls621',  'SHOPPING_STREET_GRANT_TRADERS_gkls621');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
('REQSET_PPP_PLAYER_HAS_SHOPPING_STREET_gkls621', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
('REQSET_PPP_PLAYER_HAS_SHOPPING_STREET_gkls621', 'PPP_PLAYER_HAS_SHOPPING_STREET_gkls621');

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES
('PPP_PLAYER_HAS_SHOPPING_STREET_gkls621', 'REQUIREMENT_PLAYER_HAS_DISTRICT');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES
('PPP_PLAYER_HAS_SHOPPING_STREET_gkls621', 'DistrictType', 'DISTRICT_SHOPPING_STREET_gkls621');
