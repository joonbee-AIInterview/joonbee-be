import { rejects } from 'assert';
import { resolve } from 'path';
import redis from 'redis';

export const client = redis.createClient({
    url: 'redis://:1234@localhost:6379'
});

client.on('error', (err) => {
    console.error('Redis Error ',err);
});

export const set = (key: string, value: string): Promise<void> => {
    return new Promise((resolve, reject) => {
        // client.set(key, value, (err) => {
        //     // if (err) {
        //     //     reject(err);
        //     // } else {
        //     //     resolve();
        //     // }
        // });
    });
};

// client.set("some_key", "some_value", function(err, reply) {
//     if (err) {
//         console.error(err);
//     } else {
//         console.log(reply);  // 보통 "OK"를 출력합니다.
//     }
// });

