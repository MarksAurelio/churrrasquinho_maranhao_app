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
    id_PRIMEIRO = lista[i]['id_PRIMEIRO']
    nome_PRIMEIRO = lista[i]['nome_PRIMEIRO']
    id_microrregiao = lista[i]['id_microrregiao']
    nome_microrregiao = lista[i]['nome_microrregiao']
    id_mesorregiao = lista[i]['id_mesorregiao']
    nome_mesorregiao = lista[i]['nome_mesorregiao']

    sql = f"INSERT INTO estados(id_PRIMEIRO, nome_PRIMEIRO, id_microrregiao, nome_microrregiao, id_mesorregiao, nome_mesorregiao) VALUES({id_PRIMEIRO}, '{nome_PRIMEIRO}', {id_microrregiao}, '{nome_microrregiao}', {id_mesorregiao}, '{nome_mesorregiao}');"
    banco(sql)
    i = i + 1