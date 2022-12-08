read -p "Enter name of key: " key

ALIAS=$key
JKS="${ALIAS}.jks";
CERT="${ALIAS}.crt";
CACERT=/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home/lib/security/cacerts;

keytool -genkey -alias $ALIAS -keyalg RSA -keystore $JKS -ext san=dns:localhost
keytool -export -alias $ALIAS -file $CERT -keystore $JKS
keytool -import -alias $ALIAS -file $CERT -keystore $CACERT
echo "${ALIAS} ${JKS} ${CERT}";