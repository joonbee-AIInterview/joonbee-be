import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';
export declare class MemberService {
    private memberRepository;
    constructor(memberRepository: Repository<Member>);
    findAll(): Promise<Member[]>;
}
