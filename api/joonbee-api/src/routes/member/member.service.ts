import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CustomError } from 'src/common/config/common';
import { Category } from 'src/entity/category.entity';
import { Like } from 'src/entity/like.entity';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';

@Injectable()
export class MemberService {

    constructor(
        @InjectRepository(Member)
        private memberRepository: Repository<Member>,
        @InjectRepository(Like)
        private likeRepository: Repository<Like>
    ){}

    async insertLike(memberId: string, questionId: number): Promise<void>{
        const likeEntity = this.likeRepository.create({
            memberId: memberId,
            questionId: questionId
        })

        try{
            await this.likeRepository.save(likeEntity);
        }catch(error){
            console.log('insertLIKE ERROR member.service 27 \n'+ error);
            throw new CustomError('좋아요 실패',500);
        }
    }
}
