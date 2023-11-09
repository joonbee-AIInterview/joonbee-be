import { TypeOrmModule } from "@nestjs/typeorm";
import { InterviewController } from "./interview.controller";
import { InterviewService } from "./interview.service";
import { Module } from "@nestjs/common";
import { Interview } from "src/entity/interview.entity";

@Module({
     imports: [TypeOrmModule.forFeature([
          Interview,
     ])],
     controllers: [InterviewController],
     providers: [InterviewService]
   })
   export class InterviewModule {}