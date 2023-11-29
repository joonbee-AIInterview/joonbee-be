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
exports.QuestionService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const category_entity_1 = require("../../entity/category.entity");
const question_entity_1 = require("../../entity/question.entity");
const typeorm_2 = require("typeorm");
const common_2 = require("../../common/config/common");
let QuestionService = class QuestionService {
    constructor(questionRepository, categoryRepository) {
        this.questionRepository = questionRepository;
        this.categoryRepository = categoryRepository;
        this.PAGE_SIZE = 16;
    }
    async getQuestions(page) {
        const skipNumber = (page - 1) * this.PAGE_SIZE;
        try {
            const countQuery = await this.questionRepository.createQueryBuilder('question')
                .select('COUNT(question.id)', 'count')
                .getRawOne();
            const rowPacket = await this.questionRepository.createQueryBuilder('question')
                .select(['question.id AS questionId', 'category.id AS categoryId', 'question.question_content AS questionContent', 'category.category_name AS categoryName'])
                .leftJoinAndSelect('question.category', 'category')
                .orderBy('questionId')
                .offset(skipNumber)
                .limit(this.PAGE_SIZE)
                .getRawMany();
            return this.makeResult(rowPacket, countQuery);
        }
        catch (error) {
            console.log('getQuestions ERROR question.service 43\n' + error);
            throw new common_2.CustomError('메인 페이지 하단 디폴트 랜덤 질문 정보 불러오기 실패', 500);
        }
    }
    async getQuestionsWithCategory(page, categoryName) {
        const skipNumber = (page - 1) * this.PAGE_SIZE;
        try {
            const category = await this.categoryRepository
                .createQueryBuilder('category')
                .select('category.id')
                .where('category.category_name = :categoryName', { categoryName })
                .getOne();
            const countQuery = await this.questionRepository.createQueryBuilder('question')
                .innerJoin(subQuery => subQuery.from(category_entity_1.Category, 'category')
                .select('*')
                .where('category.category_upper_id = :categoryId', { categoryId: category.id }), 'category', 'question.category_id = category.id')
                .select('COUNT(question.id)', 'count')
                .getRawOne();
            const rowPacket = await this.questionRepository.createQueryBuilder('question')
                .select(['question.id AS questionId', 'category.id AS categoryId', 'question.question_content AS questionContent', 'category.category_name AS categoryName'])
                .innerJoin(subQuery => {
                return subQuery
                    .select('*')
                    .from(category_entity_1.Category, 'category')
                    .where('category.category_upper_id = :categoryId', { categoryId: category.id });
            }, 'category', 'question.category_id = category.id')
                .orderBy('questionId')
                .offset(skipNumber)
                .limit(this.PAGE_SIZE)
                .getRawMany();
            return this.makeResult(rowPacket, countQuery);
        }
        catch (error) {
            console.log('getQuestionsWithCategory ERROR question.service 86\n' + error);
            throw new common_2.CustomError('메인 페이지 하단 상위카테고리 랜덤 질문 정보 불러오기 실패', 500);
        }
    }
    async getQuestionsWithSubcategory(page, categoryName, subCategoryName) {
        const skipNumber = (page - 1) * this.PAGE_SIZE;
        try {
            const countQuery = await this.questionRepository.createQueryBuilder('question')
                .innerJoin(subQuery => subQuery.from(category_entity_1.Category, 'category')
                .select('*')
                .where('category.category_name = :subCategoryName', { subCategoryName }), 'category', 'question.category_id = category.id')
                .select('COUNT(question.id)', 'count')
                .getRawOne();
            const rowPacket = await this.questionRepository.createQueryBuilder('question')
                .select(['question.id AS questionId', 'category.id AS categoryId', 'question.question_content AS questionContent', 'category.category_name AS categoryName'])
                .innerJoin(subQuery => {
                return subQuery
                    .select('*')
                    .from(category_entity_1.Category, 'category')
                    .where('category.category_name = :subCategoryName', { subCategoryName });
            }, 'category', 'question.category_id = category.id')
                .orderBy('questionId')
                .offset(skipNumber)
                .limit(this.PAGE_SIZE)
                .getRawMany();
            return this.makeResult(rowPacket, countQuery);
        }
        catch (error) {
            console.log('getQuestionsWithSubcategory ERROR question.service 123\n' + error);
            throw new common_2.CustomError('메인 페이지 하단 서브카테고리 랜덤 질문 정보 불러오기 실패', 500);
        }
    }
    makeResult(rowPacket, countQuery) {
        const questionsWithCategoryDTOs = rowPacket.map(packet => ({
            questionId: packet.questionId,
            categoryId: packet.categoryId,
            questionContent: packet.questionContent,
            subcategoryName: packet.categoryName,
        }));
        const result = {
            total: Number(countQuery.count),
            result: questionsWithCategoryDTOs
        };
        return result;
    }
};
exports.QuestionService = QuestionService;
exports.QuestionService = QuestionService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(question_entity_1.Question)),
    __param(1, (0, typeorm_1.InjectRepository)(category_entity_1.Category)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], QuestionService);
//# sourceMappingURL=question.service.js.map