#include <consensus/void.h>
#include <util/system.h>
#include <thread>
#include <chrono>

/** 
 * Логика Pulse Void: Энергоэффективный цикл ожидания Биткоин-пульса.
 * Мы используем каскадные интервалы сна для минимизации активности CPU.
 */
void PulseVoidManager::Run() {
    LogPrintf("⚓ Pulse Void: Судно вышло в открытое море. Ожидаем пульс...\n");

    while (true) {
        int64_t lastBlockTime = GetLastPulseTimestamp();
        int64_t currentTime = GetAdjustedTime();
        int64_t elapsed = currentTime - lastBlockTime;

        if (elapsed < 480) { // Первые 8 минут - Глубокий сон
            // В Termux здесь можно вызывать системный sleep для максимальной экономии
            std::this_thread::sleep_for(std::chrono::minutes(2));
            UpdateStatus("🌊 AT SEA: DEEP SLEEP");
        } 
        else if (elapsed < 540) { // 9-я минута - Прогрев радиомодуля
            std::this_thread::sleep_for(std::chrono::seconds(30));
            UpdateStatus("🌊 AT SEA: WARMING UP");
            // Начинаем восстанавливать P2P соединения с Мастер-нодами
            ReconnectToFleet(); 
        } 
        else { // Время "Ч" - Активное сканирование горизонта
            UpdateStatus("🌊 AT SEA: SCANNING HORIZON");
            
            if (CheckForNewBitcoinBlock()) {
                LogPrintf("⚡ ПУЛЬС ОБНАРУЖЕН! Заякориваем сообщение...\n");
                TriggerMiningPulse(); // Вызов генерации блока форка
                // После успешного пульса цикл начнется заново с 8-минутного сна
            }
            
            // Пинг раз в 10 секунд в активной фазе
            std::this_thread::sleep_for(std::chrono::seconds(10));
        }
    }
}
