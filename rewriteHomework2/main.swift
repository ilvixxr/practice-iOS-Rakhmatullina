import Foundation

let library = Library.createTestLibrary()
print("КНИГИ ЖАНРА КЛАССИКА:")
let classics = library.findBooks(byGenre: .classic)
classics.forEach { book in
    print("\(book.shortDescription)")
}
print()

print("КНИГИ АГАТЫ КРИСТИ:")
let christieBooks = library.findBooks(byAuthor: "Агата Кристи")
christieBooks.forEach { book in
    print("\(book.shortDescription)")
}
print()

print("СОРТИРОВКА ПО КОЛИЧЕСТВУ СТРАНИЦ:")
let sortedDescending = library.sortBooks(byPageCount: false)
sortedDescending.forEach { book in
    print("\(book.shortDescription)")
}
print()

print("НАЗВАНИЯ КНИГ В БИБЛИОТЕКЕ:")
let allTitles = library.getAllTitles()
allTitles.forEach { title in
    print(title)
}
print()

print("ОБЩЕЕ КОЛИЧЕСТВО СТРАНИЦ:")
let totalPages = library.getTotalPageCount()
print("Всего страниц: \(totalPages)")
print()

print("ТРИ САМЫЕ ОБЪЁМНЫЕ КНИГИ:")
let topThree = library.getThreeMostVoluminousBooks()
topThree.forEach { book in
    print(book.shortDescription)
}
print()

let users: [LibraryUser] = [
    Student(name: "студент Иван", id: "01"),
    Teacher(name: "преподаватель Антон Юрьевич", id: "02")]

print("ПОЛИМОРФИЗМ:")
for user in users {
    user.printInfo()
}
