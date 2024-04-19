# Yapay-Sinir-Modeli
Bu proje, Alzheimer hastalığının erken teşhisi için yapay sinir ağlarının (YSA) kullanılmasını ele almaktadır. Proje, MATLAB ortamında geliştirilmiş ve test edilmiştir.

Alzheimer Hastalığının Teşhisi İçin Yapay Sinir Ağı Modeli
Bu proje, Alzheimer hastalığının erken teşhisi için yapay sinir ağlarının (YSA) kullanılmasını ele almaktadır. Proje, MATLAB ortamında geliştirilmiş ve test edilmiştir.

Proje Amaçları
Alzheimer hastalığını sağlıklı bireylerden ayırt edebilen bir YSA modeli geliştirmek.
Modelin performansını değerlendirmek ve doğruluğunu, duyarlılığını ve özgüllüğünü test etmek.
Modelin klinik uygulama için taşınabilirliğini değerlendirmek.
Kullanılan Veri Seti
Proje için kullanılan veri seti "Alzheimer.csv" adlı bir dosyadan yüklenmiştir. Veri seti, cinsiyet, yaş, eğitim seviyesi, bilişsel test sonuçları ve beyin görüntüleme verileri gibi çeşitli özellikleri içermektedir.

Yapay Sinir Ağı Modeli
Model, giriş katmanında 9 özellik bulunan, iki gizli katmanda sırasıyla 10 ve 22 nöron, ve çıkış katmanında bir nöron içeren bir yapıya sahiptir.
Aktivasyon fonksiyonu olarak her katmanda "tansig" kullanılmıştır.
Model, eğitim verileri üzerinde Levenberg-Marquardt geri yayılım (trainlm) algoritmasıyla eğitilmiştir.
Projeyi Çalıştırma
MATLAB ortamını açın.
"Alzheimer.csv" dosyasını yükleyin.
"main.m" dosyasını açın ve çalıştırın.
Modelin eğitim ve test süreçlerini gözlemleyin.
Sonuçlar ve Değerlendirme
Model, eğitim ve test veri setleri üzerinde yüksek doğruluk oranlarına ulaşmıştır.
Yapılan testler, YSA modelinin Alzheimer hastalığının erken teşhisinde potansiyel bir araç olarak kullanılabileceğini göstermektedir.
Kullanılan Kaynaklar
Bu proje için yapay sinir ağları, makine öğrenimi ve Alzheimer hastalığı alanlarındaki literatürden yararlanılmıştır.
