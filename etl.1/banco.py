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

url = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes'


# execução da requisção
response = requests.get(url)

# mostrar o retorno
lista = response.json()

# loop para mostrar todos os itens
i = 0
while i < len(lista):
    sigla = lista[i]['sigla']
    nome = lista[i]['nome']
    id = lista[i]['id']  
    sql = f"INSERT INTO regioes(nome, sigla, id) VALUES('{nome}', '{sigla}', {id});"
    banco(sql)
    i = i + 1