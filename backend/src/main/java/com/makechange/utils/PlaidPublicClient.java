package com.makechange.utils;

public interface PlaidPublicClient {

    Object getEntity(String entityId);
    
    Object getInstitution(String institutionId);
    
    InstitutionsResponse getAllInstitutions();
    
    CategoriesResponse getAllCategories();
    
    Object getCategory(String categoryId);
    
    Object getCategoriesByMapping(String mapping, MappingOptions options);
    
    HttpDelegate getHttpDelegate();
}
