from utils import *


def main():
    while True:
        user_req = input('Выберите запрос:\n\
        1. Вывести все объявления.\n\
        2. Вывести объявления только конкретных пользователей.\n\
        3. Вывести объявления в диапазоне цен и отсортировать данные в порядке возрастания.\n\
        4. Вывести объявления для конкретного города.\n\
        5. Вывести информацию для определенного пользователя и цены.\n\
        6. Выйти из программы.\n>>')

        if user_req not in '123456':
            print('Чтобы выполнить запрос, введите соответствующую цифру.')
            continue
        else:
            connection = connect_db()
            if connection:
                cursor = connection.cursor()
                match user_req:
                    case '1':
                        get_all_adds(cursor)

                    case '2':
                        user_name_to_search = input('Введите имя пользователя, объявления которого нужно найти.\n>>')
                        get_adds_by_name(cursor, user_name_to_search.capitalize())

                    case '3':
                        user_min_num_to_search = input('Введите минимальную стоимость.\n>>')
                        user_max_num_to_search = input(
                            'Введите максимальную стоимость.\n>>')
                        get_adds_by_limits(cursor, user_min_num_to_search, user_max_num_to_search)

                    case '4':
                        user_city_to_search = input('Введите город, в котором нужно найти объявления.\n>>')
                        get_adds_by_city(cursor, user_city_to_search.capitalize())

                    case '5':
                        user_name_to_search = input('Введите имя пользователя, по которому нужно найти информацию.\n>>')
                        user_max_num_to_search = input('Введите максимальную стоимость.\n>>')
                        get_info_by_name_and_price(cursor, user_name_to_search.capitalize(), user_max_num_to_search)

                    case '6':
                        break


if __name__ == '__main__':
    main()