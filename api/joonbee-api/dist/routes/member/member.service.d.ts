import { Category } from 'src/entity/category.entity';
import { Like } from 'src/entity/like.entity';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';
import { RequestInterviewSaveDTO } from './dto/request.dto';
import { Interview } from 'src/entity/interview.entity';
import { InterviewAndQuestion } from 'src/entity/and.question.entity';
import { ResponseInterviewCategoryDTO, ResponseMyInfoDTO } from './dto/response.dto';
export declare class MemberService {
    private readonly memberRepository;
    private readonly likeRepository;
    private readonly interviewRepository;
    private readonly andQuestionRepository;
    private readonly categoryRepository;
    private PAGE_SIZE;
    constructor(memberRepository: Repository<Member>, likeRepository: Repository<Like>, interviewRepository: Repository<Interview>, andQuestionRepository: Repository<InterviewAndQuestion>, categoryRepository: Repository<Category>);
    insertLike(memberId: string, interviewId: number): Promise<void>;
    insertInterview(memberId: string, questionInfo: RequestInterviewSaveDTO): Promise<void>;
    myInfoData(memberId: number): Promise<ResponseMyInfoDTO>;
    myCategoryInfoService(memberId: string, page: number): Promise<ResponseInterviewCategoryDTO>;
    myCategoryLikeInfoService(memberId: string, page: number): Promise<ResponseInterviewCategoryDTO>;
}
