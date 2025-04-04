# PersonaProjectWonsik

## 프로젝트 소개
숫자 야구 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다. 각 자리의 숫자와 위치가 모두 맞으면 '스트라이크', 숫자만 맞고 위치가 다르면 '볼'로 판정됩니다.
예를 들어, 상대방의 숫자가 123일 때 132를 추리하면 1스트라이크 2볼이 됩니다. 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가는 게임입니다.


## 프로젝트 기간
2025.03.24 ~ 2025.04.4

## 프로젝트 요구사항
Swift 5 이상
iOS 16.0
SnapKit

## 단계 별 기능 요구사항
### 필수 구현기능
### 1. Lv1 
  - [x]  Json 데이터에서 해리포터 시리즈 첫번째 제목인 Harry Potter and the Philosopher’s Stone 을 표시합니다.
    - 책 제목 속성
      - 텍스트 가운데 정렬
      - Font = 시스템 볼드체, 사이즈 24

  - [x]  책 제목 밑에 시리즈 순서를 표시합니다. 
    - 시리즈 순서 속성
      - 가운데 정렬
      - Font = 사이즈 16
      - `cornerRadius` 이용해 원형으로 표시
      - `backgroundColor` = `.systemBlue`

  - [x] **AutoLayout**
    - superView와 safeArea를 고려하여 제약 조건을 설정합니다.
      - 책 제목
        - `leading`, `trailing` = superView 로 부터 20 떨어지도록 세팅
        - `top` = safeArea 로 부터 10씩 떨어지도록 세팅
      - 시리즈 순서
        - `leading`, `trailing` = superView 로 부터 20 이상 떨어지도록 세팅
        - `top` = 책 제목으로부터 16 떨어지도록 세팅
        
### 2. Lv2 
  - [x]  DataService.loadBooks()를 통해 Json 데이터를 가지고 오기 실패한 경우 Alert 창으로 에러의 원인을 사용자에게 알립니다.
  - [x]  - **책 표지 이미지 속성**
    - `width` = 100
    - height : width 비율은 `1:1.5`
    - `contentMode`는 어떤걸로 하면 좋을지 고민해보세요.
  - [x] **책 제목 속성**
    - Font = 시스템 볼드체, 사이즈 20, 색상 black
  - [x] **저자 속성**
    - 타이틀(*Author*) 속성
      - Font = 시스템 볼드체, 사이즈 16, 색상 black
    - 저자(*J. K. Rowling*) 속성
      - Font = 사이즈 18, 색상 darkGray
  - [x] **출간일 속성**
    - 타이틀(*Released*) 속성
      - Font = 시스템 볼드체, 사이즈 14, 색상 black
    - 출간일(*June 26, 1997*) 속성
      - Font = 사이즈 14, 색상 gray
    - `1998-07-02` 형태로 되어있는 Json 데이터를 변형하여 `June 26, 1997` 형태로 표시
  - [x] **페이지 속성**
    - 타이틀(*Pages*) 속성
      - Font = 시스템 볼드체, 사이즈 14, 색상 black
    - 페이지 수(*223*) 속성
      - Font = 사이즈 14, 색상 gray
  - [x] **저자, 출간일, 페이지 수 속성**
    - 타이틀(*Author*)과 저자(*J. K. Rowling*) 사이 간격 8
    - 타이틀(*Released*)과 출간일(*June 26, 1997*) 사이 간격 8
    - 타이틀(*Pages*)과 페이지 수(*223*) 사이 간격 8
  - [x] **AutoLayout**
    - `leading`, `trailing` = safeArea에서 5만큼씩 떨어지도록 세팅
    - 책 정보 영역이 시리즈 순서 영역 하단에 위치

3. Lv3 
  - [x] **Dedication 속성**
    - 타이틀(*Dedication*) 속성
      - Font = 시스템 볼드체, 사이즈 18, 색상 black
    - 헌정사 내용 속성
      - Font = 사이즈 14, 색상 darkGray
  - [x] **Summary 속성**
    - 타이틀(*Summary*) 속성
      - Font = 시스템 볼드체, 사이즈 18, 색상 black
    - 요약 속성
      - Font = 사이즈 14, 색상 darkGray
  - [x] **Autolayout**
    - Dedication 영역
      - `top` = 책 정보 영역과 24 떨어져 있도록 세팅
      - `leading`, `trailing` = superView와 20씩 떨어지도록 세팅
      - 타이틀(*Dedication*)과 헌정사(*내용*) 사이 간격 8
    - Summary 영역
      - `top` = Dedication 영역과 24만큼 떨어져 있도록 세팅
      - `leading`, `trailing` = superView와 20씩 떨어지도록 세팅
      - 타이틀(*Summary*)과 요약(*내용*) 사이 간격 8

### 4. Lv4
  - [x] **스크롤 속성**
    - 책 제목과 시리즈 순서는 화면 상단에 고정          
    - 책 정보(책 표지, 책 제목, 저자, 출간일, 페이지수) 영역부터 목차(Chapters)까지 스크롤 가능하도록 구현
    - 스크롤 바가 보이지 않도록 구현
  - [x] 목차 속성
    - `UIScrollView` 안에 `UIStackView`를 추가하고 해당 `UIStackView`안에`UILabel` 추가하여 구현
      - 전체적인 포함 관계:
        `UIScrollView` 안에 `UIStackView` 안에 `UILabel`들어 있는 구조
    - 각 챕터 사이 간격은 8
    - 타이틀(*Chapters*) 속성
      - Font = 시스템 볼드체, 사이즈 18, 색상 black
    - 목차 속성
      - Font = 사이즈 14, 색상 darkGray
  - [x] **Autolayout**
    - 목차 영역의 `top` = Summary 영역과 24만큼 떨어져 있도록 세팅
    - `leading`, `trailing` = superView와 20씩 떨어지도록 세팅
    - 타이틀(*Chapters*)과 첫번째 챕터 사이 간격 8

### 3. Lv5 
- [x] - 글자수가 450자 이상인 경우 `…` 말줄임표 표시 및 `더보기` 버튼 표시
  - 참고로, 2권(시리즈 두번째)의 요약 내용은 글자수가 450자 미만이므로 더보기 버튼이 표시되지 않아야 합니다.
  - `더보기` 버튼을 누르면 요약 텍스트 전체가 표시되고 `더보기` 버튼은 `접기` 버튼으로 변경
  - 더보기/접기 상태를 저장해 앱을 종료했다가 다시 실행했을 때에도 마지막 상태를 기억하여 표시
  - `더보기` 버튼을 눌러 Summary를 펼친 상태로 앱을 종료했다면, 앱을 다시 실행했을 때 펼쳐진 상태로 표시되어 있습니다.
    반대로 `접기`버튼을 눌러 접은 상태로 종료했다면 앱 종료 후 다시 실행했을 때 접은 상태로 표시되어 있습니다.

### 4. Lv 6 
  - [x] 시리즈 전체(7권) 순서 중 원하는 권수의 책 정보를 볼 수 있도록 왼쪽과 같이 구현
    - 전체 데이터는 `data.json`에 있으며 시리즈 순서대로 데이터가 제공됩니다.
    - 시리즈 순서 버튼을 누르면 아래 부분의 데이터가 업데이트 되어야 합니다.
    - level 5에서 시리즈 권별로 더보기/접기 상태를 저장하는 기능을 잘 구현했다면, 각 시리즈 권별 마지막 더보기/접기 상태를 기억하고 있어야 합니다.

### 도전 구현기능

### 1. Lv 7
  - [x] iOS 16.0과 호환 가능한 iPhone 모델(SE 2세대, 16 Pro Max 등)의 다양한 디바이스 지원과 Portrait 모드/ Landscape 모드를 대응하여 구현
    - iOS 16.0 호환 모델 확인: [https://support.apple.com/ko-kr/guide/iphone/iphe3fa5df43/16.0/ios/16.0](https://support.apple.com/ko-kr/guide/iphone/iphe3fa5df43/18.0/ios/18.0)
    - iOS 16 이상 모든 버전을 지원할 수 있도록 구현
    - Portrait 모드와 Landscape 모드 대응
    - 콘텐츠가 노치나 다이나믹 아일랜드 영역에 가려지지 않도록 구현해보세요.
    - Autolayout이 제대로 구현되어있지 않다면 콘솔창에 Autolayout 관련 경고 메시지가 출력됩니다. 디바이스 방향을 바꾸더라도 (Portrait 모드 ↔ Landscape 모드) 콘솔창에 Autolayout 관련 경고 메시지가 뜨지 않도록 구현해보세요.

## 추가 사항
1. Portrait 모드/ Landscape 모드 시 `더 보기` 대응

  ![스크린샷 2025-04-04 오전 11 17 45](https://github.com/user-attachments/assets/d6f64ed0-b7ff-45d9-9d58-455cc765b7e5)
  ![스크린샷 2025-04-04 오전 11 18 11](https://github.com/user-attachments/assets/1508c9ca-70ef-4aaa-b1ca-4c4429e64daf)
  
  Portrait 모드에서는 글자 수(450자)를 기준으로 요약 텍스트를 제한하지만, Landscape 모드에서는 화면 가로 길이가 늘어나 글자 수 제한이 부자연스럽습니다. 
  따라서 Landscape 모드일 때는 글자 수 대신 최대 7줄까지만 표시하도록 제한 조건을 변경하여, 화면 전환 시 보다 자연스러운 사용자 경험을 제공합니다.

  ```swift
      // MARK: - Layout 변경 감지 (ex. 회전)
      override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.updateSummaryDisplay()
        }
    }

    // MARK: - 요약 텍스트 표시 로직
    private func updateSummaryDisplay() {
        let charCount = summary.text?.count ?? 0
        let maxLines = 7
        let isLongText = charCount > 450
        let isActuallyTruncated = isTextTruncated(summary, maxLines: maxLines)

        if isLongText && isActuallyTruncated {
            summary.numberOfLines = isExpanded ? 0 : maxLines
            expand.setTitle(isExpanded ? "접기" : "더 보기", for: .normal)
            expand.isHidden = false
        } else {
            summary.numberOfLines = 0
            expand.setTitle("", for: .normal)
            expand.isHidden = true
        }
    }

  ```

## 트러블 슈팅 
- Landscape 모드 전환 시 더 보기가 제한 조건에 맞게 변경되지 않는 부분 해결

