name := """e-choppe"""
organization := "fr.hop63"

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "3.3.5"
jooqVersion := "3.21.6"

enablePlugins(JooqCodegenPlugin)

libraryDependencies += guice
libraryDependencies += "org.postgresql" % "postgresql" % "42.7.11"
libraryDependencies += "org.postgresql" % "postgresql" % "42.7.11" % JooqCodegen
libraryDependencies += "org.scalatestplus.play" %% "scalatestplus-play" % "7.0.2" % Test

jooqCodegenConfig := file("db/jooq-config.xml")
jooqCodegenMode := CodegenMode.Unmanaged
Compile / jooqSource := crossTarget.value / "db"

// Adds additional packages into Twirl
//TwirlKeys.templateImports += "fr.hop63.e-choppe.app.controllers._"

// Adds additional packages into conf/routes
// play.sbt.routes.RoutesKeys.routesImport += "fr.hop63.e-choppe.app.binders._"
