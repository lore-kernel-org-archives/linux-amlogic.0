Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8522FC64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 13:22:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A192B207FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 13:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hwNH5Up7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="n/mHaQRe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A192B207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dxeb/PcoT18srGDdk8LoxbJiUuGPHHhTX1V5IQUd2Rs=; b=hwNH5Up7K0XUXC55FJl1eQFya
	rxPknY96iXfK00SdYUzxakxSpIXNnSUA/LPaloCPjNhAZBTEZIhNr/DHE4pBFb5sgiVXAQnamSPW7
	6O/tx2idItnnsLBrR+/GviZyVd3pw62Y6QbOeQZcETr5Ol8f4qmYzax7GuAm4VtGDqjwgKMKrcKS9
	XBBzEPSGLT0AL57gBkGtc9dyt0h0OOZLGEInSWIByfB7T7vRcYnsahT231MeM6QtEyqvhicjkMmWi
	7nzN/HCODHd73Pz3NEe5lTc8/600AyqsnFxQu3XiShC9/AA7EyYmEmf3t84NVHMBYLLLtRuotSBoQ
	SWW8FL1ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5bX-0002tH-C5; Tue, 01 Dec 2020 13:22:03 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5bM-0002oE-Dz; Tue, 01 Dec 2020 13:21:55 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5::979])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id A89C25C2AB5;
 Tue,  1 Dec 2020 14:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1606828909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4jPXXFT61h0+NZ5HlKP22zr51bhXqri0cz8N+6UjZ7I=;
 b=n/mHaQRe2O2Kt8bvt6Leuv5FobSungYHVVZ8ibNIy0vUc0UeWCXya2xMWDw6oWzvIC7WIN
 et7j5LcmeIySUUUrob4ox7KjkRuKQ0dqufQ7pEBBLPYyURDPufVsmKj0o+3zP3ENyxE6Le
 Md59+aH4CIy+QmdJ89ji7SOz293Cmqs=
From: Stefan Agner <stefan@agner.ch>
To: khilman@baylibre.com
Subject: [PATCH v2 3/5] ARM: dts: meson: fix PHY deassert timing requirements
Date: Tue,  1 Dec 2020 14:21:39 +0100
Message-Id: <6bfe17d86ead62c20d236e2ebbc7b7fe3354829d.1606828668.git.stefan@agner.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_082152_828571_03879272 
X-CRM114-Status: GOOD (  15.48  )
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

Fixes: a2c6e82e5341 ("ARM: dts: meson: switch to the generic Ethernet PHY reset bindings")
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 2 +-
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 0c26467de4d0..5963566dbcc9 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -224,7 +224,7 @@ eth_phy: ethernet-phy@0 {
 			reg = <0>;
 
 			reset-assert-us = <10000>;
-			reset-deassert-us = <30000>;
+			reset-deassert-us = <80000>;
 			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
 
 			interrupt-parent = <&gpio_intc>;
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index cc498191ddd1..8f4eb1ed4581 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -81,7 +81,7 @@ eth_phy0: ethernet-phy@0 {
 			reg = <0>;
 
 			reset-assert-us = <10000>;
-			reset-deassert-us = <30000>;
+			reset-deassert-us = <80000>;
 			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
 		};
 	};
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
