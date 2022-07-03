# Booking Dive Mobile

A booking dive mobile project.


<details>
    <summary><font size="5">Generator</font> </summary>

### Json to model generator

1. Create/copy `.json` files into `lib/json/`
2. Run the following command<br/>

   ```sh
   flutter pub run json_to_model -s lib/json -o lib/app/data/model
   ```

3. Use the generated models in `lib/app/data/model/`<br/>
   [Package Docs](https://pub.dev/packages/json_to_model)


### Assets generator

1. Copy icon/images files into `assets/icons` or `assets/images`...

   ```
   -- assets
     -- icons
       -- an_icon.svg
     -- images
       -- an_image.png
   ```

2. Run the following command<br/>

   ```sh
   flutter packages pub run build_runner build
   ```

3. Usage:<br/>

   ```dart
   import 'package:mantra_mobile/gen/assets.gen.dart';
   // Display a svg
   Assets.icons.anIcon.svg(),
   // Display an image
   Assets.images.anImage.image()
   ```

   [Package Docs](https://pub.dev/packages/flutter_gen)


</details>

<details>
    <summary><font size="5">Build</font> </summary>

### Android Build

1. Gradle clean

   ```sh
   cd android && ./gradlew clean && cd ..
   ```

2. Android Build for Testing APK

    - DEV

   ```sh
   flutter build apk --flavor dev -t lib/main_dev.dart
   ```

    - UAT

   ```sh
   flutter build apk --flavor uat -t lib/main_uat.dart
   ```

    - PROD

   ```sh
   flutter build apk --flavor prod -t lib/main_prod.dart
   ```

3. Android FastLane build to Google App Distribution

    - UAT

   ```sh
   fastlane android uat
   ```

    - PROD

   ```sh
   fastlane android prod
   ```

### iOS Build

1. iOS FastLane build to TestFlight

    - UAT

   ```sh
   fastlane ios uat
   ```

    - PROD

   ```sh
   fastlane ios prod
   ```


</details>