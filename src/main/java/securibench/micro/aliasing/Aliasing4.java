/*
   Copyright 2006 Benjamin Livshits

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 *//**
    @author Benjamin Livshits <livshits@cs.stanford.edu>
    
    $Id: Aliasing4.java,v 1.1 2006/04/21 17:14:27 livshits Exp $
 */
package securibench.micro.aliasing;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import securibench.micro.BasicTestCase;
import securibench.micro.MicroTestCase;

/** 
 *  @servlet description="simple aliasing with casts" 
 *  @servlet vuln_count = "1" 
 *  */
public class Aliasing4 extends BasicTestCase implements MicroTestCase {
	private static final String FIELD_NAME = "name";

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
       String name = req.getParameter(FIELD_NAME);
       String o1 = name;
       String o2 = name.concat("abc");
       String o3 = "anc";

       new File(o1);                              /* BAD */
       new File(o2);                              /* BAD */
       new File(o3);                              /* OK */
    }
    
    public String getDescription() {
        return "simple aliasing with casts";
    }
    
    public int getVulnerabilityCount() {
        return 1;
    }
}