#!/bin/bash

# 1. Уникальные Magic Bytes (пароль сети)
# Мы меняем их на 'M' 'A' 'R' 'I' (Maritime)
sed -i 's/0xf9, 0xbe, 0xb4, 0xd9/0x4d, 0x41, 0x52, 0x49/g' src/chainparams.cpp

# 2. Уникальный порт (18888 вместо 8333)
sed -i 's/8333/18888/g' src/chainparams.cpp

# 3. Минимальная сложность (для моментального майнинга на мобильном)
# Меняем powLimit на 0000ffff...
sed -i 's/00000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffff/0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff/g' src/chainparams.cpp

# 4. Интервал блоков (10 минут = 600 сек)
sed -i 's/nPowTargetSpacing = 10 \* 60/nPowTargetSpacing = 600/g' src/chainparams.cpp

# 5. Отключаем DNS-сиды Биткоина (чтобы не стучаться к чужим)
sed -i 's/vSeeds.emplace_back/\/\/ vSeeds.emplace_back/g' src/chainparams.cpp

echo "⚓ Параметры сети изменены на MARITIME. Флот готов к сборке."
