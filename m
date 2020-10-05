Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6220C47095
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:37:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77AC720853
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWg4bL1X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77AC720853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=skV16151XYrqxj3W/zEftEvP+2scAhTGrTmKItLxF94=; b=hWg4bL1XrjNYz+tujEyv6UioX
	yAip7UFnDh7cJz33o1vExAu/0HunvDyYN5MAxbvNXKe+3IFPT3pZWxTf8eoyfWzC/m6tnEvUdtl1m
	NVwFpe7rnND7UfRKMvI2tUpf9W7x86UUTqylkbOYIXVYaTQaIBAb2oQQISpKCJHVGlon1eJbFv+qJ
	dh2iwgWOpmkizPLuiqGfZpZ7t5ObDsNYyBbLEvh9I7wA9tIopzwu41uJLbb01Il4XPAAOn3VXTq4q
	8LMSuCvTtW2exhn3HVYxxd7Tg7xYrPseHAat5iJTe0zlvAnJ+E5Z5wdlF9dgi+aJL4xO7Bah2Mcqe
	91nCGZKyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXEl-0007E0-Ej; Mon, 05 Oct 2020 20:37:35 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDZ-0006Z3-PG; Mon, 05 Oct 2020 20:36:24 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvrRB-1khLB50vep-00syjW; Mon, 05 Oct 2020 22:35:56 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD7-0004Wl-3i; Mon, 05 Oct 2020 22:35:54 +0200
Received: (nullmailer pid 10382 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:40 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 09/12] ARM: dts: omap: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:48 +0200
Message-Id: <20201005203451.9985-10-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 45ec6910c78ac02328d2d17c1d0778f0
X-Provags-ID: V03:K1:tj7egiK6AuNaQWepjgZvHcM6M5lfa7UAR2P9ioUJ3RlNB4jyF7v
 evoYPhbCTvSeI8Op6s+vrsa+6ur+wHyp4SAMR3uXS+LOIsVmqJaZS9m1+Us1wtzVYWtjUUC
 7i1EcRWIR2GkZMhYamcXIZK5SXykWa4MAkqS1rtXB9aUaHPUHjC3rVEmOwCvUVZgBtd1Y4C
 lfn3rw3Xxo1YAgCsLMWUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jvtlnEnNPm8=:+oNI0rux+CbT7gXthF0CTY
 CDGiyW24Ps0ErOL3NWnOFJjIJCl9wHWn8AvEGroxKmzE2v5lzMtwXiK3i7y2d/Y3/1Yz8l4Xy
 jy4tOMS2DUxviDSgY8WRVLHSWtk2lkPfDYzcSsC2Xma4wSwZG0HqjFWayp9WDn4RPKBQ0ERNn
 pUIqGhFjy4Sh0SkuQ7koPP4CKABIVtRTLUyXHg3jgeBF6cn+ONCKtFChkwgow2EzaCPURLv3p
 DYEebmgnQdCdkBs9R6BRIHGnvHltmQTCRw9Y3eXye5jdB/8ZwyWO6vGxVA938GxYxy51cYdEY
 qow6U4UbcrZYjKabnE8D+Ib8QLgB5+qbDPG9HCRpLxVLyU1qnDVFjMD3aHCJNtggCnfNedxmg
 PeRFrlUYJq8rwMto57vld4CnRVU+HkSso3wCALw+wOdxOesX5xJqZ+F6GCmJFzj2wruaWDr0Z
 V3l+8MZDIquZq0/jZMH474O1k1V3TvlvARnkX8JdAU5VoGvtvd2NH2vorbQOulEODBuf8fMwZ
 B1tu9LZ3OZgv258ZiWlrQuirX9nWpj0+/gZ6PnC/qxHCkq6fXTq2kZxKC6FrVAHjtszWKYqw5
 M298G3+f80uNabZjs8DGjWGDTjK1gmJR3AV0E3pUGSiKyMvTv6RhMLkqBWS3d8UelKe3JPFNw
 M9/g7wxuti2lihIa2kjeLUnUuJM2xZP6wEnDegOuyzgFc8k3RZVjBwHGgn1dTMnLWybvNx1iV
 dyW96cGwYYLiJRzvm7peWiZr5Hn6DxuutMyNYoG8LHIaz8uwAm8+VoOs26by+LHJe+QFpbtsO
 9rn9nfnLt1OJLJxhJO4ZHk+CQp7uyGXEdEC5facXQ4rqxuGB4EXA8fcLSonblpkljvYH1x4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163622_090512_623ABB6B 
X-CRM114-Status: GOOD (  13.76  )
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
 Tony Lindgren <tony@atomide.com>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/omap3-beagle-xm.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-beagle-xm.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-beagle-xm.dt.yaml: pwmleds: 'pmu_stat' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-beagle-xm-ab.dt.yaml: pwmleds: 'pmu_stat' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-alto35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-alto35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-alto35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-chestnut43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-gallop43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-palo35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-palo35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-palo35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-palo43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-palo43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-palo43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-alto35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-chestnut43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-gallop43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-palo35.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-palo43.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-summit.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-tobi.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-storm-tobiduo.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-summit.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-summit.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-summit.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-tobi.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-tobi.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-tobi.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml
  CHECK   arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap3-overo-tobiduo.dt.yaml: pwmleds: 'overo' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap4-kc1.dt.yaml
  CHECK   arch/arm/boot/dts/omap4-kc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap4-kc1.dt.yaml: pwmleds: 'green', 'orange' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap4-sdp.dt.yaml
  CHECK   arch/arm/boot/dts/omap4-sdp.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap4-sdp.dt.yaml: pwmleds: 'charging', 'kpad' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
  DTC     arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
  CHECK   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: pwmleds: 'charging', 'kpad' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/omap3-beagle-xm.dts   | 10 +++++-----
 arch/arm/boot/dts/omap3-overo-base.dtsi |  4 ++--
 arch/arm/boot/dts/omap4-kc1.dts         |  6 +++---
 arch/arm/boot/dts/omap4-sdp.dts         | 26 +++++++++++++------------
 4 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-beagle-xm.dts b/arch/arm/boot/dts/omap3-beagle-xm.dts
index 05077f3c75cd..cbeab697b89f 100644
--- a/arch/arm/boot/dts/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/omap3-beagle-xm.dts
@@ -34,26 +34,26 @@
 		clock-frequency = <26000000>;
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		heartbeat {
+		led-1 {
 			label = "beagleboard::usr0";
 			gpios = <&gpio5 22 GPIO_ACTIVE_HIGH>; /* 150 -> D6 LED */
 			linux,default-trigger = "heartbeat";
 		};
 
-		mmc {
+		led-2 {
 			label = "beagleboard::usr1";
 			gpios = <&gpio5 21 GPIO_ACTIVE_HIGH>; /* 149 -> D7 LED */
 			linux,default-trigger = "mmc0";
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		pmu_stat {
+		led-3 {
 			label = "beagleboard::pmu_stat";
 			pwms = <&twl_pwmled 1 7812500>;
 			max-brightness = <127>;
diff --git a/arch/arm/boot/dts/omap3-overo-base.dtsi b/arch/arm/boot/dts/omap3-overo-base.dtsi
index 971d3e250515..006a6d97231c 100644
--- a/arch/arm/boot/dts/omap3-overo-base.dtsi
+++ b/arch/arm/boot/dts/omap3-overo-base.dtsi
@@ -14,10 +14,10 @@
 		reg = <0 0>;
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		overo {
+		led-1 {
 			label = "overo:blue:COM";
 			pwms = <&twl_pwmled 1 7812500>;
 			max-brightness = <127>;
diff --git a/arch/arm/boot/dts/omap4-kc1.dts b/arch/arm/boot/dts/omap4-kc1.dts
index 31d856b58f8a..e59d17b25a1d 100644
--- a/arch/arm/boot/dts/omap4-kc1.dts
+++ b/arch/arm/boot/dts/omap4-kc1.dts
@@ -15,16 +15,16 @@
 		reg = <0x80000000 0x20000000>; /* 512 MB */
 	};
 
-	pwmleds {
+	led-controller {
 		compatible = "pwm-leds";
 
-		green {
+		led-1 {
 			label = "green";
 			pwms = <&twl_pwm 0 7812500>;
 			max-brightness = <127>;
 		};
 
-		orange {
+		led-2 {
 			label = "orange";
 			pwms = <&twl_pwm 1 7812500>;
 			max-brightness = <127>;
diff --git a/arch/arm/boot/dts/omap4-sdp.dts b/arch/arm/boot/dts/omap4-sdp.dts
index 79e7a41ecb7e..f5d7539a3668 100644
--- a/arch/arm/boot/dts/omap4-sdp.dts
+++ b/arch/arm/boot/dts/omap4-sdp.dts
@@ -45,58 +45,60 @@
 		regulator-boot-on;
 	};
 
-	leds {
+	led-controller-1 {
 		compatible = "gpio-leds";
-		debug0 {
+
+		led-1 {
 			label = "omap4:green:debug0";
 			gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>; /* 61 */
 		};
 
-		debug1 {
+		led-2 {
 			label = "omap4:green:debug1";
 			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>; /* 30 */
 		};
 
-		debug2 {
+		led-3 {
 			label = "omap4:green:debug2";
 			gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>; /* 7 */
 		};
 
-		debug3 {
+		led-4 {
 			label = "omap4:green:debug3";
 			gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>; /* 8 */
 		};
 
-		debug4 {
+		led-5 {
 			label = "omap4:green:debug4";
 			gpios = <&gpio2 18 GPIO_ACTIVE_HIGH>; /* 50 */
 		};
 
-		user1 {
+		led-6 {
 			label = "omap4:blue:user";
 			gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* 169 */
 		};
 
-		user2 {
+		led-7 {
 			label = "omap4:red:user";
 			gpios = <&gpio6 10 GPIO_ACTIVE_HIGH>; /* 170 */
 		};
 
-		user3 {
+		led-8 {
 			label = "omap4:green:user";
 			gpios = <&gpio5 11 GPIO_ACTIVE_HIGH>; /* 139 */
 		};
 	};
 
-	pwmleds {
+	led-controller-2 {
 		compatible = "pwm-leds";
-		kpad {
+
+		led-9 {
 			label = "omap4::keypad";
 			pwms = <&twl_pwm 0 7812500>;
 			max-brightness = <127>;
 		};
 
-		charging {
+		led-10 {
 			label = "omap4:green:chrg";
 			pwms = <&twl_pwmled 0 7812500>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
