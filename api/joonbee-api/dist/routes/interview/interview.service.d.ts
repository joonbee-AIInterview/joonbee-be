import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";
import { ResponseInterviewsDTO } from "./dto/response.dto";
import { InterviewAndQuestion } from 'src/entity/and.question.entity';
import { Category } from 'src/entity/category.entity';
export declare class InterviewService {
    private readonly interviewRepository;
    private readonly interviewAndQuestionRepository;
    private readonly categoryRepository;
    private PAGE_SIZE;
    constructor(interviewRepository: Repository<Interview>, interviewAndQuestionRepository: Repository<InterviewAndQuestion>, categoryRepository: Repository<Category>);
    getInterviews(page: number): Promise<ResponseInterviewsDTO>;
    getInterviewsWithLikeMemberQuestion(page: number, categoryName: string): Promise<ResponseInterviewsDTO>;
}
