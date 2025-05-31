//
//  FileManagerHelper.swift
//  Acreage
//
//  Created by Tom on 5/31/25.
//

import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()

    func saveDataToFile(named filename: String, data: Data) -> URL? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = directory.appendingPathComponent(filename)

        do {
            try data.write(to: fileURL)
            return fileURL
        } catch {
            print("Failed to save file: \(error)")
            return nil
        }
    }

    func loadDataFromFile(named filename: String) -> Data? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = directory.appendingPathComponent(filename)

        return try? Data(contentsOf: fileURL)
    }
}
