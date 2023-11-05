import { Column, CreateDateColumn, Entity, PrimaryColumn, UpdateDateColumn } from "typeorm";

@Entity({name: 'cart'})
export class Cart{

    @PrimaryColumn({ name: 'member_id' })
    memberId: string;

    @PrimaryColumn({ name: 'question_id' })
    questionId: number;

    @Column({ name: 'category_name'})
    categoryName: string;

    @CreateDateColumn({ name: 'created_at', type: 'datetime', default: () => 'CURRENT_TIMESTAMP' })
    createdAt: Date;

    @UpdateDateColumn({ name: 'updated_at', type: 'datetime', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP'  })
    updatedAt: Date;
}