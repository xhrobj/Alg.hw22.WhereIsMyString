
//
// NOTE: Операции над строками в Swift, ну, прям оооооооооооооочень "многословные", поэтому для простоты
// сразу преобразуем строки в массивы символов, чтобы можно было обращаться к символам строки по индексу
//

let haystack = Array("sdgdsdrehujkfhjabbamfsdfkjsdhtiewelmrernjehllfmabdadmgkgfgaba")
let needle = Array("abba")

func findIndex_bruteforce(_ needle: [Character], in haystack: [Character]) -> Int? {
    for h in 0...(haystack.count - needle.count) {
        var n = 0
        while haystack[h + n] == needle[n] {
            guard n < needle.count - 1 else { return h }
            n += 1
        }
    }
    return nil
}

if let index = findIndex_bruteforce(needle, in: haystack) {
    print("Найдено:", index)
} else {
    print("Не найдено")
}
