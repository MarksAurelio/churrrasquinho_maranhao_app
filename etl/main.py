import requests  # pip install requests
import mysql.connector  # pip install mysql-connector-python

# função para conectar o banco de dados
def banco(sql):
    conexao = mysql.connector.connect(
        host='localhost',
        database='pizzaria',
        user='root',
        password='senai@123'
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()

# Endereço de onde vamos acessar
url = 'https://api.anota.ai/clientauth/nm-category/menu-merchant?displaySources=DIGITAL_MENU'
# token de autorização
headers = {
    'Authorization':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHBhZ2UiOiI2NGY4ZTUwZGRlYTRkNDAwMTI2OTlmMzMiLCJpYXQiOjE3NDA0MzY3NTZ9.jfV56c8DTXYfcQSQPfac2Q8vzw60YnO_OfWJvJj7Cx8'
}
# execução da requisção
response = requests.get(url, headers=headers)

# mostrar o retorno
obj = response.json()
lista = obj['data']['menu']['menu'][1]['itens']

# loop para mostrar todos os itens
i = 0
while i < len(lista):
    titulo = lista[i]['title']
    descricao = lista[i]['description']
    preco = lista[i]['price']  
    sql = f"INSERT INTO pizza(sabor, ingredientes, preco) VALUES('{titulo}', '{descricao}', {preco});"
    banco(sql)
    i = i + 1

