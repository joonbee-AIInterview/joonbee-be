import { Column, CreateDateColumn, Entity, PrimaryColumn, UpdateDateColumn } from "typeorm";


@Entity('member')
export class Member{

    @PrimaryColumn({ type: 'varchar', length: 255 })
    id: string;

    @Column({ type: 'varchar', length: 255, unique: true})
    email: string;

    @Column({ type: 'varchar', length: 255 })
    password: string;
  
    @Column({ type: 'text', nullable: true })
    thumbnail: string | null;
  
    @Column({ name: 'login_type' ,type: 'varchar', length: 50, nullable: true })
    loginType: string | null;
  
    @Column({ name: 'del_flag' ,type: 'boolean', default: false })
    delFlag: boolean;
   
    @CreateDateColumn({ name: 'created_at' })
    createdAt: Date;

    @UpdateDateColumn({ name: 'updated_at' })
    updatedAt: Date;
  
}