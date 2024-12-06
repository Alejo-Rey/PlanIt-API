#!/bin/bash

echo "🚀 Iniciando configuración del proyecto PlanIt-API..."

# Instalar gemas necesarias
echo "📦 Instalando gemas..."
bundle install

# Crear y migrar la base de datos
echo "💾 Creando y migrando la base de datos..."
rails db:create
rails db:migrate

# Cargar datos iniciales (si tienes seeds configurados)
if [ -f db/seeds.rb ]; then
  echo "🌱 Cargando datos iniciales (seeds)..."
  rails db:seed
fi

# Ejecutar pruebas (opcional, para verificar que todo está bien)
# echo "✅ Corriendo pruebas para verificar el proyecto..."
# bundle exec rspec || echo "⚠️ Algunas pruebas fallaron, revisa los logs."

# Avisar que todo está listo
echo "🎉 Proyecto configurado correctamente. ¡Listo para usar!"
