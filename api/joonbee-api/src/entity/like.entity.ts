import { Entity, JoinColumn, ManyToOne, PrimaryColumn } from "typeorm";
import { Member } from "./member.entity";
import { Question } from "./question.entity";


@Entity('like')
export class Like{
    @PrimaryColumn({ name: 'member_id'})
    memberId: string;

    @PrimaryColumn({ name: 'question_id'})
    questionId: number;

    @ManyToOne(() => Member, member => member.id, { onDelete: 'CASCADE'})
    @JoinColumn({ name: 'question_id'})
    member: Member;

    @ManyToOne(() => Question, question => question.id, { onDelete: 'CASCADE'})
    @JoinColumn({ name: 'question_id' })
    question: Question;

}