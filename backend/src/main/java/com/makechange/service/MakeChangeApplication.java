package com.makechange.service;

import com.makechange.resources.*;
import io.dropwizard.Application;
import io.dropwizard.db.DataSourceFactory;
import io.dropwizard.migrations.MigrationsBundle;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class MakeChangeApplication extends Application<MakeChangeConfiguration> {

    public static void main(String[] args) throws Exception {
        new MakeChangeApplication().run(args);
    }

    private final MigrationsBundle<MakeChangeConfiguration> migration = new MigrationsBundle<MakeChangeConfiguration>() {
        @Override
        public DataSourceFactory getDataSourceFactory(MakeChangeConfiguration configuration) {
            return configuration.getDataSourceFactory();
        }
    };

    @Override
    public void initialize(Bootstrap<MakeChangeConfiguration> bootstrap) {
    }

    @Override
    public void run(MakeChangeConfiguration configuration, Environment environment) {

        environment.jersey().register(new ContributionResource());
    }
}