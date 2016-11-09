---
date: 2016-11-07T00:00:00Z
title: "Amazon Kinesis Firehose: One month later"
description: "We started using Amazon Kinesis Firehose on production one month ago. How was it?"
url: /2016/11/07/amazon-kinesis-one-month-ago.html
---

Since 2014 one of the things I've been trying to do with our services is to lean towards Data Streaming while breaking up all the monolithic-like services into much more specific ones. One of those services was the one in charge of receiving data and inserting into our [Data warehouse](https://aws.amazon.com/redshift/), the truth is that although the endpoint and the importer were separated it could not keep up with that amount of traffic we decided to track.

Enter [Kinesis Firehose](https://aws.amazon.com/blogs/aws/amazon-kinesis-firehose-simple-highly-scalable-data-ingestion/).

When _Kinesis Firehose_ was announced I knew for sure it will be great solution for our problem, but sadly I couldn't make the switch, lack of resources, different priorities and what not. **That** changed until recently, and oh boy what a nice change.

Not only we get the usual benefits of using **a** Data Stream, but also we can handle much more traffic and all the data is copied into Redshift with no problems. Now, the truth is there some things, not at lot, to consider when making this change.

## Redshift considerations

If you are familiar with Redshift, then you already know what to do, but if not keep at least the following things in mind:

* Values must be correctly escaped and truncated, use your COPY options wisely.
* When adding new columns to the schema make sure you use *FILLRECORD* in the COPY Command options in Kinesis.

## Kinesis considerations

* Sending data to Firehose takes time, make sure you send all of it asynchronously.
* Use **PutRecordBatch** and send as much data as possible, the [maximum is 4 MB](http://docs.aws.amazon.com/firehose/latest/dev/limits.html).

## Thoughts so far

I'm pleased with the performance of Kinesis Firehose and, obviously, Redshift; I'm also happy we have this ready and _battletested_ before the holiday season.
