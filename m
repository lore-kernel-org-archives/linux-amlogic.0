Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CFDC47420
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:49:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6DA20BED
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dO+MLAKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB6DA20BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xyzOz++BC8ANBZ0E/w5r+um8nng4bB7vlg6K13Up0Tw=; b=dO+MLAKU/X7ZQpCQ8YUn6A2yn
	n7+ll/bMpDcixmMRTi65VyLg/HVeIkoGkaAHtYvluTrXeH/Jyo2Rl4XgzhDTeOlEeV0n0aGQZxUWG
	pwtNIoYGXsgqf9gvEdNQYXYwZjRDIAzp4J8FmSdyPEy7KOyfowT4Qj51patMz4WhJmA1Btlh+rc8w
	Z3hHnw+qI4ZyF8WnulDZCIWcUcZAmxfKDi6pkEpGfeagR2P5GNdNeIT0DJpTmfU6NYEbHodTYz699
	ZnRMRMDvfQL4Y4yNuekpaoLaB4y0iWEJ+oeK2zyIWkLjdwpek4JM2lbsPtVOtvUqC4Q7qCQgVQ2XH
	iQy6oCX2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNlqF-0000pF-30; Wed, 30 Sep 2020 23:48:59 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNlpP-0000U9-OS; Wed, 30 Sep 2020 23:48:09 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWiYo-1jvFXk1OsC-00X0F6; Thu, 01 Oct 2020 01:47:52 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlp7-0007a8-MI; Thu, 01 Oct 2020 01:47:50 +0200
Received: (nullmailer pid 7811 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:49 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v6 6/7] arm64: dts: meson: Fix schema warnings for pwm-leds
Date: Thu,  1 Oct 2020 01:46:36 +0200
Message-Id: <20200930234637.7573-7-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 57fe0bff746948a1c00c1c012c955907
X-Provags-ID: V03:K1:aZN4vsQ09FD4ST1oiQw/j/zmw/WZNfS+WwJm4ljdYqSrse6wOJB
 HIwUSHD8ea0pFYgoq2609uGTcfq+/wDtaLXxV06FrmGKixxlLClh9iiByk498n0mUczE2FF
 F/K5zjrNkCk6f5MbiWHQn7sUxo+NM/BUwyGjUIuw14TGdLjs4Kwa+ZFrJCRuLIfO/DnScWu
 5T8JxfvsL1SFxYJ42c6Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8xDsnToblKs=:i9D+lIxwSR0wVQMwoBhj0C
 Rqtkz1qmZN2Nl0cEKIBJVdazJUP0U1bfmAI1gMxMRw9uK7dQ6k0zAilbCgb8n+sJHDwhqvajm
 8D4MU3Q9ZMv8vfYxQVAVIjecyF18EkyoTLDsxk+cIWhKATA8Ay5qzFJnI6DMVO9r7UKuLldDB
 Y7lFpFiga2OQTbZ5/8kgacWgf7J39jp+XDU9K+6K4439EQ4UtobRug5DKV7A1k25F55dCWMn/
 0oCWvuNNtfyttSgZfF7PALNVathPbRrSF13N3E72yI4KRxGU8bvNHM7YeiBCDFO6XRW4yzAW2
 p5GkeiuJVwKUYyrlS6LqMEn9ywuubmDLSm7YDQ/tRjaAnisxEMpm/Gg1t6CO+vMXdc54cSWcn
 TCPPAEadao3O6Z5PXc044Dy344r6apnEin+phw8V+hTjLUbH0rrxWdNfFDsCfsO78E9PqZ+B7
 JDer4c4i8WK3tgSCPBGGumtVr8hwTxSlgpOxGF5PGGOuZqLMKCZut0A6Yyl6wlxD3yP9WYukc
 nc8hnRgimLHdc8hj1Nxp/Bfa+wyosCeAyLJDPifImFMUtrX6XSQ41b0U9i28gYDtYPMCFMPOL
 umgRJVSCIdtBs/O7K6vghrkGK6oP+UGq0eDb6UG/A7Z8OIIG+/9rbFs5tSlFLpTcl3f5ztS9H
 pnABQvVFhC9+jVq0fmpYsThPCUnt+wVgjkWIW+kKFlsvgyKOryqWAbRUPKSHxQ5vOnPqXM7Nn
 0qJXsTkMCOWsk60GhPxxPfskiblRy1U2GWMy4v7EQXWEe3Rzglf66ZXsbk4UVOgHBqJGoCYWt
 jnZK79D1kPyLWV2vTy6felafY+K8f83rWBIQybG7fHCHnpJIL+7+yMAEgzmNoIBKGRmMOsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_194808_111198_7EF9C57C 
X-CRM114-Status: GOOD (  13.32  )
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

 .../arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts     | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts          | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d0..adfc72500e66 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -42,10 +42,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..dcb435af4e0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -81,10 +81,10 @@
 		};
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		power {
+		led-1 {
 			label = "vim:red:power";
 			pwms = <&pwm_AO_ab 1 7812500 0>;
 			max-brightness = <255>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 5ab139a34c01..039a8d0d1e9b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -101,20 +101,20 @@
 		};
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		led-bluetooth {
+		led-1 {
 			label = "sei610:blue:bt";
 			gpios = <&gpio GPIOC_7 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 			default-state = "off";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		power {
+		led-2 {
 			label = "sei610:red:power";
 			pwms = <&pwm_AO_ab 0 30518 0>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
