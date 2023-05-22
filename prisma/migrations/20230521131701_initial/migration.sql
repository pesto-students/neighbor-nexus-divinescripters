/*
  Warnings:

  - You are about to drop the column `access_token_expires` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `compound_id` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `provider_account_id` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `provider_id` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `provider_type` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `user_id` on the `Account` table. All the data in the column will be lost.
  - You are about to drop the column `access_token` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `session_token` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `Session` table. All the data in the column will be lost.
  - You are about to drop the column `age` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `bio` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `email_verified` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `VerificationRequest` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[provider,providerAccountId]` on the table `Account` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sessionToken]` on the table `Session` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `provider` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `providerAccountId` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Account` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sessionToken` to the `Session` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Session" DROP CONSTRAINT "Session_userId_fkey";

-- DropIndex
DROP INDEX "Account_compound_id_key";

-- DropIndex
DROP INDEX "account_provider_account_id_idx";

-- DropIndex
DROP INDEX "account_provider_id_idx";

-- DropIndex
DROP INDEX "account_user_id_idx";

-- DropIndex
DROP INDEX "Session_access_token_key";

-- DropIndex
DROP INDEX "Session_session_token_key";

-- DropIndex
DROP INDEX "session_access_token_idx";

-- DropIndex
DROP INDEX "session_session_token_idx";

-- DropIndex
DROP INDEX "session_user_id_idx";

-- AlterTable
ALTER TABLE "Account" DROP COLUMN "access_token_expires",
DROP COLUMN "compound_id",
DROP COLUMN "created_at",
DROP COLUMN "provider_account_id",
DROP COLUMN "provider_id",
DROP COLUMN "provider_type",
DROP COLUMN "updated_at",
DROP COLUMN "user_id",
ADD COLUMN     "expires_at" INTEGER,
ADD COLUMN     "id_token" TEXT,
ADD COLUMN     "provider" TEXT NOT NULL,
ADD COLUMN     "providerAccountId" TEXT NOT NULL,
ADD COLUMN     "scope" TEXT,
ADD COLUMN     "session_state" TEXT,
ADD COLUMN     "token_type" TEXT,
ADD COLUMN     "type" TEXT NOT NULL,
ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Session" DROP COLUMN "access_token",
DROP COLUMN "created_at",
DROP COLUMN "session_token",
DROP COLUMN "updated_at",
ADD COLUMN     "sessionToken" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "age",
DROP COLUMN "bio",
DROP COLUMN "created_at",
DROP COLUMN "email_verified",
DROP COLUMN "updated_at",
ADD COLUMN     "emailVerified" TIMESTAMP(3);

-- DropTable
DROP TABLE "VerificationRequest";

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
