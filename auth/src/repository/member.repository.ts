import pool from '../utils/database.utils';

export class UserRepository {
    
    async insertMember(id: string, email: string, password: string, thumbnail: string): Promise<void> {
        const client = await pool.connect();

        try{
            const queryText = 'INSERT INTO users(id, email, password, thumbnail) VALUES($1, $2, $3, $4)';
            await client.query(queryText, [id, email, password, thumbnail]);
        }

       
    }
}