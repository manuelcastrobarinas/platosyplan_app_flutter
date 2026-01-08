# 📱 PLATOSYPLAN - App de Recetas y Planificación de Comidas

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.5.4+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![BLoC](https://img.shields.io/badge/State-BLoC-blueviolet)
![Material Design](https://img.shields.io/badge/UI-Material%20Design%203-blue)

**Plataforma para gestionar recetas de cocina y planificar comidas semanales**

[Características](#-características-principales) • [Arquitectura](#-arquitectura) • [Instalación](#-instalación) • [Documentación](#-documentación-técnica)

</div>

---

<img width="2048" height="1536" alt="project-f92bb46d-fc53-43e5-9d5a-29a418f0aae6" src="https://github.com/user-attachments/assets/2802d5c6-5e4b-4a5a-ac25-7f389c2dd239" />



## 🎯 ¿Qué es platosyplan?

**platosyplan** es una aplicación móvil Flutter que funciona como una plataforma completa de gestión de recetas de cocina similar a HelloFresh o Cookpad. Permite a los usuarios descubrir recetas, crear sus propias recetas con ingredientes e información nutricional detallada, y planificar comidas semanales de forma organizada.


<img width="2048" height="1536" alt="project-f92bb46d-fc53-43e5-9d5a-29a418f0aae6 (1)" src="https://github.com/user-attachments/assets/ca2f70c0-9d27-4169-a7b4-404f566d7273" />


### Propósito
- 📖 Explorar recetas con instrucciones paso a paso
- 👨‍🍳 Crear y publicar recetas completas
- 📅 Planificar comidas semanales personalizadas
- 🔒 Gestión de usuario con autenticación segura

---

## ✨ Características Principales

### 1. 🔐 Autenticación Completa
- Registro e inicio de sesión con JWT
- Almacenamiento seguro de tokens (Keychain/EncryptedSharedPreferences)
- Validación automática de sesión
- Gestión y actualización de perfil
<img width="200" height="600" alt="1" src="https://github.com/user-attachments/assets/6d00fca4-6f10-4275-8cf7-411cb5f6aabc" />
<img width="200" height="600" alt="2" src="https://github.com/user-attachments/assets/5285b089-3f54-47fe-b646-91032a91fc01" />

### 2. 📚 Gestión de Recetas

#### Ver Recetas
- Catálogo completo de recetas públicas con paginación
- Filtros por categoría, tiempo y dificultad
- Detalle completo: ingredientes, utensilios, tabla nutricional
- Sistema de calificación


<img width="200" height="600" alt="4" src="https://github.com/user-attachments/assets/313bc6d8-4d12-4cf4-bc41-444edd2aebec" />
<img width="200" height="600" alt="12" src="https://github.com/user-attachments/assets/65141c10-7afa-4a4b-8e45-f23ddc7a7420" />
<img width="200" height="600" alt="13" src="https://github.com/user-attachments/assets/e722ed8e-8270-466c-af8d-945c734216c4" />
<img width="200" height="600" alt="15" src="https://github.com/user-attachments/assets/c3bdea18-6c48-447a-b727-dc80910b90a7" />


#### Mis Recetas
- Lista personal de recetas creadas
- Activar/desactivar visibilidad pública
- Gestión completa (editar, eliminar)
<img width="200" height="600" alt="6" src="https://github.com/user-attachments/assets/488fbcd2-2dc7-48b8-9c03-2643df854063" />

#### Crear Recetas (Proceso de 7 Pasos)
1. **Nombre y descripción** - Información básica
2. **Imagen principal** - Foto desde cámara o galería
3. **Tiempo y dificultad** - Categoría, tiempo de preparación, nivel
4. **Ingredientes** - Lista con cantidades y unidades
5. **Utensilios** - Equipamiento necesario
6. **Tabla nutricional** - 9 valores nutricionales (calorías, grasas, proteínas, etc.)
7. **Pasos de cocina** - Instrucciones detalladas con imágenes
<img width="200" height="600" alt="11" src="https://github.com/user-attachments/assets/9d10c1d7-1173-4957-8ee9-559b0352f48d" />
<img width="200" height="600" alt="10" src="https://github.com/user-attachments/assets/619f4b27-d449-4a70-b344-41e3c32c2514" />
<img width="200" height="600" alt="9" src="https://github.com/user-attachments/assets/3bb8cae0-57b8-4fb5-8060-c021a3dd19aa" />
<img width="200" height="600" alt="8" src="https://github.com/user-attachments/assets/a5f3306c-0cef-4292-b5b6-138a3fa7dfa9" />


### 3. 🍳 Pasos de Cocina Interactivos
- Carrusel horizontal con navegación swipe
- Timeline de progreso visual
- Ingredientes y utensilios específicos por paso
- Sincronización automática entre vistas

<img width="200" height="600" alt="7" src="https://github.com/user-attachments/assets/cd6f475e-f6a1-4fee-b73f-5db1a43eb501" />

### 4. 📅 Planificación de Comidas
- Selector de número de personas (1-5+)
- Comidas por semana configurables (3, 5, 7, 14, 21)
- Calendario semanal con recetas asignadas
- Vista organizada por días y tipo de comida

<img width="200" height="600" alt="3" src="https://github.com/user-attachments/assets/fcfad249-7c64-4dcd-b0a8-b8a0d2488c4b" />
<img width="200" height="600" alt="16" src="https://github.com/user-attachments/assets/777adb76-8a9f-4167-979d-2371b0252e04" />

### 5. 👤 Gestión de Perfil
- Información del usuario (nombre, email, teléfono)
- Edición de datos personales
- Estadísticas de uso
- Cierre de sesión seguro
<img width="300" height="700" alt="5" src="https://github.com/user-attachments/assets/abf8f825-bff9-44b3-82f2-5ecdbc7a2148" />

---

## 🏗️ Arquitectura

### Patrón: Arquitectura Limpia + BLoC

```
┌─────────────────────────────────┐
│   UI (Screens/Views)            │
└────────────┬────────────────────┘
             ↓
┌─────────────────────────────────┐
│   BLoC (Estado)                 │
│   • AuthBloc                    │
│   • RecipesBloc                 │
│   • PlanBloc                    │
│   • StepsBloc                   │
│   • SlidershowBloc              │
└────────────┬────────────────────┘
             ↓
┌─────────────────────────────────┐
│   Services (Lógica)             │
│   • AuthService                 │
│   • RecipeServices              │
│   • Interceptors                │
└────────────┬────────────────────┘
             ↓
┌─────────────────────────────────┐
│   Backend REST API              │
└─────────────────────────────────┘
```

### Estructura del Proyecto

```
lib/
├── bloc/              # Gestión de estado (BLoC Pattern)
├── models/            # Modelos de datos
├── services/          # Servicios y llamadas API
├── presentation/      # UI (screens y views)
├── components/        # Widgets reutilizables
├── routes/            # Configuración de rutas
├── utils/             # Utilidades
└── main.dart          # Punto de entrada
```

---

## 📊 Diagramas de Arquitectura

### Diagrama de Flujo BLoC Pattern

```mermaid
sequenceDiagram
    participant UI as UI Widget
    participant BLOC as BLoC
    participant SVC as Service
    participant API as Backend API
    
    UI->>BLOC: Dispara Event
    activate BLOC
    BLOC->>SVC: Llama método
    activate SVC
    SVC->>API: HTTP Request
    activate API
    API-->>SVC: Response
    deactivate API
    SVC-->>BLOC: Datos procesados
    deactivate SVC
    BLOC->>BLOC: Actualiza State
    BLOC-->>UI: Notifica cambio
    UI->>UI: Rebuild con nuevo State
    deactivate BLOC
```

### Diagrama de Flujo de Autenticación

```mermaid
flowchart TD
    START([App Start]) --> INTRO[IntroductionScreen]
    INTRO --> CHECK{¿Token existe?}
    
    CHECK -->|Sí| VALIDATE[Validar Token]
    CHECK -->|No| LOGIN[LoginScreen]
    
    VALIDATE --> VALID{¿Token válido?}
    VALID -->|Sí| NAV[NavegationScreen]
    VALID -->|No| LOGIN
    
    LOGIN --> LOGIN_FORM{Usuario ingresa datos}
    LOGIN_FORM -->|Correcto| GET_TOKEN[Recibe Token JWT]
    LOGIN_FORM -->|Incorrecto| ERROR[Mostrar Error]
    ERROR --> LOGIN
    
    LOGIN --> REGISTER[RegisterScreen]
    REGISTER --> REG_FORM{Usuario se registra}
    REG_FORM -->|Correcto| GET_TOKEN
    REG_FORM -->|Incorrecto| ERROR2[Mostrar Error]
    ERROR2 --> REGISTER
    
    GET_TOKEN --> SAVE_TOKEN[Guardar en SecureStorage]
    SAVE_TOKEN --> UPDATE_BLOC[Actualizar AuthBloc]
    UPDATE_BLOC --> NAV
    
    NAV --> HOME([Home])
```

### Diagrama de Flujo de Creación de Receta

```mermaid
flowchart TD
    START([Iniciar Creación]) --> STEP1[Paso 1: Nombre y Descripción]
    STEP1 --> STEP2[Paso 2: Seleccionar Imagen]
    STEP2 --> STEP3[Paso 3: Tiempo y Dificultad]
    STEP3 --> STEP4[Paso 4: Ingredientes]
    STEP4 --> STEP5[Paso 5: Utensilios]
    STEP5 --> STEP6[Paso 6: Tabla Nutricional]
    STEP6 --> STEP7[Paso 7: Pasos de Cocina]
    
    STEP7 --> VALIDATE{¿Datos completos?}
    VALIDATE -->|No| ERROR[Mostrar Error]
    ERROR --> STEP7
    VALIDATE -->|Sí| BUILD[Construir RecipeModel]
    
    BUILD --> FORMDATA[Preparar FormData]
    FORMDATA --> API_CALL[POST /recipes/create]
    API_CALL --> UPLOAD[Subir Imágenes]
    UPLOAD --> RESPONSE{¿Éxito?}
    
    RESPONSE -->|Sí| SUCCESS[Mostrar Éxito]
    RESPONSE -->|No| API_ERROR[Mostrar Error API]
    
    SUCCESS --> MY_RECIPES[Ir a Mis Recetas]
    MY_RECIPES --> END([Fin])
```

### Diagrama de Modelo de Datos

```mermaid
classDiagram
    class RecipeModel {
        +String id
        +String image
        +String name
        +String category
        +int calification
        +int timeCreate
        +String difficulty
        +String description
        +bool active
        +List~Ingredient~ ingredients
        +NutricionalTable nutricionalTable
        +List~Utensil~ utensils
        +List~StepCooking~ steps
    }
    
    class Ingredient {
        +String image
        +String name
        +double units
    }
    
    class Utensil {
        +String name
    }
    
    class NutricionalTable {
        +NutritionalTableElement calories
        +NutritionalTableElement fat
        +NutritionalTableElement saturedFat
        +NutritionalTableElement carbohidrate
        +NutritionalTableElement sugar
        +NutritionalTableElement protein
    }
    
    class NutritionalTableElement {
        +String name
        +int amount
    }
    
    class StepCooking {
        +String image
        +String description
        +List~Utensil~ utensiliosSteps
        +List~Ingredient~ ingredientsSteps
    }
    
    class UserModel {
        +String id
        +String name
        +String email
        +String phone
    }
    
    RecipeModel "1" --> "*" Ingredient
    RecipeModel "1" --> "*" Utensil
    RecipeModel "1" --> "1" NutricionalTable
    RecipeModel "1" --> "*" StepCooking
    NutricionalTable "1" --> "*" NutritionalTableElement
    StepCooking "1" --> "*" Ingredient
    StepCooking "1" --> "*" Utensil
```

### Diagrama de Navegación Principal

```mermaid
graph LR
    NAV[NavegationScreen] --> TAB1[Tab: Plan]
    NAV --> TAB2[Tab: Recetas]
    NAV --> TAB3[Tab: Perfil]
    
    TAB1 --> PLAN_VIEW[PlanView]
    PLAN_VIEW --> CREATE_PLAN[Crear Plan]
    
    TAB2 --> ALL_RECIPES[AllRecetsView]
    ALL_RECIPES --> RECIPE_DETAIL[RecipeView]
    RECIPE_DETAIL --> COOKING_STEPS[CookingStepsView]
    
    TAB3 --> PROFILE_VIEW[ProfileView]
    PROFILE_VIEW --> EDIT[EditProfileView]
    PROFILE_VIEW --> MY_REC[MyRecipesView]
    
    MY_REC --> CREATE_REC[Crear Receta]
    CREATE_REC --> STEP1[7 Pasos]
```

### Diagrama de Endpoints API

```mermaid
graph TB
    subgraph "AUTENTICACIÓN /api/v1/user"
        A1[POST /create]
        A2[POST /]
        A3[GET /me]
        A4[PATCH /update]
    end
    
    subgraph "RECETAS /api/v1/recipes"
        R1[GET /all]
        R2[GET /myrecipes]
        R3[POST /create]
        R4[PATCH /active]
    end
    
    subgraph "AUTORIZACIÓN"
        AUTH[JWT Token Required]
    end
    
    A1 --> TOKEN[Devuelve Token]
    A2 --> TOKEN
    TOKEN --> A3
    TOKEN --> A4
    TOKEN --> R2
    TOKEN --> R3
    TOKEN --> R4
    
    R1 -.Sin Auth.-> PUBLIC[Público]
    
    style A1 fill:#ff7622
    style A2 fill:#ff7622
    style A3 fill:#ffb872
    style A4 fill:#ffb872
    style R1 fill:#90EE90
    style R2 fill:#ffb872
    style R3 fill:#ffb872
    style R4 fill:#ffb872
```

---

## 💻 Stack Tecnológico

### Core
- **Flutter** 3.5.4+ - Framework multiplataforma
- **Dart** - Lenguaje de programación

### Gestión de Estado
- **flutter_bloc** ^8.1.6 - Patrón BLoC
- **bloc** ^8.1.4 - Core BLoC

### Networking
- **dio** ^5.7.0 - Cliente HTTP
- **flutter_dotenv** ^5.2.1 - Variables de entorno

### Seguridad
- **flutter_secure_storage** ^9.2.2 - Almacenamiento encriptado de tokens

### UI y Multimedia
- **flutter_svg** ^2.0.10+1 - Renderizado SVG
- **image_picker** ^1.1.2 - Captura de imágenes

### Utilidades
- **url_launcher** ^6.1.11 - Abrir URLs
- **cupertino_icons** ^1.0.8 - Íconos iOS

---

## 🚀 Instalación

### Requisitos Previos
- Flutter SDK 3.5.4 o superior
- Dart SDK
- Android Studio / Xcode (según plataforma)
- Backend API corriendo (ver [Backend Setup](#backend-setup))

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone <repository-url>
cd platosyplan_app_flutter
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Configurar variables de entorno**

Crear archivo `.env.dev` en la raíz del proyecto:

```env
BACKEND_URL=http://localhost:3000/api/v1
```

Para producción, crear `.env.prod`:

```env
BACKEND_URL=https://api.platosyplan.com/api/v1
```

4. **Ejecutar la aplicación**
```bash
# Desarrollo
flutter run

# Build Android
flutter build apk --release

# Build iOS
flutter build ios --release
```

### Backend Setup

⚠️ **IMPORTANTE**: Esta aplicación requiere un backend REST API corriendo.

El backend debe proporcionar los siguientes endpoints:

**Autenticación** (`/api/v1/user`)
- `POST /create` - Registro
- `POST /` - Login
- `GET /me` - Obtener perfil
- `PATCH /update` - Actualizar usuario

**Recetas** (`/api/v1/recipes`)
- `GET /all` - Obtener todas las recetas
- `GET /myrecipes` - Obtener recetas del usuario
- `POST /create` - Crear receta (multipart/form-data)
- `PATCH /active` - Activar/desactivar receta

---

## 📋 Documentación Técnica

### Modelos de Datos

#### RecipeModel
```dart
{
  "id": "uuid",
  "image": "url",
  "name": "Pasta Carbonara",
  "category": "Almuerzo",
  "calification": 5,
  "time_create": 30,
  "difficulty": "Medio",
  "description": "Descripción...",
  "active": true,
  "ingredients": [
    {"name": "Pasta", "units": 400.0, "image": "url?"}
  ],
  "nutricional_table": {
    "calories": {"name": "Calorías", "amount": 450},
    "fat": {"name": "Grasas", "amount": 18},
    // ... otros valores
  },
  "utensils": [{"name": "Olla grande"}],
  "steps": [
    {
      "image": "url",
      "description": "Instrucciones...",
      "utensilios_steps": [],
      "ingredients_steps": []
    }
  ]
}
```

#### UserModel
```dart
{
  "id": "uuid",
  "name": "Juan Pérez",
  "email": "juan@email.com",
  "phone": "573001234567",
  "CreatedAt": "2024-01-08T10:30:00Z",
  "UpdatedAt": "2024-01-08T10:30:00Z"
}
```

### BLoCs Principales

#### AuthBloc
- **Responsabilidad**: Autenticación y gestión de usuario
- **Métodos**: `registerNewUser()`, `loginSesion()`, `loadCredentials()`, `updateUser()`

#### RecipesBloc
- **Responsabilidad**: Gestión completa de recetas
- **Métodos**: `getAllRecipes()`, `getMyRecipes()`, `createRecipe()`, `changeActiveRecipe()`
- **Estado**: Almacena recetas y datos de creación (nombre, ingredientes, pasos, etc.)

#### PlanBloc
- **Responsabilidad**: Planificación de comidas
- **Estado**: `peopleActive`, `meelsPerWeek`

#### StepsBloc
- **Responsabilidad**: Pasos de cocina interactivos
- **Especial**: StreamSubscription al SlidershowBloc para sincronización

### Servicios

#### AuthService
- Gestión de tokens JWT
- Almacenamiento seguro (FlutterSecureStorage)
- Timeout: 5 segundos
- Auto-logout en caso de token inválido

#### RecipeServices
- Cliente Dio con AuthorizationInterceptor
- Soporte multipart/form-data para imágenes
- Manejo de errores personalizado

### Componentes Reutilizables

**Navegación**
- `ButtonComponent` - Botón principal con loading
- `DrawerComponent` - Menú lateral

**Formularios**
- `TextFormFieldComponent` - Input personalizado
- `CategorySelectorComponent` - Selector de categorías

**Multimedia**
- `SelectImageComponent` - Selector cámara/galería
- `SlideshowComponent` - Carrusel genérico

**Progreso**
- `TimelineVerticalComponent` - Timeline de pasos
- Loading states y animaciones

**Alertas**
- `ShowAlertComponent` - Diálogos personalizados
- `ShowScaffoldMessageComponent` - SnackBars

---

## 🎨 Diseño

### Paleta de Colores
- **Primario**: `#FF7622` (Naranja vibrante)
- **Secundario**: `#FFB872` (Naranja claro)
- **Fondo**: `#FFEBE4` (Melocotón)
- **Scaffold**: `#FFFFFF` (Blanco)

### Material Design 3
- Componentes modernos
- Animaciones fluidas
- Diseño responsivo (breakpoint: 600px)

### Navegación
Bottom Navigation Bar flotante con 3 tabs:
- 🍽️ **Plan** - Planificación de comidas
- 📖 **Recetas** - Catálogo de recetas
- 👤 **Perfil** - Gestión de usuario

---

## 🗺️ Flujo de Navegación

```
Introduction
    ↓
¿Token válido?
    ├─ Sí → Navegation (Home)
    └─ No → Login/Register
              ↓
         Navegation
         ├─ Plan
         ├─ Recetas
         │   ├─ Ver todas
         │   ├─ Mis recetas
         │   ├─ Crear (7 pasos)
         │   └─ Detalle → Pasos de cocina
         └─ Perfil
             ├─ Ver perfil
             └─ Editar perfil
```

### Rutas Definidas

```dart
'introduction'       → IntroductionView
'login'              → LoginView
'register'           → RegisterView
'navegation'         → NavegationScreen (Home)
'profile'            → ProfileView
'editprofile'        → EditProfileView
'myrecipes'          → MyRecipesView
'recipe'             → RecipeView
'allrecets'          → AllRecetsView
'cookingsteps'       → CookingStepsView

// Crear receta (7 pasos)
'nameanddescription' → Paso 1
'selectimagerecipe'  → Paso 2
'timedifficulty'     → Paso 3
'selectedingredients'→ Paso 4
'selectingutensils'  → Paso 5
'nutritionaltable'   → Paso 6
'sevencreatesteps'   → Paso 7

// Plan
'selectplan'         → Selección de personas
'selectmeels'        → Selección de comidas/semana
```

---

## 🔒 Seguridad

- **JWT Tokens**: Almacenados de forma segura
  - iOS: Keychain
  - Android: EncryptedSharedPreferences
- **Interceptores**: Agregan automáticamente autorización
- **Validación**: Cliente y servidor side
- **Auto-logout**: En caso de token inválido

---

## 📱 Capturas de Pantalla

### Introducción
- Carrusel de bienvenida con 5 slides SVG
- Verificación automática de sesión

### Autenticación
- Login con email y contraseña
- Registro completo con validaciones

### Navegación Principal
- Bottom Nav Bar flotante y moderno
- 3 secciones principales

### Recetas
- Catálogo completo con tarjetas visuales
- Detalle con toda la información
- Mis recetas con gestión

### Crear Receta
- Proceso guiado en 7 pasos
- Validaciones en cada paso
- Preview antes de crear

### Pasos de Cocina
- Carrusel interactivo
- Timeline de progreso
- Ingredientes por paso

### Planificación
- Selector de personas
- Calendario semanal
- Recetas asignadas

### Perfil
- Información del usuario
- Edición de datos
- Opciones de configuración

---

## 🔮 Mejoras Futuras

### Funcionalidades
- [ ] Sistema de favoritos
- [ ] Calificación y reviews de recetas
- [ ] Búsqueda avanzada con filtros
- [ ] Compartir recetas en redes sociales
- [ ] Lista de compras automática desde plan
- [ ] Notificaciones push
- [ ] Modo offline
- [ ] Soporte multi-idioma
- [ ] Temas claro/oscuro

### Técnicas
- [ ] Caché de imágenes
- [ ] Tests unitarios y de integración
- [ ] CI/CD pipeline
- [ ] Analytics y Crashlytics
- [ ] Deep linking
- [ ] Optimización web

---

## 🛠️ Comandos Útiles

```bash
# Desarrollo
flutter run                      # Ejecutar en debug
flutter run --release            # Ejecutar en release

# Build
flutter build apk --release      # Build Android
flutter build ios --release      # Build iOS
flutter build web                # Build Web

# Mantenimiento
flutter clean                    # Limpiar build
flutter pub get                  # Instalar dependencias
flutter pub upgrade              # Actualizar dependencias

# Testing
flutter test                     # Ejecutar tests
flutter analyze                  # Análisis estático
```

---


<div align="center">

**platosyplan** - Gestión de Recetas y Planificación de Comidas

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B?logo=flutter)](https://flutter.dev)
[![BLoC](https://img.shields.io/badge/State-BLoC-blueviolet)](https://bloclibrary.dev)

</div>
