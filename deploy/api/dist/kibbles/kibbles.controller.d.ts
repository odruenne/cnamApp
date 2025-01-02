import { KibblesService } from './kibbles.service';
import { Kibbles } from './interfaces/kibbles.interface';
export declare class KibblesController {
    private readonly kibblesService;
    constructor(kibblesService: KibblesService);
    findAll(): Promise<Kibbles[]>;
}
