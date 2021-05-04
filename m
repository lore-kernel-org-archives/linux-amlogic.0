Return-Path: <SRS0=bYYt=J7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09255C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 04:17:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7554561186
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 04:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7554561186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rwNlhApCFFOdnu0QPnG7X3FNLPuwZKNb0n+gs0h6vLY=; b=f7f4ykrsp3Y2Fsl4/mJVLTa/rg
	B2RVs8UzgItybQFyi8EKF8ahbKTsRQ+EQCXQv7AI8m3/+BTyHzfxaQN2j1MuGTUZ8luRID3BwohTH
	XGlUjdSqtCjO2Kewe9k/sYIms795JTNUkk3KNAcwjG9MnxErxzLqbhheuM2NP7rWU+hIt+9SsUQYs
	7syCXAa3I2HDMsk8S+YtUqsy08flJ0Z4Opqf/jydeXc+23hWjd0Aoe0dNQGVcKg69Oh+cwUxqqC5e
	aZ3eFxsytf9qvJ3x/ODNNAqPjLyncMeGCsyZf5xQtzozfqAsRd0HT5lsk1pbws1+LuwPOW3TsvyC5
	vss/YbgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldmUf-00FNDG-1K; Tue, 04 May 2021 04:17:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldmUd-00FND7-9u; Tue, 04 May 2021 04:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=kRBYMxt9nD+HU7ssayegHAsokCDFgDqK/wQv5JwUcKM=; b=za0S1HKNuGTCQV5H4ac2FeN7hR
 9LouQOYrLzr97HZD7Obb/AolDHLrLdQa+fcm6DBU/BZoLwjPhV02lecmeOw/p6wRarkmv7r6eYT+I
 ZJ7wWJoqV/VmpVj53zy/a4lH27554jRKKf0t8elFL0ZToP1EMe8hqQKXioshs5IKkArFmQcW8LI8g
 nwnznywTL+TktMO5F9JBwGd+I6KuG+9xD/EBp79N0V1rd6BNleFB7UymIQ0MmX482WUcq3OtrWCm5
 GyFg8vTrU6XVYeXkcq1vFm72NfnCOpd5vBa8PkRkIDZnC2ZHio001ixQe/JZEjX0ROlqF2jLZtxFY
 chQ4HDTQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldmUa-003fYO-Nf; Tue, 04 May 2021 04:17:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3980E61186;
 Tue,  4 May 2021 04:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620101823;
 bh=o6bzGyR/7bsRfnO0+aNVpGB5YWfLgC/3PIVf/41nDM0=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+1PwRv70pQbWWpiebMnyXuxFP4Rl6TJAj0zZR4swW8eTU7D+e03Zu5RhRU8Ooq2C
 HZhviqCvI3JNE48XdbT1ZE1kAdn8/iLwPhjvzhLm1PfPwsuRhXKE4Vu6UcaHYza97N
 0LlhOZR0w6goBXHP7zDa+L47wIEwbYhQwdPREt3myftotS3h0DqLxlWF967sooTRPd
 r7OMRZoSCX9q3xnX8VMHlRFaDE+tHwArqvT1lDZtQiciP0KlnPSBkXtyAVRCFkgclZ
 Lt4IzEwUAWSGtmwqefHaeryKPywJYHqz3IzI1mZI7ExRdi+HBDevZQos/h5pQW1SkP
 iNbzJRD0Nvc3A==
Received: by wens.tw (Postfix, from userid 1000)
 id 4B92D5FBFA; Tue,  4 May 2021 12:17:00 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
Date: Tue,  4 May 2021 12:16:59 +0800
Message-Id: <20210504041659.22495-1-wens@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_211704_838964_7DC02713 
X-CRM114-Status: GOOD (  13.63  )
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

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:
  - added uart-has-rtscts property
  - added alias for uart_A

Hi Neil, Martin,

I dropped your review-bys since I added the UART alias and I'm not sure
what the policy for those are.

ChenYu
---
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7273eed5292c..f017a263784f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		serial0 = &uart_AO;
+		serial1 = &uart_A;
 		ethernet0 = &ethmac;
 	};
 
@@ -385,9 +386,20 @@ &uart_AO {
 
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
