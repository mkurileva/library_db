from sqlmodel import SQLModel, Field
from typing import Optional
from datetime import date

class Book(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    isbn: str
    title: str
    author: str
    publisher: str
    year: int
    genre: str

class BookCopy(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    inventory_number: str
    status: str
    location: str
    book_id: Optional[int] = Field(default=None, foreign_key="book.id")

class Reader(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    full_name: str
    address: str
    phone: str
    email: str
    registration_date: date
    status: str

class Librarian(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    full_name: str
    position: str
    login: str
    password: str
    status: str

class Borrowing(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    issue_date: date
    planned_return_date: date
    actual_return_date: Optional[date]
    reader_id: Optional[int] = Field(default=None, foreign_key="reader.id")
    book_copy_id: Optional[int] = Field(default=None, foreign_key="bookcopy.id")
    librarian_id: Optional[int] = Field(default=None, foreign_key="librarian.id")

class Fine(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    amount: float
    reason: str
    status: str
    borrowing_id: Optional[int] = Field(default=None, foreign_key="borrowing.id")
