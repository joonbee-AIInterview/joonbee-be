import { ApiProperty } from "@nestjs/swagger";
import { IsNotEmpty } from "class-validator";

export class RequestQuestion {
    @IsNotEmpty()
    @ApiProperty({ description: '질문 ID' })
    questionId: number;
  
    @IsNotEmpty()
    @ApiProperty({ description: '질문 내용' })
    questionContent: string;
  
    @IsNotEmpty()
    @ApiProperty({ description: '답변 내용' })
    answerContent: string;
  }

export class RequestLikeDTO{

    @IsNotEmpty()
    interviewId: number;
}

export class RequestInterviewSaveDTO{
    @IsNotEmpty()
    @ApiProperty({ 
        description: 'questionId(number), questionContent(string), answerContent(string)',
        type: RequestQuestion,
        isArray: true
    })
    questions: RequestQuestion[];

}
