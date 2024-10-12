FROM python:3.11-slim
# Устанавливаем переменную окружения для игнорирования предупреждений pip
ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR /app

COPY pyproject.toml poetry.lock* /app/

RUN pip install poetry && poetry install --no-dev

EXPOSE 80

COPY . /app

CMD ["poetry", "run", "python", "-m", "hello_world"]
