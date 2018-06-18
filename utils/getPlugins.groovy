List<String> jenkinsPlugins = new ArrayList<String>(Jenkins.instance.pluginManager.plugins)
jenkinsPlugins.sort { it.getShortName() }
  .each { plugin ->
  println ("${plugin.shortName}:${plugin.version}")
}
