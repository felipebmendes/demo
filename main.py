# -*- coding: utf-8 -*-
from app import create_app

application = create_app()

print('starting....')

if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)