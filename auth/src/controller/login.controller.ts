import { UserRepository } from "../repository/member.repository"
import { CustomError } from "../utils/api.utils";
import { generateTokenForNickName } from "../utils/jwt.utils";

export const loginAuthentication = async (id: string, nickName: string) => {
    const userRepository = new UserRepository();
    const existData = await userRepository.existMemberByNickName(nickName);

    if(existData){
        throw new CustomError('이미 존재하는 닉네임입니다.', 400);
    }

    await userRepository.updateNickname(id, nickName);
    const authToken = await generateTokenForNickName(id);
    return authToken;
}