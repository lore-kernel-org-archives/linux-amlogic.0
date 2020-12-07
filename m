Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D428C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 17:58:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45D82389F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 17:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45D82389F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WgdaeBqJGbU06BRR0rLKynZjwueGsbTfXEIzElhr/Lw=; b=BYpe6nkqxtS2PUpGsELkVTW4e
	/B2j4EutsMeb9/aRclLthArQrDrnxwBZFQ4kTcH1+wKocdbH0/ldvPuYpsYikHNQVVpaNHDgKQZs0
	HUUafm/cTOUSpERTxhQ/KTiN3ZeU8/DrLDF/auyBRPbHwKdwReny7WVU/mXDXdEgTPMSWvjKslerR
	G4UqNDycohQb1thtvJYAPM/1LV/NDs9Z9ZoKsekmvJAHBEb2YvwrewAEODp4JTclAnGZmTZPP38EB
	ytiJA6dn4WIVmgofD0E+kSQOY5pbFvmFHVmyDv6fXqpAuWYhVFABTnYYWl6X5uKxuoa8Stzk1bQMd
	+swAh04IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmKmT-0005Qw-Qd; Mon, 07 Dec 2020 17:58:37 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmKm7-0005Hy-De; Mon, 07 Dec 2020 17:58:18 +0000
Received: from allenwind.lan (unknown
 [IPv6:2a02:169:3df5:0:6d9:f5ff:fe22:28bf])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 58CCF5C2DCA;
 Mon,  7 Dec 2020 18:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1607363894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j5Wc0uqvAKauZzgK3ofMgmzYgK3c72rCXM14svN6qWo=;
 b=dHoEpzOI7oroCHfDcGUXorgZFUAJuF0HhKQ4DgwUO4rBmkewZtzLPxkG4Yea3ADgLWeKH5
 5l3Wusta6y/xg3bcG4v8egmFHXnG3Blu7wJFilkNqtjLDasUGgZ3+2+H1NNCd8hpYSDI8u
 p/iv0sjoyFErLFeE3ARMUygE3TBIkww=
From: Stefan Agner <stefan@agner.ch>
To: khilman@baylibre.com
Subject: [PATCH v3 5/5] arm64: dts: meson: g12b: w400: fix PHY deassert timing
 requirements
Date: Mon,  7 Dec 2020 18:58:03 +0100
Message-Id: <46298e66572784c44f873f1b71cc4ab3d8fc5aa6.1607363522.git.stefan@agner.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <df3f5c4fc6e43c55429fd3662a636036a21eed49.1607363522.git.stefan@agner.ch>
References: <df3f5c4fc6e43c55429fd3662a636036a21eed49.1607363522.git.stefan@agner.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_125815_621247_83B68E79 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, jian.hu@amlogic.com,
 Stefan Agner <stefan@agner.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According to the datasheet (Rev. 1.9) the RTL8211F requires at least
72ms "for internal circuits settling time" before accessing the PHY
egisters. On similar boards with the same PHY this fixes an issue where
Ethernet link would not come up when using ip link set down/up.

Fixes: 2cd2310fca4c ("arm64: dts: meson-g12b-ugoos-am6: add initial device-tree")
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index 2802ddbb83ac..feb088504740 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -264,7 +264,7 @@ external_phy: ethernet-phy@0 {
 		max-speed = <1000>;
 
 		reset-assert-us = <10000>;
-		reset-deassert-us = <30000>;
+		reset-deassert-us = <80000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 
 		interrupt-parent = <&gpio_intc>;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
