import { CustomError } from '../utils/api.utils';
import pool from '../utils/database.utils';

export class UserRepository {
    
    async insertMember(id: string, email: string, password: string, thumbnail: string, type: string): Promise<void> {
        const client = await pool.connect();

        try{
            const currentDate = new Date();
            const formattedDate = (currentDate.getFullYear().toString())+(currentDate.getMonth() + 1)+(currentDate.getDate().toString());
            const queryText = `INSERT INTO Member(id, email, password, thumbnail, created_at, updated_at, login_type) 
            VALUES($1, $2, $3, $4, TO_TIMESTAMP($5, 'YYYYMMDDHH24'), TO_TIMESTAMP($5, 'YYYYMMDDHH24'), $6)`;
            console.log(formattedDate);
            await client.query(queryText, [id, email, password, thumbnail, formattedDate, type]);
            
        }catch(err){
            console.error(err);
            throw new CustomError("insertMember ERROR member.repository 12", 500);
        }
    }

    async existMember(id: string, email: string): Promise<boolean>{
        const client = await pool.connect();

       try{
            const queryText = 'SELECT count(*) FROM member WHERE id = $1 and email $2 ';
            const query = {
                text: 'SELECT count(*) FROM member WHERE id = $1 and email = $2',
                values: [id, email]
            };

            const result = await pool.query(query);

            return result.rows[0].count > 0;
        }catch(err){
            console.error(err);
            throw new CustomError("existMember ERROR member.repository 31", 500);
       }
    }
}