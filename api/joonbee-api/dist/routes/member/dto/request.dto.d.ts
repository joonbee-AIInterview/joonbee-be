export declare class RequestQuestion {
    questionId: number;
    questionContent: string;
    answerContent: string;
}
export declare class RequestLikeDTO {
    interviewId: number;
}
export declare class RequestInterviewSaveDTO {
    questions: RequestQuestion[];
}
