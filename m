Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D6AC04AB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 09:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A672147A
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 09:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HM9IxngU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VjNwcN6Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A672147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TUuRkDtHKha+y8rxkuH8SPs2RJmJ2PInI/EHYrFT/lo=; b=HM9IxngUZ3dQEA
	bC9doHWxVSWIoba7ggz2VOYaEiow5M5keAu5pcIV5iGVBA/kx6bUc2aRzHBoxF96xehiFkGEHls5t
	836bLD89WOqefHL10kVWeFfd/DK1FAHGCQZpo5std/NeYNIhJxSUJjYBzAFF4zudu3YjjFhJNAg5g
	2s0d2A6BrAOtqyM6Xu0YEv9ua7bu1cD7syjhRxQa0Do/MtlbE8syW5tzvgZsF2ExFadnZBuqUjWyP
	YJ9eod7FhBA/G+/B0W6Y3YPUQ7wlsg5HG6oj6+nKuf11Xd9rJRRiATmfmkOt2cR24P+q6URRgW22L
	gBdd5b1W9eq8VwG8JHmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQU0N-0002ht-Sw; Tue, 14 May 2019 09:45:51 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQU0K-0002gr-6f
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 09:45:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id c5so18383079wrs.11
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 02:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AImHa44p0mDvOU1NWVHOPq3uhogoe7GyDrgo2WEXj/c=;
 b=VjNwcN6YD8r8chxHjTjcst6CSr1XuWPV3akry0c2LVIIlO2oxGYjnN3DcNSWBl0b/d
 oEp7GfwJqAJEeljYW8HW+FBJTRJ9fDkORslgbwem3e/dUpvMuGkDLXpzfJxwn+XACW5X
 OuCDrRzpgTynjSYhsony0A6maZCmOV5IL49Na7ViefXpKF7DykUNn2nnCc3SRtg57O7f
 0IJDcUh6j/6D6Tq1Te5UnL35aFPK9aeh47tNlGI2Ne8qITWHvd6JyMQUlJ6BhAGjhLu7
 aAYCrHKaJWq8AZzOHY/galHkdMJrjfHyCaPE4C8plGwAmx2w925YrSUeAf+sjYVz0veE
 LZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AImHa44p0mDvOU1NWVHOPq3uhogoe7GyDrgo2WEXj/c=;
 b=ZzNs7C2/gDSUbZw2de6nXjnWQYDiqQ7T5TSFua8THDrujPm3ckl6J5jchpXQsTgvIW
 3C40dxJnEWi+T/AhnmgeSrWe3dcY8eLUH4qNz7rdUCLHXE/8fzsaqA1m1A3zzmb7hl4M
 RyaLLUPe8gCZp0x3r09lSJOl4550y5GSrZ1ME5bE/5XFywhtYlh4TfwxS58LTRC3qpb6
 kb7K8+hRFtCqO+COqOvwFebXe22dBM13TlvotQW/2fWTFP3CKmNNKYxWTi5pHPsZgtWj
 CjlqaLDptiUyPZRNdiET09FgNc+gzKzfFRGMVKENra/S0EFxdiAs+4rz09C9Rq0e1LUm
 PSYg==
X-Gm-Message-State: APjAAAURueZVMmcRMNloBZkE58TTKPC2tYaSl4w2TojfO1UOwN+xbfWB
 WodExiQko+PiaqbcZNxSfm26EA==
X-Google-Smtp-Source: APXvYqzSVHJmToHiREG3mWCkBwVsO8AwYFyO/y+AxQxPWtyxHM5C4VI+AE7HytatFMM38AV+Ys7+ZA==
X-Received: by 2002:a5d:688a:: with SMTP id h10mr20000592wru.211.1557827146709; 
 Tue, 14 May 2019 02:45:46 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id n4sm5319216wmb.22.2019.05.14.02.45.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 02:45:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: g12a: set uart_ao clocks
Date: Tue, 14 May 2019 11:45:37 +0200
Message-Id: <20190514094537.8765-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_024548_383580_85DCDEE1 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that the AO clock controller is available, make the uarts of the
always-on domain claim the appropriate peripheral clock.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index b2f08fc96568..ca01064a771a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -708,7 +708,7 @@
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x3000 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>, <&xtal>, <&xtal>;
+				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
@@ -718,7 +718,7 @@
 					     "amlogic,meson-ao-uart";
 				reg = <0x0 0x4000 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>, <&xtal>, <&xtal>;
+				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
