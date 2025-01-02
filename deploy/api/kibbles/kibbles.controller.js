"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.KibblesController = void 0;
const common_1 = require("@nestjs/common");
const kibbles_service_1 = require("./kibbles.service");
const auth_guard_1 = require("../auth/auth.guard");
let KibblesController = class KibblesController {
    constructor(kibblesService) {
        this.kibblesService = kibblesService;
    }
    async findAll() {
        return this.kibblesService.findAll();
    }
};
exports.KibblesController = KibblesController;
__decorate([
    (0, common_1.UseGuards)(auth_guard_1.AuthGuard),
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], KibblesController.prototype, "findAll", null);
exports.KibblesController = KibblesController = __decorate([
    (0, common_1.Controller)('kibbles'),
    __metadata("design:paramtypes", [kibbles_service_1.KibblesService])
], KibblesController);
//# sourceMappingURL=kibbles.controller.js.map