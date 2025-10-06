-- Saaya Traits
INSERT INTO Types
(Type,  Kind)
VALUES
('TRAIT_LEADER_SAAYA_gkls621', 'KIND_TRAIT'),
('MODIFIER_PPP_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE_gkls621', 'KIND_MODIFIER');

INSERT INTO DynamicModifiers (ModifierType, EffectType, CollectionType)
VALUES
('MODIFIER_PPP_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE_gkls621', 'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE', 'COLLECTION_PLAYER_CITIES');

INSERT INTO Traits
(TraitType,                     Name,                                   Description)
VALUES
('TRAIT_LEADER_SAAYA_gkls621', 'LOC_TRAIT_LEADER_SAAYA_gkls621_NAME', 'LOC_TRAIT_LEADER_SAAYA_gkls621_DESCRIPTION');

INSERT INTO LeaderTraits
(LeaderType,                TraitType)
VALUES
('LEADER_SAAYA_gkls621',   'TRAIT_LEADER_SAAYA_gkls621'),
('LEADER_SAAYA_gkls621',   'TRAIT_DISTRICT_SHOPPING_STREET_gkls621');

INSERT INTO TraitModifiers
(TraitType, ModifierId)
VALUES
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_RANDOM_STAR_GRANT_GRANARY_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_NEIGHBORHOOD_TIER1_TRADE_ROUTE_CAPACITY_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_BONUS_FAITH_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_BONUS_PRODUCTION_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_WHEAT_CULTURE_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_FARM_INDUSTRIAL_ZONE_PRODUCTION_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_TRADE_ROUTE_GOLD_FROM_FARMS_gkls621'),
('TRAIT_LEADER_SAAYA_gkls621', 'SAAYA_TRADE_ROUTE_RELIGIOUS_PRESSURE_gkls621');

INSERT INTO Modifiers
(ModifierId,                                                   ModifierType,                                                        SubjectRequirementSetId)
VALUES
('SAAYA_RANDOM_STAR_GRANT_GRANARY_gkls621',                 'MODIFIER_PPP_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE_gkls621',     'REQSET_PPP_CITY_HAS_RANDOMSTAR_gkls621'),
('SAAYA_NEIGHBORHOOD_TIER1_TRADE_ROUTE_CAPACITY_gkls621',   'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',                   'REQSET_PPP_CITY_HAS_NEIGHBORHOOD_TIER1_BUILDINGS_gkls621'),
('SAAYA_BONUS_FAITH_gkls621',                               'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'REQSET_PPP_PLOT_HAS_BONUS_RESOURCE_gkls621'),
('SAAYA_BONUS_PRODUCTION_gkls621',                          'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'REQSET_PPP_PLOT_HAS_BONUS_RESOURCE_gkls621'),
('SAAYA_WHEAT_CULTURE_gkls621',                             'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'REQSET_PPP_PLOT_HAS_WHEAT_gkls621'),
('SAAYA_FARM_INDUSTRIAL_ZONE_PRODUCTION_gkls621',           'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'REQSET_PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621'),
('SAAYA_TRADE_ROUTE_GOLD_FROM_FARMS_gkls621',               'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_IMPROVEMENT_IN_TARGET',   NULL),
('SAAYA_TRADE_ROUTE_RELIGIOUS_PRESSURE_gkls621',            'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_RELIGIOUS_PRESSURE',                NULL);

INSERT INTO ModifierArguments
(ModifierId,                                                Name,               Value)
VALUES
('SAAYA_RANDOM_STAR_GRANT_GRANARY_gkls621',                 'BuildingType',     'BUILDING_GRANARY'),
('SAAYA_NEIGHBORHOOD_TIER1_TRADE_ROUTE_CAPACITY_gkls621',   'Amount',           2),
('SAAYA_BONUS_FAITH_gkls621',                               'YieldType',        'YIELD_FAITH'),
('SAAYA_BONUS_FAITH_gkls621',                               'Amount',           2),
('SAAYA_BONUS_PRODUCTION_gkls621',                          'YieldType',        'YIELD_PRODUCTION'),
('SAAYA_BONUS_PRODUCTION_gkls621',                          'Amount',           2),
('SAAYA_WHEAT_CULTURE_gkls621',                             'YieldType',        'YIELD_CULTURE'),
('SAAYA_WHEAT_CULTURE_gkls621',                             'Amount',           2),
('SAAYA_FARM_INDUSTRIAL_ZONE_PRODUCTION_gkls621',           'YieldType',        'YIELD_PRODUCTION'),
('SAAYA_FARM_INDUSTRIAL_ZONE_PRODUCTION_gkls621',           'Amount',           2),
('SAAYA_TRADE_ROUTE_GOLD_FROM_FARMS_gkls621',               'Amount',           1),
('SAAYA_TRADE_ROUTE_GOLD_FROM_FARMS_gkls621',               'YieldType',        'YIELD_GOLD'),
('SAAYA_TRADE_ROUTE_GOLD_FROM_FARMS_gkls621',               'Origin',           1),
('SAAYA_TRADE_ROUTE_GOLD_FROM_FARMS_gkls621',               'ImprovementType',  'IMPROVEMENT_FARM'),
('SAAYA_TRADE_ROUTE_RELIGIOUS_PRESSURE_gkls621',            'Origin',           1),
('SAAYA_TRADE_ROUTE_RELIGIOUS_PRESSURE_gkls621',            'Destination',      1),
('SAAYA_TRADE_ROUTE_RELIGIOUS_PRESSURE_gkls621',            'Amount',           100);

INSERT INTO RequirementSets
(RequirementSetId,  RequirementSetType)
VALUES
('REQSET_PPP_CITY_HAS_NEIGHBORHOOD_TIER1_BUILDINGS_gkls621',  'REQUIREMENTSET_TEST_ANY'),
('REQSET_PPP_PLOT_HAS_BONUS_RESOURCE_gkls621',  'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLOT_HAS_WHEAT_gkls621',  'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621',  'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
(RequirementSetId,  RequirementId)
VALUES
('REQSET_PPP_PLOT_HAS_BONUS_RESOURCE_gkls621',  'PPP_PLOT_HAS_BONUS_RESOURCE_gkls621'),
('REQSET_PPP_PLOT_HAS_WHEAT_gkls621',   'PPP_PLOT_HAS_WHEAT_gkls621'),
('REQSET_PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621',    'PPP_PLOT_HAS_FARM_gkls621'),
('REQSET_PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621',    'PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621');

INSERT INTO RequirementSetRequirements
(RequirementSetId,  RequirementId)
SELECT DISTINCT
'REQSET_PPP_CITY_HAS_NEIGHBORHOOD_TIER1_BUILDINGS_gkls621',
'PPP_CITY_HAS_' || SUBSTR(b1.BuildingType, 10) || '_gkls621'
FROM Buildings b1
WHERE b1.PrereqDistrict = 'DISTRICT_NEIGHBORHOOD'
AND EXISTS (
    SELECT 1
    FROM BuildingPrereqs b2
    WHERE b2.Building = b1.BuildingType AND b2.PrereqBuilding IS NULL
);

INSERT INTO Requirements
(RequirementId, RequirementType)
VALUES
('PPP_PLOT_HAS_BONUS_RESOURCE_gkls621', 'REQUIREMENT_PLOT_RESOURCE_CLASS_TYPE_MATCHES'),
('PPP_PLOT_HAS_WHEAT_gkls621',  'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES'),
('PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621',   'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');

INSERT INTO Requirements
(RequirementId, RequirementType)
SELECT DISTINCT
'PPP_CITY_HAS_' || SUBSTR(b1.BuildingType, 10) || '_gkls621',
'REQUIREMENT_CITY_HAS_BUILDING'
FROM Buildings b1
WHERE b1.PrereqDistrict = 'DISTRICT_NEIGHBORHOOD'
AND EXISTS (
    SELECT 1
    FROM BuildingPrereqs b2
    WHERE b2.Building = b1.BuildingType AND b2.PrereqBuilding IS NULL
);

INSERT INTO RequirementArguments
(RequirementId, Name,   Value)
VALUES
('PPP_PLOT_HAS_BONUS_RESOURCE_gkls621', 'ResourceClassType',    'RESOURCECLASS_BONUS'),
('PPP_PLOT_HAS_WHEAT_gkls621',  'ResourceType', 'RESOURCE_WHEAT'),
('PPP_PLOT_ADJACENT_TO_INDUSTRY_gkls621',   'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE');

INSERT INTO RequirementArguments
(RequirementId, Name,   Value)
SELECT DISTINCT
'PPP_CITY_HAS_' || SUBSTR(b1.BuildingType, 10) || '_gkls621',
'BuildingType', b1.BuildingType
FROM Buildings b1
WHERE b1.PrereqDistrict = 'DISTRICT_NEIGHBORHOOD'
AND EXISTS (
    SELECT 1
    FROM BuildingPrereqs b2
    WHERE b2.Building = b1.BuildingType AND b2.PrereqBuilding IS NULL
);