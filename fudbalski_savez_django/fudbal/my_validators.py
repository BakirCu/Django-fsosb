from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def check_lower_ch(some_txt, index):
    lower_ch = []
    while index < len(some_txt):
        if some_txt[index].islower():
            ch = some_txt[index]
            lower_ch.append(ch)
            index += 1
        elif some_txt[index].isspace():
            break
        elif not some_txt[index].isalpha():
            raise ValidationError(
                _('Smeju se koristiti samo slova'))
        else:
            raise ValidationError(
                _('Samo pocetno slovo moze biti veliko'))
    while index < len(some_txt) and some_txt[index].isspace():
        index += 1
    lower_ch.append(some_txt[index-1])
    return ''.join(lower_ch), index


def check_first_upper(some_txt):
    index = 0
    final_list = []
    while index < len(some_txt):
        if some_txt[index].isspace():
            index += 1
        elif index < len(some_txt) and some_txt[index].isalpha():
            if some_txt[index].isupper():
                final_list.append(some_txt[index])
                index += 1
                temp_str, index = check_lower_ch(some_txt, index)
                final_list.append(temp_str)
            else:
                raise ValidationError(
                    _('Prvo slovo mora biti veliko'))
        else:
            raise ValidationError(
                _('Smeju se koristiti samo slova'))
    return ''.join(final_list)
