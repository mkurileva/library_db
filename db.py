from sqlmodel import SQLModel, create_engine

DATABASE_URL = "postgresql+psycopg2://postgres:password@localhost:5432/library_db"

engine = create_engine(DATABASE_URL, echo=True)

def create_db_and_tables():
    SQLModel.metadata.create_all(engine)
