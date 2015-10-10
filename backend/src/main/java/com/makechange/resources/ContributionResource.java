package com.makechange.resources;

import com.codahale.metrics.annotation.Timed;
import io.dropwizard.hibernate.UnitOfWork;
import com.makechange.utils.*;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("/contribution")
@Produces(MediaType.APPLICATION_JSON)
public class ContributionResource {


    private PlaidUserClient plaidUserClient;
    private CloseableHttpClient httpClient;
    private HttpDelegate httpDelegate;
    private TransactionsResponse response;
    private List<Transaction> transactions;

    public ContributionResource() {
        httpClient = HttpClients.custom().disableContentCompression().build();

        httpDelegate = new ApacheHttpClientHttpDelegate("https://tartan.plaid.com", httpClient);
        plaidUserClient = new DefaultPlaidUserClient.Builder()
                .withHttpDelegate(httpDelegate)
                .withClientId("test_id")
                .withSecret("test_secret")
                .build();

        Credentials testCredentials = new Credentials("plaid_test", "plaid_good");
        response = plaidUserClient.addUser(testCredentials, "amex", "test@test.com", null);

        transactions = response.getTransactions();
    }

    @GET
    @Timed
    @UnitOfWork
    @Path("getTotalDonation")
    public Double getTotalDonation() {
        Double total = new Double("0");
        for (Transaction transaction: transactions) {
            total = total + (Math.ceil(transaction.getAmount()) - transaction.getAmount());
        }

        return total;
    }

    @GET
    @Timed
    @UnitOfWork
    @Path("getTotalPayment")
    public Double getTotalPayment() {
        Double total = new Double("0");
        for (Transaction transaction: transactions) {
            System.out.println(transaction.getAmount());
            total = total + transaction.getAmount();
        }

        return total;
    }

    @GET
    @Timed
    @UnitOfWork
    @Path("getNumberOfPurchases")
    public Integer getNumberOfPurchases() {
        return transactions.size();
    }
}

