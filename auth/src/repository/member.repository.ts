import { CustomError } from '../utils/api.utils';
import pool from '../utils/database.utils';

export class UserRepository {
    
    async insertMember(id: string, email: string, password: string, thumbnail: string): Promise<void> {
        const client = await pool.connect();

        try{
            const queryText = 'INSERT INTO Member(id, email, password, thumbnail) VALUES($1, $2, $3, $4)';
            await client.query(queryText, [id, email, password, thumbnail]);
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