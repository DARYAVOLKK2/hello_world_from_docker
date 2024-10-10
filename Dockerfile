FROM python:3.11-slim

WORKDIR /app

COPY pyproject.toml poetry.lock* /app/

RUN pip install poetry && poetry install --no-dev

ENV PIP_ROOT_USER_ACTION=ignore

COPY . /app

CMD ["poetry", "run", "python", "-m", "hello_world"]
