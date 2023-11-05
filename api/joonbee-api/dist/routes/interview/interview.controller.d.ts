import { InterviewService } from './interview.service';
import { Interview } from 'src/entity/interview.entity';
export declare class InterviewController {
    private readonly interviewService;
    constructor(interviewService: InterviewService);
    findAllInterviewWithMemberQuestionCategory(): Promise<Interview[]>;
}
