//
//  CoreDataManager.swift
//  Notepad
//
//  Created by SaiKiran Panuganti on 20/07/21.
//

import UIKit
import CoreData

class CoreDataManager {
    static func getContext() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil}
        let persitanceContainer = appDelegate.persistentContainer
        return persitanceContainer.viewContext
    }
    
    static func fetchAllExpenses() -> [Expense]? {
        guard let context = getContext() else { return nil}
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            if let notes = try context.fetch(fetchRequest) as? [Expense] {
                return notes
            }
        }catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
//    static func fetchNotesOfFolder(folder: String) -> [Expense]? {
//        guard let context = getContext() else { return nil}
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
//        fetchRequest.returnsObjectsAsFaults = false
//        fetchRequest.predicate = NSPredicate(format: "folder == %@", folder)
//
//        do {
//            if let notes = try context.fetch(fetchRequest) as? [Expense] {
//                return notes
//            }
//        }catch {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
    
    static func addExpenseToFolder(title: String, balance: Int, advance: Int, total: Int, comment: String, image1: UIImage?, image2: UIImage?, image3: UIImage?) {
        guard let context = getContext() else { return }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Expense", in: context) else {return}
        let note = NSManagedObject(entity: entity, insertInto: context)
        note.setValue(false, forKey: "archieve")
        note.setValue(UUID().uuidString, forKey: "id")
        note.setValue(title, forKey: "title")
        note.setValue(advance, forKey: "advance")
        note.setValue(balance, forKey: "balance")
        note.setValue(total, forKey: "total")
        note.setValue(comment, forKey: "comment")
        note.setValue(image1?.pngData, forKey: "image1")
        note.setValue(image2?.pngData, forKey: "image2")
        note.setValue(image3?.pngData, forKey: "image3")
        
        do {
            try context.save()
        }catch {
            print(error.localizedDescription)
        }
    }
    
//    static func updateNote(title: String, id: String, pinned: Bool? = nil, folderName: String? = nil) {
//        guard let context = getContext() else { return }
//
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
//        fetchRequest.returnsObjectsAsFaults = false
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//
//        do {
//            let notes = try context.fetch(fetchRequest)
//            if notes.count > 0 {
//                if let note = notes[0] as? Expense {
//                    note.title = message
//                    note.date = Date()
//
//                    if let pinned = pinned {
//                        note.pinned = pinned
//                    }
//
//                    if let folderName = folderName {
//                        note.folder = folderName
//                    }
//                }
//            }
//        }catch {
//            print(error.localizedDescription)
//        }
//        do {
//            try context.save()
//        }catch {
//            print(error.localizedDescription)
//        }
//    }
    
//    static func deleteNote(note: Expense) {
//        guard let context = getContext() else { return }
//
//        let itemToRemove = note
//        context.delete(itemToRemove)
//
//        do {
//            try context.save()
//        } catch  {
//            print(error.localizedDescription)
//        }
//    }
    
//    static func deleteFolder(folder: String?) {
//        if let folder = folder {
//            if let notes = fetchNotesOfFolder(folder: folder) {
//                for note in notes {
//                    deleteNote(note: note)
//                }
//            }
//        }
//    }
    
//    static func updateFolderName(folder: Folder, folderName: String) {
//        for note in folder.notes {
//            updateNote(message: note.message ?? "", id: note.id ?? "", pinned: note.pinned, folderName: folderName)
//        }
//    }
}
