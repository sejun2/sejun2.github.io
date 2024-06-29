import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChangeLogScreen extends StatelessWidget {
  const ChangeLogScreen({super.key});

  final String data = '''
  # Sejun2 change log

모든 주목할 만한 변경 사항은 이 파일에 기록될 것입니다.

## [현재] - ABC 기술

### 추가
- 팀 리더 역할 수행 시작
- 마이크로서비스 아키텍처 설계 및 구현 프로젝트 주도
- Kubernetes를 이용한 컨테이너 오케스트레이션 도입

### 변경
- React와 Node.js 스택으로 전환하여 새로운 웹 애플리케이션 개발
- 코드 리뷰 프로세스 개선으로 팀 생산성 20% 향상

### 제거
- 레거시 PHP 코드베이스 점진적 폐기

## [2018-05-01] - ABC 기술 입사

### 추가
- React 기반 프론트엔드 개발 시작
- Node.js를 이용한 백엔드 API 구현
- 주니어 개발자 멘토링 프로그램 참여

### 변경
- 모놀리식 아키텍처에서 마이크로서비스로의 전환 시작

## [2014-2018] - XYZ 솔루션즈

### 추가
- Java와 Spring Framework를 이용한 엔터프라이즈 애플리케이션 개발
- RESTful API 설계 및 구현
- Jenkins를 이용한 CI/CD 파이프라인 구축

### 변경
- 데이터베이스 쿼리 최적화로 시스템 성능 30% 개선
- 단위 테스트 도입으로 버그 발생률 50% 감소

### 제거
- 수동 배포 프로세스 폐지

## [2014-03-01] - XYZ 솔루션즈 입사

### 추가
- 첫 정규직 소프트웨어 개발자 역할 시작
- Java 기반 백엔드 시스템 유지보수 및 개발
- Git 버전 관리 시스템 사용 시작

## [2014-02-15] - 한국대학교 졸업

### 추가
- 컴퓨터 공학 학사 학위 취득
- 졸업 프로젝트: IoT 기반 스마트홈 시스템 개발
  ''';

  @override
  Widget build(BuildContext context) {
    return Markdown(data: data);
  }
}
