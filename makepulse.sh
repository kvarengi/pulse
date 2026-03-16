#!/data/data/com.termux/files/usr/bin/bash

echo "⚓ [DAO MARITIME LAW] Инициализация верфи..."

# 1. Проверка и установка зависимостей (Coreutils, Clang, и т.д.)
pkg update && pkg install -y git clang make cmake autoconf automake libtool pkg-config boost libevent libzmq leveldb

# 2. Переход в рабочую директорию
mkdir -p $HOME/pulse_build && cd $HOME/pulse_build

# 3. Клонирование (если нет) или обновление
if [ ! -d ".git" ]; then
    git clone https://github.com .
else
    git pull origin main
fi

# 4. Сборка Ultra-Light (Бережем батарею и память)
./autogen.sh
./configure --disable-wallet --without-gui --disable-tests --with-daemon CXXFLAGS="-O2 -march=native"
make -j$(nproc)

# 5. Установка бинарников в систему Termux
cp src/pulsed $PREFIX/bin/
cp src/pulse-cli $PREFIX/bin/
chmod +x $PREFIX/bin/pulsed $PREFIX/bin/pulse-cli

echo "==============================================="
echo "⚓ СБОРКА ЗАВЕРШЕНА. Команда 'pulsed' готова."
echo "==============================================="
