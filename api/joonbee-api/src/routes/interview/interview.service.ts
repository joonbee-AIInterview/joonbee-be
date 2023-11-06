import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";

@Injectable()
export class InterviewService {

     constructor(
          @InjectRepository(Interview)
          private interviewRepository: Repository<Interview>
     ) {}

     /**
     * @note 9개씩 페이징, 랜덤으로 (카테고리이름, 작성자, 사용자썸네일, 좋아요개수) 가져온다.
    */
     async interviewsWithQuestionCategoryMember() {
          throw new Error('Method not implemented.');
     }
}