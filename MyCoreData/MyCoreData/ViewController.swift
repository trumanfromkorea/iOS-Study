//
//  ViewController.swift
//  MyCoreData
//
//  Created by 장재훈 on 2022/11/02.
//

import CoreData
import UIKit

class ViewController: UIViewController {
    
    var appDelegate: AppDelegate!
    var container: NSPersistentContainer!
    var context: NSManagedObjectContext!
            
    override func viewDidLoad() {
        super.viewDidLoad()

        print(NSHomeDirectory())

        appDelegate = (UIApplication.shared.delegate) as? AppDelegate
        container = appDelegate.persistentContainer
        context = container.viewContext

        let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context) as! Todo
        todo.title = "CoreData 공부"
        todo.dueDate = Date()
        
        appDelegate.saveContext()
    }
    
    func fetchTodos() {
        let request: NSFetchRequest = Todo.fetchRequest()
        
        do {
            let todos = try context.fetch(request)
            todos.forEach { print("todo: \($0.title)")}
        } catch {
            print("fetch error: \(error)")
        }
    }
}
