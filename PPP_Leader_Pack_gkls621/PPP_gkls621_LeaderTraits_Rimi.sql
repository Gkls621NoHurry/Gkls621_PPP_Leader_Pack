-- Rimi Traits
INSERT INTO Types
(Type,  Kind)
VALUES
('MODIFIER_PPP_CAPITAL_GRANT_FREE_RESOURCE_gkls621', 'KIND_MODIFIER'),
('TRAIT_LEADER_RIMI_gkls621', 'KIND_TRAIT');

INSERT INTO Traits
(TraitType,                     Name,                                   Description)
VALUES
('TRAIT_LEADER_RIMI_gkls621', 'LOC_TRAIT_LEADER_RIMI_gkls621_NAME', 'LOC_TRAIT_LEADER_RIMI_gkls621_DESCRIPTION');

INSERT INTO LeaderTraits
(LeaderType,               TraitType)
VALUES
('LEADER_RIMI_gkls621',    'TRAIT_LEADER_RIMI_gkls621'),
('LEADER_RIMI_gkls621',    'TRAIT_UNIT_RIMI_ZOMBIE_gkls621');

INSERT INTO TraitModifiers
(TraitType, ModifierId)
VALUES
('TRAIT_LEADER_RIMI_gkls621', 'RIMI_GRANT_FREE_ZOMBIES_gkls621'),
('TRAIT_LEADER_RIMI_gkls621', 'RIMI_ZOMBIE_INTERCONTINENTAL_gkls621'),
('TRAIT_LEADER_RIMI_gkls621', 'RIMI_GRANT_CHOCO_CORNET_gkls621'),
('TRAIT_LEADER_RIMI_gkls621', 'TRAIT_INQUISITORS_FULL_EVICT'),
('TRAIT_LEADER_RIMI_gkls621', 'RIMI_GRANT_FREE_GOVERNOR_TITLE_gkls621');
--('TRAIT_LEADER_RIMI_gkls621', 'YURI_GRANT_MUSICIAN_GLITTER_GREEN_gkls621');
--('TRAIT_LEADER_RIMI_gkls621', 'RIMI_SCIENCE_YIELD_INTERCONTINENTAL_gkls621');

INSERT INTO Modifiers
(ModifierId,                                        ModifierType,                                           SubjectRequirementSetId)
VALUES
('RIMI_ZOMBIE_INTERCONTINENTAL_gkls621',            'MODIFIER_PLAYER_CITIES_GRANT_UNIT_IN_CITY',            'CITY_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS');
--('RIMI_SCIENCE_YIELD_INTERCONTINENTAL_gkls621',     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'CITY_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS');

INSERT INTO Modifiers
(ModifierId,                                ModifierType,                                       RunOnce,    Permanent,   OwnerRequirementSetId)
VALUES
('RIMI_GRANT_FREE_ZOMBIES_gkls621',         'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',            1,          1,           'REQSET_PPP_PLAYER_HAS_CAPITAL_gkls621'),
('RIMI_GRANT_CHOCO_CORNET_gkls621',         'MODIFIER_PPP_CAPITAL_GRANT_FREE_RESOURCE_gkls621', 1,          1,           'REQSET_PPP_PLAYER_HAS_CAPITAL_gkls621'),
('RIMI_GRANT_FREE_GOVERNOR_TITLE_gkls621',  'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',           1,          0,           NULL);

INSERT INTO ModifierArguments
(ModifierId,                                    Name,                  Value)
VALUES
('RIMI_GRANT_FREE_ZOMBIES_gkls621',             'AllowUniqueOverride', 0),
('RIMI_GRANT_FREE_ZOMBIES_gkls621',             'Amount',              2),
('RIMI_GRANT_FREE_ZOMBIES_gkls621',             'UnitType',            'UNIT_RIMI_ZOMBIE_gkls621'),
('RIMI_ZOMBIE_INTERCONTINENTAL_gkls621',        'AllowUniqueOverride', 0),
('RIMI_ZOMBIE_INTERCONTINENTAL_gkls621',        'Amount',              2),
('RIMI_ZOMBIE_INTERCONTINENTAL_gkls621',        'UnitType',            'UNIT_RIMI_ZOMBIE_gkls621'),
('RIMI_GRANT_CHOCO_CORNET_gkls621',             'Amount',              2),
('RIMI_GRANT_CHOCO_CORNET_gkls621',             'ResourceType',        'RESOURCE_CHOCO_CORNET_gkls621'),
('RIMI_GRANT_FREE_GOVERNOR_TITLE_gkls621',      'Delta',               2);
--('RIMI_SCIENCE_YIELD_INTERCONTINENTAL_gkls621', 'YieldType',           'YIELD_SCIENCE'),
--('RIMI_SCIENCE_YIELD_INTERCONTINENTAL_gkls621', 'Amount',              15);

INSERT  OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
('REQSET_PPP_PLAYER_HAS_CAPITAL_gkls621', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
('REQSET_PPP_PLAYER_HAS_CAPITAL_gkls621', 'REQUIRES_CAPITAL_CITY');

INSERT INTO DynamicModifiers (ModifierType, EffectType, CollectionType)
VALUES
('MODIFIER_PPP_CAPITAL_GRANT_FREE_RESOURCE_gkls621', 'EFFECT_GRANT_FREE_RESOURCE_IN_CITY', 'COLLECTION_PLAYER_CAPITAL_CITY');