import { InterviewAndQuestion } from './and.question.entity';
import { Member } from "./member.entity";
export declare class Interview {
    id: number;
    memberId: string;
    categoryName: string;
    member: Member;
<<<<<<< HEAD
    countFlag: number;
=======
    interviewAndQuestions: InterviewAndQuestion[];
>>>>>>> 2fb82bc3c7f456db7b9aea52bdb968b2e3a93b44
    createdAt: Date;
    updatedAt: Date;
}
