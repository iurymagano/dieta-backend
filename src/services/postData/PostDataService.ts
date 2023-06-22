import prismaClient from "../../prisma";

interface PostDataRequest {
  table: string;
  data: object;
}

class PostDataService {
  async execute({ table, data }: PostDataRequest) {
    if (!table) {
      throw new Error("Não foi incluido a table");
    }

    const postData = await prismaClient[table].create(data);
    if (!postData) {
      throw new Error("Algo aconteceu, tente novamente.");
    }

    return postData;
  }
}

export { PostDataService };
