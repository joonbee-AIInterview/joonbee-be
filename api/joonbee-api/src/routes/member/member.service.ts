import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CustomError } from 'src/common/config/common';
import { Category } from 'src/entity/category.entity';
import { Like } from 'src/entity/like.entity';
import { Member } from 'src/entity/member.entity';
import { Repository } from 'typeorm';
import { RequestInterviewSaveDTO } from './dto/request.dto';
import { Interview } from 'src/entity/interview.entity';
import { InterviewAndQuestion } from 'src/entity/and.question.entity';

@Injectable()
export class MemberService {

    constructor(
        @InjectRepository(Member)
        private readonly memberRepository: Repository<Member>,
        @InjectRepository(Like)
        private readonly likeRepository: Repository<Like>,
        @InjectRepository(Interview)
        private readonly interviewRepository: Repository<Interview>,
        @InjectRepository(InterviewAndQuestion)
        private readonly andQuestionRepository: Repository<InterviewAndQuestion>
    ){}
    /**
     * @note 면접에 좋아요를 누르면 insert 되는 코드
     * @TODO 아직 구현 안함
     */
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

    /**
     * @note interview 엔티티를 먼저 저장하고, interview_and_question 데이터를 저장한다.
     */
    async insertInterview(memberId: string, questionInfo: RequestInterviewSaveDTO): Promise<void>{
        try{
            const interviewObject = this.interviewRepository.create({ memberId });
            const interviewEntity: Interview = await this.interviewRepository.save(interviewObject);

            const entityArr: InterviewAndQuestion[] = [];
            questionInfo.questions.forEach(el => {
                const entity = this.andQuestionRepository.create({
                    questionId : el.questionId,
                    answerContent: el.answerContent,
                    interviewId: interviewEntity.id
                });

                entityArr.push(entity);
            });

            await this.andQuestionRepository.save(entityArr);

        }catch(error){
            console.log('insertInterview ERROR member.serivce 40 \n' + error);
            throw new CustomError('면접 저장 실패',500);
        }
    }
}
