Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B92FCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3112084C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cq2sQ2TS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NDuJdtzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3112084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFmyRYN6d5f1u2FLjtccxI99qYm3YnfdiIpuH9MNXYk=; b=cq2sQ2TS7tr3a9
	fHM3i4m+W3piC6rUNI5iC8/GyMvrU0kI38EUoKF0Tbime7V4UksJVy/KD4dw1xl7BqqDFo3/j3qV4
	yCbyHYl5OqHLLsHQ5GBtjjT0JNHnRAdTYKDPv9B6oW7BlD0PxNISuqyng4vSoohveD1vZ/0ZT61Ol
	+5S1hkKu9pBTuoT1Aub1cq2mDSd9vhVTypNYiVy9UKNN0sZE0pFOrqpNiXw4HZNhTLQf8qMFFS+Dd
	zb3e5Kh+wfG6mpX7uLOudSci1UxQMxCNjK2HyLNlyUGbTWpyWnC73vc41Z0TXGR8U6Ct/sd8S3nLm
	Yib+TV5+rkPumRiuSKRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYgp-0007Y2-0h; Mon, 21 Oct 2019 14:29:43 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYgG-000709-II
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:29:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id t16so9119413wrr.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxYYIsnCFuLUec3Mt7t5xj1H4ecLSFsGNR/kmuhF8Xw=;
 b=NDuJdtzqxA3OkM8uec3rQa8bOcNzLPulM0OXh/XyrH9Ymu5xNJsy3h1598MEwd6anI
 X/6r/euqtrCGbxi/pCDiLwiQB3wkDOwB1Ce/YSVAWgeySHI49KKoGcYIMQP4tMm179YS
 //N7JGeQhY9hYx8Ho3z+l5B66Hl6rzeuNV5xwkBfB5bv3B+Y3FOhaARhGQPpvwv8C7In
 7v0ZN1SfWLG6cyXOcItJ8sMrPMRxopF7WIM1/g+axau+0ZUUfCgN11UR3Re/geaFNUhJ
 tcDcueyK/Fsy6chlR4r+uAEJutQEmNL8K1Ubm0OIgcmakwZdzABtcnHW6OUMWmnZ5ze7
 dRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QxYYIsnCFuLUec3Mt7t5xj1H4ecLSFsGNR/kmuhF8Xw=;
 b=eMIwyOp3h709AYiZ4mJcq2djgK38lpNFRbba0pBgzhktARs3Uf+TXq9jYjcayOLVL3
 bVrPQpq9LfsMzPlE41AjzcZ/2fOfSCsU2wHsv7n9RYoBtWk2fDz9lGGFznSh/p85s3cQ
 mNkSCDhelQiPItWHLv8AjPCh6kb4Tl/K1qzNJr3BvNofDCluijRGa9EqVGih+X26r4nn
 rcSEa0NUww/nvV7l3uapgjqZL/P9NyjsssnqyJ7n9+dnx91d6M7UawJEiPiPwz+EJ37K
 KBBs0kCjXRvFYwRMVsYB1eaBmZUNliJibtMCRFKuyA9o5TTmycPoyzphIZ5T5NShVdyb
 26Eg==
X-Gm-Message-State: APjAAAUQBeSdwtgFki/C6rWztoYcuTGWd7ZHpWuscxRrutU99aC4a/dM
 XUTjw2bqXBhkeymZneb/nA1d+g==
X-Google-Smtp-Source: APXvYqzoY3Id/cVnMuCKMTHqE3o3klKK3GFRil4uFFZJ/1VmKO1UXMdfsxgAkMy3bby5/p/Or7OubA==
X-Received: by 2002:adf:c143:: with SMTP id w3mr20338530wre.77.1571668147049; 
 Mon, 21 Oct 2019 07:29:07 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d11sm17304463wrf.80.2019.10.21.07.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:29:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/5] arm64: dts: meson-g12a: fix gpu irq order
Date: Mon, 21 Oct 2019 16:29:00 +0200
Message-Id: <20191021142904.12401-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021142904.12401-1-narmstrong@baylibre.com>
References: <20191021142904.12401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_072908_609362_566DE586 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-g12b-s922x-khadas-vim3.dt.yaml: gpu@ffe40000: interrupt-names:0: 'job' was expected
meson-g12b-s922x-khadas-vim3.dt.yaml: gpu@ffe40000: interrupt-names:2: 'gpu' was expected

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 3f39e020f74e..f9c52ada7fda 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2388,10 +2388,10 @@
 			compatible = "amlogic,meson-g12a-mali", "arm,mali-bifrost";
 			reg = <0x0 0xffe40000 0x0 0x40000>;
 			interrupt-parent = <&gic>;
-			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "gpu", "mmu", "job";
+				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
 			clocks = <&clkc CLKID_MALI>;
 			resets = <&reset RESET_DVALIN_CAPB3>, <&reset RESET_DVALIN>;
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
