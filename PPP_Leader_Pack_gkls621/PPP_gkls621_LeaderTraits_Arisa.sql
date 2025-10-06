-- Arisa Traits
INSERT INTO Types
(Type,  Kind)
VALUES
('TRAIT_LEADER_ARISA_gkls621', 'KIND_TRAIT');

INSERT INTO Traits
(TraitType,                     Name,                                   Description)
VALUES
('TRAIT_LEADER_ARISA_gkls621', 'LOC_TRAIT_LEADER_ARISA_gkls621_NAME', 'LOC_TRAIT_LEADER_ARISA_gkls621_DESCRIPTION');

INSERT INTO LeaderTraits
(LeaderType,                TraitType)
VALUES
('LEADER_ARISA_gkls621',   'TRAIT_LEADER_ARISA_gkls621'),
('LEADER_ARISA_gkls621',   'TRAIT_BUILDING_RYUSEIDO_gkls621_gkls621');

INSERT INTO TraitModifiers
(TraitType, ModifierId)
VALUES
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_LAW_UNLOCKS_IRRIGATION_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_PLANTATION_CULTURE_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_FRESH_WATER_PLANTATION_PRODUCTION_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_FARM_CULTURE_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_FRESH_WATER_FARM_PRODUCTION_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_GRANT_FREE_SPIES_WRITING_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_GRANT_SPY_CAPACITY_WRITING_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_GRANT_SPY_CAPACITY_CAMPUS_CITIES_ATTACH_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_GRANT_SPY_CAPACITY_COMMERCE_CITIES_ATTACH_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_SPY_PRODUCTION_BONUS_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_ESPIONAGE_ESTABLISH_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'ARISA_SPY_TECHNOLOGIST_ACTIVE_gkls621'),
('TRAIT_LEADER_ARISA_gkls621', 'UNIQUE_LEADER_SPIES_START_PROMOTED');

INSERT INTO TraitModifiers
(TraitType, ModifierId)
SELECT
'TRAIT_LEADER_ARISA_gkls621',
'ARISA_' || GreatWorkObjectType || '_GOLD_gkls621'
FROM GreatWorkObjectTypes;

INSERT INTO TraitModifiers
(TraitType, ModifierId)
SELECT
'TRAIT_LEADER_ARISA_gkls621',
'ARISA_' || gwot.GreatWorkObjectType || '_' || y.YieldType || '_MULTIPLIER_gkls621'
FROM GreatWorkObjectTypes gwot CROSS JOIN Yields y;

INSERT INTO Modifiers
(ModifierId,                                                    ModifierType,                                               SubjectRequirementSetId)
VALUES
('ARISA_PLANTATION_CULTURE_gkls621',                            'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                        'REQSET_PPP_PLOT_HAS_PLANTATION_gkls621'),
('ARISA_FARM_CULTURE_gkls621',                                  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                        'REQSET_PPP_PLOT_HAS_RESOURCE_FARM_gkls621'),
('ARISA_FRESH_WATER_PLANTATION_PRODUCTION_gkls621',             'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                        'REQSET_PPP_PLOT_HAS_FRESH_WATER_PLANTATION_gkls621'),
('ARISA_FRESH_WATER_FARM_PRODUCTION_gkls621',                   'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                        'REQSET_PPP_PLOT_HAS_FRESH_WATER_FARM_gkls621'),
('ARISA_GRANT_SPY_CAPACITY_CAMPUS_CITIES_ATTACH_gkls621',       'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                   'REQSET_PPP_CITY_HAS_CAMPUS_gkls621'),
('ARISA_GRANT_SPY_CAPACITY_COMMERCE_CITIES_ATTACH_gkls621',     'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                   'REQSET_PPP_CITY_HAS_COMMERCIAL_HUB_gkls621'),
('ARISA_SPY_PRODUCTION_BONUS_gkls621',                          'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION_MODIFIER',   NULL),
('ARISA_ESPIONAGE_ESTABLISH_gkls621',                           'MODIFIER_PLAYER_UNITS_ADJUST_SPY_ESTABLISH_TIME',          NULL),
('ARISA_SPY_TECHNOLOGIST_ACTIVE_gkls621',                       'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION',                    NULL);

INSERT INTO Modifiers
(ModifierId,                                    ModifierType,                               RunOnce,    Permanent,   OwnerRequirementSetId)
VALUES
('ARISA_LAW_UNLOCKS_IRRIGATION_gkls621',    'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',    1,          1,           'REQSET_PPP_PLAYER_HAS_CODE_OF_LAW_gkls621'),
('ARISA_GRANT_FREE_SPIES_WRITING_gkls621',      'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',    1,          1,           'REQSET_PPP_PLAYER_HAS_CAPITAL_AND_WRITING_gkls621'),
('ARISA_GRANT_SPY_CAPACITY_WRITING_gkls621',    'MODIFIER_PLAYER_GRANT_SPY',                1,          1,           'REQSET_PPP_PLAYER_HAS_CAPITAL_AND_WRITING_gkls621'),
('ARISA_GRANT_SPY_CAPACITY_BONUS_gkls621',      'MODIFIER_PLAYER_GRANT_SPY',                1,          1,           NULL);

INSERT INTO Modifiers
(ModifierId,    ModifierType)
SELECT
'ARISA_' || GreatWorkObjectType || '_GOLD_gkls621',
'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD'
FROM GreatWorkObjectTypes;

INSERT INTO Modifiers
(ModifierId,    ModifierType)
SELECT
'ARISA_' || gwot.GreatWorkObjectType || '_' || y.YieldType || '_MULTIPLIER_gkls621',
'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD'
FROM GreatWorkObjectTypes gwot CROSS JOIN Yields y;

INSERT INTO ModifierArguments
(ModifierId,                                                 Name,                 Value)
VALUES
('ARISA_PLANTATION_CULTURE_gkls621',                        'YieldType',           'YIELD_CULTURE'),
('ARISA_PLANTATION_CULTURE_gkls621',                        'Amount',              2),
('ARISA_FARM_CULTURE_gkls621',                              'YieldType',           'YIELD_CULTURE'),
('ARISA_FARM_CULTURE_gkls621',                              'Amount',              2),
('ARISA_FRESH_WATER_PLANTATION_PRODUCTION_gkls621',         'YieldType',           'YIELD_PRODUCTION'),
('ARISA_FRESH_WATER_PLANTATION_PRODUCTION_gkls621',         'Amount',              2),
('ARISA_FRESH_WATER_FARM_PRODUCTION_gkls621',               'YieldType',           'YIELD_PRODUCTION'),
('ARISA_FRESH_WATER_FARM_PRODUCTION_gkls621',               'Amount',              2),
('ARISA_LAW_UNLOCKS_IRRIGATION_gkls621',                    'TechType',            'TECH_IRRIGATION'),
('ARISA_GRANT_SPY_CAPACITY_CAMPUS_CITIES_ATTACH_gkls621',   'ModifierId',          'ARISA_GRANT_SPY_CAPACITY_BONUS_gkls621'),
('ARISA_GRANT_SPY_CAPACITY_COMMERCE_CITIES_ATTACH_gkls621', 'ModifierId',          'ARISA_GRANT_SPY_CAPACITY_BONUS_gkls621'),
('ARISA_GRANT_FREE_SPIES_WRITING_gkls621',                  'AllowUniqueOverride', 0),
('ARISA_GRANT_FREE_SPIES_WRITING_gkls621',                  'Amount',              2),
('ARISA_GRANT_FREE_SPIES_WRITING_gkls621',                  'UnitType',            'UNIT_SPY'),
('ARISA_GRANT_SPY_CAPACITY_WRITING_gkls621',                'Amount',              2),
('ARISA_SPY_PRODUCTION_BONUS_gkls621',                      'Amount',              200),
('ARISA_ESPIONAGE_ESTABLISH_gkls621',                       'ReductionPercent',    100),
('ARISA_SPY_TECHNOLOGIST_ACTIVE_gkls621',                   'PromotionType',       'PROMOTION_SPY_TECHNOLOGIST'),
('ARISA_GRANT_SPY_CAPACITY_BONUS_gkls621',                  'Amount',              1);

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT
'ARISA_' || GreatWorkObjectType || '_GOLD_gkls621',
'GreatWorkObjectType',  GreatWorkObjectType
FROM GreatWorkObjectTypes;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT
'ARISA_' || GreatWorkObjectType || '_GOLD_gkls621',
'YieldChange',  3
FROM GreatWorkObjectTypes;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT
'ARISA_' || GreatWorkObjectType || '_GOLD_gkls621',
'YieldType',  'YIELD_GOLD'
FROM GreatWorkObjectTypes;
-----
INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT
'ARISA_' || gwot.GreatWorkObjectType || '_' || y.YieldType || '_MULTIPLIER_gkls621',
'GreatWorkObjectType',  gwot.GreatWorkObjectType
FROM GreatWorkObjectTypes gwot CROSS JOIN Yields y;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT
'ARISA_' || gwot.GreatWorkObjectType || '_' || y.YieldType || '_MULTIPLIER_gkls621',
'ScalingFactor',  300
FROM GreatWorkObjectTypes gwot CROSS JOIN Yields y;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT
'ARISA_' || gwot.GreatWorkObjectType || '_' || y.YieldType || '_MULTIPLIER_gkls621',
'YieldType',  y.YieldType
FROM GreatWorkObjectTypes gwot CROSS JOIN Yields y;

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
('REQSET_PPP_PLAYER_HAS_CODE_OF_LAW_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLOT_HAS_PLANTATION_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLOT_HAS_RESOURCE_FARM_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLOT_HAS_FRESH_WATER_PLANTATION_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLOT_HAS_FRESH_WATER_FARM_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_CITY_HAS_CAMPUS_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_CITY_HAS_COMMERCIAL_HUB_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_PLAYER_HAS_CAPITAL_AND_WRITING_gkls621', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
('REQSET_PPP_PLAYER_HAS_CODE_OF_LAW_gkls621', 'PPP_PLAYER_HAS_CODE_OF_LAW_gkls621'),
('REQSET_PPP_PLOT_HAS_PLANTATION_gkls621', 'PPP_PLOT_HAS_PLANTATION_gkls621'),
('REQSET_PPP_PLOT_HAS_RESOURCE_FARM_gkls621', 'PPP_PLOT_HAS_BONUS_RESOURCE_gkls621'),
('REQSET_PPP_PLOT_HAS_RESOURCE_FARM_gkls621', 'PPP_PLOT_HAS_FARM_gkls621'),
-----
('REQSET_PPP_PLOT_HAS_FRESH_WATER_PLANTATION_gkls621', 'PPP_PLOT_HAS_PLANTATION_gkls621'),
('REQSET_PPP_PLOT_HAS_FRESH_WATER_PLANTATION_gkls621', 'REQUIRES_PLOT_IS_FRESH_WATER'),
('REQSET_PPP_PLOT_HAS_FRESH_WATER_FARM_gkls621', 'PPP_PLOT_HAS_BONUS_RESOURCE_gkls621'),
('REQSET_PPP_PLOT_HAS_FRESH_WATER_FARM_gkls621', 'REQUIRES_PLOT_IS_FRESH_WATER'),
('REQSET_PPP_PLOT_HAS_FRESH_WATER_FARM_gkls621', 'PPP_PLOT_HAS_FARM_gkls621'),
-----
('REQSET_PPP_CITY_HAS_CAMPUS_gkls621',  'REQUIRES_CITY_HAS_CAMPUS'),
('REQSET_PPP_CITY_HAS_COMMERCIAL_HUB_gkls621',  'REQUIRES_CITY_HAS_COMMERCIAL_HUB'),
('REQSET_PPP_PLAYER_HAS_CAPITAL_AND_WRITING_gkls621', 'PPP_PLAYER_HAS_WRITING_gkls621'),
('REQSET_PPP_PLAYER_HAS_CAPITAL_AND_WRITING_gkls621', 'REQUIRES_CAPITAL_CITY');

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES
('PPP_PLAYER_HAS_CODE_OF_LAW_gkls621', 'REQUIREMENT_PLAYER_HAS_CIVIC'),
('PPP_PLOT_HAS_PLANTATION_gkls621', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'),
('PPP_PLOT_HAS_FARM_gkls621', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'),
('PPP_PLAYER_HAS_WRITING_gkls621', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES
('PPP_PLAYER_HAS_CODE_OF_LAW_gkls621', 'CivicType',    'CIVIC_CODE_OF_LAWS'),
('PPP_PLOT_HAS_PLANTATION_gkls621', 'ImprovementType', 'IMPROVEMENT_PLANTATION'),
('PPP_PLOT_HAS_FARM_gkls621', 'ImprovementType', 'IMPROVEMENT_FARM'),
('PPP_PLAYER_HAS_WRITING_gkls621', 'TechnologyType', 'TECH_WRITING');