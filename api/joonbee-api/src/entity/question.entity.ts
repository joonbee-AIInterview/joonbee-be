import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm/index';
import { Category } from './category.entity';
import { UpdateQuestionDto } from 'src/routes/question/dto/update.request.dto';

@Entity('question')
export class Question {

     @PrimaryGeneratedColumn()
     id: number;

     @ManyToOne(() => Category, category => category.id, { onDelete: 'CASCADE' })
     @JoinColumn({ name: 'category_id' })
     category: Category;

     @Column({ type: 'tinyint', name: 'gpt_flag' })
     gptFlag: number; // 0 1

     @Column({ type: 'int', name: 'question_level' })
     questionLevel: number;

     @Column({ type: 'varchar', length: 255, nullable: false } )
     writer: string;

     @Column({ type: 'text', name: 'question_content'})
     questionContent: string;

     @CreateDateColumn({ name: 'created_at', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
     createdAt: Date;

     @UpdateDateColumn({ name: 'updated_at', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP'  })
     updatedAt: Date;

     /**
      * 의미있는 메소드
      */
     updateQuestion(updateQuestionDto: UpdateQuestionDto) {
          this.category.categoryName = updateQuestionDto.categoryName;
          this.gptFlag = updateQuestionDto.gptFlag;
          this.questionLevel = updateQuestionDto.questionLevel;
          this.writer = updateQuestionDto.writer;
          this.questionContent = updateQuestionDto.questionContent;
     }
}