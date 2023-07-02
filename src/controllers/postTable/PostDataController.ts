import { Request, Response } from "express";
import { PostDataService } from "../../services/postData/PostDataService";

class PostDataController {
  async handle(req: Request, res: Response) {
    const { table, ...data } = req.body;
    const postDataService = new PostDataService();
    console.log(table, data);
    const postData = await postDataService.execute({
      table,
      data,
    });

    return res.json(postData);
  }
}

export { PostDataController };
