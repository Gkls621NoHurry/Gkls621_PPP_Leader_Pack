-- PPP Civ and Arisa's Unique Building
INSERT INTO Types
(Type,  Kind)
VALUES
('BUILDING_RANDOM_STAR_gkls621',    'KIND_BUILDING'),
('TRAIT_BUILDING_RANDOM_STAR_gkls621',    'KIND_TRAIT'),
('BUILDING_RYUSEIDO_gkls621',    'KIND_BUILDING'),
('TRAIT_BUILDING_RYUSEIDO_gkls621_gkls621',    'KIND_TRAIT');

INSERT INTO Traits
(TraitType, Name,   Description)
VALUES
('TRAIT_BUILDING_RANDOM_STAR_gkls621',  'LOC_BUILDING_RANDOM_STAR_gkls621_NAME',    'LOC_BUILDING_RANDOM_STAR_gkls621_DESCRIPTION'),
('TRAIT_BUILDING_RYUSEIDO_gkls621_gkls621', 'LOC_BUILDING_RYUSEIDO_gkls621_gkls621_NAME', 'LOC_BUILDING_RYUSEIDO_gkls621_gkls621_DESCRIPTION');

INSERT INTO BuildingReplaces
(CivUniqueBuildingType, ReplacesBuildingType)
VALUES
('BUILDING_RANDOM_STAR_gkls621',    'BUILDING_MONUMENT'),
('BUILDING_RYUSEIDO_gkls621',       'BUILDING_MARKET');

INSERT INTO MutuallyExclusiveBuildings
(Building,  MutuallyExclusiveBuilding)
SELECT
'BUILDING_RYUSEIDO_gkls621',    MutuallyExclusiveBuilding
FROM MutuallyExclusiveBuildings WHERE Building = 'BUILDING_MARKET';

INSERT INTO Buildings (
BuildingType,
Name,
Cost,
Capital,
PrereqDistrict,
Description,
RequiresPlacement,
RequiresRiver,
Housing,
Entertainment,
EnabledByReligion,
AllowsHolyCity,
PurchaseYield,
MustPurchase,
Maintenance,
IsWonder,
OuterDefenseStrength,
CitizenSlots,
MustBeLake,
MustNotBeLake,
RegionalRange,
AdjacentToMountain,
ObsoleteEra,
RequiresReligion,
GrantFortification,
DefenseModifier,
InternalOnly,
RequiresAdjacentRiver,
MustBeAdjacentLand,
AdvisorType,
AdjacentCapital,
UnlocksGovernmentPolicy,
TraitType
) SELECT 
'BUILDING_RANDOM_STAR_gkls621',
'LOC_BUILDING_RANDOM_STAR_gkls621_NAME',
Cost -5,
0,
'DISTRICT_CITY_CENTER',
'LOC_BUILDING_RANDOM_STAR_gkls621_DESCRIPTION',
RequiresPlacement,
RequiresRiver,
Housing,
Entertainment,
EnabledByReligion,
AllowsHolyCity,
PurchaseYield,
MustPurchase,
Maintenance,
IsWonder,
OuterDefenseStrength,
CitizenSlots,
MustBeLake,
MustNotBeLake,
RegionalRange,
AdjacentToMountain,
ObsoleteEra,
RequiresReligion,
GrantFortification,
DefenseModifier,
InternalOnly,
RequiresAdjacentRiver,
MustBeAdjacentLand,
AdvisorType,
AdjacentCapital,
UnlocksGovernmentPolicy,
'TRAIT_BUILDING_RANDOM_STAR_gkls621'
FROM Buildings WHERE BuildingType = 'BUILDING_MONUMENT';

INSERT INTO Buildings (
BuildingType,
Name,
Cost,
Capital,
PrereqDistrict,
Description,
RequiresPlacement,
RequiresRiver,
Housing,
Entertainment,
EnabledByReligion,
AllowsHolyCity,
PurchaseYield,
MustPurchase,
Maintenance,
IsWonder,
OuterDefenseStrength,
CitizenSlots,
MustBeLake,
MustNotBeLake,
RegionalRange,
AdjacentToMountain,
ObsoleteEra,
RequiresReligion,
GrantFortification,
DefenseModifier,
InternalOnly,
RequiresAdjacentRiver,
MustBeAdjacentLand,
AdvisorType,
AdjacentCapital,
UnlocksGovernmentPolicy,
TraitType
) SELECT 
'BUILDING_RYUSEIDO_gkls621',
'LOC_BUILDING_RYUSEIDO_gkls621_NAME',
Cost -30,
0,
'DISTRICT_COMMERCIAL_HUB',
'LOC_BUILDING_RYUSEIDO_gkls621_DESCRIPTION',
RequiresPlacement,
RequiresRiver,
2,
Entertainment,
EnabledByReligion,
AllowsHolyCity,
PurchaseYield,
MustPurchase,
Maintenance,
IsWonder,
OuterDefenseStrength,
CitizenSlots +1,
MustBeLake,
MustNotBeLake,
6,
AdjacentToMountain,
ObsoleteEra,
RequiresReligion,
GrantFortification,
DefenseModifier,
InternalOnly,
RequiresAdjacentRiver,
MustBeAdjacentLand,
AdvisorType,
AdjacentCapital,
UnlocksGovernmentPolicy,
'TRAIT_BUILDING_RYUSEIDO_gkls621_gkls621'
FROM Buildings WHERE BuildingType = 'BUILDING_MARKET';

INSERT INTO Building_YieldChanges
(BuildingType,  YieldType,  YieldChange)
SELECT 'BUILDING_RANDOM_STAR_gkls621',    YieldType,  YieldChange +1
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONUMENT';

INSERT INTO Building_YieldChanges
(BuildingType,  YieldType,  YieldChange)
SELECT 'BUILDING_RYUSEIDO_gkls621',    YieldType,  YieldChange
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MARKET';

INSERT INTO Building_YieldChanges
(BuildingType,  YieldType,  YieldChange)
VALUES
('BUILDING_RYUSEIDO_gkls621',    'YIELD_SCIENCE', 1);

INSERT INTO Building_YieldsPerEra
(BuildingType,  YieldType,  YieldChange)
VALUES
('BUILDING_RYUSEIDO_gkls621',   'YIELD_SCIENCE',    1);

INSERT INTO BuildingModifiers
(BuildingType,  ModifierId)
SELECT 'BUILDING_RANDOM_STAR_gkls621',  ModifierId
FROM BuildingModifiers WHERE BuildingType = 'BUILDING_MONUMENT';

INSERT INTO BuildingModifiers
(BuildingType,  ModifierId)
SELECT 'BUILDING_RYUSEIDO_gkls621',  ModifierId
FROM BuildingModifiers WHERE BuildingType = 'BUILDING_MARKET';

INSERT INTO Building_GreatPersonPoints
(BuildingType,  GreatPersonClassType,   PointsPerTurn)
VALUES
('BUILDING_RANDOM_STAR_gkls621',    'GREAT_PERSON_CLASS_MUSICIAN',  1),
('BUILDING_RYUSEIDO_gkls621',   'GREAT_PERSON_CLASS_MERCHANT',  1),
('BUILDING_RYUSEIDO_gkls621',   'GREAT_PERSON_CLASS_ARTIST',    1);

INSERT INTO Building_GreatWorks
(BuildingType,  GreatWorkSlotType,  NumSlots)
VALUES
('BUILDING_RANDOM_STAR_gkls621',    'GREATWORKSLOT_PALACE', 2);

INSERT INTO Building_GreatWorks
(BuildingType,  GreatWorkSlotType,  NumSlots,
ThemingSameObjectType,  ThemingYieldMultiplier, ThemingTourismMultiplier,   NonUniquePersonYield,   NonUniquePersonTourism, ThemingBonusDescription)
VALUES
('BUILDING_RYUSEIDO_gkls621',   'GREATWORKSLOT_PALACE', 3,
1,  200,    200,    1,  1,  'LOC_BUILDING_RYUSEIDO_THEMINGBONUS_gkls621');