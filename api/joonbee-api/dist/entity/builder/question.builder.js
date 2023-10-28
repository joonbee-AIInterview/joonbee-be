"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.QuestionBuilder = void 0;
const question_entity_1 = require("../question.entity");
class QuestionBuilder {
    constructor() {
        this.question = new question_entity_1.Question();
    }
    withCategory(category) {
        this.question.category = category;
        return this;
    }
    withGptFlag(gptFlag) {
        this.question.gpt_flag = gptFlag;
        return this;
    }
    withQuestionLevel(questionLevel) {
        this.question.question_level = questionLevel;
        return this;
    }
    withWriter(writer) {
        this.question.writer = writer;
        return this;
    }
    withQuestionContent(questionContent) {
        this.question.question_content = questionContent;
        return this;
    }
    build() {
        return this.question;
    }
}
exports.QuestionBuilder = QuestionBuilder;
//# sourceMappingURL=question.builder.js.map