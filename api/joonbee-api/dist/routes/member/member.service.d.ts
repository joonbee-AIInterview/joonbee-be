import { Like } from 'src/entity/like.entity';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';
import { RequestInterviewSaveDTO } from './dto/request.dto';
import { Interview } from 'src/entity/interview.entity';
export declare class MemberService {
    private readonly memberRepository;
    private readonly likeRepository;
    private readonly interviewRepository;
    constructor(memberRepository: Repository<Member>, likeRepository: Repository<Like>, interviewRepository: Repository<Interview>);
    insertLike(memberId: string, interviewId: number): Promise<void>;
    insertInterview(memberId: string, questionInfo: RequestInterviewSaveDTO): Promise<void>;
}
