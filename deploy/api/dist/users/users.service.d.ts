import { User } from './interfaces/user.interface';
import { UserDTO } from './interfaces/userDTO.interface';
export declare class UsersService {
    private readonly users;
    private readonly usersDataDTO;
    constructor();
    findOne(login: string): Promise<User | undefined>;
    getDataFromUser(login: string): Promise<UserDTO | undefined>;
    updateUser(lastName: string, firstName: string, mailAddress: string, postalAddress: string, zipCode: string, city: string, country: string, login: string): Promise<UserDTO>;
}
