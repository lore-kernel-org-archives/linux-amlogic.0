Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154C1C4727F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:48:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7709C20C09
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A4KXQMXE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7709C20C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3wmtWWTxgunbFMyFCtd4aRxjd9XQC0Uk+FMPBHdArJg=; b=A4KXQMXEfjvUgCEq+q6quUYkg
	TeTRc/QEUisE2OgByxDlGmqWPm8ng5UayHM2sYXK/h4QquLkk+iRp9ZIVhIpOgFbYdZcuLQGHUdHp
	3FOQG9nuoXkIJmFmzEEsqwk7g2kRKtOWO/+UpGqbt4cSnCj6Bl87O1WLdiRhcTUks9QKMNbV37rND
	c33kaLESeEh0i2aW0X4HmzwrXg7WnlWzCasWaTy4T3Db4bbEqGpHucpQ4XG3ukSYoR6GIp2JvHEGs
	I0jDFX+bDx62S/L9mGPfNH+G94OIHgWEsCe36K9u+ytoM3/mZif15t+P7n3LxIfIW6tZJsF1EZBVU
	Vx30KlT8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNlpG-0000QV-Jf; Wed, 30 Sep 2020 23:47:58 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNlp6-0000Mc-8G; Wed, 30 Sep 2020 23:47:49 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sQ6-1kJuCR17Ok-0050dZ; Thu, 01 Oct 2020 01:47:37 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlos-0007ZT-EL; Thu, 01 Oct 2020 01:47:35 +0200
Received: (nullmailer pid 7769 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:34 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date: Thu,  1 Oct 2020 01:46:33 +0200
Message-Id: <20200930234637.7573-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 2beb02607f6eb8f9cf7f14ab96a8f994
X-Provags-ID: V03:K1:bP90eXR+w48aTn1ppXN+URCgE4TjDapabKR3j+t/0oN2he6UhS4
 m6ghKbSHJkVGW+jQn/1s17fu0hH++ewc1KAf1hb8c6rbXVTMJqhqGfghejlKAXTk2KnVt4u
 h8COnj2ZoHZ2irrHbvClLgCbfgW76zmIICkfLfSaLRqsttzfOoomDwOmdDJ9wQS0PwVO3A7
 j4ZxtfGDHC5halIijwdXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rgwX+3edwsM=:+F+Lk5lVZWeAg1oAkNSG2l
 SeNBwiXso4jjoA9hE5cjQmT5n1frhfkYKkSwkP8a+PRRUQk3OtDpB7imMHJcy/tyb1QhjucOx
 nTaigEyQCndAl7P1/tyOBj1iqi4pG8eXsFzwTmyO4++fa2WZ6GsanWGyNcFezGStaDM5JpGgx
 mDiNjkdTBAkvEfYa2KnfFKWPwfizSuQums2wQqeqEdQgrqPjbvBUPq6DuGEmZ3Gf5L4vvRdDY
 H3kNDrfmtK/HGq71MqNte9mz/ZQlP3TiHqiYC2Z0ViB8FYTGhWs9OoJZZ+LlgigwRLu3d+LAb
 QByBZNMQU+xQxc83GT6CmOzDkrhHMoUG6n/OZJTC2slrWkinAwZJ8/8UXhChLua1odpvo+eaC
 jyZdaaZALVM29FucV6cqPi70jJiZaXO+Zk/CzYw79AsXA5KiHPvIwoGMcRCmvAmGGR3+XQ0h8
 UKa4FPHw1WIm4/pxlj/Ux1wxmGodnkQsN+jTugFS1Q3RKfEWOkcWpDL26bWy9ynkk/pxXhEFx
 jhJZE3mkhzPFXAGqMDBNkGjYsdQo9xRiXYG9FJc1k8BGgQtHbj4PMJO2rUskedyqNjcfhCXMD
 pQ58YgwQsyFFeM06xF0W51AvBYs3vdSK66cQ3p8i+tO0yurEJKYM2tIulI8on3Ewl1ei4DbmC
 fGuUkIVAUO81ELOJAu+TfxWclLAKO63cwGNfldBu2hW4zNV9wIpSmCbkHzLT8h7uTAVR4syt7
 l6UxZrGSMg2flMZpQ/1gnTrQ+euWQnpB7tL5PdiDHevMhJo18i4EF1LCJ6OFMhgxH0olQQQBN
 BeaDR6IfQd7ypj/La2v4cK7MtSCIur+WrysyIE8UB0CpHTr1YadNhb1kkz5B/W6muFmzLHw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_194748_789152_F03BD17E 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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
