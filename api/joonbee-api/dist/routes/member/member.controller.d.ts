import { MemberService } from './member.service';
export declare class MemberController {
    private readonly memberService;
    constructor(memberService: MemberService);
    findAll(): Promise<import("../../entity/member.entity").Member[]>;
}
