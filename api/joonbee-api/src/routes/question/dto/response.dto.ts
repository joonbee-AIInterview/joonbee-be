export class ResponseQuestionsWithCategoryDTO {
     total: number;
     result: ResponseQuestionsWithCategoryData[]
}

export class ResponseQuestionsWithCategoryData {
     questionId: number;
     categoryId: number;
     questionContent: string;
     categoryName: string;
}