# Güvenlik Politikası / Security Policy

## Açık bildirimi

Bir güvenlik açığı bulduğunuzu düşünüyorsanız lütfen **herkese açık issue açmayın**.
Ayrıntıları (etkilenen sürüm, yeniden üretme adımları, olası etki) şu adrese e-posta ile gönderin:

**alperen.cetin.969@gmail.com** — konu: `[VisitFlow Security]`

- 5 iş günü içinde alındı bilgisi verilir.
- Doğrulanan açıklar için düzeltme yayımlanana kadar koordineli açıklama (en fazla 90 gün) rica edilir.
- İyi niyetli araştırmalar için yasal işlem başlatılmaz; lütfen yalnızca kendi kurulumunuzda test yapın ve gerçek kişisel verilere erişmeyin.

## Reporting a vulnerability

Please do **not** open a public issue. Email **alperen.cetin.969@gmail.com** with subject `[VisitFlow Security]`.
You will receive an acknowledgement within 5 business days. We ask for coordinated disclosure (max. 90 days).

## Kapsam dışı

- Yalnızca kendi tarayıcınızı etkileyen istemci tarafı engellerin (ör. video oynatıcı) atlatılması — güvenlik sunucu tarafında sağlanır.
- Hız sınırlarının dağıtık (çok sayıda IP) saldırılarla aşılması — bu, ağ katmanında (WAF/CDN) ele alınmalıdır.
- Yanlış yapılandırılmış kurulumlar (ör. HTTPS'siz yayın, güvenilmeyen proxy başlıkları).
