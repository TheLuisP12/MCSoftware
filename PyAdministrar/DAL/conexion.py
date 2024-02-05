import mysql.connector

# Parámetros de conexión a la base de datos
host = 'localhost'
usuario = 'root'
contrasena = ''
base_datos = 'alquiler_inmuebles'

# Crear una conexión
conexion = mysql.connector.connect(
    host=host,
    user=usuario,
    password=contrasena,
    database=base_datos
)

# Crear un objeto cursor para ejecutar consultas SQL
cursor = conexion.cursor()

# Ejemplo de ejecución de una consulta
cursor.execute("SELECT * FROM propiedades")
resultados = cursor.fetchall()

# Mostrar los resultados
for fila in resultados:
    print(fila)

# Cerrar el cursor y la conexión cuando hayas terminado
cursor.close()
conexion.close()
