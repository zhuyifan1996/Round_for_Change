package com.makechange.utils;

import com.makechange.utils.*;

public interface PlaidUserClient {

    void setAccessToken(String accesstoken);

    String getAccessToken();

    PlaidUserResponse exchangeToken(String publicToken);

    TransactionsResponse addUser(Credentials credentials, String type, String email, ConnectOptions connectOptions) throws PlaidMfaException;

    TransactionsResponse mfaConnectStep(String mfa, String type) throws PlaidMfaException;

    AccountsResponse achAuth(Credentials credentials, String type, ConnectOptions connectOptions) throws PlaidMfaException;

    AccountsResponse mfaAuthStep(String mfa, String type) throws PlaidMfaException;

    AccountsResponse mfaAuthDeviceSelectionByDeviceType(String deviceType, String type) throws PlaidMfaException;

    AccountsResponse mfaAuthDeviceSelectionByDeviceMask(String deviceMask, String type) throws PlaidMfaException;

    TransactionsResponse updateTransactions();

    TransactionsResponse updateTransactions(GetOptions options);

    TransactionsResponse updateCredentials(Credentials credentials, String type);

    TransactionsResponse updateWebhook(String webhook);

    AccountsResponse updateAuth();

    MessageResponse deleteUser();

    AccountsResponse checkBalance();

    InfoResponse info(Credentials credentials, String type, InfoOptions options);

    TransactionsResponse addProduct(String product, ConnectOptions options);

    HttpDelegate getHttpDelegate();
}
