import requests  
import mysql.connector  

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

url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'


# execução da requisção
response = requests.get(url)

# mostrar o retorno
lista = response.json()

# loop para mostrar todos os itens
i = 0
while i < len(lista):
    id = lista[i]['id']
    sigla = lista[i]['sigla']
    nome = lista[i]['nome']  
    sql = f"INSERT INTO estados(id, sigla, nome) VALUES({id}, '{sigla}', '{nome}');"
    banco(sql)
    i = i + 1