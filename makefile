# Makefile для Pulse-Core (Termux Optimized)

.PHONY: all pulse clean install

all: pulse

pulse:
	@echo "⚓ Начало сборки Флагмана Pulse..."
	chmod +x configure_pulse.sh
	./configure_pulse.sh
	make -j$(nproc)
	@echo "⚓ Сборка завершена. Демон готов к выходу в море."

clean:
	make clean
	@echo "🌊 Трюмы очищены."

install:
	cp src/pulsed $${PREFIX}/bin/
	cp src/pulse-cli $${PREFIX}/bin/
	@echo "⚓ Утилиты установлены в систему Termux."
