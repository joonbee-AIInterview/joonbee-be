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
    async questionsWithCategory(page, categoryName, subCategoryName) {
        try {
            if (categoryName === "" && subCategoryName != "") {
                throw new common_2.CustomError('카테고리를 선택해주세요.', 403);
            }
            let rowPacket;
            let countQuery;
            const skipNumber = (page - 1) * this.PAGE_SIZE;
            if (categoryName === "" && subCategoryName === "") {
                countQuery = await this.questionRepository.createQueryBuilder('question')
                    .select('COUNT(question.id)', 'count')
                    .getRawOne();
                rowPacket = await this.questionRepository.createQueryBuilder('question')
                    .select([
                    'question.id AS questionId',
                    'category.id AS categoryId',
                    'question.question_content AS questionContent',
                    'category.category_name AS categoryName'
                ])
                    .leftJoinAndSelect('question.category', 'category')
                    .orderBy('RAND()')
                    .offset(skipNumber)
                    .limit(this.PAGE_SIZE)
                    .getRawMany();
            }
            else if (categoryName != "" && subCategoryName === "") {
                const category = await this.categoryRepository
                    .createQueryBuilder('category')
                    .select('category.id')
                    .where('category.category_name = :categoryName', { categoryName })
                    .getOne();
                countQuery = await this.questionRepository.createQueryBuilder('question')
                    .innerJoin(subQuery => subQuery.from(category_entity_1.Category, 'category')
                    .select('*')
                    .where('category.category_upper_id = :categoryId', { categoryId: category.id }), 'category', 'question.category_id = category.id')
                    .select('COUNT(question.id)', 'count')
                    .getRawOne();
                rowPacket = await this.questionRepository.createQueryBuilder('question')
                    .select([
                    'question.id AS questionId',
                    'category.id AS categoryId',
                    'question.question_content AS questionContent',
                    'category.category_name AS categoryName'
                ])
                    .innerJoin(subQuery => {
                    return subQuery
                        .select('*')
                        .from(category_entity_1.Category, 'category')
                        .where('category.category_upper_id = :categoryId', { categoryId: category.id });
                }, 'category', 'question.category_id = category.id')
                    .orderBy('RAND()')
                    .offset(skipNumber)
                    .limit(this.PAGE_SIZE)
                    .getRawMany();
            }
            else {
                countQuery = await this.questionRepository.createQueryBuilder('question')
                    .innerJoin(subQuery => subQuery.from(category_entity_1.Category, 'category')
                    .select('*')
                    .where('category.category_name = :subCategoryName', { subCategoryName }), 'category', 'question.category_id = category.id')
                    .select('COUNT(question.id)', 'count')
                    .getRawOne();
                rowPacket = await this.questionRepository.createQueryBuilder('question')
                    .select([
                    'question.id AS questionId',
                    'category.id AS categoryId',
                    'question.question_content AS questionContent',
                    'category.category_name AS categoryName'
                ])
                    .innerJoin(subQuery => {
                    return subQuery
                        .select('*')
                        .from(category_entity_1.Category, 'category')
                        .where('category.category_name = :subCategoryName', { subCategoryName });
                }, 'category', 'question.category_id = category.id')
                    .orderBy('RAND()')
                    .offset(skipNumber)
                    .limit(this.PAGE_SIZE)
                    .getRawMany();
            }
            const questionsWithCategoryDtos = rowPacket.map(packet => ({
                questionId: packet.questionId,
                categoryId: packet.categoryId,
                questionContent: packet.questionContent,
                categoryName: packet.categoryName,
            }));
            const result = {
                total: Number(countQuery.count),
                result: questionsWithCategoryDtos
            };
            return result;
        }
        catch (error) {
            console.log('questionsWithCategory ERROR question.service 24\n' + error);
            throw new common_2.CustomError('랜덤질문 정보 불러오기 실패', 500);
        }
    }
    async saveQuestion(saveQuestionDto) {
        const categoryPS = await this.categoryRepository.findOne({ where: { categoryName: saveQuestionDto.categoryName,
                categoryUpperId: saveQuestionDto.categoryUpperId } });
        if (categoryPS == null) {
            console.log('잘못된 category_name 또는 category_upper_id을 입력했습니다.');
            return;
        }
        const questionPS = await this.questionRepository.createQueryBuilder('question')
            .insert().values({
            category: categoryPS,
            gptFlag: saveQuestionDto.gptFlag,
            questionLevel: saveQuestionDto.questionLevel,
            writer: saveQuestionDto.writer,
            questionContent: saveQuestionDto.questionContent
        }).execute();
        return questionPS.identifiers[0].id;
    }
    async findOneWithCategory(questionId) {
        const questionPS = await this.questionRepository.findOne({ where: { id: questionId } });
        console.log(questionPS);
        if (!questionPS) {
            throw new common_1.HttpException('NOT_FOUND', common_1.HttpStatus.NOT_FOUND);
        }
        return await this.questionRepository.createQueryBuilder('question')
            .where('question.id = :questionId', { questionId })
            .leftJoinAndSelect('question.category', 'category')
            .getOne();
    }
    async deleteQuestion(questionId) {
        await this.questionRepository.delete(questionId);
    }
    async updateQuestion(questionId, updateQuestionDto) {
        const questionPS = await this.questionRepository.findOne({ where: { id: questionId } });
        if (!questionPS) {
            throw new common_1.HttpException('NOT_FOUND', common_1.HttpStatus.NOT_FOUND);
        }
        console.log('전 : ' + questionPS.questionContent);
        const category = await this.categoryRepository.findOne({ where: { categoryName: updateQuestionDto.categoryName } });
        const questionUP = await this.questionRepository.createQueryBuilder('question')
            .update().set({
            category: { id: category.id },
            gptFlag: updateQuestionDto.gptFlag,
            questionLevel: updateQuestionDto.questionLevel,
            writer: updateQuestionDto.writer,
            questionContent: updateQuestionDto.questionContent
        })
            .where("id = :id", { id: questionPS.id })
            .execute();
        return questionPS.id;
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