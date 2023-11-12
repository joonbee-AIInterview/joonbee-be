import { RowDataPacket } from 'mysql2';
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { CustomError } from "src/common/config/common";
import { Interview } from "src/entity/interview.entity";
import { Repository } from "typeorm";
import { ResponseInterviewsQuestionCategoryMemberDTO, ResponseInterviewsQuestionCategoryMemberData } from "./dto/response.dto";

@Injectable()
export class InterviewService {

     private PAGE_SIZE: number;

     constructor(
          @InjectRepository(Interview)
          private readonly interviewRepository: Repository<Interview>,
     ) {
          this.PAGE_SIZE = 9;
     }

     /**
     * @note 9개씩 페이징, 랜덤으로 가져온다.
    */
     // async interviewsWithQuestionCategoryMember(page: number, categoryName: string): Promise<ResponseInterviewsQuestionCategoryMemberDTO> {
     //      try {
     //           let rowPacket: RowDataPacket[];
     //           let countQuery: RowDataPacket;

     //           const skipNumber = (page - 1) * this.PAGE_SIZE;

     //           if (categoryName === "") { // categoryName 없을 때 -> 무작위

     //           } else { // categoryName 있을 때 -> 해당하는 상위 카테고리 무작위

     //           }

              

     //           const interviewsWithQuestionCategoryMemberDTOs: ResponseInterviewsQuestionCategoryMemberData = RowDataPacket.map(packet => ({

     //           }));

     //           const result: ResponseInterviewsQuestionCategoryMemberDTO = {
     //                //total: Number(countQuery.count),
     //                result: interviewsWithQuestionCategoryMemberDTOs
     //           }
     //           return result;
     //      } catch(error) {
     //           console.log('interviewsWithQuestionCategoryMember ERROR interview.service 148\n' + error);
     //           throw new CustomError('메인 페이지 상단 인터뷰 정보 불러오기 실패', 500);
     //      }
     // }
}