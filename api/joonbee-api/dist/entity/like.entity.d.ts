import { Member } from "./member.entity";
import { Question } from "./question.entity";
export declare class Like {
    memberId: string;
    questionId: number;
    member: Member;
    question: Question;
}
