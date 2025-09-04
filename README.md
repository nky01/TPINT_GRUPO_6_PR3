# 🩺 TPINT_GRUPO_6_PR3 – Sistema de Gestión Clínica Médica

[![C#](https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white)](https://docs.microsoft.com/en-us/dotnet/csharp/) 
[![ASP.NET](https://img.shields.io/badge/ASP.NET-512BD4?style=for-the-badge&logo=asp.net&logoColor=white)](https://dotnet.microsoft.com/apps/aspnet) 
[![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](https://www.microsoft.com/en-us/sql-server)

Proyecto desarrollado como **Trabajo Integrador Final de Programación III** – UTN FRGP (3º Cuatrimestre 2025).  
Sistema web de gestión clínica para administrar pacientes, médicos y turnos, implementando buenas prácticas de desarrollo y arquitectura en capas.

---

## 📌 Descripción

El sistema permite administrar:

- Información de **pacientes**, **médicos** y **turnos**.  
- Roles de usuario diferenciados: **Administrador** y **Médico**.  
- **Seguridad y control de acceso** mediante login y sesiones.  
- **Informes estadísticos** procesados sobre turnos y asistencia.  

**Usuarios y datos precargados**:  
- Administradores, especialidades, provincias y localidades ya se encuentran cargados en la base de datos; no requieren altas ni modificaciones.  

---

## 🧩 Funcionalidades principales

### 🔐 Login
- Acceso diferenciado para **administrador** y **médico**.  
- Visualización del usuario activo en todas las pantallas.  
- Contraseñas protegidas con asteriscos y doble ingreso al asignar.

### 👨‍💻 Administrador
- **ABML de pacientes:** DNI, nombre, apellido, sexo, nacionalidad, fecha de nacimiento, dirección, localidad, provincia, correo, teléfono.  
- **ABML de médicos:** Legajo, DNI, nombre, apellido, sexo, nacionalidad, fecha de nacimiento, dirección, localidad, provincia, correo, teléfono, especialidad, días y horarios de atención.  
- Creación y modificación de usuarios y contraseñas de médicos.  
- **Asignación de turnos** por especialidad, médico, día, horario y paciente (1 hora de duración, sin solapamiento).  
- **Informes estadísticos** procesados: porcentaje de ausentes/presentes, listado de pacientes según estado.  

### 🩺 Médico
- Visualización de todos los turnos asignados con filtros y búsquedas.  
- Registro de **presentes/ausentes**.  
- Agregar **observaciones clínicas** a los pacientes presentes.

### 📊 Informes
- Estadísticas de asistencia, agregaciones (`SUM`, `AVG`, `COUNT`) y reportes por rango de fechas.  
- Información procesada, no simples listados.

---

## ✅ Requisitos cumplidos (TP Integrador)

2. Login y visualización de usuario activo.  
3. Listados paginados con **búsquedas y filtros** (`LIKE` para texto, rangos para fechas).  
4. Mensajes de confirmación y alertas.  
5. Arquitectura **tres capas**: Datos, Entidades, Negocio, Vistas.  
6. Bajas lógicas (no físicas).  
7. Validaciones de campos (no guardar vacíos, correo, números, textos).  
8. Modificación de registros con carga automática de datos.  
9. Manejo seguro de contraseñas.  
10. Evitar registros duplicados (ej: mismo DNI).  
11. Limpieza de controles luego de operaciones.  
12. Reportes con parámetros y estadísticas procesadas.  
13. Uso de **desplegables** para provincias, localidades y especialidades.  
14. Nombres de columnas claros en grillas (SQL `AS`).  
15. Base de datos cargada con **múltiples registros válidos** para pruebas.

---

## ⚙️ Tecnologías utilizadas

- **C#**
- **ASP.NET WebForms**  
- **SQL Server**
- **ADO.NET (tres capas)**  
- **HTML & CSS **

---

## 🗂️ Estructura del proyecto

```text
PINT_GRUPO_6_PR3/
│
├── Entidades/
│ ├── Clinica.cs
│ └── Entidades.csproj
│
├── Datos/
│ ├── AccesoDatos.cs
│ ├── DaoClinica.cs
│ └── Datos.csproj
│
├── Negocio/
│ ├── NegocioClinica.cs
│ └── Negocio.csproj
│
├── Vistas/
│ ├── Login/
│ │ └── Login.aspx
│ ├── Administrador/
│ │ ├── AdminVista.aspx
│ │ ├── Admin_Pacientes/
│ │ ├── Admin_Medicos/
│ │ └── Admin_Turnos/
│ ├── Médico/
│ │ ├── MedicoVista.aspx
│ │ ├── MedicoTurnos.aspx
│ │ └── MedicoCargar.aspx
│ └── Estilo CSS
│
├── MiraeLogo.png
├── Web.config
└── README.md
```
---

## 👾 Cómo ejecutar el proyecto

1. Clonar el repositorio o descargar el ZIP del proyecto.
2. Abrir la solución en Visual Studio.
3. Configurar la cadena de conexión a SQL Server.
4. Ejecutar el script de la base de datos para crear y poblar las tablas.
5. Ejecutar el proyecto (F5) y loguearse como administrador o médico.

---

## 🔒 Usuarios de prueba

**Administrador:**
- Usuario: `admin`
- Contraseña: `admin123`

**Médico:**
- Usuario: `med123`
- Contraseña: `pass123`


---

## 💻 Créditos

Proyecto desarrollado por **TPINT_GRUPO_6_PR3** para la materia **Programación III** - UTN FRGP - 2025
