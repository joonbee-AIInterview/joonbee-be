import e from 'express';
import { CustomError } from '../utils/api.utils';
import pool from '../utils/database.utils';
import { RowDataPacket } from 'mysql2';

export class UserRepository {
    
    async insertMember(id: string, email: string, password: string, thumbnail: string, type: string): Promise<void> {
        const client = await pool.getConnection();
        try{
            const queryText = `INSERT INTO Member(id, email, password, thumbnail, login_type) 
            VALUES(?, ?, ?, ?, ?)`;

            await client.query(queryText, [id, email, password, thumbnail, type]);

            
        }catch(err){
            console.error(err);
            throw new CustomError("insertMember ERROR member.repository 12", 500);
        }
    }

    async existMember(id: string, email: string): Promise<boolean>{
        const client = await pool.getConnection();

       try{
            const query = `SELECT count(*) as cnt FROM member WHERE id = ? AND email = ?`;
            const [rows] = await pool.query(query, [id, email]) as RowDataPacket[];;
            const count = rows[0].cnt;

            return count;
            
        }catch(err){
            console.error(err);
            throw new CustomError("existMember ERROR member.repository 31", 500);
       }
    }
}