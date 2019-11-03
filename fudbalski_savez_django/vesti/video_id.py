from urllib.parse import urlsplit, parse_qsl
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _
from PIL import Image
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
import sys


def embed_video(link):

    video_id = dict(parse_qsl(urlsplit(link).query))

    if video_id:
        return 'https://www.youtube.com/embed/' + video_id['v']
    elif urlsplit(link).netloc == 'youtu.be':
        return 'https://www.youtube.com/embed' + urlsplit(link).path
    else:
        raise ValidationError(
            _("Niste dobro iskopirali lik"))


def resize_image(image_obj, width_def, height_def):
    output = BytesIO()
    img_temp = Image.open(image_obj)
    if img_temp.height > height_def or img_temp.width > height_def:
        skale_factor_1 = img_temp.height / height_def
        skale_factor_2 = img_temp.width / width_def
        if skale_factor_1 > skale_factor_2:
            new_height = img_temp.height / skale_factor_1
            new_width = img_temp.width / skale_factor_1
        else:
            new_height = img_temp.height / skale_factor_2
            new_width = img_temp.width / skale_factor_2
        img_temp_rez = img_temp.resize((int(new_width), int(new_height)))
        img_temp_rez.save(output, format="JPEG", quality=85)
        output.seek(0)
    return InMemoryUploadedFile(output, 'ImageField', "%s.jpg" % image_obj.name.split(
        '.')[0], 'image/jpeg', sys.getsizeof(output), None)
