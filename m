Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21984C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:05:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42902081B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:05:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0qWhJsE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zJ5eI3rx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42902081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pT7YHiKCdvi6r7HJN5M6OuQpMnkKknH0NUxIT9VNRSA=; b=r0qWhJsEU42uYL
	3Xfq9tHY7bzVSTcw5SYBiOr6J315joXpwRsuCqn5xKdSIATZ3a3TyZG9NIzX6DCL0YPSM0cV7zr0h
	I/QPy3nImIGnCfSEey80ORt29cF3aFKhkbyYcZi53zBor9z9ODwY3LMK5tq5r4HlH5zn1OBamiw2c
	MgbARre/XiHQQam6+FVERMMClxuYU9rSnivnz6kdYtmeaV9zF6oO2avXtHXnT/lahH+wQUc7jFkYy
	RJVyR2H9rwb8z7R+HL2v8OUU5FDBspbsoZNJTOeLeL1SbqdV6a4yaNwXkeAEzGgu4RljLh1FZGry5
	rS9vU0VbQi/ZxhffN6Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUDCO-0005QI-89; Tue, 04 Dec 2018 16:05:24 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUDCC-00048H-8L
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:05:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id n190so7738717wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XN+iJU0/cAep1Wwr8rSwA7W/c+XOn4BhI5wEkNhsKjg=;
 b=zJ5eI3rx0SUgklcxvQrXD3m4sQq8GF+beKgqPUlYnNk3jl6JFtR4nf7dkBjJo0KpAX
 /IR9eo3OwmGy9NLuo0cZflGMAeQILAaROlZke2fYbxfoWEKXOL5khVA/V/bMQQ1rWzG7
 zSWIG77moVBU0HUKMvfjyvIJ5cOkHkrjhGqaUZGXnALJVCVuoPTxhmOo3XSXhkMsGzlf
 1Drow7uQCAgOLcPRvCrjc3FmcjlniXc8qwJaL25egb8/6xnbEcfMl+A9af0zioIBjzAA
 RO97P56f86aRwAzBorgjW/z2xIIBMGN3itL/5B2wCZNbmKwtYzFm0S5M9FTAsDKcyXYi
 CX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XN+iJU0/cAep1Wwr8rSwA7W/c+XOn4BhI5wEkNhsKjg=;
 b=Md5c2lEV/wSgT3xikSsLOr/xQvaoM6b1LAZwsGKIN+/c2xE9s3gC+Ub28TuSRoE9zx
 gTTeEjPq/PhjibrCqvlKCm0Pux1oq30+y4+OUoeGp04beAkYjpDN24uUuK3fjOAdB0Hf
 8mLuK9fkUfhc5VIPIM/TjJ2B1hVvVkqcKND04HBirwbIEJybJLbJ6waZAaR5+FiaqJZn
 SQUnTQXlzqwNa2q/DTa3Cr9peJUla/y60BLR+sLKmyI6J3a1p3ppvIwpD6xdp2vV/rn9
 v0N75BC+RKvCt7pndoK1Xj/Su0pZhraJ9WBUF3b0bT7q+UYeqltqtFOwkJ5MTrzkEDct
 smEA==
X-Gm-Message-State: AA+aEWbbAk28ZXKUQkIVCoJENw66/rMuN2WmR0mPz+sUABE5MYnY3oiY
 nW0vCkTbsQro+wWcxKfzabB43w==
X-Google-Smtp-Source: AFSGD/VDnRmD9tZaMfcMHfQmULBbSBzmLutQk6a3gXNGow2nvW33S0EV/vgmiQlWbbtNdXb0S11ItQ==
X-Received: by 2002:a1c:2e0c:: with SMTP id u12mr12964703wmu.81.1543939501699; 
 Tue, 04 Dec 2018 08:05:01 -0800 (PST)
Received: from xps.expressvpn ([2a00:23c4:f7a1:ce00:1581:6f5a:196:51f2])
 by smtp.gmail.com with ESMTPSA id k23sm5451585wmj.32.2018.12.04.08.05.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 08:05:00 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, martin.blumenstingl@googlemail.com
Subject: [PATCH 2/2] arm64: dts: meson: Remove eee-broken-1000t quirk
Date: Tue,  4 Dec 2018 16:04:47 +0000
Message-Id: <20181204160447.27869-3-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204160447.27869-1-ccaione@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_080512_328492_57DA717B 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The change in the macirq IRQ type also solved another long standing
issue affecting this SoC/PHY where EEE was causing the network
connection to die after stressing it with iperf3 (even though much
sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
well.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts              | 1 -
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi   | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 58669abda259..a951a6632d0c 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -221,7 +221,6 @@
 		/* Realtek RTL8211F (0x001cc916) */
 		eth_phy: ethernet-phy@0 {
 			reg = <0>;
-			eee-broken-1000t;
 			interrupt-parent = <&gpio_intc>;
 			/* GPIOH_3 */
 			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 18778ada7bd3..4d57363ac536 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -357,7 +357,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 54954b314a45..f8d1cedbe600 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -143,7 +143,6 @@
 			interrupt-parent = <&gpio_intc>;
 			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
-			eee-broken-1000t;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 70325b273bd2..ec09bb5792b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -142,7 +142,6 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
-			eee-broken-1000t;
 		};
 	};
 };
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
