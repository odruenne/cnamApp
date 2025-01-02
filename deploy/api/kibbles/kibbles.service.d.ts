import { Kibbles } from "./interfaces/kibbles.interface";
export declare class KibblesService {
    private readonly kibbles;
    constructor();
    findAll(): Promise<Kibbles[]>;
}
