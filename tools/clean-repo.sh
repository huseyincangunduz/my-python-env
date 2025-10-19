# bu script repo'yu temizler ve sadece gerekli dosyaları bırakır
#!/bin/bash
## Kullanıcıdan onay al
read -p "⚠️ DİKKAT: Bu işlem repo içindeki tüm dosyaları silecek! 
ÖNEMLİ DEĞİŞİKLİKLER VARSA YA DA REPOSITORY GITHUB GİBİ BİR YERE PUSHLANMADIYSA TÜM PROJE ÇÖP OLACAK! 
Devam etmek istiyor musunuz? (e/h): " CONFIRM
if [[ "$CONFIRM" != "e" && "$CONFIRM" != "E" ]]; then
    echo "❌ İşlem iptal edildi."
    exit 1
fi
echo "🧹 Repo temizleniyor..."
# gereksiz dosyaları sil
rm -rf __pycache__
rm -rf .vscode
rm -rf .git
rm -f .gitignore
# projedeki packages.txt, activate-env.sh and tools dışındaki her şeyi sil
find . -maxdepth 1 ! -name '.' ! -name 'packages.txt' ! -name 'activate-env.sh' ! -name 'tools' -exec rm -rf {} +