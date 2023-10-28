import { Like } from 'src/entity/like.entity';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';
export declare class MemberService {
    private memberRepository;
    private likeRepository;
    constructor(memberRepository: Repository<Member>, likeRepository: Repository<Like>);
    insertLike(memberId: string, questionId: number): Promise<void>;
}
