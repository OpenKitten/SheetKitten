# SheetKitten

Adorable little spreadsheet library for Swift

## 🐈 Work in progress

SheetKitten is early in development and can currently only generate CSV files. In the near future the API will change and export to XLSX will be added.

- [x] CSV export
- [ ] XLSX export
- [ ] ODS export

We may also include import (parsing) functionality, but probably not in the near future.

If you need anything, feel free to implement it and submit a pull request.

## 😺 Usage

- Make your type(s) conform to the `SpreadsheetConvertible` protocol:

```swift
extension Fish : SpreadsheetConvertible {
	let numberOfRowsForSpreadshet: UInt = 4
	let spreadsheetColumnTitles = ["Blub?", "Blub!", "Blubbbbb"]
	
	func getDataForSpreadsheet(atRow row: UInt) -> [String] {
		// get data for a single row
		// ...
		
		return data
	}
}
```

- Export to any supported format:

```swift
let f: Fish = fishProducingFunction()
let csv = makeCSV(f)
```