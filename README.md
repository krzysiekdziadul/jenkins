# jenkins test

## Run Jenkins TestComplete

Configure these repository secrets under **Settings → Secrets and variables → Actions**:

- `JENKINS_URL`: Jenkins base URL, without a trailing slash.
- `JENKINS_USER`: Jenkins user allowed to trigger and stop the job.
- `JENKINS_API_TOKEN`: API token for that user.
- `JENKINS_JOB_TOKEN`: Build trigger token for `TestComplete QA tc-ui-automation (bareAgent)`.

In the **Actions** tab, select **Jenkins TestComplete**, click **Run workflow**,
and enter the required `testcomplete_url` (for example,
`s3://bucket/path/installer.exe`). The workflow waits for Jenkins and succeeds
only when the build result is `SUCCESS`; the build link appears in the run summary.

Jenkins must be reachable from the runner. If it is not reachable from the
internet, change `runs-on` in the workflow to `self-hosted` and use a runner with
access to Jenkins. Cancelling the workflow attempts to stop a started Jenkins build.
