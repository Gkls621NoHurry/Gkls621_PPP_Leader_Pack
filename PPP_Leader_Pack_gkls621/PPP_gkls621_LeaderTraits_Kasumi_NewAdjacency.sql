-- Kasumi Trait, part relied on NEW ADJACENCY
INSERT INTO Ruivo_New_Adjacency 
    (ID, DistrictType,                              
    ProvideType, YieldType, YieldChange,            
    AdjacencyType, CustomAdjacentObject,       
    DistrictModifiers, TraitType,                    
    Only, FreeCompose)                                    
    VALUES 
    ('KASUMI_PROPHET_POINT_FROM_MET_CIVS', 'DISTRICT_CITY_CENTER', 
    'GreatPersonPoints', 'GREAT_PERSON_CLASS_PROPHET', 1.0, 
    'FROM_PLAYER_PROPERTY', 'KASUMI_PLAYERS_MET',
    0, 'TRAIT_LEADER_KASUMI_gkls621', 
    'Human&AI', 0),
    ('KASUMI_INFLUENCE_FROM_BELIEVERS_CITY', 'DISTRICT_CITY_CENTER', 
    'SelfInfluence', 'YIELD_INFLUENCE', 0.05, 
    'FROM_RELIGION_TOTAL_FOLLOWERS', 'NONE',
    0, 'TRAIT_LEADER_KASUMI_gkls621', 
    'Human&AI', 0),
    ('KASUMI_INFLUENCE_FROM_BELIEVERS_GOVERNMENT', 'DISTRICT_GOVERNMENT', 
    'SelfInfluence', 'YIELD_INFLUENCE', 0.5, 
    'FROM_RELIGION_TOTAL_FOLLOWERS', 'NONE',
    0, 'TRAIT_LEADER_KASUMI_gkls621', 
    'Human&AI', 0),
    ('KASUMI_INFLUENCE_FROM_BELIEVERS_DIPLOMACY', 'DISTRICT_DIPLOMATIC_QUARTER', 
    'SelfInfluence', 'YIELD_INFLUENCE', 0.5, 
    'FROM_RELIGION_TOTAL_FOLLOWERS', 'NONE',
    0, 'TRAIT_LEADER_KASUMI_gkls621', 
    'Human&AI', 0);

INSERT INTO Ruivo_New_Adjacency_Text (ID, Tooltip) VALUES
    ('KASUMI_PROPHET_POINT_FROM_MET_CIVS', 'LOC_KASUMI_PROPHET_POINT_FROM_MET_CIVS');