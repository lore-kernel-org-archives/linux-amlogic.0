Return-Path: <SRS0=wDd0=FC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9C7C63798
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E7E20857
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uyl42kL2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E7E20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xqXlBL1Vkx9jmbACtYuvQAM0Ie7tM64T/f8kPo2g5OE=; b=Uyl42kL2icWs/NyQoCTEuBL4S
	e3/SRHj9mwcRz4liRC3uFr8kezCIG4YvEknlAPfWgfDA1X9/hFfLkVjsB/wEvmKd4ZVizjMPIfu2e
	dSc7TKpsmPCyTqq5qGmUhiil63DKRiuQraY5i5RFewJmZktFavRE7TZL5VnYmLQRCKr275LLfGQ6m
	raJXhI4BF6kL/9LRGh3mHPbJbDtbNd/p+bz1uFMYznVGem1AxZXtA+UTOiVC56drJGtkVUt0tIvjb
	8Egxrp8XO8qf5xxSaxH2eeZDfEOrp5x1GRF1LVGWV90JpLyyeCayZECsfwI0hyZBfFzzohnvN53WH
	VQZszLq3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj8BQ-00049c-N1; Sat, 28 Nov 2020 21:55:08 +0000
Received: from mout.kundenserver.de ([212.227.126.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj8BK-00047x-As; Sat, 28 Nov 2020 21:55:04 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M5fZ4-1kpCim2lxa-007CJv; Sat, 28 Nov 2020 22:54:50 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8B5-00028I-NS; Sat, 28 Nov 2020 22:54:48 +0100
Received: (nullmailer pid 4125 invoked by uid 2001);
 Sat, 28 Nov 2020 21:54:47 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 3/5] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date: Sat, 28 Nov 2020 22:53:51 +0100
Message-Id: <20201128215353.3991-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: b8844dc5d654d495a7d706217a0e2c12
X-Provags-ID: V03:K1:FlCDQkEi3tojBhZ6dJIeoMgPtn78ZGf5wr8Ko/avsnHZJq4p1IC
 IE9YE1Z9C2johS1RteZrR4nd12BKi46txMgnRLCBeeO95SIxxlxu1Ta+70tFG+yIrb61ChT
 y3q2Rkj8zuCjtaFbrGNVQ4LWnHKjtNg9ko/WM/ARG0zXLlHI7JGAFl/LlQhMJz5kfg5IGeV
 veu9ah73k+2AawmzZan1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tmzo1QhOPc0=:4DnXuAtSDLCQxrFLG9qEUS
 9SwB2A6+hgoBUsKhDST9tApq3bb4MI1Tx/nAkNtogLoaJWMudXkZBQWKmU6CFGqK7vXbHZi/t
 f2GjbAOJ54K8W0JSTYnEkZAsrVVVYr/aQ+4xSTRtl1W7ScBrlhWkXttDk55E3feZL70jVJ7J+
 YlK3RIvahhMrOta62iSo1HJhKib/Pn6VKcOcH2VWReuiAr/7dg+ihDapQm4wiECyQd7oK7v1g
 tDr+npEVbvz+O/Ejugbj+fUk9l+V1ui/bFWNcn+anVwLqmXS7itzIqpuFPT7d0UqzuhmqX+So
 4CZMnz3rjE/x0U2LYZ4vINWAha8O4eFw4/mnD2aKBqu54B1MyFCATZCLpCDaW+7wjWOS2uAs3
 x3ZBQ11O2eAqy5aZh1B6kZhYZFcYSiK44aHCFJZSbevVKteDtVH+gy+8SHT/sRZvBzDEWOYWL
 9QXkksN6AA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_165503_705270_B70E2A69 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
  CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
      * updated indexes and added comment (Ahmad Fatoum)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 1e5333fd437f..5ed58110d963 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,35 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-0 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-0 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		led-red {
+		/* led-1 to led-3 are part of a single RGB led */
+		led-1 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-2 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-3 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
