FROM cp.icr.io/cp/appc/ace-server-prod@sha256:f9b2b5e385f462d60a3fedf2aa7366b3bc304e971c89fafe6425cf2949a472c6
ENV LICENSE accept
COPY TestService /home/aceuser/TestService
RUN mkdir /home/aceuser/bars
RUN source /opt/ibm/ace-12/server/bin/mqsiprofile
RUN /opt/ibm/ace-12/server/bin/mqsipackagebar -a bars/TestService.bar -k TestService
RUN ace_compile_bars.sh
RUN chmod -R 777 /home/aceuser/ace-server/run/TestService