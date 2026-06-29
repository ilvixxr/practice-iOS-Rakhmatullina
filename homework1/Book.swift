import Foundation

enum Genre: String{
    case fantasy = "фантастика"
    case detective = "детектив"
    case classic = "классика"
    case nonfiction = "нон-фикшн"
}

protocol Printable {
    func printInfo()
}

struct Book: Printable{
    let title: String
    let author:String
    let year: Int
    let pageCount: Int
    var isAvailable: Bool
    let genre: Genre
    
    var shortDescription: String{
        return "\(title) - \(author) \((pageCount)) "
    }
    
    func genreDescroption (for genre: Genre) -> String{
        switch genre {
        case .fantasy:
            return "Фантастика — книги о вымышленных мирах и технологиях"
        case .detective:
            return "Детектив — произведения о расследованиях"
        case .classic:
            return "Классика — литература, прошедшая проверку временем"
        case .nonfiction:
            return "Нон-фикшн — документальная литература, основанная на фактах"
        }
    }
    
    func printInfo() {
        print("Название: \(title)")
        print("Автор: \(author)")
        print("Год издания: \(year)")
        print("Количество страниц: \(pageCount)")
        print("Жанр: \(genre.rawValue)")
        print("Доступна ли: \(isAvailable)")
    }
}
    
    class Library {
        var books: [Book]
        
        init(books: [Book] = []) {
            self.books = books
        }
        
        func addBook(_ book: Book) {
            books.append(book)
        }
        
        func removeBook(byTitle title: String) -> Bool {
            guard let index = books.firstIndex(where: { $0.title.lowercased() == title.lowercased() }) else {
                return false
            }
            books.remove(at: index)
            return true
        }
        
        func getAllBooks() -> [Book] {
            return books
        }
        
        func getBookCount() -> Int {
            return books.count
        }
    }
    extension Library {
        func getThreeMostVoluminousBooks() -> [Book] {
            let sortedBooks = books.sorted { $0.pageCount > $1.pageCount }
            let count = min(sortedBooks.count, 3)
            return Array(sortedBooks.prefix(count))
        }
    }
