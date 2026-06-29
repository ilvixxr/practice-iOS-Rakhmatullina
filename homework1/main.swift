import Foundation

var library: [Book] = [
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
         author: "Ольга Примаченко
         pageCount: 312,
         isAvailable: true,
         genre: .nonfiction),
    
    Book(title: "Убийство в Восточном экспрессе",
         author: "Агата Кристи",
         year: 1962,
         pageCount: 136,
         isAvailable: true,
         genre: .detective),
    
    Book(title: "Восемь негритят",
         author: "Агата Кристи",
         year: 1902,
         pageCount: 160,
         isAvailable: false,
         genre: .detective),
    
]

func findBook(byTitle title: String, in library: [Book]) -> Book? {

    for book in library {
        if book.title.lowercased() == title.lowercased() {
            return book
        }
    }
    return nil
}

func findBooks(byAuthor author: String, in library: [Book]) -> [Book] {
    var foundBooks: [Book] = []
    
    for book in library {
        if book.author.lowercased() == author.lowercased() {
            foundBooks.append(book)
        }
    }
    
    return foundBooks
}

func issueBook(_ book: inout Book) {
    guard book.isAvailable else {
        print("Книга \"\(book.title)\" недоступна")
        return
    }
    
    book.isAvailable = false
    print("Книга \"\(book.title)\" успешно выдана!")
}

func getBooks(byGenre genre: Genre, from library: [Book]) -> [Book] {
    return library.filter { $0.genre == genre }
}

func getBooks(byAuthor author: String, from library: [Book]) -> [Book] {
    return library.filter {$0.author.lowercased() == author.lowercased() }
}

func sortBooks(byPageCount books: [Book], ascending: Bool = true) -> [Book] {
    return books.sorted { first, second in
        if ascending {
            return first.pageCount < second.pageCount
        } else {
            return first.pageCount > second.pageCount
        }
    }
}

func getAllTitles(from library: [Book]) -> [String] {
    return library.map { $0.title }
}

func getTotalPageCount(from library: [Book]) -> Int {
    return library.reduce(0) { total, book in
        total + book.pageCount
    }
}

