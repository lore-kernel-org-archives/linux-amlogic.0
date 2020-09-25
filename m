Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E245CC4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:42:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 889C120659
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d6rwjfmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 889C120659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cottsay.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Resent-Date:Resent-To:Resent-From:Resent-Cc:
	MIME-Version:Date:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Sender:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iJPpMFtkjUa8W2HJGzeKlrrLRGOqcecO+BuVWL7+bNA=; b=d6rwjfmPwVIGAz
	1nZofOEGsMAkjTQhIlNRdSS4vseD+cO++EWAP4Z4O2u6He6+GOKw77G1S5GjePUqgJfiCo9+l3J6O
	aFRq5S5S6RscylfYTR8zgAgKq0x48rUiGdcNmnT5gLPBupoLkM8ItqG7DXKvU6RpttiktnD0ibmm8
	gw03sP3nGYYw2RGAY8+6icGLFiq0O+7RELbP2oxH87cjZnB5VkTiPWGmw5ozOLfXE+3WmfkMxnMZO
	ZPGGyOKHCMFo5bRcEee9MIai227fZtzDmjgQaoT/Fnw8ex53S2P6OFjSEn5AIbJXtEbUmrAfn906k
	QbfvWaNc/ktMTWZGrw4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLvUI-0006Fj-4g; Fri, 25 Sep 2020 21:42:42 +0000
Received: from azure2.cottsay.net ([104.41.151.152])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLvUG-0005pN-75
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 21:42:40 +0000
Received: from cottsay-server.delphi.cottsay.net
 (c-24-17-110-2.hsd1.wa.comcast.net [24.17.110.2])
 by azure2.cottsay.net (Postfix) with ESMTPS id 7AAD119F836
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 21:40:34 +0000 (UTC)
Received: from cottsay-lenovo.delphi.cottsay.net
 (cottsay-lenovo.delphi.cottsay.net [172.16.1.31])
 by cottsay-server.delphi.cottsay.net (Postfix) with ESMTPSA id 7FF193C0095;
 Fri, 25 Sep 2020 14:40:33 -0700 (PDT)
Message-ID: <520a1a8ec7a958b3d918d89563ec7e93a4100a45.camel@cottsay.net>
Subject: [PATCH] arm64: dts: meson: add missing g12 rng clock
From: Scott K Logan <logans@cottsay.net>
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Date: Fri, 25 Sep 2020 01:43:53 -0700
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Resent-Cc: Neil Armstrong <narmstrong@baylibre.com>
Resent-From: Scott K Logan <logans@cottsay.net>
Resent-To: linux-amlogic@lists.infradead.org
Resent-Date: Fri, 25 Sep 2020 14:40:32 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_174240_288398_581D759B 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Resent-Message-Id: <20200925214249.889C120659@mail.kernel.org>

This adds the missing perpheral clock for the RNG for Amlogic G12. As
stated in amlogic,meson-rng.yaml, this isn't always necessary for the
RNG to function, but is better to have in case the clock is disabled for
some reason prior to loading.

Signed-off-by: Scott K Logan <logans@cottsay.net>
Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 593a006f4b7b..6ec40af658ba 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -247,6 +247,8 @@ apb_efuse: bus@30000 {
 				hwrng: rng@218 {
 					compatible = "amlogic,meson-rng";
 					reg = <0x0 0x218 0x0 0x4>;
+					clocks = <&clkc CLKID_RNG0>;
+					clock-names = "core";
 				};
 			};
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
