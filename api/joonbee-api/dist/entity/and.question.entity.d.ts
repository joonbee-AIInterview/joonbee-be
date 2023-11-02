import { Interview } from "./interview.entity";
import { Question } from "./question.entity";
export declare class InterviewAndQuestion {
    interviewId: number;
    questionId: number;
    answerContent: string;
    interview: Interview;
    question: Question;
}
