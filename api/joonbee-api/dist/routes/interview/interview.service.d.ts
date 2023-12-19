import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";
import { ResponseInterviewsDTO } from "./dto/response.dto";
import { InterviewAndQuestion } from 'src/entity/and.question.entity';
export declare class InterviewService {
    private readonly interviewRepository;
    private readonly interviewAndQuestionRepository;
    private PAGE_SIZE;
    constructor(interviewRepository: Repository<Interview>, interviewAndQuestionRepository: Repository<InterviewAndQuestion>);
    getInterviews(page: number, memberId: string): Promise<ResponseInterviewsDTO>;
    getInterviewsWithLikeMemberQuestion(page: number, memberId: string, categoryName: string): Promise<ResponseInterviewsDTO>;
}
