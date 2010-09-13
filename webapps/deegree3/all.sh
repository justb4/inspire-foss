mvn clean install
cd target/deegree-tomcat
chmod +x *.sh */*.sh
mv ../deegree3.war webapps
./start-deegree.sh
cd -

