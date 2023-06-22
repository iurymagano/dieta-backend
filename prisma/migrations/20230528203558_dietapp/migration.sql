/*
  Warnings:

  - You are about to drop the `detailsUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `foods` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `likesFoods` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `meals` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `users` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "LikesPublications" DROP CONSTRAINT "LikesPublications_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Publications" DROP CONSTRAINT "Publications_meal_id_fkey";

-- DropForeignKey
ALTER TABLE "Publications" DROP CONSTRAINT "Publications_user_id_fkey";

-- DropForeignKey
ALTER TABLE "detailsUser" DROP CONSTRAINT "detailsUser_user_id_fkey";

-- DropForeignKey
ALTER TABLE "likesFoods" DROP CONSTRAINT "likesFoods_food_id_fkey";

-- DropForeignKey
ALTER TABLE "likesFoods" DROP CONSTRAINT "likesFoods_user_id_fkey";

-- DropForeignKey
ALTER TABLE "meals" DROP CONSTRAINT "meals_food_id_fkey";

-- DropForeignKey
ALTER TABLE "meals" DROP CONSTRAINT "meals_mealtime_id_fkey";

-- DropForeignKey
ALTER TABLE "meals" DROP CONSTRAINT "meals_user_id_fkey";

-- DropTable
DROP TABLE "detailsUser";

-- DropTable
DROP TABLE "foods";

-- DropTable
DROP TABLE "likesFoods";

-- DropTable
DROP TABLE "meals";

-- DropTable
DROP TABLE "users";

-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DetailsUser" (
    "id" TEXT NOT NULL,
    "peso" INTEGER NOT NULL,
    "altura" INTEGER NOT NULL,
    "idade" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "DetailsUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LikesFoods" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "food_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LikesFoods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Foods" (
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

    CONSTRAINT "Foods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Meals" (
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

    CONSTRAINT "Meals_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "DetailsUser" ADD CONSTRAINT "DetailsUser_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesFoods" ADD CONSTRAINT "LikesFoods_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesFoods" ADD CONSTRAINT "LikesFoods_food_id_fkey" FOREIGN KEY ("food_id") REFERENCES "Foods"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meals" ADD CONSTRAINT "Meals_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meals" ADD CONSTRAINT "Meals_food_id_fkey" FOREIGN KEY ("food_id") REFERENCES "Foods"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meals" ADD CONSTRAINT "Meals_mealtime_id_fkey" FOREIGN KEY ("mealtime_id") REFERENCES "MealTime"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Publications" ADD CONSTRAINT "Publications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Publications" ADD CONSTRAINT "Publications_meal_id_fkey" FOREIGN KEY ("meal_id") REFERENCES "Meals"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikesPublications" ADD CONSTRAINT "LikesPublications_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
