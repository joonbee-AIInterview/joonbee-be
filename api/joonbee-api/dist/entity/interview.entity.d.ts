import { Member } from "./member.entity";
import { Question } from "./question.entity";
export declare class Interview {
    id: number;
    memberId: string;
    questionId: number;
    questionContent: string;
    countFlag: number;
    member: Member;
    question: Question;
    createdAt: Date;
    updatedAt: Date;
}
