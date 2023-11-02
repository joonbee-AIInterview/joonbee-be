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
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const common_2 = require("../../common/config/common");
const like_entity_1 = require("../../entity/like.entity");
const member_entity_1 = require("../../entity/member.entity");
const typeorm_2 = require("typeorm");
const interview_entity_1 = require("../../entity/interview.entity");
const and_question_entity_1 = require("../../entity/and.question.entity");
let MemberService = class MemberService {
    constructor(memberRepository, likeRepository, interviewRepository, andQuestionRepository) {
        this.memberRepository = memberRepository;
        this.likeRepository = likeRepository;
        this.interviewRepository = interviewRepository;
        this.andQuestionRepository = andQuestionRepository;
    }
    async insertLike(memberId, interviewId) {
        try {
            const likeEntity = this.likeRepository.create({
                memberId: memberId,
                interviewId: interviewId
            });
            console.log(likeEntity);
            await this.likeRepository.save(likeEntity);
        }
        catch (error) {
            console.log('insertLIKE ERROR member.service 27 \n' + error);
            throw new common_2.CustomError('좋아요 실패', 500);
        }
    }
    async insertInterview(memberId, questionInfo) {
        try {
            const interviewObject = this.interviewRepository.create({ memberId });
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
};
exports.MemberService = MemberService;
exports.MemberService = MemberService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(member_entity_1.Member)),
    __param(1, (0, typeorm_1.InjectRepository)(like_entity_1.Like)),
    __param(2, (0, typeorm_1.InjectRepository)(interview_entity_1.Interview)),
    __param(3, (0, typeorm_1.InjectRepository)(and_question_entity_1.InterviewAndQuestion)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository])
], MemberService);
//# sourceMappingURL=member.service.js.map