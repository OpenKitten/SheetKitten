import Foundation

public protocol SpreadsheetConvertible {
    var spreadsheetColumnTitles: [String] { get }
    
    func makeDataForSpreadsheet() -> [[String]]
}

public func makeCSV(from source: SpreadsheetConvertible) -> String {
    let titles = source.spreadsheetColumnTitles
    
    func escape(_ string: String) -> String {
        guard string.characters.contains("\"") || string.characters.contains(",") else {
            return string
        }
        
        let string = string.replacingOccurrences(of: "\"", with: "\"\"")
        
        return "\"\(string)\""
    }
    
    var csv = titles.map(escape).joined(separator: ",")
    
    for data in source.makeDataForSpreadsheet() {
        let rowString = data.map(escape).joined(separator: ",")
        csv.append("\n\(rowString)")
    }
    
    return csv
}

