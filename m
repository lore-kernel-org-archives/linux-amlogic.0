Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20640C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73F5207B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73F5207B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bovtMAEkxMdzcLHVNrB6kIDOINdmbFniNKZLxKEYKSo=; b=phHcXI/f84kxZBP29NaTE4//E
	yuOjRtuDM4T82GOzyYjkxs5U+ZUvRAuPu8Kxh1wfnkRynhap/Z3aWVtBxiOUXNaOFs9cBuHE5g5Mc
	bjNH0m3afUHT0NkxGYK4JdUAml1cL5L1uyGYHaO35CH7JhcjFb1I7JQTlRhZEdZPGP0jGLIJXgaP+
	av7PaOwFgLf7Acv2aP1ocMKf2GzxJRDiAkJ7WGva5kIKV0R7TTCnAnWISDm5kgMGW/U6+PsUEjmGb
	hawHVB23pm2M6JT/lit1OPRFR1LlsHEuKH1uaMXH+7kL0CBL5d5Mz7OQv1OH5wYb3EStMmitV2uka
	KIujJYVqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvSg-0005eb-J0; Mon, 28 Dec 2020 16:33:34 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvSO-0005ZI-Do; Mon, 28 Dec 2020 16:33:17 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MmkfQ-1kCel42cH0-00joNN; Mon, 28 Dec 2020 17:33:04 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS8-0002Go-6X; Mon, 28 Dec 2020 17:33:01 +0100
Received: (nullmailer pid 32611 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:54 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 1/4] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date: Mon, 28 Dec 2020 17:32:14 +0100
Message-Id: <20201228163217.32520-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 467395612c70a9d75b41506b3ac52c2b
X-Provags-ID: V03:K1:z5bEGtgUEdxGujZwPS5GQOaXN0MpI1qWj1B7vXebONYPxe/kFgQ
 MvVlnj41sAwtgkdlDHXTKo20kYGG8QLw3pOWqa2U65YZqFf1JgWg6mgePtnR+Z1DSa9jlbN
 T+E1WvkdzoMZfROd8B2IRLjPQptkrEFpjF28qw0y7SwzAES6TV/3uYBXczizSuTvDggGt+j
 RnbFrvlq0041SsPOxsA7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j0TwOYU/4rw=:va139LkldRmqXSUsejaI0g
 qa+9GQNFDVQKwoVBKxp6Q1lxCXJ0b6/wPMFNTCLm0vNy7BbXvblwkgj3CqgXeFhmuL4zU45Wr
 GEY14YwiCc7fZ+d/4gXWjvSLBZnviGNBzJ8rmV+X9foVB0b1mY9iBNGDc50aFu0w+fC/ytYL2
 dFq0SDXi0Bf1Of+F8BRvRcLzMs9FWI3YwVZfbCSYWPF1sw7xodRVKvFlO/FdemjIvBf+b90zP
 ZY0CJe1IWyV72k84MbKSr87WPk3nq4WTPSzYWHMx7P9gCsB48E17p63f7z/NB/4Mi7b7GHpiO
 v7BXY81i20fjnyPkpiuJ+INNjC2swqNGWGWljf/SC4UsvCHnj9YcIUvNNtGA9Nn8/+CojgsTz
 3Gk6ZEgeUd/+7vETcbX/F+qWNiTtW8B9ZCbspizFewaY6XhHYAcs1caNMNxIU8EM4tQSRqChz
 OoqtJHQ9jw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_113316_737218_FFDFAA90 
X-CRM114-Status: GOOD (  11.28  )
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
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
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
Acked-by: Jeff LaBundy <jeff@labundy.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v8 -> v9:
      * added forgotten Acked-by (Jeff LaBundy)
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
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
