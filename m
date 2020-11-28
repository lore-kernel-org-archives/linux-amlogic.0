Return-Path: <SRS0=wDd0=FC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B00C63798
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:54:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB5C020857
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KtNDjRc4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB5C020857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=luLHkTHiOIj8RsULYxbM10W+MPQfLBx8gp1ZnC0YhGM=; b=KtNDjRc4IKS9kL0gRY5HefXGz
	jK5QnymgaAa49/JV8HCnabCWcflgLY2fg7Mnu0vxBov4flE96lg/2634pUVVRxAYDBcJ5G+Tzezof
	Ic2ECz8ZObRH2skW23QVn4Lej/ucQunXwdQu8JxJQQyqVZIsp/A3iznGnZ0c3J3pGq2mzOx6gjhia
	ZSgP+4wxroPNZVak5LBUF1H9V1kBgoLJzEYROuKg8cShBAqknO0+h4SSxIDE5FIis/lnB0IYt5Bp7
	yv37I3pdN9aLq5Waj8G1N8EssOc/zfPyFOy8UEhwocEZaZamvvW0m7lV/uQuLAMmUh8PfRTVTrUrA
	rRDG986ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj8B9-00045Y-3d; Sat, 28 Nov 2020 21:54:51 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj8B2-00044s-VP; Sat, 28 Nov 2020 21:54:46 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mbzdn-1kCp1h3pip-00dVpA; Sat, 28 Nov 2020 22:54:35 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8Ap-00027n-QE; Sat, 28 Nov 2020 22:54:33 +0100
Received: (nullmailer pid 4098 invoked by uid 2001);
 Sat, 28 Nov 2020 21:54:31 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 1/5] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date: Sat, 28 Nov 2020 22:53:49 +0100
Message-Id: <20201128215353.3991-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 53f17ed7acf4619e77ac9411375ac493
X-Provags-ID: V03:K1:EV7J6yS0bGPfutnvWVxMCCVlSgPwiskXwos5S6beCfiCo9yItBc
 VP7B501UjpYvDbqaI2nyNkcHkzh61wxAc9T6vG6yPKDIogjV5FQGR5Cuz5hqkLY1WwnXh+S
 SrLCNFf7dWlqZ3etQu8AuAe3VYnmp3Z7wt55/0Z9hb5Y0+C/2KTJTpxFdAIxYw5bdKgBvv9
 K4zjotGQiLPn+HdjITW8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ELxZVikg6TI=:PmypatW+rzOMpdxBmlAY1n
 EdFBUyFl74PH/aQCYuElzcbYc/o1pIlryiqJ/lRB9OEjdGS6ahQosWWII4CanGexPuhY79yDa
 /kCCTAHMK9v5s++x3s/ssR/w+WeIGiOHE7FoA5m8bueMTcEJWDnXYxjKDe5ArWKU/f5Am5qzc
 8/EoNSfStwQQI7EStFPMBEqyuTqf7S4n/4NHWqC9O+iyCE8ged/Ek4Vg9OAR1pYiuukqi6wNp
 fNM5SdUFIw6s/P0DPbMXRYLsjCypIi74xl9ohS87pwHygZ4/dbNR4IDdWYy/Ciu78w38tCCZv
 US86sU16i4I5Vx/952629q+pUPXPoSTGalk4qR+WUXPCSOhzenFmhcm+Uw8DbOSO5Jpilxnu9
 36kxQU4emB3a9Y+fck8F/eg7Id66dJgFm263GeC60oCEl3YzzWct7mLmzgGRKZsshSeILowJP
 N9PyGKn/yQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_165445_390157_DD3D0E22 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Jeff LaBundy <jeff@labundy.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
/home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
      * added Acked-by (Rob Herring)
    
    v6 -> v7:
      * added warning message to commit message (Krzysztof Kozlowski)
    
    v6:
      * added this patch to series

 Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 541b06d80e73..92dc48a8dfa7 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -90,10 +90,11 @@ examples:
             };
     };
 
-    pwmleds {
+    led-controller {
             compatible = "pwm-leds";
 
-            panel {
+            led-1 {
+                    label = "panel";
                     pwms = <&iqs620a_pwm 0 1000000>;
                     max-brightness = <255>;
             };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
