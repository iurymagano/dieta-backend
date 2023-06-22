import prismaClient from "../../prisma";
import { hash } from "bcryptjs";

interface UserRequest {
  name: string;
  email: string;
  password: string;
}

class CreateUserService {
  async execute({ name, email, password }: UserRequest) {
    if (!email) {
      throw new Error("Email incorreto");
    }

    const userAldeadyExist = await prismaClient.users.findFirst({
      where: {
        email,
      },
    });

    if (userAldeadyExist) {
      throw new Error("Email já existente.");
    }

    const passwordHash = await hash(password, 8);

    const user = await prismaClient.users.create({
      data: {
        name,
        email,
        password: passwordHash,
      },
      select: {
        id: true,
        name: true,
        email: true,
      },
    });

    return user;
  }
}

export { CreateUserService };
