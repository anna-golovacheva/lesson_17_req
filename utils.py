import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


def connect_db():
    """
    Функция создает и проверяет соединение с базой данных.
    """
    try:
        connection = psycopg2.connect(user="postgres", password="postgres",
                                      database="lesson_27", host="127.0.0.1",
                                      port="5432")
        connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        return connection
    except:
        print('Connection failed.')
        return False


def get_all_adds(cursor):
    """
    Функция выводит все объявления.
    """
    req = """
    SELECT name, author_name, price, description, city, local_address, is_published
    FROM ads JOIN addresses 
    ON ads.address_id=addresses.id_address 
    JOIN authors 
    ON author_id=id_author
    """
    try:
        cursor.execute(req)
        data = cursor.fetchall()

        for dt in data:
            print(', '.join([str(d) for d in dt]))
    except:
        print('getting all adds failed')


def get_adds_by_name(cursor, user_name):
    """
    Функция выводит объявления только конкретного пользователя.
    """
    req = f"""
    SELECT name, price, description, city, local_address, 
    is_published
    FROM ads JOIN addresses 
    ON ads.address_id=addresses.id_address 
    JOIN authors 
    ON author_id=id_author
    WHERE authors.author_name='{user_name}'
    """
    try:
        cursor.execute(req)
        data = cursor.fetchall()

        if data:
            print('Подходящие объявления:')
            for dt in data:
                print(', '.join([str(d) for d in dt]))
        else:
            print('По данному запросу ничего не найдено')
    except:
        print('getting adds by name failed')


def get_adds_by_limits(cursor, user_min, user_max):
    """
    Функция выводит объявления в заданном диапазоне цен (в порядке возрастания).
    """
    req = f"""
    SELECT name, author_name, price, description, city, local_address, 
    is_published
    FROM ads JOIN addresses 
    ON ads.address_id=addresses.id_address 
    JOIN authors 
    ON author_id=id_author
    WHERE {float(user_min)} < price and price < {float(user_max)}
    ORDER BY price
    """
    try:
        cursor.execute(req)
        data = cursor.fetchall()

        if data:
            print('Подходящие объявления:')
            for dt in data:
                print(', '.join([str(d) for d in dt]))
        else:
            print('По данному запросу ничего не найдено')
    except:
        print('getting adds by name failed')


def get_adds_by_city(cursor, user_city):
    """
    Функция выводит объявления в выбранном городе.
    """
    req = f"""
    SELECT name, author_name, price, description, local_address, 
    is_published
    FROM ads JOIN addresses 
    ON ads.address_id=addresses.id_address 
    JOIN authors 
    ON author_id=id_author
    WHERE city = '{user_city}'
    """

    try:
        cursor.execute(req)
        data = cursor.fetchall()

        if data:
            print('Подходящие объявления:')
            for dt in data:
                print(', '.join([str(d) for d in dt]))
        else:
            print('По данному запросу ничего не найдено')
    except:
        print('getting adds by city failed')


def get_info_by_name_and_price(cursor, user_name, user_max):
    """
    Функция считает количество объявлений заданного пользователя и с ценой
    меньше указанной. Выводит это количество и, если такие объявления есть,
    выводит все.
    """
    req_1 = f"""
    SELECT count(*) as cnt
    FROM ads JOIN addresses 
    ON ads.address_id=addresses.id_address 
    JOIN authors 
    ON author_id=id_author
    WHERE author_name = '{user_name}' and price < '{float(user_max)}'
    """

    req_2 = f"""
    SELECT name, price, description, city, local_address, 
    is_published
    FROM ads JOIN addresses 
    ON ads.address_id=addresses.id_address 
    JOIN authors 
    ON author_id=id_author
    WHERE author_name = '{user_name}' and price < '{float(user_max)}'
    """

    try:
        cursor.execute(req_1)
        cnt = cursor.fetchall()

        quantity = cnt[0][0]
        print(f'Всего найдено {quantity} подходящих объявлений.\n')

        if quantity > 0:
            cursor.execute(req_2)
            data = cursor.fetchall()

            for dt in data:
                print(', '.join([str(d) for d in dt]))
    except:
        print('getting info by name and price failed')
