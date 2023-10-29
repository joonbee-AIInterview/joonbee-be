import { MemberService } from './member.service';
import { RequestInterviewSaveDTO, RequestLikeDTO } from './dto/request.dto';
import { Request, Response } from 'express';
export declare class MemberController {
    private readonly memberService;
    constructor(memberService: MemberService);
    test(request: Request, response: Response): Promise<any>;
    insertLikeHandler(dto: RequestLikeDTO, response: Response): Promise<void>;
    insertInterviewAndQuestion(data: RequestInterviewSaveDTO, response: Response): Promise<void>;
}
