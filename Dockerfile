FROM bitnami/kubectl:1.18.19

ENV TINI_VERSION=v0.19.0 \
    HELM_VERSION=v3.8.0 \
    KUBEDOG_VERSION=v0.6.3 

USER root

COPY . .

RUN sed -i 's?deb.debian.org?mirrors.aliyun.com?g' /etc/apt/sources.list \
#  && sed -i 's?security.debian.org?mirrors.aliyun.com?g' /etc/apt/sources.list \
 && apt-get update && apt-get install -y cron skopeo \
 && curl -L https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz -o /helm-v3.8.0-linux-amd64.tar.gz \
 && curl -L https://tuf.kubedog.werf.io/targets/releases/0.6.3/linux-amd64/bin/kubedog -o /usr/local/bin/kubedog \
 && curl -L https://github.com/krallin/tini/releases/download/v0.19.0/tini -o /usr/local/bin/tini \
 && cd / \
 && chmod +x /usr/local/bin/tini \
 && tar -zxf helm-v3.8.0-linux-amd64.tar.gz \
 && rm -rf helm-v3.8.0-linux-amd64.tar.gz \
 && cp linux-amd64/helm /usr/local/bin/helm \
 && rm -rf linux-amd64 \
 && chmod +x /usr/local/bin/helm \
 && chmod +x /usr/local/bin/kubedog \
 && chmod +x init.sh \
 && mkdir /.kube/ \
 && mv kubeconfig /.kube/config

ENTRYPOINT ["/usr/local/bin/tini","--","/init.sh"]

CMD ["cron","-f","-l","2"]
