import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";
import { ResponseInterviewsDTO } from "./dto/response.dto";
import { InterviewAndQuestion } from 'src/entity/and.question.entity';
export declare class InterviewService {
    private readonly interviewRepository;
    private readonly interviewAndQuestionRepository;
    private PAGE_SIZE;
    constructor(interviewRepository: Repository<Interview>, interviewAndQuestionRepository: Repository<InterviewAndQuestion>);
    getInterviews(page: number): Promise<ResponseInterviewsDTO>;
    getInterviewsWithLikeMemberQuestion(page: number, categoryName: string): Promise<ResponseInterviewsDTO>;
}
