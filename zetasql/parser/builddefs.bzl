#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

""" Macros for the creation of parser test targets """

def gen_parser_test(filename):
    """ Create a parser_test using queries in testdata/<filename>.  """
    name = "parser_" + filename.replace(".", "_")
    datafile = "testdata/" + filename
    native.cc_test(
        name = name,
        size = "small",
        data = [datafile],
        deps = [":run_parser_test_lib"],
        args = ["--test_file=$(location " + datafile + ")"],
    )
