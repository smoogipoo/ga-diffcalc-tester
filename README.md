# GitHub Actions SR/PP Spreadsheet Generator

Wrapper over [diffcalc-sheet-generator](https://github.com/smoogipoo/diffcalc-sheet-generator) to generate spreadsheets using a self-hosted GitHub Actions runner.

## Requirements

Self-hosted runner with installed:
- `docker >= 20.10.16`
- `docker-compose >= 2.5.1`
- `lbzip2`

## Usage

The workflow can be run in two ways:
1. Via workflow dispatch.
2. By an owner of the repository posting a pull request or issue comment containing `!diffcalc`.  
For pull requests, the workflow will assume the pull request as the target to compare against (i.e. the `OSU_B` variable).  
Any lines in the comment of the form `KEY=VALUE` are treated as variables for the generator.

## Google Service Account

Spreadsheets are uploaded to a Google Service Account, and exposed with read-only permissions to the wider audience.

1. Create a project at https://console.cloud.google.com
2. Enable the `Google Sheets` and `Google Drive` APIs.
3. Create a Service Account
4. Generate a key in the JSON format.
5. Encode the key as base64 and store as an **actions secret** with name **`DIFFCALC_GOOGLE_CREDENTIALS`**

## Environment variables

The default environment may be configured via **actions variables**.

Refer to [the sample environment](https://github.com/smoogipoo/diffcalc-sheet-generator/blob/master/.env.sample), and prefix each variable with `DIFFCALC_` (e.g. `DIFFCALC_THREADS`, `DIFFCALC_INNODB_BUFFER_SIZE`, etc...).

