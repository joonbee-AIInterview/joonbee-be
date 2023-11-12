"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MemberService = void 0;
const redis_config_1 = require("./../../common/config/redis.config");
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("../../common/config/common");
const category_entity_1 = require("../../entity/category.entity");
const like_entity_1 = require("../../entity/like.entity");
const member_entity_1 = require("../../entity/member.entity");
const typeorm_2 = require("typeorm");
const interview_entity_1 = require("../../entity/interview.entity");
const and_question_entity_1 = require("../../entity/and.question.entity");
const cart_entity_1 = require("../../entity/cart.entity");
let MemberService = class MemberService {
    constructor(memberRepository, likeRepository, interviewRepository, andQuestionRepository, categoryRepository, cartRepository, redisService) {
        this.memberRepository = memberRepository;
        this.likeRepository = likeRepository;
        this.interviewRepository = interviewRepository;
        this.andQuestionRepository = andQuestionRepository;
        this.categoryRepository = categoryRepository;
        this.cartRepository = cartRepository;
        this.redisService = redisService;
        this.PAGE_SIZE = 6;
    }
    async insertLike(memberId, interviewId) {
        try {
            const likeObj = this.likeRepository.create({
                memberId: memberId,
                interviewId: interviewId
            });
            const likeEntity = await this.likeRepository.save(likeObj);
            const interviewEntityId = likeEntity.interviewId;
            const interviewEntityForMemberId = await this.interviewRepository
                .createQueryBuilder('i')
                .select('i.memberId', 'memberId')
                .where('i.id = :id', { id: interviewId })
                .getRawOne();
            console.log(interviewEntityForMemberId);
            const publishWithMemberId = interviewEntityForMemberId.memberId;
            await this.redisService.publish(publishWithMemberId);
        }
        catch (error) {
            console.log('insertLIKE ERROR member.service 27 \n' + error);
            throw new common_2.CustomError('좋아요 실패', 500);
        }
    }
    async insertInterview(memberId, questionInfo) {
        try {
            const interviewObject = this.interviewRepository.create({
                memberId,
                categoryName: questionInfo.categoryName
            });
            const interviewEntity = await this.interviewRepository.save(interviewObject);
            const entityArr = [];
            questionInfo.questions.forEach(el => {
                const entity = this.andQuestionRepository.create({
                    questionId: el.questionId,
                    answerContent: el.answerContent,
                    interviewId: interviewEntity.id
                });
                entityArr.push(entity);
            });
            await this.andQuestionRepository.save(entityArr);
        }
        catch (error) {
            console.log('insertInterview ERROR member.serivce 40 \n' + error);
            throw new common_2.CustomError('면접 저장 실패', 500);
        }
    }
    async myInfoData(memberId) {
        try {
            const result = await this.memberRepository
                .createQueryBuilder('m')
                .select(['m.id', 'm.thumbnail', 'm.nickName'])
                .addSelect('COUNT(i.id)', 'interviewCount')
                .leftJoin('m.interviews', 'i')
                .where('m.id = :id', { id: memberId })
                .groupBy('m.id')
                .getRawOne();
            const rowPacket = await this.categoryRepository
                .createQueryBuilder('c')
                .select('c.category_name', 'categoryName')
                .addSelect('COUNT(DISTINCT q.id)', 'categoryCount')
                .innerJoin('c.questions', 'q', 'c.category_level = 1')
                .innerJoin('q.interviewAndQuestions', 'iaq')
                .innerJoin('iaq.interview', 'i', 'i.member_id = :memberId', { memberId: '13b4a' })
                .groupBy('c.category_name')
                .orderBy('categoryCount', 'DESC')
                .getRawMany();
            const categoryInfoDTOs = rowPacket.map(packet => ({
                categoryName: packet.categoryName,
                categoryCount: +packet.categoryCount
            }));
            const dto = {
                id: result.m_id,
                thumbnail: result.m_thumbnail,
                nickName: result.m_nick_name,
                interviewCount: result.interviewCount,
                categoryInfo: categoryInfoDTOs
            };
            return dto;
        }
        catch (error) {
            console.log('insertInterview ERROR member.serivce 121\n' + error);
            throw new common_2.CustomError('사용자 정보 불러오기 실패', 500);
        }
    }
    async myCategoryInfoService(memberId, page) {
        try {
            const skipNumber = (page - 1) * this.PAGE_SIZE;
            const countQuery = await this.interviewRepository.count();
            const rowPacket = await this.interviewRepository
                .createQueryBuilder('interview')
                .select(['COUNT(*) AS questionCount', 'interview.categoryName AS categoryName', 'interview.id AS interviewId'])
                .innerJoin('interview.interviewAndQuestions', 'iaq')
                .where('interview.member_id = :memberId', { memberId })
                .groupBy('interview.id')
                .offset(skipNumber)
                .limit(this.PAGE_SIZE)
                .getRawMany();
            const categoryInfoDTOs = rowPacket.map(packet => ({
                categoryName: packet.categoryName,
                questionCount: +packet.questionCount,
                interviewId: +packet.interviewId,
            }));
            const result = {
                total: +countQuery,
                result: categoryInfoDTOs
            };
            return result;
        }
        catch (error) {
            console.log('insertInterview ERROR member.serivce 158\n' + error);
            throw new common_2.CustomError('사용자 면접 정보 불러오기 실패', 500);
        }
    }
    async myCategoryLikeInfoService(memberId, page) {
        try {
            const skipNumber = (page - 1) * this.PAGE_SIZE;
            const countQuery = await this.likeRepository
                .createQueryBuilder('like')
                .select('COUNT(like.interview_id)', 'count')
                .getRawOne();
            const subQuery = this.likeRepository.createQueryBuilder('like')
                .select('like.interviewId')
                .where('like.memberId = :memberId', { memberId });
            const rowPacket = await this.interviewRepository
                .createQueryBuilder('interview')
                .select(['COUNT(*) AS questionCount', 'interview.categoryName AS categoryName', 'interview.id AS interviewId'])
                .innerJoin('interview.interviewAndQuestions', 'iaq')
                .where(`interview.id IN (${subQuery.getQuery()})`)
                .setParameters(subQuery.getParameters())
                .groupBy('interview.id')
                .offset(skipNumber)
                .limit(this.PAGE_SIZE)
                .getRawMany();
            const categoryInfoDTOs = rowPacket.map(packet => ({
                categoryName: packet.categoryName,
                questionCount: +packet.questionCount,
                interviewId: +packet.interviewId
            }));
            const result = {
                total: Number(countQuery.count),
                result: categoryInfoDTOs
            };
            return result;
        }
        catch (error) {
            console.log('insertInterview ERROR member.serivce 158\n' + error);
            throw new common_2.CustomError('사용자 면접 정보 불러오기 실패', 500);
        }
    }
    async insertCartService(memberId, questionId, categoryName) {
        try {
            const cartObj = this.cartRepository.create({
                memberId,
                questionId,
                categoryName
            });
            this.cartRepository.save(cartObj);
        }
        catch (error) {
            console.log('insertInterview ERROR member.serivce 222\n' + error);
            throw new common_2.CustomError('사용자 장바구니 저장실패', 500);
        }
    }
    async myCartReadService(memberId, page) {
        try {
            const skipNumber = (page - 1) * this.PAGE_SIZE;
            const countQuery = await this.cartRepository.count();
            const cart = await this.cartRepository
                .createQueryBuilder('cart')
                .select(['q.questionContent AS questionContent', 'q.id AS questionId'])
                .innerJoin('cart.question', 'q')
                .where('cart.memberId = :memberId', { memberId })
                .offset(skipNumber)
                .limit(this.PAGE_SIZE)
                .getRawMany();
            const data = cart.map((packet) => ({
                questionId: +packet.questionId,
                questionContent: packet.questionContent
            }));
            const result = {
                total: countQuery,
                data
            };
            return result;
        }
        catch (error) {
            console.log('insertInterview ERROR member.serivce 241\n' + error);
            throw new common_2.CustomError('사용자 장바구니 조회실패', 500);
        }
    }
    async deleteCartService(memberId, questionId) {
        const data = await this.cartRepository.findOne({
            where: {
                memberId,
                questionId
            }
        });
        if (data) {
            await this.cartRepository.remove(data);
            return true;
        }
        return false;
    }
};
exports.MemberService = MemberService;
exports.MemberService = MemberService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(member_entity_1.Member)),
    __param(1, (0, typeorm_1.InjectRepository)(like_entity_1.Like)),
    __param(2, (0, typeorm_1.InjectRepository)(interview_entity_1.Interview)),
    __param(3, (0, typeorm_1.InjectRepository)(and_question_entity_1.InterviewAndQuestion)),
    __param(4, (0, typeorm_1.InjectRepository)(category_entity_1.Category)),
    __param(5, (0, typeorm_1.InjectRepository)(cart_entity_1.Cart)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository,
        redis_config_1.RedisService])
], MemberService);
//# sourceMappingURL=member.service.js.map