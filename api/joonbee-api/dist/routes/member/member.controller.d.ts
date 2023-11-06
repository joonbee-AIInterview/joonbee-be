import { MemberService } from './member.service';
import { RequestCartInsertDTO, RequestLikeDTO } from './dto/request.dto';
import { Request, Response } from 'express';
export declare class MemberController {
    private readonly memberService;
    constructor(memberService: MemberService);
    myInfoSelect(response: Response): Promise<void>;
    myCategoryInfo(page: string, response: Response): Promise<void>;
    myCategoryLikeInfo(page: string, response: Response): Promise<void>;
    myCartRead(page: string, response: Response): Promise<void>;
    insertCart(dto: RequestCartInsertDTO, response: Response): Promise<void>;
    insertLikeHandler(dto: RequestLikeDTO, response: Response): Promise<void>;
    insertInterviewAndQuestion(request: Request, response: Response): Promise<void>;
    deleteCart(questionId: number, response: Response): Promise<void>;
}
