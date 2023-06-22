import prismaClient from "../../prisma";

interface GetDataRequest {
  table: string;
  key?: string;
  searchTable?: [];
}

class GetDataService {
  async execute({ table, key, searchTable }: GetDataRequest) {
    if (!table) {
      throw new Error('Não foi incluida "table"');
    }
    let getTable: any;
    if (table == "users") {
      getTable = await prismaClient[table].findMany({
        select: {
          id: true,
          name: true,
          email: true,
          created_at: true,
          updated_at: true,
          password: false,
        },
      });
    } else {
      getTable = await prismaClient[table].findMany();
    }

    if (!getTable) {
      throw new Error("Não foi encontrado a table" + table);
    }

    return getTable;
  }
}

export { GetDataService };
