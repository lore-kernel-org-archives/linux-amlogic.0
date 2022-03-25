Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE7C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 16:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYh0k+FNmj+sDfqC72gLCRmYqlk6hLT5qlN5IYAA5Cw=; b=zKo395Ns08O4sz
	BKmF6VlpKFOgQ2Gvum+dh6JC8ab6YTB6tHclwp7Twhtm/EwXKm9hWx4p/Vie17QIxdMHjrorNoJCL
	0FgCwi1inerm+JEVF9mkHgvPop1q2iln9fgQQjUuXiN0CSTSSk+rSSPDsTQxCbX1yx+AhBRCGZSeO
	pvPqt0mW0RurPSM6Nk+Lx6QbZbkfzthGV0sl/dE0fvCP4SxQd/FjuQG1omj0aKU1cVXOFF8f0+fj4
	T8atg1bG/vknFE/YJKJ1MYVQIQcX3gW8sjcyEnS3na5In64tHfLJsFRuZa+/d+fAkmyJogUeJW9/N
	Kq9gBQ/IBbAid+TScvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnDy-002eVm-8M; Fri, 25 Mar 2022 16:55:42 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnDX-002eJl-1E; Fri, 25 Mar 2022 16:55:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3278131FD9; Fri, 25 Mar 2022 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648227313; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=759V8GCMo8/v4gz2XHnDLRHPRulPKeOQ2ejVOii6Cqg=;
 b=UraC8yxZq38pDkOCRL/19YO+ULXzaYRpXBuHZFNUr/tPcauhlUTQTs05FOc5go9LPkLERp
 s3UHhi+jh1OaI1v8sZohHOJcmlRO4jpSfyhFt4epMm8jEQJNCTFuj/waVcm1pahgBWstag
 RMG5rzWjq4Qe15wCMXEdXaE6eu6pO8zdq50nNPc4gkIKy1cPmZUKzUBw3iIlVLGiZNbNMZ
 P2t+cvkPagTtHBtdOgIiL6/AukjlPvKAsynqY39r8kFraaHysjHKgl/rQ2ZT7+1oND657e
 g9qonnuKFzD1Gknr1IJVAbLx9o6HvHt9ZDXnT4ePX8PzoSMWraGFYhRox3RUxQ==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: meson: update SDIO in dts for JetHub D1
Date: Fri, 25 Mar 2022 19:55:01 +0300
Message-Id: <20220325165501.81551-4-adeep@lexina.in>
In-Reply-To: <20220325165501.81551-1-adeep@lexina.in>
References: <20220325165501.81551-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_095515_242238_33AA4BFD 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the dts to match board's reference design:
- update vddio_boot regulator to 3.3v (Wi-Fi SDIO module)
- add vccq_1v8 regulator with 1.8v for eMMC SDIO

In the first revision of JetHub D1 the vccq_1v8 regulator was 3.3v.
All installed eMMC modules were tested to work in HS200 mode at 3.3v
supply voltage. In the next revisions of the board eMMC will be
powered with 1.8v according to the standard.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
index 66c1eeba8f48..bc00d672a357 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
@@ -81,12 +81,22 @@ vddio_ao18: regulator-vddio_ao18 {
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vccq_1v8: regulator-vccq_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCCQ_1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		vin-supply = <&vddao_3v3>;
 		regulator-always-on;
 	};
 
+
 	usb_pwr: regulator-usb_pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR";
@@ -248,8 +258,7 @@ &sd_emmc_b {
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr104;
-	max-frequency = <200000000>;
+	max-frequency = <50000000>;
 	non-removable;
 	disable-wp;
 
@@ -282,7 +291,7 @@ &sd_emmc_c {
 	mmc-pwrseq = <&emmc_pwrseq>;
 
 	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&vddio_boot>;
+	vqmmc-supply = <&vccq_1v8>;
 };
 
 /* UART Bluetooth */
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
