import { UpdateQuestionDto } from './../routes/question/dto/update.request.dto';
import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm/index';
import { Category } from './category.entity';

@Entity('question')
export class Question {

     @PrimaryGeneratedColumn()
     id: number;

     // 연관관계
     @ManyToOne(() => Category)
     @JoinColumn({ name: 'category_id' })
     category: Category;

     @Column('tinyint', { nullable: false })
     gpt_flag: number; // 0 1

     @Column('int', { nullable: false })
     question_level: number;

     @Column('varchar', { nullable: false } )
     writer: string;

     @Column('text', { nullable: false })
     question_content: string;

     @CreateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
     created_at: Date;

     @UpdateDateColumn({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP'  })
     updated_at: Date;

     /**
      * 의미있는 메소드
      */
     updateQuestion(updateQuestionDto: UpdateQuestionDto) {
          this.category.category_name = updateQuestionDto.category_name;
          this.category.category_level = updateQuestionDto.category_level;
          this.category.category_upper_id = updateQuestionDto.category_upper_id;
          this.gpt_flag = updateQuestionDto.gpt_flag;
          this.question_level = updateQuestionDto.question_level;
          this.writer = updateQuestionDto.writer;
          this.question_content = updateQuestionDto.question_content;
     }
}