Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD7AC433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 06:09:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B664961434
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 06:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B664961434
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G9uqo48HFaxQYngSK/0MJTXJJdFPTJ/vI74pJGD9tQ8=; b=NAgzbeB2UooLHRZHMbtIZ2nRXr
	wdpcCK//o4dlV8bAJ92qolUd4Eqdo7KaDiXvT6q3uM4xDySWtw8vHB1FMdNpUzJ/6bL6POY7MXGh1
	/hM97gqEP1zcrPDO5rPYGRInGZlTwTAL5DugEqtz1lwmWCXGwfbF4ad7OZEToKvzHG/mD6Z174Jrg
	+35iM8EShIHPExNmrGw7Ccnzig8wgge7SjghQystFtPJQTEEANFawcfKM+NlqVymEcW1eG5Qg4ntD
	nNpWXL4Vcp8am6bEe0KDapjJss0amALYWFlJBdY+MLx1Zs9GMf9Q4kmkRYR1fCOj+dzPCYjTczMNz
	34oxnqaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbzr0-00507K-3s; Thu, 29 Apr 2021 06:08:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbzqx-005075-No; Thu, 29 Apr 2021 06:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ETaOrZmt96hZ7knTrNScqrF0QkVObII04kIuRqAjYU0=; b=gRErLOeD1J+YmuXXAGeufh00nH
 QG8nFVwBKOH5RuaF8mx3Sd6Wmlqwvvspdr/vG8w5Nlhb2TisYyPgn65JmBbK4pNuc+E4d2Cm/+zCA
 D0Pb7/KijFVkQpuf7GvDSxSXLMAYiJghYIAzD/8qqTlWSJElK0XUcKEu8TNzk8Lgh0tkVz8Bgf3ze
 l3Ho9y8I/Dl5B29nCn4t23AfdYrkWXMIZpY6YEoO3i9x+9/N//6MZJVTX7Q4pB5O1agRdyHPS1pcY
 XKbbfUcM0t3ERpDIayN1Rw93s+fvBek23v89KyP9uwKogXMDOeP/yy/QvJxVz4i7Q0i3cyy205tbO
 GQL3+wcw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbzqv-000Orm-72; Thu, 29 Apr 2021 06:08:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5FF261434;
 Thu, 29 Apr 2021 06:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619676524;
 bh=9dFSVbrkwUxIsVzVumyBgih3vCXCrFXuL4F7lB86YGk=;
 h=From:To:Cc:Subject:Date:From;
 b=Ix5mLXnNpkc19hshwNUZ+Il5Sd+D9IPVhzhUmSfY9R7tim4tl9dV7fd0rnh5pOXoT
 NLoKwJxcZCgXmgQcusLd6OKQ+UZcysyXzvcdl+KefM7dVDVeZdUwOX0zLhsdG/aqcq
 ngn2mHoyhOJiQd4g4kCPTVKL71byo5g2eXhT8/HuChYeVm0Ctr/oKnRtlu0Tujc8N2
 XkH/GqU4Qs2MGiIYVJ5T2Bi1WlMH7ZVLq0FSC5MkPAIuW445G/jZ/nFGEPTBs0pQLG
 W4jl1PQKdsNwmxSdY/1X/xDYWBM2kOyy5Qptb3l+tV+ZsUGLP9LECfzum+ioYfiOzK
 8y+8Q0wA4xlrA==
Received: by wens.tw (Postfix, from userid 1000)
 id 18AD15FBA4; Thu, 29 Apr 2021 14:08:41 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth
Date: Thu, 29 Apr 2021 14:08:30 +0800
Message-Id: <20210429060830.6266-1-wens@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_230845_330453_87437267 
X-CRM114-Status: GOOD (  10.79  )
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
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7273eed5292c..10f48fb1af61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -385,9 +385,19 @@ &uart_AO {
 
 /* Bluetooth on AP6212 */
 &uart_A {
-	status = "disabled";
+	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
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
