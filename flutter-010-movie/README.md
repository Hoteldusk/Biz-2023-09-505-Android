# Naver OpenAPI를 활용한 영화정보 어플
- OpenAPI를 사용하기 위한 Dependency 도구 설치
```bash
flutter pub add http flutter_html
------------------------------------or
flutter pub add http
flutter flutter_html
```

## 프로젝트 패키지 이름 변경하기
- 프로젝트를 생성할때 기본 패키지를 잘 만들어야 한다. 패키지를 잘못 만들면, google play store, App Store 에 어플을 배포할 수 없다. 패키지는 기존의 다른 어플과 완전히 다름 값으로 설정해야 한다
- 패키지는 회사의 인터넷 홈페이지 주소와 연동하여 설정한다
- `https://www.callor.com` 이라는 홈페이지가 있으면 `com.callor.어플이름` 형식으로 사용한다
- 프로젝트를 만들당시에 패키지를 잘못지정하거나, 지정하지 않았을경우 개발도중에 패키지명을 변경해야 할 필요가 있다
- 이때 사용하는 도구가 있다
- 패키지명 변경도구 : `flutter pub add change_app_package_name`
- 패키지명 변경 : `flutter pub run change_app_package_name:main com.callor.movie`

## OpenAPI 를 사용하기 위한 Andorid 설정 변경
- `\android\src\main\kotlin` 폴더의 `MainActivity.kt` 파일에서 패키지명이 잘 설정되었는지 확인
- `\android\src\main\AndroidManifest.xml` 파일을 열어서 패키지 명이 잘 설정되었는지 확인
- `AndroidManifest.xml` 파일에서 다음 항목을 찾는다
```xml
    <application>
```
- `application` 과 `manifest` 사이에 queries 추가
```xml
    <queries>
        <package android:name="com.callor.movie"/>
    </queries>
```
- 어플에서 인터넷을 통하여 외부 API 를 사용하기 위한 권한을 부여한다

- Manifest 오른쪽눌러서 androidstudio로 열수있음(manifest자동완성 편함) 열고나서 <절대> 업데이트 <하지말것>
- manifest, application 사이에 코드 추가
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<queries>
        <package="com.callor.movie">
        <intent>
            <action android:name="android.intent.action.VIEW"/>
            <data android:scheme="https"/>
        </intent>
</queries>
```