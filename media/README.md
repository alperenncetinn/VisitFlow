# İSG eğitim videosu

Kurumunuzun İSG eğitim videosunu bu klasöre `isg-egitim.mp4` adıyla koyun (veya Docker'da bu klasöre bir volume bağlayın).

- `Training__DurationSeconds` değeri videonun gerçek süresine (saniye) **eşit** olmalıdır; sunucu süreyi tarayıcıya sormaz.
- Video değiştiğinde `Training__VideoVersion` değerini artırın. Dosyanın SHA-256 özeti açılışta hesaplanır ve her izleme kanıtına yazılır.
- Video aynı alan adından sunulmalıdır (CSP `media-src 'self'`).
