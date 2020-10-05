Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5DFC47095
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17EFC204EA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gku88thL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17EFC204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GB6Xev3J7CmMUhQMPUXGgVs5253kvA+RlmhbHhwXYzs=; b=gku88thLk3HcOmACVR+6NMaIS
	Xz88lGG9P/i4g0XiEnd0sBKXXfKECIaRnDd67ZQJrOM0CLwrq2JHsNIfFaNiYMGyRyoyqS/TBFlPg
	Ex9ucbTEd2cdIv3DRc1XTwq9jxOk/66pmz4rb/c2TLLEd+E1NDzxwuw9vz1QT9wrnr0gdAQ3wSG2F
	Y/+7b2ItEUPkJZFKGEVpzo9kHc7hnORJv68XNo9/CvySr4hYlo4dkfrz4YsqMbujVlDaS3VbZxBcT
	uzmcArtFXKomqZVvyApu92X2H4cY76t3H8lBgvLE0M2Dd2D7MPfgev62YS4WE4b76ECVCR+ji1JBu
	3xpRJUa9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXFB-0007Uo-8Z; Mon, 05 Oct 2020 20:38:01 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDW-0006XU-AJ; Mon, 05 Oct 2020 20:36:21 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MJVY8-1k5oV82ZaK-00JqZm; Mon, 05 Oct 2020 22:35:46 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXCw-0004VR-Ih; Mon, 05 Oct 2020 22:35:43 +0200
Received: (nullmailer pid 10325 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:37 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:42 +0200
Message-Id: <20201005203451.9985-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 4b5898d038d1415590f3a2ccc7ce21d7
X-Provags-ID: V03:K1:k0yiA9lyvy1/Zh9nh+0nofx8ISHoK3KZN7K2P4l768bFHrROa/O
 pwi2OA9dDAAdh+gXmQmP0vr4EtnzAiNh8Yslnw1T1V0Vv6ZPhJK0C2tTp4DqxQtaG27Tk3c
 +upi/Serv3087WaSsaFGKszSXwqNZvFniQ4W0uNIIk2AF92G48G515uvh/+htX+NW/+CPt4
 qtZBZo5LXWC3MSeOPaJLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pePHsAIg4/0=:6zFjBC1h9Q3yInlKRJzjXk
 GRvZrKsohZbuA9PZAJudVE3v6m7OUshdmj9zF5H82bmBZ6rm1oqDBJPO1sPkw28NkEL7Et/OP
 l9VImjVJlmYd2PN4bfc9xBqXJGMkW6FlGHBLUsIpVnOJBy8u2iC2s5uI+7Xqbp0zHXVBDWwE9
 thoMmf+V5bDhbQGb8j3R6HeqZQaMsZAg6QQpTO+hJbg0gN2MCKrJAipp6eijGtF6dKk98Hv1G
 GNqSYPtQsZlD5TD5Pk6IOHUrHVdyA8pT9BsKP9mZiXrMF6wgeplSktBEtRP7M2UA5NHN9KDSw
 aEsjeb2R2KP6xmLezzBh0uTl3G8LhhXT0KLqH7w0YNHPA9rhhFH0MCOh8bh1W8dah9kuDUgI4
 nR+ohcWZwuLboWOhglIY+5FT2iAyruZsyKP4PPNGkZm/lLAHqWAfb+ESTot3VxvyGeF7uK3zo
 lzBVG6LXHL+aW7CTfP0vIWugjs1KNL69CXEiyUy+hgEOlodWTfH6ydFjmdmeYv6y0gvpYiSEZ
 7rSFQE/COJN9a0WKZWu+ROAlnp25ymEku+s9ngCETEe/rjHCYMeL2rDXrPdQ6mfAScdLnmTlL
 XXxJ6j6SjIPbxPKIDfShc09LtV1+HbUZNX6+Kx9RxZgvi07hQZLPGL8n1mhWnQ0y8KKW52Rv/
 0B6D8lginTmCjvpHKXJbDPftBvI8BVDRe0ZD2IbC5Q3bMHtD3mNqTLQme3Bi3DZUZVvmgHegd
 ykG/07og7yADofWR1hO1eu0TXw+Wgd37WDhn1fT6WhBQDqsnBys3bgH36T3OkCEYu77Ye8BZN
 Skl5inys+DhbXebBsFzjz8XKe2/ilJeO/zANbw6fDkksuvrRHL5o0fP9kwPSQq2/4S5KnXr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163618_677245_6FEF585D 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
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
---

Notes:
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
