import Foundation

public protocol SpreadsheetConvertible {
    var numberOfRowsForSpreadsheet: UInt { get }
    var spreadsheetColumnTitles: [String] { get }
    
    func getDataForSpreadsheet(atRow row: UInt) -> [String]
}

public func makeCSV(from source: SpreadsheetConvertible) -> String {
    let numRows = source.numberOfRowsForSpreadsheet
    let titles = source.spreadsheetColumnTitles
    
    func escape(_ string: String) -> String {
        guard string.characters.contains("\"") || string.characters.contains(",") else {
            return string
        }
        
        let string = string.replacingOccurrences(of: "\"", with: "\"\"")
        
        return "\"\(string)\""
    }
    
    var csv = titles.map(escape).joined(separator: ",")
    
    for i in 0..<numRows {
        let data = source.getDataForSpreadsheet(atRow: i)
        let rowString = data.map(escape).joined(separator: ",")
        csv.append("\n\(rowString)")
    }
    
    return csv
}

