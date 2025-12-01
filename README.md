# Library Information System (FastAPI + SQLModel + PostgreSQL)

## Описание
API для информационной системы библиотеки.  
Проект использует FastAPI, SQLModel и PostgreSQL.  
В репозитории также присутствует дамп базы данных с тестовыми записями.

## Установка и запуск

### 1. Клонировать репозиторий
git clone https://github.com/mkurileva/library_db.git
cd REPOSITORY

### Установить зависимости
pip install -r requirements.txt

### Восстановить базу данных PostgreSQL из дампа
Создать базу данных (например library_db)  
и выполнить команду:

psql -U postgres -d library_db -f dump.sql

(при необходимости заменить имя пользователя и БД)

### 4. Настроить строку подключения к базе данных
В файле **db.py** указать свои данные, например:

DATABASE_URL = "postgresql://postgres:your_password@localhost:5432/library_db"

### 5. Запустить приложение
uvicorn main:app --reload

или

python -m uvicorn main:app --reload

Приложение будет доступно по адресу:  
http://localhost:8000/

Swagger UI:  
http://localhost:8000/docs

## Структура проекта
- **main.py** — API endpoints  
- **models.py** — SQLModel модели  
- **db.py** — подключение к базе данных  
- **library_db_dump.sql** — дамп БД с тестовыми данными  
- **requirements.txt** — список зависимостей

## Требования
Python 3.10+  
PostgreSQL 13+

## Автор
Курылева Мария Алексеевна 
4 курс, ИТвД 1.2
2025
