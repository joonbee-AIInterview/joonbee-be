# Node.js LTS 버전을 기반 이미지로 사용합니다.
FROM node:18

# 작업 디렉토리 설정
WORKDIR ./

# 의존성 파일들을 도커 컨테이너에 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# TypeScript 컴파일러 전역 설치
RUN npm install -g typescript

# 프로젝트의 모든 파일을 컨테이너에 복사
COPY . .

# TypeScript 코드를 JavaScript로 컴파일
RUN npm run build

# 서비스가 시작될 때 실행될 명령어 지정
CMD ["node", "./dist/src/main.js"]
