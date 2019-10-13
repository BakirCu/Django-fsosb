from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


def after_first_ch(some_txt, index):
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
                _('Za naziv imena i prezimena mozes da koristis samo slova'))
        else:
            raise ValidationError(
                _('Posle velikog slova ide malo slovo'))
    while index < len(some_txt) and some_txt[index].isspace():
        index += 1
    lower_ch.append(some_txt[index-1])
    return ''.join(lower_ch), index


def check_validation_of_txt(some_txt):
    index = 0
    final_list = []
    while index < len(some_txt):
        if some_txt[index].isspace():
            index += 1
        elif index < len(some_txt) and some_txt[index].isalpha():
            if some_txt[index].isupper():
                final_list.append(some_txt[index])
                index += 1
                temp_str, index = after_first_ch(some_txt, index)
                final_list.append(temp_str)
            else:
                raise ValidationError(
                    _('Prvo slovo reči mora da bude veliko'))
        else:
            raise ValidationError(
                _('Za naziv imena i prezimena mozes da koristis samo slova'))
    return ''.join(final_list)
