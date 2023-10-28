import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { QuestionService } from './question.service';
import { QuestionController } from './question.controller';
import { Question } from 'src/entity/question.entity';
import { Category } from 'src/entity/category.entity';

@Module({
<<<<<<< HEAD
<<<<<<< HEAD
     imports: [TypeOrmModule.forFeature([Question,Category])], 
=======
     imports: [TypeOrmModule.forFeature([Question, Category])], 
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
=======
     imports: [TypeOrmModule.forFeature([Question, Category])], 
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
     controllers: [QuestionController],
     providers: [QuestionService],
})

export class QuestionModule {}