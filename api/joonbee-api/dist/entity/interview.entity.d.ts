import { Member } from "./member.entity";
export declare class Interview {
    id: number;
    memberId: string;
    member: Member;
    countFlag: number;
    createdAt: Date;
    updatedAt: Date;
}
