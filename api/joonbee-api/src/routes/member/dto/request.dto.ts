import { ApiProperty } from "@nestjs/swagger";
import { IsNotEmpty } from "class-validator";

interface RequestQuestion{
    questionId : number,
    questionContent: string,
    answerContent: string
}

export class RequestLikeDTO{

    @IsNotEmpty()
    interviewId: number;
}

export class RequestInterviewSaveDTO{
    @IsNotEmpty()
    @ApiProperty({ description: 'questionId(number), questionContent(string), answerContent(string)'})
    questions: RequestQuestion[];

}
