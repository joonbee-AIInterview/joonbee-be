import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { QuestionService } from './question.service';
import { QuestionController } from './question.controller';
import { Question } from 'src/entity/question.entity';

@Module({
     imports: [TypeOrmModule.forFeature([Question])], 
     controllers: [QuestionController],
     providers: [QuestionService],
})

export class QuestionModule {}