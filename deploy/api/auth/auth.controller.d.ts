import { AuthService } from './auth.service';
import { UsersService } from 'src/users/users.service';
import { UserDTO } from 'src/users/interfaces/userDTO.interface';
export declare class AuthController {
    private authService;
    private userService;
    constructor(authService: AuthService, userService: UsersService);
    signIn(signInDto: Record<string, any>): Promise<string>;
    getProfile(login: string): Promise<UserDTO>;
    updateProfile(lastName: string, firstName: string, mailAddress: string, postalAddress: string, zipCode: string, city: string, country: string, login: string): Promise<UserDTO>;
}
