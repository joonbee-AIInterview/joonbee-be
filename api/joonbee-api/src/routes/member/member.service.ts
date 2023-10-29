import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CustomError } from 'src/common/config/common';
import { Category } from 'src/entity/category.entity';
import { Like } from 'src/entity/like.entity';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';
import { RequestInterviewSaveDTO } from './dto/request.dto';
import { Interview } from 'src/entity/interview.entity';

@Injectable()
export class MemberService {

    constructor(
        @InjectRepository(Member)
        private readonly memberRepository: Repository<Member>,
        @InjectRepository(Like)
        private readonly likeRepository: Repository<Like>,
        @InjectRepository(Interview)
        private readonly interviewRepository: Repository<Interview> 
    ){}

    async insertLike(memberId: string, interviewId: number): Promise<void>{
        try{
            const likeEntity = this.likeRepository.create({
                memberId: memberId,
                interviewId: interviewId
            });

            console.log(likeEntity);
            await this.likeRepository.save(likeEntity);
        }catch(error){
            console.log('insertLIKE ERROR member.service 27 \n'+ error);
            throw new CustomError('좋아요 실패',500);
        }
    }


    async insertInterview(memberId: string, questionInfo: RequestInterviewSaveDTO): Promise<void>{
        try{
            const result = await this.interviewRepository
                .createQueryBuilder('i')
                .select('MAX(i.count_flag)','countFlag')
                .where('i.member_id = :memberId',{ memberId })
                .getRawOne();

            const maxCount:number = result.countFlag + 1;

            const interviews: Interview[] = []; 
            questionInfo.questions.forEach(el => {
                const interviewEntity = this.interviewRepository.create({
                    memberId: memberId,
                    questionId: el.questionId,
                    questionContent: el.questionContent,
                    countFlag: maxCount
                });

                interviews.push(interviewEntity);
            });

            this.interviewRepository.save(interviews);

        }catch(error){
            console.log('insertInterview ERROR member.serivce 40 \n' + error);
            throw new CustomError('면접 저장 실패',500);
        }
    }
}
