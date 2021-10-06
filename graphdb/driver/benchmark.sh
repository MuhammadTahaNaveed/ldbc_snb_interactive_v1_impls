#!/bin/bash

set -e
set -o pipefail

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ..

java -cp target/jeeves-standalone.jar com.ldbc.driver.Client -P driver/benchmark.properties
