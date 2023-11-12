import { InterviewService } from './interview.service';
import { Response } from 'express';
export declare class InterviewController {
    private readonly interviewService;
    constructor(interviewService: InterviewService);
    getInterviews(page: string, response: Response): Promise<void>;
    getInterviewsWithLikeMemberQuestion(page: string, category: string, response: Response): Promise<void>;
}
