
#!/bin/bash
# DİKKAT - Bunu source ./activate-env.sh olarak çalıştırın

# virtualenv kurulu olup olmadığını kontrol et
check_virtualenv() {
    if ! command -v virtualenv &> /dev/null; then
        echo "❌ UYARI: virtualenv kurulu değil!"
        echo "🔧 Lütfen aşağıdaki komutlardan biriyle virtualenv'i kurun:"
        echo "   • pip install virtualenv"
        echo "   • sudo apt install python3-virtualenv  (Ubuntu/Debian için)"
        echo "   • sudo yum install python3-virtualenv   (CentOS/RHEL için)"
        echo "   • brew install virtualenv               (macOS için)"
        echo ""
        read -p "Devam etmek için Enter'a basın (virtualenv kurulduktan sonra) veya Ctrl+C ile çıkın..."
        return 1
    fi
    return 0
}

# virtualenv kontrolü yap
if ! check_virtualenv; then
    exit 1
fi

# Virtual environment yoksa oluştur
if [ ! -d "_environment" ]; then
    echo "🔨 Virtual environment oluşturuluyor..."
    virtualenv "_environment"
fi

# Virtual environment'ı aktive et
if [ -d "_environment" ]; then
    echo "✅ Virtual environment aktive ediliyor..."
    source "./_environment/bin/activate"
    echo "🚀 Virtual environment hazır! ($(python --version))"
else
    echo "❌ Virtual environment oluşturulamadı!"
    exit 1
fi