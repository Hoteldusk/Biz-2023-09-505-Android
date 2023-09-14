# Naver 도서검색 openAPI 프로젝트

- naver 에서 제공하는 openAPI 를 사용하여 도서검색을 실행하자
- dependency : `flutter pub add http`

## 하이퍼 링크 설정
- html 에서는 a tag 를 사용하여 간편하게 하이퍼 링크를 설정할 수 있다
- flutter 에서는 하이퍼 링크를 설정하는 것이 다소 까다롭다
- 하이퍼 링크를 클릭(tab) 했을때, 내장 browser를 연결하는 코드를 작성
- 가장 보편적으로 사용하는 dependency : `flutter pub add url_launcher`

- 권한 문제 때문에 안되면 manifest.xml 에 다음 항목 추가
```xml
<uses-permission android:name="android.permission.INTERNET"/>

    <queries>
        <package android:name="com.callor.movie"/>
        <intent>
            <action android:name="android.intent.action.VIEW"/>
            <data android:scheme="https"/>
        </intent>
    </queries>
```
