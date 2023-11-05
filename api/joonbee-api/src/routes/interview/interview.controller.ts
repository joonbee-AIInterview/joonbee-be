import { Controller, Get } from '@nestjs/common';
import { InterviewService } from './interview.service';
import { Interview } from 'src/entity/interview.entity';

@Controller('api/interview')
export class InterviewController {

     constructor(
          private readonly interviewService: InterviewService
     ) {}

     @Get()
     async findAllInterviewWithMemberQuestionCategory(): Promise<Interview[]> {
          const interviewList = await this.interviewService.getAllInterviewWithMemberQuestionCategory();
          return Object.assign({
               data: interviewList,
               statusCode: 200,
               statusMsg: `findAllWithCategory을 이용한 Question 데이터 조회가 성공적으로 완료되었습니다.`,
          });
     }
}