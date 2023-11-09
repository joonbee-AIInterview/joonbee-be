import { InterviewService } from './interview.service';
import { Response } from 'express';
export declare class InterviewController {
    private readonly interviewService;
    constructor(interviewService: InterviewService);
    interviewsWithQuestionCategoryMember(response: Response): Promise<void>;
}
