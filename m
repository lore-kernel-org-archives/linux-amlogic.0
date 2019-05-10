Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1595C04AB3
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E3DB216C4
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gaEm4hAu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fBkrLJ1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E3DB216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1BvUBCC7uFm9yFgEhAS2ijSaLr5LlmKNX6rl1m4waY=; b=gaEm4hAuzJDJlt
	Yz/xIivvenXVp2YYxHrZ3KUTkeuQhmqSMeK1HqSs/4+ImROrW/UHGMwehn1UQHkGMArLxFh7zAOJb
	ymfs/02k5KhOCODsZmnY358IilGOETUbpMK6ZZ9xma9C//jJfSBeFXH0KZd+7reh1rS5zTHp4LjyD
	NWuwd03oYrhKxW84ci7dEDhsvQTCvMjQMQtTe4Lt+yJdoQGV3Z2XeI+Ep0x2DEh931kjpg/lUKI5T
	RMq4N2qzY3V9vhGQR2U56TuAPZqamdP4c69QQXeN5n9zkqMe5JQ2xpqd4LTo6wX1EGuPajGx0Nb2g
	SmoqEpweyTwaNHGmJ2Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP8iV-0002Uh-2f; Fri, 10 May 2019 16:49:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP8iS-0002Sm-0I
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 16:49:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id f2so8189802wmj.3
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Is7gD3yeObgU922o5rXJFDawZvTxttvDjfnW9eFtyrw=;
 b=fBkrLJ1E5OA+08cH9MslvzFXxoKtzBq2o6KYAEOStp1jVLEwYxnEGZ5LY773CCHu1N
 e1feqfn5tkpY51KyGEPTgYBIHFRrpWN/7s7eaQMOzChMnoq0eRDSklFUQLC5DUHOFAKx
 uKG9NUhPFBVoLbo1O9nR8gFEckRBstGu0uUVchZnQdzHcsmGc1Pl4UQCVZBjkbEOAY0z
 UgJ5zuHRK3jsilfgLJRH3IFTWyPvuNUNajH2I6VaBJKDoQZb9viLbNhLjHFjv/qsr0G3
 hnPhCTicU9Z9eAIZlj8r1zspYcXdNnRZ2H91rYQqjzP6RqpBsU8C2am/2h6cPbsRArXj
 JNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Is7gD3yeObgU922o5rXJFDawZvTxttvDjfnW9eFtyrw=;
 b=bU7cGg9IPQfgSD/4+DWubW7FhPgRbEgu0GiqJoze5mNEZI1MvtA+c/nQtuRuDybERO
 9MrAz5fhrA4A7Ks661d7rjEWsudcQM/u83L2nqqw1srekNTwXHaHXAE6mpEzdLYMLgnu
 3K3Motk1tIBGi9iaraEYSlWWPir1TKfc0b8zQOHyCse6FSdCHobIWpCw0uOrDDoRVB2m
 S4EPaKW/e3d82J9CKV0L1/mX/OwhkPlsjUKQYGWg/iRdyr1JTIhQ4km+9Dm5wAVReb98
 31BJgzL3lmR06MWYYAGBo68gEJ/84w3e7NVwzANfiOrpPNq2+aQRDy2/mA3gtVCOEbhu
 bFcw==
X-Gm-Message-State: APjAAAULJiA7ywErykL2HQY0XdLlsgg4gf/jrxx9VMqpom0XVfW2HF9t
 T3BQfFCMKOnewSkEmyPwlhjyfQ==
X-Google-Smtp-Source: APXvYqwMuN/bOnJi5zVCfLtc6oWWWxdwzjc1a80rDT+920MwLAt+4SZyEIccA37+vnMs1aIt2Rev3Q==
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr8178833wmb.76.1557506986314;
 Fri, 10 May 2019 09:49:46 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q26sm5114308wmq.25.2019.05.10.09.49.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 09:49:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/5] arm64: dts: meson: g12a: add ethernet mac controller
Date: Fri, 10 May 2019 18:49:36 +0200
Message-Id: <20190510164940.13496-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510164940.13496-1-jbrunet@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_094948_042426_D9371CBD 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the synopsys ethernet mac controller embedded in the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 2f4f4dd54cba..a32db09809f7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -102,6 +102,27 @@
 		#size-cells = <2>;
 		ranges;
 
+		ethmac: ethernet@ff3f0000 {
+			compatible = "amlogic,meson-axg-dwmac",
+				     "snps,dwmac-3.70a",
+				     "snps,dwmac";
+			reg = <0x0 0xff3f0000 0x0 0x10000
+			       0x0 0xff634540 0x0 0x8>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc CLKID_ETH>,
+				 <&clkc CLKID_FCLK_DIV2>,
+				 <&clkc CLKID_MPLL2>;
+			clock-names = "stmmaceth", "clkin0", "clkin1";
+			status = "disabled";
+
+			mdio0: mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "snps,dwmac-mdio";
+			};
+		};
+
 		apb: bus@ff600000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff600000 0x0 0x200000>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
