camunda BPM - The open source BPM platform
==========================================

[![Build Status](https://travis-ci.org/camunda/camunda-bpm-platform.svg?branch=master)](https://travis-ci.org/camunda/camunda-bpm-platform)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/org.camunda.bpm/camunda-parent/badge.svg)](https://maven-badges.herokuapp.com/maven-central/org.camunda.bpm/camunda-parent)

camunda BPM platform is a flexible framework for workflow and process automation. It's core is a native BPMN 2.0 process engine that runs inside the Java Virtual Machine. It can be embedded inside any Java application and any Runtime Container. It integrates with Java EE 6 and is a perfect match for the Spring Framework. On top of the process engine, you can choose from a stack of tools for human workflow management, operations & monitoring.

* Web Site: https://www.camunda.org/
* Getting Started: https://docs.camunda.org/get-started/
* User Forum: https://forum.camunda.org/
* Issue Tracker: https://app.camunda.com/jira
* Contribution Guidelines: https://camunda.org/contribute/
* License: The source files in this repository are made available under the [Apache License Version 2.0](./LICENSE).

Components
----------

camunda BPM platform provides a rich set of components centered around the BPM lifecycle.

#### Process Implementation and Execution
 * camunda engine - The core component responsible for executing BPMN 2.0 processes.
 * REST API - The REST API provides remote access to running processes.
 * Spring, CDI integration - Programming model integration that allows developers to write Java Applications that interact with running processes.

#### Process Design
 * camunda modeler - A [standalone desktop application](https://github.com/camunda/camunda-modeler) that allows business users and developers to design & configure processes.

#### Process Operations
 * camunda engine - JMX and advanced Runtime Container Integration for process engine monitoring.
 * camunda cockpit - Web application tool for process operations.
 * camunda admin - Web application for managing users, groups, and their access permissions.

#### Human Task Management
 * camunda tasklist - Web application for managing and completing user tasks in the context of processes.

#### And there's more...

 * [bpmn.io](https://bpmn.io/) - Toolkits for BPMN, CMMN, and DMN in Java Script (rendering, modeling)
 * [Community Extensions](https://docs.camunda.org/manual/7.5/introduction/extensions/) - Extensions on top of Camunda BPM provided and maintained by our great open source community


A Framework
----------
In contrast to other vendor BPM platforms, camunda BPM strives to be highly integrable and embeddable. We seek to deliver a great experience to developers that want to use BPM technology in their projects.

### Highly Integrable
Out of the box, camunda BPM provides infrastructure-level integration with Java EE Application Servers and Servlet Containers.

### Embeddable
Most of the components that make up the platform can even be completely embedded inside an application. For instance, you can add the process engine and the REST Api as a library to your application and assemble your custom BPM platform configuration.


Building camunda BPM platform
----------

camunda BPM is available on maven central but for development of the platform, you have to add our public nexus repository to your maven settings.xml.
Add the following lines to it:

```xml
<profiles>
  <profile>
    <id>camunda-bpm</id>
    <repositories>
      <repository>
        <id>camunda-bpm-nexus</id>
        <name>camunda-bpm-nexus</name>
        <releases>
          <enabled>true</enabled>
        </releases>
        <snapshots>
          <enabled>true</enabled>
        </snapshots>
        <url>https://app.camunda.com/nexus/content/groups/public</url>
      </repository>
    </repositories>
  </profile>
</profiles>
<activeProfiles>
  <activeProfile>camunda-bpm</activeProfile>
</activeProfiles>
```

Apache Maven 3 and Java JDK 7/8 are prerequisites for building camunda BPM platform. Once you have setup Java and Maven, run

```
mvn clean install
```

This will build all the modules that make up the camunda BPM platform but will not perform any integration testing. After the build is completed, you will find the distributions under

```
distro/tomcat/distro/target     (Apache Tomcat 7 Distribution)
distro/jbossas7/distro/target   (JBoss AS 7 Distribution)
```
