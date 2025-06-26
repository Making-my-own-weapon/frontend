# Node.js 20 버전을 기반으로 환경을 구성합니다.
FROM node:20-alpine

# 작업 디렉토리를 /app으로 설정합니다.
WORKDIR /app

# 의존성을 먼저 복사하여 Docker 빌드 캐시를 활용합니다.
COPY package*.json ./

# 의존성을 설치합니다.
RUN npm install

# 나머지 모든 소스 코드를 복사합니다.
COPY . .

# React 개발 서버의 기본 포트인 3000번을 외부에 알립니다.
EXPOSE 3000

# 컨테이너가 시작될 때 'npm start' 명령어를 실행하여 개발 서버를 구동합니다.
CMD ["npm", "start"]