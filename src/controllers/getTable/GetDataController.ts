import { Response, Request } from 'express';
import { GetDataService } from '../../services/getTable/GetDataService';

class GetDataController {
  async handle(req: Request, res: Response) {
    const { table, key, searchTable } = req.body;


    const getDataService = new GetDataService();

    const getTable = await getDataService.execute({
      table,
      key,
      searchTable
    })


    return res.json(getTable);
  }
}

export { GetDataController };