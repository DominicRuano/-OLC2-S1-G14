# -OLC2-S1-G14

## Configuración Inicial

Ejecuta los siguientes comandos para iniciar el proyecto y configurar TypeScript, Peggy y las definiciones de tipo para Node:

```bash
npm init -y
npm install -D typescript
npm install -D peggy
npm install --save-dev @types/node
npx tsc --init
```

Esto creará un archivo `tsconfig.json`. Reemplaza su contenido con lo siguiente:

```json
{
  "compilerOptions": {
    "module": "NodeNext",
    "moduleResolution": "NodeNext",
    "target": "ES2021",
    "outDir": "dist",
    "skipLibCheck": true,
    "allowJs": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
```

## Instalación de Dependencias

Una vez completado el paso anterior, instala las dependencias del proyecto con:

```bash
npm install
```
