from .liga_rezultati import Utakmica


def dohvati_kola(last_season, objects):
    kola_list = []
    for kolo in objects:
        broj_kola = kolo.get('kolo')
        utakmice_izabranog_kola = Utakmica.objects.all().filter(
            kolo=int(broj_kola), sezona=last_season)
        kola_list.append(utakmice_izabranog_kola)
    return kola_list


def after_first_ch(some_txt, index):
    lower_ch = []
    while index < len(some_txt):
        if some_txt[index].islower():
            ch = some_txt[index]
            lower_ch.append(ch)
            index += 1
        elif some_txt[index].isspace():
            break
        else:
            print('posle velikog slova ide malo slovo')
    while index < len(some_txt) and some_txt[index].isspace():
        index += 1
    lower_ch.append(' ')
    return ''.join(lower_ch), index


def is_valid(some_txt):
    index = 0
    final_list = []
    while index < len(some_txt):
        while index < len(some_txt) and some_txt[index].isspace():
            index += 1
        while index < len(some_txt) and some_txt[index].isalpha():
            if some_txt[index].isupper():
                final_list.append(some_txt[index])
                index += 1
                temp_str, index = after_first_ch(some_txt, index)
                final_list.append(temp_str)
            else:
                print('Prvo slovo mora da bude veliko')

    return ''.join(final_list)


def main():
    test_str = '  By   Br   Knn    '
    valid = is_valid(test_str)
    print(valid)


main()
