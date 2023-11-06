"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CustomExceptionFilter = void 0;
const common_1 = require("@nestjs/common");
const common_2 = require("./common");
let CustomExceptionFilter = class CustomExceptionFilter {
    catch(exception, host) {
        const ctx = host.switchToHttp();
        const response = ctx.getResponse();
        const request = ctx.getRequest();
        if (exception instanceof common_2.CustomError) {
            return response.status(exception.statusCode).json({
                statusCode: exception.statusCode,
                message: exception.message,
            });
        }
        else if (exception instanceof common_1.HttpException) {
            console.error(exception);
            return response.status(exception.getStatus()).json({
                statusCode: exception.getStatus(),
                message: exception.getResponse(),
            });
        }
        else {
            console.error(exception);
            return response.status(500).json({
                statusCode: 500,
                message: 'SERVER ERROR',
            });
        }
    }
};
exports.CustomExceptionFilter = CustomExceptionFilter;
exports.CustomExceptionFilter = CustomExceptionFilter = __decorate([
    (0, common_1.Catch)()
], CustomExceptionFilter);
//# sourceMappingURL=error.filter.js.map