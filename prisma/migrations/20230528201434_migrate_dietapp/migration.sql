/*
  Warnings:

  - You are about to drop the `categories` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `items` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `products` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "items" DROP CONSTRAINT "items_product_id_fkey";

-- DropForeignKey
ALTER TABLE "products" DROP CONSTRAINT "products_category_id_fkey";

-- DropTable
DROP TABLE "categories";

-- DropTable
DROP TABLE "items";

-- DropTable
DROP TABLE "products";

-- CreateTable
CREATE TABLE "detailsUser" (
    "id" TEXT NOT NULL,
    "peso" INTEGER NOT NULL,
    "altura" INTEGER NOT NULL,
    "idade" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "detailsUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "likesFoods" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "food_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "likesFoods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "foods" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "kcal" INTEGER NOT NULL,
    "protein" INTEGER NOT NULL,
    "carbohydrate" INTEGER NOT NULL,
    "fat" INTEGER NOT NULL,
    "likes" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "foods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meals" (
    "id" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "kcal" INTEGER NOT NULL,
    "fata" INTEGER NOT NULL,
    "carbohydrate" INTEGER NOT NULL,
    "protein" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "user_id" TEXT NOT NULL,
    "food_id" TEXT,
    "mealtime_id" TEXT NOT NULL,

    CONSTRAINT "meals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealTime" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MealTime_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Publications" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "user_id" TEXT NOT NULL,
    "meal_id" TEXT NOT NULL,

    CONSTRAINT "Publications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LikesPublications" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "pubcation_id" TEXT NOT NULL,

    CONSTRAINT "LikesPublications_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "detailsUser" ADD CONSTRAINT "detailsUser_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "likesFoods" ADD CONSTRAINT "likesFoods_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "likesFoods" ADD CONSTRAINT "likesFoods_food_id_fkey" FOREIGN KEY ("food_id") REFERENCES "foods"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meals" ADD CONSTRAINT "meals_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meals" ADD CONSTRAINT "meals_food_id_fkey" FOREIGN KEY ("food_id") REFERENCES "foods"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meals" ADD CONSTRAINT "meals_mealtime_id_fkey" FOREIGN KEY ("mealtime_id") REFERENCES "MealTime"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Publications" ADD CONSTRAINT "Publications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Publications" ADD CONSTRAINT "Publications_meal_id_fkey" FOREIGN KEY ("meal_id") REFERENCES "meals"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesPublications" ADD CONSTRAINT "LikesPublications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesPublications" ADD CONSTRAINT "LikesPublications_pubcation_id_fkey" FOREIGN KEY ("pubcation_id") REFERENCES "Publications"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
