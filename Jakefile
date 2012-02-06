namespace('test', function() {

  desc('Run unit tests.');
  task('unit', function() {
    console.log('Running unit tests...');
    jake.exec(['jasmine-node --coffee test/unit'], complete, {stdout: true});
  });
});

new jake.NpmPublishTask('slim-jim', []);

task('publish', ['npm:version', 'npm:package', 'npm:publish', 'npm:cleanup'], function() {
  console.log('custom');
});
