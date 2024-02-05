import mysql.connector

def conectar_base_datos():
    # Configura tu conexión a la base de datos
    host = 'localhost'
    usuario = 'root'
    contrasena = ''
    base_datos = 'alquiler_inmuebles'

    # Crea una conexión
    conexion = mysql.connector.connect(
        host=host,
        user=usuario,
        password=contrasena,
        database=base_datos
    )

    # Crea un cursor para ejecutar consultas SQL
    cursor = conexion.cursor()

    return conexion, cursor
