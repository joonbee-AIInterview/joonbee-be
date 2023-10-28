import { IsNotEmpty } from "class-validator";


export class RequestLikeDTO{

    @IsNotEmpty()
    questionId: number;
}
