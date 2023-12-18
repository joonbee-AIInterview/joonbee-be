import { InterviewService } from './interview.service';
import { Response } from 'express';
import { Category } from 'src/entity/category.entity';
import { Repository } from 'typeorm';
export declare class InterviewController {
    private readonly interviewService;
    private readonly categoryRepository;
    constructor(interviewService: InterviewService, categoryRepository: Repository<Category>);
    getInterviews(page: string, category: string, response: Response): Promise<void>;
}
