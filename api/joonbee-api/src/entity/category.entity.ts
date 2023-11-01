import { Column, CreateDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from 'typeorm/index';

@Entity('category')
export class Category { // 1 Category : N Question

     @PrimaryGeneratedColumn()
     id: number;

     @Column({ type: 'varchar', length: 255, name: 'category_name' })
     categoryName: string;

     @Column({ type: 'tinyint', name: 'category_level' })
     categoryLevel: number; // 0 1

     @Column({ type: 'int', name: 'category_upper_id' })
     categoryUpperId: number;

     @CreateDateColumn({ name: 'created_at' })
     createdAt: Date;

     @UpdateDateColumn({ name: 'updated_at' })
     updatedAt: Date;
}