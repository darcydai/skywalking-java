Changes by Version
==================
Release Notes.

8.8.0
------------------

* **Split Java agent from the main monorepo. It is a separate repository and going to release separately**.
* Upgrade jdk 11 in dockerfile and remove unused java_opts.
* DataCarrier changes a `#consume` API to add properties as a parameter to initialize consumer when
  use `Class<? extends IConsumer<T>> consumerClass`.
* Support Multiple DNS period resolving mechanism
* Modify `Tags.STATUS_CODE` field name to `Tags.HTTP_RESPONSE_STATUS_CODE` and type from `StringTag` to `IntegerTag`, add `Tags.RPC_RESPONSE_STATUS_CODE` field to hold rpc response code value.
* Fix kafka-reporter-plugin shade package conflict
* Add all config items to `agent.conf` file for convenient containerization use cases.
* Advanced Kafka Producer configuration enhancement.
* Suport mTLS for gRPC channel.

#### Documentation

All issues and pull requests are [here](https://github.com/apache/skywalking/milestone/99?closed=1)

------------------
Find change logs of all versions [here](changes).
