import { Interview } from "./interview.entity";
import { Cart } from "./cart.entity";
export declare class Member {
    id: string;
    email: string;
    password: string;
    thumbnail: string | null;
    loginType: string | null;
    delFlag: boolean;
    nickName: string;
    createdAt: Date;
    updatedAt: Date;
    interviews: Interview[];
    carts: Cart;
}
