FROM python:3.12-slim

ENV app_poetry /app

WORKDIR $app_poetry

COPY pyproject.toml /pyproject.toml
COPY poetry.lock /poetry.lock

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

COPY . .

CMD ["python", "main.py"]
