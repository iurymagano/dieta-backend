import { Router } from "express";

import { CreateUserController } from "./controllers/user/CreateUserController";
import { AuthController } from "./controllers/user/AuthController";
import { DetailUserController } from "./controllers/user/DetailUserController";
import { isAuthenticated } from "./middlewares/isAuthticated";
import { GetDataController } from "./controllers/getTable/GetDataController";
import { PostDataController } from "./controllers/postTable/PostDataController";

const router = Router();

/**------ users ------- */
router.post("/users", new CreateUserController().handle);
router.get("/me", isAuthenticated, new DetailUserController().handle);

/**------ login ------- */
router.post("/login", new AuthController().handle);

/**------ getdata metodo ------- */
router.post("/getdata", isAuthenticated, new GetDataController().handle);

/**------ getdata metodo ------- */
router.post("/postdata", isAuthenticated, new PostDataController().handle);

export { router };
