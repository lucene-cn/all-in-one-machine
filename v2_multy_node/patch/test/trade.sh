#!/usr/bin/env bash
source /etc/profile
if [ -f /root/.bashrc ]; then
    source /root/.bashrc
else
	if [ -f ~/.bashrc ]; then
		source ~/.bashrc
	fi
fi

export CL_HOME_DIR="$(cd "`dirname "$0"`"/..; pwd)"
source ${CL_HOME_DIR}/sbin/load-config.sh
source ${CL_SPARK_HOME}/bin/load-spark-env.sh


# Find assembly jar
SPARK_ASSEMBLY_JAR=
if [ -f "${CL_SPARK_HOME}/RELEASE" ]; then
  ASSEMBLY_DIR="${CL_SPARK_HOME}/lib"
else
  ASSEMBLY_DIR="${CL_SPARK_HOME}/assembly/target/scala-$SPARK_SCALA_VERSION"
fi

num_jars="$(ls -1 "$ASSEMBLY_DIR" | grep "^spark-assembly.*hadoop.*\.jar$" | wc -l)"
if [ "$num_jars" -eq "0" -a -z "$SPARK_ASSEMBLY_JAR" -a "$SPARK_PREPEND_CLASSES" != "1" ]; then
  echo "Failed to find Spark assembly in $ASSEMBLY_DIR." 1>&2
  echo "You need to build Spark before running this program." 1>&2
  exit 1
fi
if [ -d "$ASSEMBLY_DIR" ]; then
  ASSEMBLY_JARS="$(ls -1 "$ASSEMBLY_DIR" | grep "^spark-assembly.*hadoop.*\.jar$" || true)"
  if [ "$num_jars" -gt "1" ]; then
    echo "Found multiple Spark assembly jars in $ASSEMBLY_DIR:" 1>&2
    echo "$ASSEMBLY_JARS" 1>&2
    echo "Please remove all but one jar." 1>&2
    exit 1
  fi
fi

SPARK_ASSEMBLY_JAR="${ASSEMBLY_DIR}/${ASSEMBLY_JARS}"

export LIB_CLASS_EXEC_PATH=`find ${CL_HOME_DIR}/libexec/*| grep -v source | tr '\n' ':'|sed 's/:$//'`


${CL_JAVA_HOME}/bin/java  ${CL_CONF_UTILS} ${CL_CUSTOM_OPTS} -cp "${SPARK_ASSEMBLY_JAR}:${SPARK_CLASSPATH}" cn.lucene.plugins.autotest.TradeInsertTest "$@" 

