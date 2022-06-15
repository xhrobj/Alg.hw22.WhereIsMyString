public struct Finder {
    public static func findIndex_bruteforce(_ needle: [Character], in haystack: [Character]) -> Int? {
        for h in 0...(haystack.count - needle.count) {
            var n = 0
            while haystack[h + n] == needle[n] {
                guard n < needle.count - 1 else { return h }
                n += 1
            }
        }
        return nil
    }

    public static func findIndex_shiftTable(_ needle: [Character], in haystack: [Character]) -> Int? {
        guard !needle.isEmpty, !haystack.isEmpty else { return nil }

        let shiftTable = createShiftTable(for: needle)
        print("shiftTable: \(shiftTable.map); defaultValue: \(shiftTable.defaultValue)", "\n")

        var h = 0
        while h <= haystack.count - needle.count {
            var n = needle.count - 1
            let hn = h + n
            while haystack[h + n] == needle[n] {
                guard n > 0 else { return h }
                n -= 1
            }
            h += shiftTable.map[haystack[hn]] ?? shiftTable.defaultValue
        }

        return nil
    }
}

// Private methods
extension Finder {
    private static func createShiftTable(for text: [Character]) -> (map: [Character: Int], defaultValue: Int) {
        let defaultValue = text.count
        var shiftMap = [Character: Int]()
        for (index, char) in text.enumerated() {
            guard index < text.count - 1 else { break }
            shiftMap[char] = defaultValue - (index + 1)
        }
        return (shiftMap, defaultValue)
    }
}
