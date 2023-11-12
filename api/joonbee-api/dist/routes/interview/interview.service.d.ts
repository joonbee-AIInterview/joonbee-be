import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";
export declare class InterviewService {
    private readonly interviewRepository;
    private PAGE_SIZE;
    constructor(interviewRepository: Repository<Interview>);
}
