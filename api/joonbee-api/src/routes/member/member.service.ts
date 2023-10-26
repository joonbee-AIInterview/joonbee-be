import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';

@Injectable()
export class MemberService {

    constructor(
        @InjectRepository(Member)
        private memberRepository: Repository<Member>
    ){}

    async findAll(){
        return this.memberRepository.find();
    }
}
