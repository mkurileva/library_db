from fastapi import FastAPI
from db import create_db_and_tables
from requests import get_all_books, get_all_readers, get_all_borrowings, get_all_fines

app = FastAPI()

@app.on_event("startup")
def on_startup():
    create_db_and_tables()

@app.get("/")
def root():
    return {"message": "Сервер работает. Используй /books/, /readers/, /borrowings/, /fines/."}

@app.get("/books/")
def read_books():
    return get_all_books()

@app.get("/readers/")
def read_readers():
    return get_all_readers()

@app.get("/borrowings/")
def read_borrowings():
    return get_all_borrowings()

@app.get("/fines/")
def read_fines():
    return get_all_fines()

