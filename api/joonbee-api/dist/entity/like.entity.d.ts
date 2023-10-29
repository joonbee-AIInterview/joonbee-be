import { Member } from "./member.entity";
import { Interview } from "./interview.entity";
export declare class Like {
    memberId: string;
    interviewId: number;
    member: Member;
    interview: Interview;
}
