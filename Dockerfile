# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ARG BASE_IMAGE='adoptopenjdk/openjdk8:alpine'

FROM alpine AS cli

WORKDIR /skywalking/bin

ARG CLI_VERSION=0.6.0

ADD https://archive.apache.org/dist/skywalking/cli/${CLI_VERSION}/skywalking-cli-${CLI_VERSION}-bin.tgz /
RUN tar -zxf /skywalking-cli-${CLI_VERSION}-bin.tgz -C / ; \
    mv /skywalking-cli-${CLI_VERSION}-bin/bin/swctl-${CLI_VERSION}-linux-amd64 /skywalking/bin/swctl

FROM $BASE_IMAGE

LABEL maintainer="kezhenxu94@apache.org"

ENV JAVA_TOOL_OPTIONS=-javaagent:/skywalking/agent/skywalking-agent.jar

WORKDIR /skywalking

ADD skywalking-agent /skywalking/agent

COPY --from=cli /skywalking/bin/swctl /usr/bin/swctl
