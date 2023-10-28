import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm/index';

@Entity('category')
export class Category { // 1 Category : N Question

     @PrimaryGeneratedColumn()
     id: number;

     @Column()
     category_name: string;

     @Column()
     category_level: number; // 0 1

     @CreateDateColumn()
     created_at: Date;

     @UpdateDateColumn()
     updated_at: Date;
}