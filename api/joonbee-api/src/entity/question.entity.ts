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
     gpt_flag: number;

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
}