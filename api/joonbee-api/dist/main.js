"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const app_module_1 = require("./app.module");
const swagger_1 = require("@nestjs/swagger");
const cookieParser = require("cookie-parser");
const common_1 = require("@nestjs/common");
const error_filter_1 = require("./common/config/error.filter");
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    app.use(cookieParser());
    app.useGlobalPipes(new common_1.ValidationPipe());
    app.useGlobalFilters(new error_filter_1.CustomExceptionFilter());
    const config = new swagger_1.DocumentBuilder()
        .setTitle('JoonBee INTERVIEW')
        .setDescription(`For the start of one's career`)
        .setVersion('1.0')
        .addTag('joonbee')
        .build();
    const document = swagger_1.SwaggerModule.createDocument(app, config);
    swagger_1.SwaggerModule.setup('api/swagger', app, document);
    await app.listen(3030);
}
bootstrap();
//# sourceMappingURL=main.js.map