from PRES import menu

def main():
    while True:
        menu.mostrar_menu()
        opcion = input("Ingrese el número de la opción deseada: ")
        if opcion == '4':
            break
        menu.ejecutar_opcion(opcion)

if __name__ == "__main__":
    main()