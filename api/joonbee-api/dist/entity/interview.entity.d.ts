import { InterviewAndQuestion } from './and.question.entity';
import { Member } from "./member.entity";
export declare class Interview {
    id: number;
    memberId: string;
    categoryName: string;
    member: Member;
    interviewAndQuestions: InterviewAndQuestion[];
    createdAt: Date;
    updatedAt: Date;
}
