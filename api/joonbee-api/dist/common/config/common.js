"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PageResponseDTO = exports.CustomError = void 0;
class CustomError extends Error {
    constructor(message, statusCode) {
        super(message);
        this.statusCode = statusCode;
    }
}
exports.CustomError = CustomError;
class PageResponseDTO {
}
exports.PageResponseDTO = PageResponseDTO;
//# sourceMappingURL=common.js.map