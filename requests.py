from sqlmodel import Session, select
from db import engine
from models import Book, Reader, Borrowing, Fine

# ---- КНИГИ ----
def get_all_books():
    with Session(engine) as session:
        return session.exec(select(Book)).all()

# ---- ЧИТАТЕЛИ ----
def get_all_readers():
    with Session(engine) as session:
        return session.exec(select(Reader)).all()

# ---- ВЫДАЧИ ----
def get_all_borrowings():
    with Session(engine) as session:
        return session.exec(select(Borrowing)).all()

# ---- ШТРАФЫ ----
def get_all_fines():
    with Session(engine) as session:
        return session.exec(select(Fine)).all()

