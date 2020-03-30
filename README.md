# Dust-7
미세먼지 프로젝트 - 7팀

* BE: [Alex][alex], [XP][xp]
* FE: [Lime][lime]
* iOS: [하이디][heidi]

## Ground Rule

* 매일 오전 11시 하루 계획을 슬랙으로 공유
* 매일 오후 7시까지 백로그 작성 후 하루 진행 상황을 슬랙으로 공유

## Branch Rule

* `master`: 배포 브랜치
* `develop`: 디폴트 브랜치
* `feature/BE` : 백엔드 피쳐 개발 브랜치
* `feature/FE` : 프론트엔드 피쳐 개발 브랜치
* `feature/iOS` : 모바일 iOS 피쳐 개발 브랜치
* 자신의 클래스 피쳐 개발 브랜치에서 작업 후 `develop` 브랜치를 향해 Pull Request를 생성하고 마스터 리뷰를 받는다.
    * 작업 시작 전 이슈를 발행하고 작업 중에는 해당되는 이슈 번호를 커밋 메시지에 포함시킨다.
    * 커밋 메시지에 `Closes #n` 등을 포함시켜 이슈를 닫을 수 있다.
* 팀 프로젝트가 마무리되는 금요일 오후에 `master` 브랜치를 향해 Pull Request을 생성한다.

## Commit Message Rules

[#이슈 번호] 커밋 종류: 커밋 내용(한글)

* feat: The new feature you're adding to a particular application
* fix: A bug fix
* style: Feature and updates related to styling
* refactor: Refactoring a specific section of the codebase
* test: Everything related to testing
* docs: Everything related to documentation
* chore: Regular code maintenance.[You can also use emogjis to represent commit types]

## Issue 및 Pull Request 네이밍 규칙

* Issue 네이밍: [클래스] 제목
* Pull Request 네이밍: [클래스] 제목

## Project Backlog

[백로그 스프레드시트 바로가기][back-log]

[back-log]: https://docs.google.com/spreadsheets/d/1af1bbbi45BNF-c-OAyq9FMalbajfl8WQ7YgVgHc4Zew/edit#gid=1386834576
