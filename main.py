from fastapi import FastAPI, HTTPException
from sqlmodel import Session, select
from sqlmodel import SQLModel
from db import engine
from models import Book, Reader, Librarian, BookCopy, Borrowing, Fine

app = FastAPI(title="Library API")

@app.on_event("startup")
def on_startup():
    SQLModel.metadata.create_all(engine)

# ==========
# Общая утилита для мягкого удаления
# ==========
def soft_delete(session, model, record_id):
    obj = session.get(model, record_id)
    if not obj:
        raise HTTPException(status_code=404, detail=f"Объект id={record_id} не найден")
    if obj.status == "deleted":
        raise HTTPException(status_code=400, detail="Запись уже удалена")

    obj.status = "deleted"
    session.add(obj)
    session.commit()
    return {"ok": True, "message": f"Запись id={record_id} помечена как удалённая"}



# КНИГИ

@app.post("/books/")
def create_book(book: Book):
    with Session(engine) as session:
        session.add(book)
        session.commit()
        session.refresh(book)
        return book

@app.get("/books/")
def get_books():
    with Session(engine) as session:
        books = session.exec(select(Book).where(Book.status != "deleted")).all()
        return books

@app.put("/books/{book_id}")
def update_book(book_id: int, updated: Book):
    with Session(engine) as session:
        book = session.get(Book, book_id)
        if not book or book.status == "deleted":
            raise HTTPException(status_code=404, detail="Книга не найдена")

        for key, value in updated.dict(exclude_unset=True).items():
            setattr(book, key, value)
        session.add(book)
        session.commit()
        session.refresh(book)
        return book

@app.delete("/books/{book_id}")
def delete_book(book_id: int):
    with Session(engine) as session:
        return soft_delete(session, Book, book_id)



# ЧИТАТЕЛИ

@app.post("/readers/")
def create_reader(reader: Reader):
    with Session(engine) as session:
        session.add(reader)
        session.commit()
        session.refresh(reader)
        return reader

@app.get("/readers/")
def get_readers():
    with Session(engine) as session:
        readers = session.exec(select(Reader).where(Reader.status != "deleted")).all()
        return readers

@app.put("/readers/{reader_id}")
def update_reader(reader_id: int, updated: Reader):
    with Session(engine) as session:
        reader = session.get(Reader, reader_id)
        if not reader or reader.status == "deleted":
            raise HTTPException(status_code=404, detail="Читатель не найден")

        for key, value in updated.dict(exclude_unset=True).items():
            setattr(reader, key, value)
        session.add(reader)
        session.commit()
        session.refresh(reader)
        return reader

@app.delete("/readers/{reader_id}")
def delete_reader(reader_id: int):
    with Session(engine) as session:
        return soft_delete(session, Reader, reader_id)



# БИБЛИОТЕКАРИ

@app.post("/librarians/")
def create_librarian(librarian: Librarian):
    with Session(engine) as session:
        session.add(librarian)
        session.commit()
        session.refresh(librarian)
        return librarian

@app.get("/librarians/")
def get_librarians():
    with Session(engine) as session:
        librarians = session.exec(select(Librarian).where(Librarian.status != "deleted")).all()
        return librarians

@app.put("/librarians/{librarian_id}")
def update_librarian(librarian_id: int, updated: Librarian):
    with Session(engine) as session:
        librarian = session.get(Librarian, librarian_id)
        if not librarian or librarian.status == "deleted":
            raise HTTPException(status_code=404, detail="Библиотекарь не найден")

        for key, value in updated.dict(exclude_unset=True).items():
            setattr(librarian, key, value)
        session.add(librarian)
        session.commit()
        session.refresh(librarian)
        return librarian

@app.delete("/librarians/{librarian_id}")
def delete_librarian(librarian_id: int):
    with Session(engine) as session:
        return soft_delete(session, Librarian, librarian_id)



# ЭКЗЕМПЛЯРЫ КНИГ

@app.post("/bookcopies/")
def create_bookcopy(copy: BookCopy):
    with Session(engine) as session:
        session.add(copy)
        session.commit()
        session.refresh(copy)
        return copy

@app.get("/bookcopies/")
def get_bookcopies():
    with Session(engine) as session:
        copies = session.exec(select(BookCopy).where(BookCopy.status != "deleted")).all()
        return copies

@app.put("/bookcopies/{copy_id}")
def update_bookcopy(copy_id: int, updated: BookCopy):
    with Session(engine) as session:
        copy = session.get(BookCopy, copy_id)
        if not copy or copy.status == "deleted":
            raise HTTPException(status_code=404, detail="Экземпляр не найден")

        for key, value in updated.dict(exclude_unset=True).items():
            setattr(copy, key, value)
        session.add(copy)
        session.commit()
        session.refresh(copy)
        return copy

@app.delete("/bookcopies/{copy_id}")
def delete_bookcopy(copy_id: int):
    with Session(engine) as session:
        return soft_delete(session, BookCopy, copy_id)



# ВЫДАЧИ

@app.post("/borrowings/")
def create_borrowing(borrowing: Borrowing):
    with Session(engine) as session:
        session.add(borrowing)
        session.commit()
        session.refresh(borrowing)
        return borrowing

@app.get("/borrowings/")
def get_borrowings():
    with Session(engine) as session:
        borrowings = session.exec(select(Borrowing).where(Borrowing.status != "deleted")).all()
        return borrowings

@app.put("/borrowings/{borrowing_id}")
def update_borrowing(borrowing_id: int, updated: Borrowing):
    with Session(engine) as session:
        borrowing = session.get(Borrowing, borrowing_id)
        if not borrowing or borrowing.status == "deleted":
            raise HTTPException(status_code=404, detail="Выдача не найдена")

        for key, value in updated.dict(exclude_unset=True).items():
            setattr(borrowing, key, value)
        session.add(borrowing)
        session.commit()
        session.refresh(borrowing)
        return borrowing

@app.delete("/borrowings/{borrowing_id}")
def delete_borrowing(borrowing_id: int):
    with Session(engine) as session:
        return soft_delete(session, Borrowing, borrowing_id)


# ШТРАФЫ

@app.post("/fines/")
def create_fine(fine: Fine):
    with Session(engine) as session:
        session.add(fine)
        session.commit()
        session.refresh(fine)
        return fine

@app.get("/fines/")
def get_fines():
    with Session(engine) as session:
        fines = session.exec(select(Fine).where(Fine.status != "deleted")).all()
        return fines

@app.put("/fines/{fine_id}")
def update_fine(fine_id: int, updated: Fine):
    with Session(engine) as session:
        fine = session.get(Fine, fine_id)
        if not fine or fine.status == "deleted":
            raise HTTPException(status_code=404, detail="Штраф не найден")

        for key, value in updated.dict(exclude_unset=True).items():
            setattr(fine, key, value)
        session.add(fine)
        session.commit()
        session.refresh(fine)
        return fine

@app.delete("/fines/{fine_id}")
def delete_fine(fine_id: int):
    with Session(engine) as session:
        return soft_delete(session, Fine, fine_id)

# ============================
# Восстановление записей (RESTORE)
# ============================

def restore_record(session, model, record_id):
    obj = session.get(model, record_id)
    if not obj:
        raise HTTPException(status_code=404, detail=f"Объект id={record_id} не найден")
    if obj.status == "active":
        raise HTTPException(status_code=400, detail="Запись уже активна")

    obj.status = "active"
    session.add(obj)
    session.commit()
    return {"ok": True, "message": f"Запись id={record_id} восстановлена"}


# КНИГИ
@app.put("/books/{book_id}/restore")
def restore_book(book_id: int):
    with Session(engine) as session:
        return restore_record(session, Book, book_id)


# ЧИТАТЕЛИ
@app.put("/readers/{reader_id}/restore")
def restore_reader(reader_id: int):
    with Session(engine) as session:
        return restore_record(session, Reader, reader_id)


# БИБЛИОТЕКАРИ
@app.put("/librarians/{librarian_id}/restore")
def restore_librarian(librarian_id: int):
    with Session(engine) as session:
        return restore_record(session, Librarian, librarian_id)


# ЭКЗЕМПЛЯРЫ КНИГ
@app.put("/bookcopies/{copy_id}/restore")
def restore_bookcopy(copy_id: int):
    with Session(engine) as session:
        return restore_record(session, BookCopy, copy_id)


# ВЫДАЧИ
@app.put("/borrowings/{borrowing_id}/restore")
def restore_borrowing(borrowing_id: int):
    with Session(engine) as session:
        return restore_record(session, Borrowing, borrowing_id)


# ШТРАФЫ
@app.put("/fines/{fine_id}/restore")
def restore_fine(fine_id: int):
    with Session(engine) as session:
        return restore_record(session, Fine, fine_id)
