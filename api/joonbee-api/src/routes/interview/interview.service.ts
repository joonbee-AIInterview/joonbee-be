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

     async getAllInterviewWithMemberQuestionCategory(): Promise<Interview[]> {
          throw new Error('Method not implemented.');
     }
}