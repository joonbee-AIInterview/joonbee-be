export declare class RequestQuestion {
    questionId: number;
    questionContent: string;
    answerContent: string;
}
export declare class RequestLikeDTO {
    interviewId: number;
}
export declare class RequestInterviewSaveDTO {
    categoryName: string;
    questions: RequestQuestion[];
}
export declare class RequestCartInsertDTO {
    questionId: number;
    categoryName: string;
}
