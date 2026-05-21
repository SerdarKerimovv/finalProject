import { APIResponse, expect } from "@playwright/test";
import { APIRequestContext } from "@playwright/test";

interface LoginParams {
  request: APIRequestContext;
  email: string;
  password: string;
}

export class APIClient {
  // constructor(private request: APIRequestContext){}

  token: string;

  async login({ request, email, password }): Promise<string> {
    const url = process.env.BASE_URL! + "/api-auth/login";

    const response = await request.post(url, {
      headers: {
        Accept: "application/json",
      },
      data: {
        email: email,
        password: password,
      },
    });
    expect(response.status()).toBe(200);

    const responseBody = await response.json();
    return responseBody.token;
  }

  async getRequest({ request }, endpoint: string, token: string): Promise<APIResponse> {
    const url = process.env.BASE_URL! + endpoint;

    return await request.get(url, {
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${token}`,
      },
    });
  }

  async postRequest({ request }, endpoint: string, token: string, body: object): Promise<APIResponse> {
    const url = process.env.BASE_URL! + endpoint;

    return await request.post(url, {
      headers: {
        Accept: "application/json",
        Authorization: `Bearer ${token}`,
      },
      data: body,
    });
  }
}
