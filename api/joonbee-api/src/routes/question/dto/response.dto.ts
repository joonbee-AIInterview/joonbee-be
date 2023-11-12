/**
 * 줘야하는 공통된 Data
 */
export class ResponseQuestionsWithCategoryData {
     questionId: number;
     categoryId: number;
     questionContent: string;
     categoryName: string;
}


// 메인 페이지 하단API 디폴트 DTO
export class ResponseQuestionsDTO {
     total: number;
     result: ResponseQuestionsWithCategoryData[];
}

// 메인 페이지 하단API category DTO
export class ResponseQuestionsWithCategoryDTO {
     total: number;
     result: ResponseQuestionsWithCategoryData[];
}

// 메인 페이지 하단API subcategory DTO
export class ResponseQuestionsWithSubcategoryDTO {
     total: number;
     result: ResponseQuestionsWithCategoryData[];
}

