import prismaClient from "../../prisma";
import { compare } from "bcryptjs";
import { sign } from "jsonwebtoken";

interface AuthRequest {
  email: string;
  password: string;
}

class AuthUserService {
  async execute({ email, password }: AuthRequest) {
    const user = await prismaClient.users.findFirst({
      where: {
        email,
      },
    });

    if (!user) {
      throw new Error("Email/Password inválido.");
    }

    const passowordMatch = await compare(password, user.password);

    if (!passowordMatch) {
      throw new Error("Email/Password inválido.");
    }

    const token = sign(
      {
        name: user.name,
        email: user.email,
      },
      process.env.JWT_SECRET || "",
      {
        subject: user.id,
        expiresIn: "30d",
      }
    );

    return {
      id: user.id,
      name: user.name,
      email: user.email,
      token,
    };
  }
}

export { AuthUserService };
