import requests  
import mysql.connector  

def banco(sql, params):
    conexao = mysql.connector.connect(
        host='localhost',
        database='pizzaria',
        user='root',
        password='senai@123'
    )
    cursor = conexao.cursor()
    cursor.execute(sql, params)
    conexao.commit()
    cursor.close()
    conexao.close()

url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'

# execução da requisição
response = requests.get(url)

# verificar o retorno (se a requisição foi bem-sucedida)
if response.status_code == 200:
    lista = response.json()

    # loop para inserir todos os estados
    for item in lista:
        # Extraindo os dados do JSON
        id_PRIMEIRO = item['id']
        nome_PRIMEIRO = item['nome']
        id_microrregiao = item['microrregiao']['id']
        nome_microrregiao = item['microrregiao']['nome']
        id_mesorregiao = item['microrregiao']['mesorregiao']['id']
        nome_mesorregiao = item['microrregiao']['mesorregiao']['nome']
        id_UF = item['microrregiao']['mesorregiao']['UF']['id']
        nome_UF = item['microrregiao']['mesorregiao']['UF']['nome']
        id_regiao = item['microrregiao']['mesorregiao']['UF']['regiao']['id']
        nome_regiao = item['microrregiao']['mesorregiao']['UF']['regiao']['nome']

        # Criando a consulta SQL com parâmetros
        sql = """
        INSERT INTO estados (id_PRIMEIRO, nome_PRIMEIRO, id_microrregiao, nome_microrregiao, 
        id_mesorregiao, nome_mesorregiao, id_UF, nome_UF, id_regiao, nome_regiao) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s);
        """

        # Parametrizando os valores para evitar SQL injection
        params = (id_PRIMEIRO, nome_PRIMEIRO, id_microrregiao, nome_microrregiao,
                  id_mesorregiao, nome_mesorregiao, id_UF, nome_UF, id_regiao, nome_regiao)

        # Executando a função que insere os dados no banco
        banco(sql, params)

else:
    print(f"Erro na requisição. Status code: {response.status_code}")
