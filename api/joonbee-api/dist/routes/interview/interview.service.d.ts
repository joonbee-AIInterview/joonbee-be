import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";
export declare class InterviewService {
    private interviewRepository;
    constructor(interviewRepository: Repository<Interview>);
    getAllInterviewWithMemberQuestionCategory(): Promise<Interview[]>;
}
