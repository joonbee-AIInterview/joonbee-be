import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Member } from "./member.entity";
import { Question } from "./question.entity";


@Entity('interview')
export class Interview{

    @PrimaryGeneratedColumn()
    id: number;

    @Column({ name: 'member_id', type: 'varchar', length: 255 })
    memberId: string;

    @Column({ name: 'question_id' ,type: "bigint"})
    questionId: number;

    @Column({ name: 'question_content', type: 'text'})
    questionContent: string;

    @Column({ name: 'count_flag', type: 'int'})
    countFlag: number;

    @ManyToOne(() => Member, member => member.id, { onDelete: 'CASCADE'})
    @JoinColumn({name: 'member_id'})
    member: Member;

    @ManyToOne(() => Question, question => question.id)
    @JoinColumn({ name: "question_id" })
    question: Question;

    @CreateDateColumn({ name: 'created_at' })
    createdAt: Date;

    @UpdateDateColumn({ name: 'updated_at' })
    updatedAt: Date;

}