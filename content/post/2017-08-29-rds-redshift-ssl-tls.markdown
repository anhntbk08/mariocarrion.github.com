---
date: 2017-08-29
title: "SSL/TLS + RDS + Redshift"
description: "How to connect to RDS and Redshift using SSL"
url: /2017/08/29/ssl-tls-rds-redshift.html
---

## SQL Workbench/J + (Redshift / RDS)

[SQL Workbench/J](http://www.sql-workbench.net/) is Java program, recommended by AWS, to use for connecting to Redshift, if you're planning to connect to any cluster that enforces SSL you **must** take a look [at the documentation](http://docs.aws.amazon.com/redshift/latest/mgmt/connecting-ssl-support.html#connecting-ssl-support-java), the gist is the following (steps are assuming you're using MacOS, Linux instructions should be really similar):

1. Download the [certificate](https://s3.amazonaws.com/redshift-downloads/redshift-ssl-ca-cert.pem).
1. Import the certificate to your keystore, something like: `keytool -keystore ${JAVA_HOME}/lib/security/cacerts -import -alias redshift -file <file.pem>`; follow the prompt and make sure you use the default password `changeit`.
3. Update your `sqlworkbench.sh` to append the required java parameters to properly load the new store, something like this:

```
exec $JAVACMD \
  -Djavax.net.ssl.trustStore=$JAVA_HOME/lib/security/cacerts -Djavax.net.ssl.trustStorePassword=changeit \
  -Dvisualvm.display.name=SQLWorkbench -Xmx1024m -cp $cp workbench.WbStarter $@
```

Also, do not forget to append `ssl=true` to your connection string, and that **should do it**.

Please notice this is the _best case scenario_, I always prefer downloading the **tar.gz** from the [manual downloads page](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) add manually update the `PATH` to the user folder, in other cases when using the installer you **will need** to do more to accomplish what you just read above.

For Microsoft Windows things are bit _simpler_ however you still have to consider permissions when modifying the `cacerts` file.

## RDS

Similar to _SQL Workbench/J_, connecting to RDS+SSL requires:

1. Downloading the [certificate](https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem)
1. Updating your connecting string to:
  1. Use certificate
  1. Force the `sslmode`

In practical terms this means modifying your connecting string, in Rails you can easily do this by modifying the `config/database.yml`, in [PostreSQL](https://www.postgresql.org/docs/9.3/static/libpq-connect.html) adding the following should be enough:

{{< highlight yaml >}}
sslrootcert: /path/to/rds-combined-ca-bundle.pem
sslmode: require
{{< / highlight >}}

For MySQL something similar:

{{< highlight yaml >}}
sslca: /path/to/rds-combined-ca-bundle.pem
sslmode: 'REQUIRED'
{{< / highlight >}}
