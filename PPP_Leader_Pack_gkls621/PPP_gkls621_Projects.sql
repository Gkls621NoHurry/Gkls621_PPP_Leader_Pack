-- Kasumi Project
-- Refined with HUAN's assistance
INSERT INTO Types
(Type,	Kind)
VALUES
('PROJECT_TWINKLE_FOUNDER_gkls621',	    'KIND_PROJECT'),
('PROJECT_TWINKLE_ENHANCER_gkls621',    'KIND_PROJECT'),
('PROJECT_TWINKLE_FOLLOWER_gkls621',	'KIND_PROJECT'),
('PROJECT_TWINKLE_PANTHEON_gkls621',	'KIND_PROJECT');

INSERT INTO Projects
(ProjectType,	Name,	ShortName,	Description,
PrereqCivic,    MaxPlayerInstances,	Cost,	AdvisorType,	UnlocksFromEffect)
VALUES
('PROJECT_TWINKLE_FOUNDER_gkls621',	'LOC_PROJECT_TWINKLE_FOUNDER_gkls621_NAME',	'LOC_PROJECT_TWINKLE_FOUNDER_gkls621_SHORT_NAME',	'LOC_PROJECT_TWINKLE_FOUNDER_gkls621_DESCRIPTION',
'CIVIC_EARLY_EMPIRE',   1,	100,	'ADVISOR_GENERIC',	1),
('PROJECT_TWINKLE_ENHANCER_gkls621',	'LOC_PROJECT_TWINKLE_ENHANCER_gkls621_NAME',	'LOC_PROJECT_TWINKLE_ENHANCER_gkls621_SHORT_NAME',	'LOC_PROJECT_TWINKLE_ENHANCER_gkls621_DESCRIPTION',
'CIVIC_DIVINE_RIGHT',   1,	190,	'ADVISOR_GENERIC',	1),
('PROJECT_TWINKLE_FOLLOWER_gkls621',	'LOC_PROJECT_TWINKLE_FOLLOWER_gkls621_NAME',	'LOC_PROJECT_TWINKLE_FOLLOWER_gkls621_SHORT_NAME',	'LOC_PROJECT_TWINKLE_FOLLOWER_gkls621_DESCRIPTION',
'CIVIC_DIVINE_RIGHT',   1,	190,	'ADVISOR_GENERIC',	1),
('PROJECT_TWINKLE_PANTHEON_gkls621',	'LOC_PROJECT_TWINKLE_PANTHEON_gkls621_NAME',	'LOC_PROJECT_TWINKLE_PANTHEON_gkls621_SHORT_NAME',	'LOC_PROJECT_TWINKLE_PANTHEON_gkls621_DESCRIPTION',
NULL,   1,	65,	'ADVISOR_GENERIC',	1);

INSERT INTO ProjectPrereqs
(ProjectType,   PrereqProjectType,  MinimumPlayerInstances)
VALUES
('PROJECT_TWINKLE_ENHANCER_gkls621', 'PROJECT_TWINKLE_FOUNDER_gkls621', 1),
('PROJECT_TWINKLE_FOLLOWER_gkls621', 'PROJECT_TWINKLE_FOUNDER_gkls621', 1);

-->>========================================================================================

INSERT INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_PANTHEON_gkls621',
  'TWINKLE_PANTHEON_' || ma.Value || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT OR IGNORE INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_PANTHEON_gkls621',
  'TWINKLE_PANTHEON_' || ma.ModifierId || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';

--<<========================================================================================
-->>========================================================================================

INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_PANTHEON_' || ma.Value || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;

INSERT OR IGNORE INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_PANTHEON_' || ma.ModifierId || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;

--<<========================================================================================
-->>========================================================================================

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_PANTHEON_' || ma.Value || '_gkls621',
'ModifierId',
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_PANTHEON_' || ma.ModifierId || '_gkls621',
ma.Name,
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_PANTHEON'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';

--<<========================================================================================
-->>========================================================================================
INSERT INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_FOLLOWER_gkls621',
  'TWINKLE_FOLLOWER_' || ma.Value || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT OR IGNORE INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_FOLLOWER_gkls621',
  'TWINKLE_FOLLOWER_' || ma.ModifierId || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';


INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_FOLLOWER_' || ma.Value || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;

INSERT OR IGNORE INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_FOLLOWER_' || ma.ModifierId || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;



INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_FOLLOWER_' || ma.Value || '_gkls621',
'ModifierId',
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_FOLLOWER_' || ma.ModifierId || '_gkls621',
ma.Name,
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOLLOWER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';
--<<========================================================================================
-->>========================================================================================
INSERT INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_ENHANCER_gkls621',
  'TWINKLE_ENHANCER_' || ma.Value || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_ENHANCER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT OR IGNORE INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_ENHANCER_gkls621',
  'TWINKLE_ENHANCER_' || ma.ModifierId || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_ENHANCER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';


INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_ENHANCER_' || ma.Value || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_ENHANCER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;

INSERT OR IGNORE INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_ENHANCER_' || ma.ModifierId || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_ENHANCER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;

UPDATE Modifiers SET SubjectRequirementSetId = 'REQSET_PPP_KASUMI_JUST_WAR_gkls621'
WHERE ModifierId = 'TWINKLE_ENHANCER_JUST_WAR_COMBAT_BONUS_MODIFIER_gkls621';

UPDATE Modifiers SET SubjectRequirementSetId = 'REQSET_PPP_KASUMI_DEFENDER_OF_FAITH_gkls621'
WHERE ModifierId = 'TWINKLE_ENHANCER_DEFENDER_OF_FAITH_COMBAT_BONUS_MODIFIER_gkls621';

UPDATE Modifiers SET SubjectRequirementSetId = 'REQSET_PPP_KASUMI_HOLY_WATERS_gkls621'
WHERE ModifierId = 'TWINKLE_ENHANCER_HOLY_WATERS_HEALING_MODIFIER_gkls621';


INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_ENHANCER_' || ma.Value || '_gkls621',
'ModifierId',
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_ENHANCER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_ENHANCER_' || ma.ModifierId || '_gkls621',
ma.Name,
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_ENHANCER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';
--<<========================================================================================
-->>========================================================================================
INSERT INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_FOUNDER_gkls621',
  'TWINKLE_FOUNDER_' || ma.Value || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOUNDER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT OR IGNORE INTO ProjectCompletionModifiers (ProjectType, ModifierId)
SELECT DISTINCT
  'PROJECT_TWINKLE_FOUNDER_gkls621',
  'TWINKLE_FOUNDER_' || ma.ModifierId || '_gkls621'
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOUNDER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';


INSERT INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_FOUNDER_' || ma.Value || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOUNDER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;

INSERT OR IGNORE INTO Modifiers
(ModifierId,    ModifierType,   SubjectRequirementSetId,    SubjectStacklimit)
SELECT DISTINCT
'TWINKLE_FOUNDER_' || ma.ModifierId || '_gkls621',
mr.ModifierType,
'REQSET_PPP_PLAYER_IS_KASUMI_gkls621',
1
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOUNDER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId'
JOIN Modifiers mr
  ON mr.ModifierId = bm.ModifierId;


INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_FOUNDER_' || ma.Value || '_gkls621',
'ModifierId',
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOUNDER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name = 'ModifierId';

INSERT INTO ModifierArguments
(ModifierId,    Name,   Value)
SELECT DISTINCT
'TWINKLE_FOUNDER_' || ma.ModifierId || '_gkls621',
ma.Name,
ma.Value
FROM BeliefModifiers bm
JOIN Beliefs b
  ON b.BeliefClassType = 'BELIEF_CLASS_FOUNDER'
  AND b.BeliefType = bm.BeliefType
JOIN ModifierArguments ma
  ON ma.ModifierId = bm.ModifierId
  AND ma.Name <> 'ModifierId';
--<<========================================================================================
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
('REQSET_PPP_PLAYER_IS_KASUMI_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_KASUMI_JUST_WAR_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_KASUMI_DEFENDER_OF_FAITH_gkls621', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_PPP_KASUMI_HOLY_WATERS_gkls621', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
('REQSET_PPP_PLAYER_IS_KASUMI_gkls621', 'PPP_PLAYER_IS_KASUMI_gkls621');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'REQSET_PPP_KASUMI_JUST_WAR_gkls621',  RequirementId
FROM RequirementSetRequirements
WHERE RequirementSetId = 'JUST_WAR_REQUIREMENTS' AND RequirementId <> 'REQUIRES_PLAYER_FOUNDED_RELIGION';

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'REQSET_PPP_KASUMI_DEFENDER_OF_FAITH_gkls621',  RequirementId
FROM RequirementSetRequirements
WHERE RequirementSetId = 'DEFENDER_OF_FAITH_REQUIREMENTS' AND RequirementId <> 'REQUIRES_PLAYER_FOUNDED_RELIGION';

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'REQSET_PPP_KASUMI_HOLY_WATERS_gkls621',  RequirementId
FROM RequirementSetRequirements
WHERE RequirementSetId = 'HOLY_WATERS_HEALING_REQUIREMENTS' AND RequirementId <> 'REQUIRES_CITY_FOLLOWS_RELIGION';

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES
('PPP_PLAYER_IS_KASUMI_gkls621', 'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES
('PPP_PLAYER_IS_KASUMI_gkls621', 'LeaderType', 'LEADER_KASUMI_gkls621');
