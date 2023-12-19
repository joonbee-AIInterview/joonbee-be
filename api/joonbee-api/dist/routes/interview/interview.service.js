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
exports.InterviewService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("../../common/config/common");
const interview_entity_1 = require("../../entity/interview.entity");
const typeorm_2 = require("typeorm");
const member_entity_1 = require("../../entity/member.entity");
const like_entity_1 = require("../../entity/like.entity");
const and_question_entity_1 = require("../../entity/and.question.entity");
const question_entity_1 = require("../../entity/question.entity");
let InterviewService = class InterviewService {
    constructor(interviewRepository, interviewAndQuestionRepository) {
        this.interviewRepository = interviewRepository;
        this.interviewAndQuestionRepository = interviewAndQuestionRepository;
        this.PAGE_SIZE = 9;
    }
    async getInterviews(page, memberId) {
        let rowPacket;
        try {
            const countQuery = await this.interviewRepository
                .createQueryBuilder('interview')
                .select('COUNT(interview.id)', 'count')
                .getRawOne();
            if (memberId === undefined) {
                rowPacket = await this.interviewRepository
                    .createQueryBuilder('interview')
                    .select(['interview.id as interviewId', 'interview.member_id as memberId', 'm.thumbnail as thumbnail', 'm.nick_name as nickname', 'interview.category_name as categoryName', 'COUNT(l.member_id) as likeCount',])
                    .innerJoin(member_entity_1.Member, 'm', 'interview.member_id = m.id')
                    .leftJoin(like_entity_1.Like, 'l', 'interview.id = l.interview_id')
                    .groupBy('interview.id, interview.member_id, m.thumbnail, interview.category_name')
                    .orderBy('likeCount', 'DESC').offset((page - 1) * this.PAGE_SIZE).limit(this.PAGE_SIZE).getRawMany();
            }
            else {
                rowPacket = await this.interviewRepository
                    .createQueryBuilder('interview')
                    .select(['interview.id as interviewId', 'interview.member_id as memberId', 'm.thumbnail as thumbnail', 'm.nick_name as nickname', 'interview.category_name as categoryName', 'COUNT(l.member_id) as likeCount',
                    'CASE WHEN EXISTS (SELECT 1 FROM `like` ll WHERE ll.interview_id = interview.id and ll.member_id = :memberId) then "Y" ELSE "N" END as bool',])
                    .innerJoin(member_entity_1.Member, 'm', 'interview.member_id = m.id')
                    .leftJoin(like_entity_1.Like, 'l', 'interview.id = l.interview_id')
                    .groupBy('interview.id, interview.member_id, m.thumbnail, interview.category_name').setParameter('memberId', memberId)
                    .orderBy('likeCount', 'DESC').offset((page - 1) * this.PAGE_SIZE).limit(this.PAGE_SIZE).getRawMany();
            }
            const interviewsWithQuestionCategoryMemberDTOs = await Promise.all(rowPacket.map(async (packet) => {
                const { interviewId, memberId, thumbnail, categoryName, likeCount, nickname } = packet;
                const questionsQuery = await this.interviewAndQuestionRepository
                    .createQueryBuilder('iaq')
                    .select(['q.id as questionId', 'q.question_content as questionContent',])
                    .innerJoin(question_entity_1.Question, 'q', 'iaq.question_id = q.id')
                    .where('iaq.interview_id = :interviewId', { interviewId }).getRawMany();
                const questions = questionsQuery.map(({ questionId, questionContent }) => ({ questionId, questionContent, }));
                return { interviewId, memberId, nickname, thumbnail, categoryName, likeCount, questions, };
            }));
            const result = {
                total: Number(countQuery.count),
                result: interviewsWithQuestionCategoryMemberDTOs,
            };
            return result;
        }
        catch (error) {
            console.log('getInterviews ERROR interview.service 66\n' + error);
            throw new common_2.CustomError('메인 페이지 상단 디폴트 랜덤 인터뷰 정보 불러오기 실패', 500);
        }
    }
    async getInterviewsWithLikeMemberQuestion(page, memberId, categoryName) {
        let rowPacket;
        try {
            const countQuery = await this.interviewRepository
                .createQueryBuilder('interview')
                .select('COUNT(interview.id)', 'count')
                .where('interview.categoryName = :categoryName', { categoryName: categoryName }).getRawOne();
            if (memberId === undefined) {
                rowPacket = await this.interviewRepository
                    .createQueryBuilder('interview')
                    .select(['interview.id as interviewId', 'interview.member_id as memberId', 'm.thumbnail as thumbnail', 'm.nick_name as nickname', 'interview.category_name as categoryName', 'COUNT(l.member_id) as likeCount',])
                    .innerJoin(member_entity_1.Member, 'm', 'interview.member_id = m.id')
                    .leftJoin(like_entity_1.Like, 'l', 'interview.id = l.interview_id')
                    .where('interview.categoryName = :categoryName', { categoryName: categoryName })
                    .groupBy('interview.id, interview.member_id, m.thumbnail, interview.category_name')
                    .orderBy('likeCount', 'DESC').offset((page - 1) * this.PAGE_SIZE).limit(this.PAGE_SIZE).getRawMany();
            }
            else {
                rowPacket = await this.interviewRepository
                    .createQueryBuilder('interview')
                    .select(['interview.id as interviewId', 'interview.member_id as memberId', 'm.thumbnail as thumbnail', 'm.nick_name as nickname', 'interview.category_name as categoryName', 'COUNT(l.member_id) as likeCount',])
                    .innerJoin(member_entity_1.Member, 'm', 'interview.member_id = m.id')
                    .leftJoin(like_entity_1.Like, 'l', 'interview.id = l.interview_id')
                    .groupBy('interview.id, interview.member_id, m.thumbnail, interview.category_name')
                    .orderBy('likeCount', 'DESC').offset((page - 1) * this.PAGE_SIZE).limit(this.PAGE_SIZE).getRawMany();
            }
            const interviewsWithQuestionCategoryMemberDTOs = await Promise.all(rowPacket.map(async (packet) => {
                const { interviewId, memberId, thumbnail, categoryName, likeCount, nickname } = packet;
                const questionsQuery = await this.interviewAndQuestionRepository
                    .createQueryBuilder('iaq')
                    .select(['q.id as questionId', 'q.question_content as questionContent',])
                    .innerJoin(question_entity_1.Question, 'q', 'iaq.question_id = q.id')
                    .where('iaq.interview_id = :interviewId', { interviewId }).getRawMany();
                const questions = questionsQuery.map(({ questionId, questionContent }) => ({ questionId, questionContent, }));
                return { interviewId, memberId, nickname, thumbnail, categoryName, likeCount, questions, };
            }));
            const result = {
                total: Number(countQuery.count),
                result: interviewsWithQuestionCategoryMemberDTOs,
            };
            return result;
        }
        catch (error) {
            console.log('getInterviewsWithLikeMemberQuestion ERROR interview.service 113\n' + error);
            throw new common_2.CustomError('메인 페이지 상단 상위 카테고리 랜덤 인터뷰 정보 불러오기 실패', 500);
        }
    }
};
exports.InterviewService = InterviewService;
exports.InterviewService = InterviewService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(interview_entity_1.Interview)),
    __param(1, (0, typeorm_1.InjectRepository)(and_question_entity_1.InterviewAndQuestion)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], InterviewService);
//# sourceMappingURL=interview.service.js.map