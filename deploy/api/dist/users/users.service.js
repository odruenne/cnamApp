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
exports.UsersService = void 0;
const common_1 = require("@nestjs/common");
const usersData = require("./data/users.json");
const usersDTO = require("./data/usersDTO.json");
const fs = require("fs");
let UsersService = class UsersService {
    constructor() {
        this.users = [];
        this.usersDataDTO = [];
        this.users = usersData;
        this.usersDataDTO = usersDTO;
    }
    async findOne(login) {
        return this.users.find(user => user.login === login);
    }
    async getDataFromUser(login) {
        return this.users.find(user => user.login === login);
    }
    async updateUser(lastName, firstName, mailAddress, postalAddress, zipCode, city, country, login) {
        const userIndex = this.usersDataDTO.findIndex(user => user.login === login);
        this.usersDataDTO[userIndex] = {
            ...this.usersDataDTO[userIndex],
            lastName,
            firstName,
            mailAddress,
            postalAddress,
            zipCode,
            city,
            country,
        };
        try {
            fs.writeFileSync('./src/users/data/usersDTO.json', JSON.stringify(this.usersDataDTO, null, 2), 'utf8');
            return this.usersDataDTO[userIndex];
        }
        catch (error) {
            throw new Error(`Error: ${error.message}`);
        }
    }
};
exports.UsersService = UsersService;
exports.UsersService = UsersService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [])
], UsersService);
//# sourceMappingURL=users.service.js.map