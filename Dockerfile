# Copyright 2016 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM python:3.6.9-slim-buster

# Update to have latest images
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
	ca-certificates=20190110 \
	openssl=1.1.1d-0+deb10u2 \
	iproute2=4.20.0-2 \
	libpcap-dev=1.8.1-6 \
	wget=1.20.1-1.1 \
	build-essential=12.6 \
	git=1:2.20.1-2 \
	binutils=2.31.1-16 \
	libffi-dev=3.2.1-9 \
	libssl-dev=1.1.1d-0+deb10u2 \
	librdkafka-dev=0.11.6-1.1 \
	libzmq3-dev=4.3.1-4+deb10u1 \
	libxml2-dev=2.9.4+dfsg1-7+b3 \
	libxslt1-dev=1.1.32-2.2~deb10u1 \
	pkg-config=0.29-6 \
	python-pkgconfig=1.4.0-1 \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

# Install adapter requirements. pip is included in python dockerhub images
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Label image
ARG org_label_schema_version=unknown
ARG org_label_schema_vcs_url=unknown
ARG org_label_schema_vcs_ref=unknown
ARG org_label_schema_build_date=unknown
ARG org_opencord_vcs_commit_date=unknown

LABEL org.label-schema.schema-version=1.0 \
      org.label-schema.name=voltha-python-base \
      org.label-schema.version=$org_label_schema_version \
      org.label-schema.vcs-url=$org_label_schema_vcs_url \
      org.label-schema.vcs-ref=$org_label_schema_vcs_ref \
      org.label-schema.build-date=$org_label_schema_build_date \
      org.opencord.vcs-commit-date=$org_opencord_vcs_commit_date
