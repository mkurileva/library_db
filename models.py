from sqlmodel import SQLModel, Field
from typing import Optional
from datetime import date



# Таблица BOOKS

class Book(SQLModel, table=True):
    __tablename__ = "books"

    id: Optional[int] = Field(default=None, primary_key=True)
    isbn: str
    title: str
    author: str
    publisher: str
    year: int
    genre: str

    # системный статус (для soft delete)
    status: str = Field(default="active")   # active / deleted

    # дополнительный статус (доступность)
    availability_status: str = Field(default="available")
    # available / lost / damaged
    



# Таблица BOOKCOPIES

class BookCopy(SQLModel, table=True):
    __tablename__ = "bookcopies"

    id: Optional[int] = Field(default=None, primary_key=True)
    inventory_number: str
    location: str
    book_id: Optional[int] = Field(default=None, foreign_key="books.id")

    status: str = Field(default="active")  # active / deleted

    condition_status: str = Field(default="good")
    # good / worn / damaged




# Таблица READERS

class Reader(SQLModel, table=True):
    __tablename__ = "readers"

    id: Optional[int] = Field(default=None, primary_key=True)
    full_name: str
    address: str
    phone: str
    email: str
    registration_date: date

    status: str = Field(default="active")  # active / deleted
    account_status: str = Field(default="normal")
    # normal / blocked




# Таблица LIBRARIANS

class Librarian(SQLModel, table=True):
    __tablename__ = "librarians"

    id: Optional[int] = Field(default=None, primary_key=True)
    full_name: str
    position: str
    login: str
    password: str

    status: str = Field(default="active")  # active / deleted




# Таблица BORROWINGS

class Borrowing(SQLModel, table=True):
    __tablename__ = "borrowings"

    id: Optional[int] = Field(default=None, primary_key=True)
    issue_date: date
    planned_return_date: date
    actual_return_date: Optional[date]

    reader_id: Optional[int] = Field(default=None, foreign_key="readers.id")
    book_copy_id: Optional[int] = Field(default=None, foreign_key="bookcopies.id")
    librarian_id: Optional[int] = Field(default=None, foreign_key="librarians.id")

    status: str = Field(default="active")  # active / deleted

    return_status: str = Field(default="issued")
    # issued / returned / overdue




# Таблица FINES

class Fine(SQLModel, table=True):
    __tablename__ = "fines"

    id: Optional[int] = Field(default=None, primary_key=True)
    amount: float
    reason: str

    borrowing_id: Optional[int] = Field(default=None, foreign_key="borrowings.id")

    status: str = Field(default="active")  # active / deleted
    payment_status: str = Field(default="unpaid")
    # paid / unpaid
