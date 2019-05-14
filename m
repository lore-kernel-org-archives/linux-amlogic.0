Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE34C04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803372168B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 11:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AIMbX0yK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GrLWanG/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 803372168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKj3UJj+0tqVyZeHTKbu9l98brgDbP4NPg8IlyMh/AI=; b=AIMbX0yKBgw9e7
	dDkecliw7BrNtc3dNlvGnnDedrmmZxuoOhIt9x01si8dpI7Ln9YmZN3GzuxxDHGfWe2t0++5yf8iY
	rLzoIMkazAKpi/e81zshWNEk1shauRyUwbQ/yeeBwgD65owXdzSZYwcxQudxFzlvhFGM+7L8JaQ7W
	LIDZ55xKRkeOgZ13h2pNIRQ67OLaP0o9m91T5o7Yh+Kh0uCt4z32NH2pjUG0zaqBIunByIbpwj1II
	ENYYpZs+VvwrLvCwkgadg/Ek/m1fjNalGkw6eKLToAqfSfUAoCbHouh9VwoWl3W5RNoRViUNumsaJ
	Ss81VkTbYc3BsvmaS7/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQVPK-0001Uy-ND; Tue, 14 May 2019 11:15:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQVP4-0000oU-TY
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 11:15:29 +0000
Received: by mail-wm1-x341.google.com with SMTP id x64so2414655wmb.5
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mU8ejWHy+W5AYtnGGvQAFcqui30OeOfdUF4Rimt6ejQ=;
 b=GrLWanG/uCTvdYXVZJknxkFiKNgW/j9vvGBCnZGnRIy98x3TPbc4wVRPJuIeVgLREw
 PuB3uuz4WOf9LdlFEzX3WgQCRXsSHSbzv+h8Ea1deY/yxdKU/ROlZC8tKyGzyY8P3izB
 3PrCDuiyANEuLQp3sMZJIrkbrZ5mLdC50mMIzJPmO26/J4Os8bTM0fCA2LDSzmPoUFnD
 Yc+gmZZSdbF56ClMM4PXms+Xrm4bAOzI8FxWkaaiyle10F6PyA+fNpLX1jateVkv+Hnn
 J1jDQV0h333B2KJhRCT7TJALRYXLwDmVwmQWFSkrgE2DUzQ1G091G0Me928VC1ADZxD3
 vaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mU8ejWHy+W5AYtnGGvQAFcqui30OeOfdUF4Rimt6ejQ=;
 b=haPqXiPzgVRE3p8xUfTaNUPMl3VyD3rIoAKnSHO2jAzMCjiR6UHd9MHSHXGdAMeYrG
 s6S699rihub/V2mZPX0mHaJtyiYuMY5/PuSzqbKutQrrjS8oHcbcejNgWloLBWh0MdyW
 rt+4tFYQZuiKgctc4N+8g+0pEbiw/56M6RHVkOt64FVTUG9efYhczhlswwGdN3A/sIEL
 kGS5oHZijeKEnmfsyO8zo88XZz8fz1gsQ7QthKY/hgVtLHk3NXLKeQAmn3dtfs/Ob0l7
 5f6nwxcvdhaomAdEmIaGcgdvHmh03cQjDzLRRH3G12yVTj3fx8fDCkv6CbOTTWHySPJW
 GNTw==
X-Gm-Message-State: APjAAAUI02QFGgZkWfLlFMmTewH0Bom/cqCQQPiF8SgrwBT/gcYvjyRn
 11/fcIyV/cDiXbe4sQKgtMuv2A==
X-Google-Smtp-Source: APXvYqwNYfIz+EntwTRpSxz3e5FlMiLk8xhRV0KoFKpWfBnG4xI9Vgeb/o/oIp3AfLznSOJCmCvPgw==
X-Received: by 2002:a1c:7dd6:: with SMTP id y205mr15308582wmc.90.1557832525211; 
 Tue, 14 May 2019 04:15:25 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c130sm7289922wmf.47.2019.05.14.04.15.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 04:15:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 8/8] arm64: dts: meson: g12a: enable hdmi_tx sound dai provider
Date: Tue, 14 May 2019 13:15:10 +0200
Message-Id: <20190514111510.23299-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514111510.23299-1-jbrunet@baylibre.com>
References: <20190514111510.23299-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_041527_427042_33AC3B4E 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

At the moment the sysnopsys hdmi i2s driver provides a single playback
DAI. Add the corresponding sound-dai-cell to the hdmi device node.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index d4fc645f0ff3..5c8c93ff4816 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -158,6 +158,7 @@
 				clock-names = "isfr", "iahb", "venci";
 				#address-cells = <1>;
 				#size-cells = <0>;
+				#sound-dai-cells = <0>;
 				status = "disabled";
 
 				/* VPU VENC Input */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
