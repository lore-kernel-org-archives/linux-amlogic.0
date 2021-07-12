Return-Path: <SRS0=/T27=ME=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C7EC07E99
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 13:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E61160724
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jul 2021 13:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E61160724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BSIBjRQjmMaSpR1lBpmPqN+cuOCBTSqsxvvp6/wbUZk=; b=coQ7NIowJnAkQg
	fWsg0HK3QLYyiHQXOHgHuMri5AChWQ7wTqAxTfHvnGrk5GFlqzxO1sdDwSXVWjvdT/rbYiPCjziai
	K1Zt27xuc1rAjgZdriMtpYhjQ9pstcdhE+FNJuVL0jX1Dm8mTTOw5fJZDeH4HP8E508gHkiV0roq2
	mdupzBuTQSDK3XvvVyZiYU7sArvVFGOYn0wzc9mBiadHapFUHlOWtIuKLNZ6drcscTDGEUcZSwz2c
	L40u6xrFjAyhv8on2nlH1HbxC4sb3lWAkBsNqH2SC6A4cnm86EaTjADuP/KO+74dLp6rZ28Q/LFwF
	fQ6mJ6Y3dxWsRqrBBYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2wT1-007RwY-0w; Mon, 12 Jul 2021 13:59:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2wSy-007Rvq-To; Mon, 12 Jul 2021 13:59:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D27A761003;
 Mon, 12 Jul 2021 13:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626098364;
 bh=CVa9mOdD4iVXL47LeMVBbUqVDOCPCuh6G06o/IBjVAA=;
 h=From:To:Cc:Subject:Date:From;
 b=eJHp1t8b22M7dLCIWLFl17xaWR15lVo7pZYTSPilqbsKK3p20ZKV5cZOpNiFrE8EA
 dJvqwhFEHtJOti1SFV/srwm7dqfSTSTnsnadZaj20J7dAyxsb84Cthp2dTLPutvSub
 09q5U1ZT0VrlVrGqUwOInsQGubij6R/78hVJxjzeOTpEqHMtyVqGTzskdEAUFJqxR4
 jVX/yLUzQfszVTV2eRpCfxRnSaSeLBhhZ/u2dlP9VQmzsywn9aecO0Iqx49AxBIfGR
 h9vvcK6IM+SsRQUi1zH5jyXbvRsUQpReIcv9YYx6YDZlxVrUuK9cdX/Z6+FOxLtF/E
 rYPfjJa3EKWzQ==
Received: by wens.tw (Postfix, from userid 1000)
 id B0BF15FBF5; Mon, 12 Jul 2021 21:59:21 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
Date: Mon, 12 Jul 2021 21:59:19 +0800
Message-Id: <20210712135919.32059-1-wens@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_065925_032955_CB54AA23 
X-CRM114-Status: GOOD (  11.80  )
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

From: Chen-Yu Tsai <wens@csie.org>

The NanoPi K2 has a AP6212 WiFi+BT combo module. The WiFi portion is
already enabled. The BT part is connected via UART and I2S.

Enable the UART and add a device node describing the Bluetooth portion
of the module.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v2:
  - dropped alias for uart_A
  - added Martin's reviewed-by

Changes since v1:
  - added uart-has-rtscts property
  - added alias for uart_A
---
 .../arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7273eed5292c..7d94160f5802 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -385,9 +385,20 @@ &uart_AO {
 
 /* Bluetooth on AP6212 */
 &uart_A {
-	status = "disabled";
+	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&wifi_32k>;
+		clock-names = "lpo";
+		vbat-supply = <&vddio_ao3v3>;
+		vddio-supply = <&vddio_ao18>;
+		host-wakeup-gpios = <&gpio GPIOX_21 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 /* 40-pin CON1 */
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
