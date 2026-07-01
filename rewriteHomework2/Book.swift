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
        return "\(title) - \(author) (\(pageCount) стр.) "
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
    
    func findBook(byTitle title: String) -> Book? {
        return books.first { $0.title.lowercased() == title.lowercased() }
    }
    
    func findBooks(byAuthor author: String) -> [Book] {
        return books.filter { $0.author.lowercased() == author.lowercased() }
    }
    
    func findBooks(byGenre genre: Genre) -> [Book] {
        return books.filter { $0.genre == genre }
    }
    
    func issueBook(byTitle title: String) {
        guard let index = books.firstIndex(where: {
            $0.title.lowercased() == title.lowercased()
        }) else {
            print("Книга \"\(title)\" не найдена")
            return
        }
        
        guard books[index].isAvailable else {
            print("Книга \"\(books[index].title)\" уже выдана")
            return
        }
        
        books[index].isAvailable = false
        print("Книга \"\(books[index].title)\" успешно выдана")
    }
    func sortBooks(byPageCount ascending: Bool = true) -> [Book] {
        return books.sorted { first, second in
            if ascending {
                return first.pageCount < second.pageCount
            } else {
                return first.pageCount > second.pageCount
            }
        }
    }
    
    func getAllTitles() -> [String] {
        return books.map { $0.title }
    }
    
    func getTotalPageCount() -> Int {
        return books.reduce(0) { total, book in
            total + book.pageCount
        }
    }
    
    static func createTestLibrary() -> Library {
        let books = [
            Book(title: "Анна Каренина",
                 author: "Лев Толстой",
                 year: 1873,
                 pageCount: 953,
                 isAvailable: true,
                 genre: .classic),
            
            Book(title: "Марсианин",
                 author: "Энди Вейер",
                 year: 2011,
                 pageCount: 298,
                 isAvailable: false,
                 genre: .fantasy),
            
            Book(title: "Преступление и наказание",
                 author: "Фёдор Достоевский",
                 year: 1850,
                 pageCount: 465,
                 isAvailable: false,
                 genre: .classic),
            
            Book(title: "Мастер и Маргарита",
                 author: "Михаил Булгаков",
                 year: 1985,
                 pageCount: 350,
                 isAvailable: true,
                 genre: .classic),
            
            Book(title: "451 по Фаренгейту",
                 author: "Рэй Брэдбери",
                 year: 1978,
                 pageCount: 148,
                 isAvailable: true,
                 genre: .fantasy),
            
            Book(title: "К себе нежно",
                 author: "Ольга Примаченко",
                 year: 2019, // Добавлен год
                 pageCount: 312,
                 isAvailable: true,
                 genre: .nonfiction),
            
            Book(title: "Убийство в Восточном экспрессе",
                 author: "Агата Кристи",
                 year: 1934, // Исправлен год (был 1962)
                 pageCount: 136,
                 isAvailable: true,
                 genre: .detective),
            
            Book(title: "Восемь негритят",
                 author: "Агата Кристи",
                 year: 1939, // Исправлен год (был 1902)
                 pageCount: 160,
                 isAvailable: false,
                 genre: .detective),
        ]
        
        return Library(books: books)
    }
}
extension Library {
    func getThreeMostVoluminousBooks() -> [Book] {
        let sortedBooks = books.sorted { $0.pageCount > $1.pageCount }
        let count = min(sortedBooks.count, 3)
        return Array(sortedBooks.prefix(count))
    }
}
