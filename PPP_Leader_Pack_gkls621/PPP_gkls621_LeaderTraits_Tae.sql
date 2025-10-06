-- Tae Traits
CREATE TEMP TABLE GklsTaeYields(
    YieldType   TEXT
                DEFAULT NULL);

CREATE TEMP TABLE GklsTaeGPPs(
    GreatPersonClassType   TEXT
                           DEFAULT NULL);               

INSERT INTO GklsTaeYields(YieldType)
SELECT YieldType FROM Yields WHERE YieldType <> 'YIELD_FOOD';

INSERT INTO GklsTaeGPPs(GreatPersonClassType)
SELECT GreatPersonClassType FROM District_GreatPersonPoints WHERE DistrictType = 'DISTRICT_HOLY_SITE' OR DistrictType = 'DISTRICT_PRESERVE'OR DistrictType = 'DISTRICT_CAMPUS';

INSERT INTO Types
(Type,  Kind)
VALUES
('TRAIT_LEADER_TAE_gkls621', 'KIND_TRAIT');

INSERT INTO Traits
(TraitType,                     Name,                                   Description)
VALUES
('TRAIT_LEADER_TAE_gkls621', 'LOC_TRAIT_LEADER_TAE_gkls621_NAME', 'LOC_TRAIT_LEADER_TAE_gkls621_DESCRIPTION');

INSERT INTO LeaderTraits
(LeaderType,                TraitType)
VALUES
('LEADER_TAE_gkls621',   'TRAIT_LEADER_TAE_gkls621'),
('LEADER_TAE_gkls621',   'TRAIT_UNIT_RABBIT_BRIGADE_gkls621');

INSERT INTO TraitModifiers
(TraitType, ModifierId)
SELECT
'TRAIT_LEADER_TAE_gkls621', 'TAE_EMPIRE_HAPPY_' || SUBSTR(YieldType, 7) || '_gkls621'
FROM GklsTaeYields;

INSERT INTO TraitModifiers
(TraitType, ModifierId)
SELECT
'TRAIT_LEADER_TAE_gkls621', 'TAE_EMPIRE_ECSTATIC_' || SUBSTR(YieldType, 7) || '_gkls621'
FROM GklsTaeYields;

INSERT INTO TraitModifiers
(TraitType, ModifierId)
SELECT
'TRAIT_LEADER_TAE_gkls621', 'TAE_NATIONAL_PARK_' || SUBSTR(GreatPersonClassType, 20) || '_POINT_gkls621'
FROM GklsTaeGPPs;

INSERT INTO TraitModifiers
(TraitType, ModifierId)
SELECT DISTINCT
'TRAIT_LEADER_TAE_gkls621', 'TAE_IMPROVED' || SUBSTR(ResourceType, 10) || '_AMENITY_gkls621'
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';

INSERT INTO TraitModifiers
(TraitType, ModifierId)
VALUES
('TRAIT_LEADER_TAE_gkls621', 'TAE_GRANT_NATURALIST_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_APPEAL_BASE_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_APPEAL_NATIONAL_PARK_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_CAMP_PRESERVE_FOOD_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_CAMP_PRESERVE_CULTURE_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_PASTURE_PRESERVE_FAITH_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_PASTURE_PRESERVE_PRODUCTION_gkls621'),
('TRAIT_LEADER_TAE_gkls621', 'TAE_PASTURE_PRESERVE_CULTURE_gkls621');

INSERT INTO Modifiers
(ModifierId,    ModifierType)
SELECT 'TAE_EMPIRE_HAPPY_' || SUBSTR(YieldType, 7) || '_gkls621',
'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB'
FROM GklsTaeYields;

INSERT INTO Modifiers
(ModifierId,    ModifierType)
SELECT 'TAE_EMPIRE_ECSTATIC_' || SUBSTR(YieldType, 7) || '_gkls621',
'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB'
FROM GklsTaeYields;

INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId)
SELECT 'TAE_NATIONAL_PARK_' || SUBSTR(GreatPersonClassType, 20) || '_POINT_gkls621',
'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BASE',
'CITY_HAS_NATIONAL_PARK_REQUREMENTS'
FROM GklsTaeGPPs;

INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId)
SELECT DISTINCT
'TAE_IMPROVED' || SUBSTR(ResourceType, 10) || '_AMENITY_gkls621',
'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY', 'REQSET_PPP_' || SUBSTR(ResourceType, 10) || '_IMPROVED_gkls621'
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';

INSERT INTO Modifiers
(ModifierId,    ModifierType,   RunOnce,    Permanent,  OwnerRequirementSetId)
VALUES
('TAE_GRANT_NATURALIST_gkls621',    'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',    1,  1,  'REQSET_PPP_PLAYER_HAS_CAPITAL_gkls621');

INSERT INTO Modifiers
(ModifierId,                                ModifierType,                                    SubjectRequirementSetId)
VALUES
('TAE_APPEAL_BASE_gkls621',                 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',     NULL),
('TAE_APPEAL_NATIONAL_PARK_gkls621',        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',     'CITY_HAS_NATIONAL_PARK_REQUREMENTS'),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',       'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY',  NULL),
('TAE_CAMP_PRESERVE_FOOD_gkls621',          'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY',  NULL),
('TAE_PASTURE_PRESERVE_FAITH_gkls621',      'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY',  NULL),
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621', 'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY',  NULL),
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',    'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY',  NULL);

-- Happiness Yield Bonus Pt. Happy
INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_EMPIRE_HAPPY_' || SUBSTR(YieldType, 7) || '_gkls621',
'HappinessType',    'HAPPINESS_HAPPY'
FROM GklsTaeYields;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_EMPIRE_HAPPY_' || SUBSTR(YieldType, 7) || '_gkls621',
'YieldType',    YieldType
FROM GklsTaeYields;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_EMPIRE_HAPPY_' || SUBSTR(YieldType, 7) || '_gkls621',
'Amount',    50
FROM GklsTaeYields;
-- Happiness Yield Bonus Pt. Ecstatic
INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_EMPIRE_ECSTATIC_' || SUBSTR(YieldType, 7) || '_gkls621',
'HappinessType',    'HAPPINESS_ECSTATIC'
FROM GklsTaeYields;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_EMPIRE_ECSTATIC_' || SUBSTR(YieldType, 7) || '_gkls621',
'YieldType',    YieldType
FROM GklsTaeYields;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_EMPIRE_ECSTATIC_' || SUBSTR(YieldType, 7) || '_gkls621',
'Amount',    50
FROM GklsTaeYields;
-- GPP Bonus
INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_NATIONAL_PARK_' || SUBSTR(GreatPersonClassType, 20) || '_POINT_gkls621',
'Amount',    2
FROM GklsTaeGPPs;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT 'TAE_NATIONAL_PARK_' || SUBSTR(GreatPersonClassType, 20) || '_POINT_gkls621',
'GreatPersonClassType',    GreatPersonClassType
FROM GklsTaeGPPs;

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TAE_IMPROVED' || SUBSTR(ResourceType, 10) || '_AMENITY_gkls621',
'Amount', 2
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';

-- Not Modularised Parts
INSERT INTO ModifierArguments
(ModifierId,                                    Name,               Value)
VALUES
('TAE_GRANT_NATURALIST_gkls621',                'Amount',           1),
('TAE_GRANT_NATURALIST_gkls621',                'UnitType',         'UNIT_NATURALIST'),
('TAE_APPEAL_BASE_gkls621',                     'Amount',           2),
('TAE_APPEAL_NATIONAL_PARK_gkls621',            'Amount',           3),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',           'Amount',           3),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',           'Description',     'LOC_TAE_CAMP_CULTURE_gkls621_DESCRIPTION'),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',           'DistrictType',    'DISTRICT_PRESERVE'),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',           'ImprovementType', 'IMPROVEMENT_CAMP'),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',           'TilesRequired',    1),
('TAE_CAMP_PRESERVE_CULTURE_gkls621',           'YieldType',       'YIELD_CULTURE'),
-----
('TAE_CAMP_PRESERVE_FOOD_gkls621',              'Amount',           3),
('TAE_CAMP_PRESERVE_FOOD_gkls621',              'Description',     'LOC_TAE_CAMP_FOOD_gkls621_DESCRIPTION'),
('TAE_CAMP_PRESERVE_FOOD_gkls621',              'DistrictType',    'DISTRICT_PRESERVE'),
('TAE_CAMP_PRESERVE_FOOD_gkls621',              'ImprovementType', 'IMPROVEMENT_CAMP'),
('TAE_CAMP_PRESERVE_FOOD_gkls621',              'TilesRequired',    1),
('TAE_CAMP_PRESERVE_FOOD_gkls621',              'YieldType',       'YIELD_FOOD'),
-----
('TAE_PASTURE_PRESERVE_FAITH_gkls621',          'Amount',           3),
('TAE_PASTURE_PRESERVE_FAITH_gkls621',          'Description',     'LOC_TAE_PASTURE_FAITH_gkls621_DESCRIPTION'),
('TAE_PASTURE_PRESERVE_FAITH_gkls621',          'DistrictType',    'DISTRICT_PRESERVE'),
('TAE_PASTURE_PRESERVE_FAITH_gkls621',          'ImprovementType', 'IMPROVEMENT_CAMP'),
('TAE_PASTURE_PRESERVE_FAITH_gkls621',          'TilesRequired',    1),
('TAE_PASTURE_PRESERVE_FAITH_gkls621',          'YieldType',       'YIELD_FAITH'),
-----
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621',     'Amount',           3),
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621',     'Description',     'LOC_TAE_PASTURE_PRODUCTION_gkls621_DESCRIPTION'),
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621',     'DistrictType',    'DISTRICT_PRESERVE'),
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621',     'ImprovementType', 'IMPROVEMENT_CAMP'),
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621',     'TilesRequired',    1),
('TAE_PASTURE_PRESERVE_PRODUCTION_gkls621',     'YieldType',       'YIELD_PRODUCTION'),
-----
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',        'Amount',           3),
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',        'Description',     'LOC_TAE_PASTURE_CULTURE_gkls621_DESCRIPTION'),
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',        'DistrictType',    'DISTRICT_PRESERVE'),
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',        'ImprovementType', 'IMPROVEMENT_PASTURE'),
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',        'TilesRequired',    1),
('TAE_PASTURE_PRESERVE_CULTURE_gkls621',        'YieldType',       'YIELD_CULTURE');

INSERT INTO RequirementSets
(RequirementSetId,  RequirementSetType)
SELECT DISTINCT 
'REQSET_PPP_' || SUBSTR(ResourceType, 10) || '_IMPROVED_gkls621',
'REQUIREMENTSET_TEST_ALL'
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';

INSERT INTO RequirementSetRequirements
(RequirementSetId,  RequirementId)
SELECT DISTINCT
'REQSET_PPP_' || SUBSTR(ResourceType, 10) || '_IMPROVED_gkls621',
'PPP_' || SUBSTR(ResourceType, 10) || '_IMPROVED_gkls621'
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';

INSERT INTO Requirements
(RequirementId, RequirementType)
SELECT DISTINCT
'PPP_' || SUBSTR(ResourceType, 10) || '_IMPROVED_gkls621',
'REQUIREMENT_PLAYER_HAS_RESOURCE_IMPROVED'
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';

INSERT INTO RequirementArguments
(RequirementId, Name,   Value)
SELECT DISTINCT
'PPP_' || SUBSTR(ResourceType, 10) || '_IMPROVED_gkls621',
'ResourceType', ResourceType
FROM Improvement_ValidResources WHERE ImprovementType = 'IMPROVEMENT_PASTURE' OR ImprovementType = 'IMPROVEMENT_CAMP';