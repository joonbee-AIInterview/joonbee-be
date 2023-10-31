import { Column, CreateDateColumn, Entity, JoinColumn, ManyToOne, OneToMany, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";
import { Member } from "./member.entity";
import { Question } from "./question.entity";
import { InterviewAndQuestion } from "./and.question.entity";


@Entity('interview')
export class Interview{

    @PrimaryGeneratedColumn()
    id: number;

    @Column({ name: 'member_id', type: 'varchar', length: 255 })
    memberId: string;

    @ManyToOne(() => Member, member => member.id, { onDelete: 'CASCADE'})
    @JoinColumn({name: 'member_id'})
    member: Member;
  
    @CreateDateColumn({ name: 'created_at' })
    createdAt: Date;

    @UpdateDateColumn({ name: 'updated_at' })
    updatedAt: Date;

}