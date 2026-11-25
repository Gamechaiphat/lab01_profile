# Lab L1 – About me

- ชื่อ: นายไชยภัทร อ่อนวันนา
- รหัสนักศึกษา: 67103150
- GitHub: https://github.com/gamechaiphat/lab01_profile

## การทดลอง hot reload (r) กับ hot restart (R)

สภาพแวดล้อม: Flutter 3.50.0, emulator Pixel (Android 16, API 36)

ขั้นตอน: รันแอปด้วย `flutter run` แล้วกดปุ่ม Like 3 ครั้ง (Likes: 3) จากนั้นกด `r` แล้วกด `R` ในเทอร์มินัล

| การทดลอง | ค่า Likes ก่อนกด | ค่า Likes หลังกด | ข้อความจาก flutter run | ผลที่สังเกต |
|---|---|---|---|---|
| กด `r` (hot reload) | 3 | **3** | `Reloaded 0 libraries in 316ms` | state เดิมยังอยู่ หน้าจอไม่เริ่มใหม่ |
| กด `R` (hot restart) | 3 | **0** | `Restarted application in 1,942ms` | แอปเริ่มใหม่ state หายหมด |

## สรุป

- **Hot reload (r)** ฉีดโค้ดที่แก้ไขเข้าไปใน Dart VM ที่กำลังรันอยู่ แล้วเรียก `build()` ใหม่
  โดย**ไม่**สร้าง `State` ใหม่ ค่า `_likes` จึงยังคงอยู่ เร็วมาก (ไม่ถึง 1 วินาที)
  แต่จะไม่รันโค้ดใน `main()` หรือ `initState()` ซ้ำ และไม่สามารถ reload การเปลี่ยนแปลงบางแบบได้
  เช่น การเปลี่ยน StatelessWidget เป็น StatefulWidget หรือแก้ค่าเริ่มต้นของตัวแปร (`int _likes = 0;`)
- **Hot restart (R)** โหลดโค้ดใหม่ทั้งหมดและเริ่มแอปตั้งแต่ `main()` ใหม่ widget tree และ state ถูกสร้างใหม่
  ค่า `_likes` จึงกลับเป็น 0 ช้ากว่า hot reload เล็กน้อย แต่ยังเร็วกว่าการ stop แล้ว `flutter run` ใหม่
- **setState()** บอก Flutter ว่า state ของ widget เปลี่ยนแล้ว ให้เรียก `build()` ใหม่เพื่อวาดหน้าจอ
  ถ้าเพิ่ม `_likes++` โดยไม่เรียก `setState()` ตัวเลขบนจอจะไม่เปลี่ยน
