
//
// NOTE: Операции над строками в Swift, ну, прям оооооооооооооочень "многословные", поэтому для простоты
// сразу преобразуем строки в массивы символов, чтобы можно было обращаться к символам строки по индексу
//

//let haystackString = "sdgdsdrehujkfhjabbamfsdfkjsdhtiewelmrernjehllfmabdadmgkgfgaba"
//let needleString = "abba"

let haystackString = ".KOLOLOKOLOKOLOKOL"
let needleString = "KOLOKOL"

// 012345678901234567
// .KOLOLOKOLOKOLOKOL
//        KOLOKOL

let haystack = Array(haystackString)
let needle = Array(needleString)

print("🎱 Строка, в которой ищем:", haystackString)
print("🔍 Строка, которую ищем: \(needleString)\n")

example(of: "Поиск подстроки полным перебором:") {
    if let index = Finder.findIndex_bruteforce(needle, in: haystack) {
        print("Найденный индекс:", index)
    } else {
        print("Не найдено")
    }
}

example(of: "Поиск подстроки \"оптимизированным\" (таблица сдвигов) перебором:") {
    if let index = Finder.findIndex_shiftTable(needle, in: haystack) {
        print("Найденный индекс:", index)
    } else {
        print("Не найдено")
    }
}
