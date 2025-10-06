-- Tae Trait, part relied on NEW ADJACENCY
INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              
    ProvideType, YieldType, YieldChange,            
    AdjacencyType, CustomAdjacentObject, Rings,       
    DistrictModifiers, TraitType,                    
    Only, FreeCompose)                                    
    VALUES 
    ('TAE_HOLY_SITE_SCIENCE_FROM_ADJACENT_APPEAL_gkls621', 'DISTRICT_HOLY_SITE', 
    'SelfBonus', 'YIELD_SCIENCE', 0.4, 
    'FROM_UI_ADJACENT_APPEAL', 'NONE', 3,
    0, 'TRAIT_LEADER_TAE_gkls621', 
    'Human&AI', 0);

INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              
    ProvideType, YieldType, YieldChange,            
    AdjacencyType, CustomAdjacentObject,            
    DistrictModifiers, TraitType,                    
    Only, FreeCompose)  
    SELECT
    'TAE_PRESERVE_' || SUBSTR(ResourceType, 10) || '_FROM_SURPLUS_AMENITY_gkls621',
    'DISTRICT_PRESERVE', 
    'SelfExtractResource',  ResourceType,   2.0,
    'FROM_CITY_SURPLUS_AMENITIES_OVER_HIGHEST_LEVEL_HAPPINESS', 'NONE',
    0,  'TRAIT_LEADER_TAE_gkls621',
    'Human&AI', 0
    FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_STRATEGIC';

INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              
    ProvideType, YieldType, YieldChange,            
    AdjacencyType, CustomAdjacentObject,            
    DistrictModifiers, TraitType,                    
    Only, FreeCompose)  
    SELECT
    'TAE_PRESERVE_' || SUBSTR(YieldType, 7) || '_FROM_TOTAL_PARKS_gkls621',
    'DISTRICT_PRESERVE', 
    'SelfMultiplier',  YieldType,   50,
    'FROM_PLAYER_PROPERTY', 'TAE_SUM_OF_PARKS',
    0,  'TRAIT_LEADER_TAE_gkls621',
    'Human&AI', 0
    FROM Yields;

INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              
    ProvideType, YieldType, YieldChange,            
    AdjacencyType, CustomAdjacentObject,            
    DistrictModifiers, TraitType,                    
    Only, FreeCompose)  
    SELECT
    'TAE_HOLY_SITE_' || SUBSTR(YieldType, 7) || '_FROM_TOTAL_PARKS_gkls621',
    'DISTRICT_HOLY_SITE', 
    'SelfMultiplier',  YieldType,   25,
    'FROM_PLAYER_PROPERTY', 'TAE_SUM_OF_PARKS',
    0,  'TRAIT_LEADER_TAE_gkls621',
    'Human&AI', 0
    FROM Yields;

INSERT INTO Ruivo_New_Adjacency_Text (ID, Tooltip) SELECT
    'TAE_PRESERVE_' || SUBSTR(YieldType, 7) || '_FROM_TOTAL_PARKS_gkls621',
    'LOC_TAE_YIELD_FROM_TOTAL_PARKS_gkls621'
    FROM Yields;

INSERT INTO Ruivo_New_Adjacency_Text (ID, Tooltip) SELECT
    'TAE_HOLY_SITE_' || SUBSTR(YieldType, 7) || '_FROM_TOTAL_PARKS_gkls621',
    'LOC_TAE_YIELD_FROM_TOTAL_PARKS_gkls621'
    FROM Yields;