Return-Path: <SRS0=2X5a=XR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5DDC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Sep 2019 18:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0680B21D6C
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Sep 2019 18:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ntO4NCZu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKJDPtva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0680B21D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vryUAsFRBBaU9ggIe/LF8T8rJ003lNpgrfpYuUbxurE=; b=ntO4NCZu1GrqgA
	6D8Eu4ebJSpNGjgMQS3DLJbVatRKyE+rEfngFef0M767toYcOivGC/YHj+l/OlxIjcybsJUe5lIfh
	l1bvLZdrZd1cwkIukb66rwRgq9JXOxeFDJ6Vh/ocoCzP1UOwJ3coeeCxsN3g+Ebcv0cM61V5UmY4p
	Vx1r7oZIICsTv72VZerpo3ns6pLwvbdL1z9MCCBAFWRWgX2G2Ix3l7dg6dF7QPQbAcizgCm6I83kK
	IdeKplYKxSQGOqs4mrJ/+3CEw8fMqmB0CSWBeEaXYvpikcnrX5lWgTX6uy8/KrtbFMk4hIclMhd6M
	igt+LxgmDwjYujljl5BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iC6tb-0007dn-PJ; Sun, 22 Sep 2019 18:47:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iC6tZ-0007d7-1c
 for linux-amlogic@lists.infradead.org; Sun, 22 Sep 2019 18:47:42 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD27D2186A;
 Sun, 22 Sep 2019 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569178060;
 bh=ulMTkWJfiEqWgPk5C5vp6qg69ZA6Dm1K3OpYYqcV01o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QKJDPtva8wDMQPND42pSTsXL+rEUHK1o5HXENi2ak8ylF7ZcQoDr3Jzd9QR1nAc+6
 mQF9thTMe7Wdwshn5vxZUc2ZIaTZ6YfWlI7qrjYMTQQXM8AlT5PCaeIeRc/NrbgtnJ
 xYaeLyfMy4wYdw0A/22uRH8EM+0Pm1lDixnxr1N0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 136/203] arm64: dts: meson: fix boards regulators
 states format
Date: Sun, 22 Sep 2019 14:42:42 -0400
Message-Id: <20190922184350.30563-136-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184350.30563-1-sashal@kernel.org>
References: <20190922184350.30563-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_114741_124281_F01696A8 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit f9717178b9be9477877d4c3776c61ff56d854ddf ]

This fixes the following DT schemas check errors:
meson-gxbb-odroidc2.dt.yaml: gpio-regulator-tf_io: states:0: Additional items are not allowed (1800000, 1 were unexpected)
meson-gxbb-odroidc2.dt.yaml: gpio-regulator-tf_io: states:0: [3300000, 0, 1800000, 1] is too long
meson-gxbb-nexbox-a95x.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxbb-nexbox-a95x.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-gxbb-p200.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxbb-p200.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-gxl-s905x-hwacom-amazetv.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxl-s905x-hwacom-amazetv.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-gxbb-p201.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxbb-p201.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long
meson-g12b-odroid-n2.dt.yaml: gpio-regulator-tf_io: states:0: Additional items are not allowed (1800000, 1 were unexpected)
meson-g12b-odroid-n2.dt.yaml: gpio-regulator-tf_io: states:0: [3300000, 0, 1800000, 1] is too long
meson-gxl-s905x-nexbox-a95x.dt.yaml: gpio-regulator: states:0: Additional items are not allowed (3300000, 1 were unexpected)
meson-gxl-s905x-nexbox-a95x.dt.yaml: gpio-regulator: states:0: [1800000, 0, 3300000, 1] is too long

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts          | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts           | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi              | 4 ++--
 .../arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts   | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 4e916e1f71f76..1c2a9ca491c02 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -66,8 +66,8 @@
 		gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
 
-		states = <3300000 0
-			  1800000 1>;
+		states = <3300000 0>,
+			 <1800000 1>;
 	};
 
 	flash_1v8: regulator-flash_1v8 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index b636912a27157..afcf8a9f667b9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -75,8 +75,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 9972b1515da61..6039adda12eec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -77,8 +77,8 @@
 		gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
 
-		states = <3300000 0
-			  1800000 1>;
+		states = <3300000 0>,
+			 <1800000 1>;
 	};
 
 	vcc1v8: regulator-vcc1v8 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index e8f925871edfc..89f7b41b0e9ef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -46,8 +46,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 
 		regulator-settling-time-up-us = <10000>;
 		regulator-settling-time-down-us = <150000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
index 796baea7a0bfb..c8d74e61dec18 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
@@ -38,8 +38,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 26907ac829301..c433a031841f6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -38,8 +38,8 @@
 		gpios-states = <1>;
 
 		/* Based on P200 schematics, signal CARD_1.8V/3.3V_CTR */
-		states = <1800000 0
-			  3300000 1>;
+		states = <1800000 0>,
+			 <3300000 1>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
