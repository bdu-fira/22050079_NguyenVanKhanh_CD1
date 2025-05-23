# Generated by Django 5.1.7 on 2025-05-10 10:00

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("auth", "0012_alter_user_first_name_max_length"),
        ("restaurant", "0004_alter_nguoidung_options"),
    ]

    operations = [
        migrations.CreateModel(
            name="Profile",
            fields=[
                (
                    "user",
                    models.OneToOneField(
                        db_column="ID",
                        on_delete=django.db.models.deletion.CASCADE,
                        primary_key=True,
                        serialize=False,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
                ("HoTen", models.CharField(db_column="HoTen", max_length=100)),
                ("Email", models.EmailField(db_column="Email", max_length=254)),
                ("SDT", models.CharField(db_column="SDT", max_length=20)),
                ("MatKhau", models.CharField(db_column="MatKhau", max_length=255)),
            ],
            options={
                "db_table": "NguoiDung",
                "managed": False,
            },
        ),
        migrations.DeleteModel(
            name="NguoiDung",
        ),
    ]
