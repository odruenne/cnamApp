"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.KibblesModule = void 0;
const common_1 = require("@nestjs/common");
const kibbles_controller_1 = require("./kibbles.controller");
const kibbles_service_1 = require("./kibbles.service");
let KibblesModule = class KibblesModule {
};
exports.KibblesModule = KibblesModule;
exports.KibblesModule = KibblesModule = __decorate([
    (0, common_1.Module)({
        controllers: [kibbles_controller_1.KibblesController],
        providers: [kibbles_service_1.KibblesService],
    })
], KibblesModule);
//# sourceMappingURL=kibbles.module.js.map