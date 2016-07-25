import XCTest
@testable import SheetKitten

class SheetKittenTests: XCTestCase {
    func testExample() {
        
        struct TestSheetType : SpreadsheetConvertible {
            let numberOfRowsForSpreadsheet: UInt = 3
            var spreadsheetColumnTitles = ["Name", "Nickname", "Function", "City"]
            
            func getDataForSpreadsheet(atRow row: UInt) -> [String] {
                switch row {
                case 0:
                    return ["Robbert Brandsma", "Obbut", "Nerd", "Eindhoven"]
                case 1:
                    return ["Joannis Orlandos", "Joannis", "Also Nerd", "Eindhoven"]
                case 2:
                    return ["Fred \"Wilhelmus\" met de lastige naam", "Harriebob", "Henk, fred, piet, sap en \"sauselina\"", "Overal en nergens"]
                default:
                    fatalError()
                }
            }
        }
        
        let s = TestSheetType()
        let csv = makeCSV(from: s)
        
        print(csv)
        
    }


    static var allTests : [(String, (SheetKittenTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
