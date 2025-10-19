FIRST_PARAM="$1"
pip install --upgrade pip
## Eğer ilk parametre boş ise packages.txt dosyasındakileri kur
if [ -z "$FIRST_PARAM" ]; then
    if [ -f "packages.txt" ]; then
        echo "📦 packages.txt dosyasından paketler kuruluyor..."
        pip install -r packages.txt
    else
        echo "❌ packages.txt dosyası bulunamadı!"
        exit 1
    fi
else
    echo "📦 Belirtilen paket '$FIRST_PARAM' kuruluyor..."
    pip install "$FIRST_PARAM"
    # kurulumun başarılı olup olmadığını kontrol et
    if [ $? -ne 0 ]; then
        echo "❌ Paket '$FIRST_PARAM' kurulamadı!"
        exit 1
    else
        echo "✅ Paket '$FIRST_PARAM' başarıyla kuruldu!"
        # package.txt içine son satıra ekle
        echo -e "\n$FIRST_PARAM" >> packages.txt
        # package.txt içindeki boş satırları temizle
        sed -i '/^$/d' packages.txt
        exit 0
    fi
fi