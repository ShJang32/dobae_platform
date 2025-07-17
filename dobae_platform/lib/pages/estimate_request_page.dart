// 견적서 요청
// 입력: 이름, 연락처, 시공유형, 평수, 요청사항
// 모델: EstimateRequest(name, phone, type, area, message, createdAt)
// firestore에 저장 + 관리자 이메일 또는 알림 전송
// firebase functions 사용해 이메일 발송 가능