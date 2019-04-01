Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DFAC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 07:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633E820700
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 07:48:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIFuLl6b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Nh+AbC+0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633E820700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ODvlYct6ZAtvSC+iCggWBSMnC19YBXYfwb5Q80uZnB0=; b=QIFuLl6bpyxl9h
	ox9cNjAj6+ZqauvwPo7nbwpdAUnRkGumKqHi/VFLz9jl2MWkNTW8Hnaot+e18km/ZgNGzCCa6Zs6D
	Fb8mwR2BXKFuqyBxm8S+7JmP7P9Wndgd8pSzcbRUunmUHXzYhXQYpCRnb2rlNIXGPpApp+vFaU9Sq
	WuwkQzVqCec6iX/xUAiOZmAdtLOV1/K2M2/0wfT8O4bu0prNSKTmKAOY3uW2lGJaNLvF5NU8vBTFF
	IPO6OIGGeO0e2SXo7Mai4El9tFb+cBUOTePkkD+che4y8g+GLl7PACiagiDjG9cuXmUdkAwkYj2xI
	SGYQlzoSXzMpQtMSJ0Ew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hArgC-0006AN-9d; Mon, 01 Apr 2019 07:48:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hArfq-0005oD-5p
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 07:48:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so10574869wrq.8
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 00:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UV+n+dpIqqcipkajAaapuo73V0wxH6nDMwdCzNSuWU8=;
 b=Nh+AbC+0lMeu1HOMqzSHiJ5uwc4j3Ow+sXY68KlDAy8QL4XS/6Vs65sjz1V6WaKw52
 LRWPG9O2t4AVgyjDjZac0RgsWxOAWt2E6Qx0MUFEngPYS8qZwU4WcxOw5S3bUZIBZJDL
 BbccTbPc2S12JXGgjWwtcnZi4BwvU18AZ/SOUVwEtOyRNHuFaRuNzJv3m26bUozqTLUa
 yyTiGnZAd+AVtO1zXy9rhBPFj1KnipEfqPOAMyLSJmjeRJzCTyJVaJPrJZCiySTV7jOR
 xM5efuxric2GKDrXxOV+7L/PK1VqpR2g2dvKWx/BHJyVgpGUcSUBENR7u9BSEE/xbRsz
 hTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UV+n+dpIqqcipkajAaapuo73V0wxH6nDMwdCzNSuWU8=;
 b=oIVcPyOM1GbYP2zJajVYw8JqrkruROl/n0+XPU3yJcv79qmAHtprEQonU/ueXMxD34
 JUK/qIGZTEimZTgt42IyN6s5hqcLaAVtgytcOPhVUKOGnaBxNznE+Ni3/zSimFiDYDRk
 JNSpcU4JjYQj6YGoDAIAdOlPRhPGpkibkLHMuZX2ohC0nf1/4NQu1VQFVAlXpOZdt3EW
 H2GSbPjuhoL+2HrAwvOfq2cVj6IPCKNhq1P0LrrF937gyVjFwSxScII8T7s/kIJQwLmi
 ysUsXDOX6xHpDjczFtuX3yuWH+9ed/I7rjW8uLaa2/QwcLePPfOqKYaAPLEce+CovOIH
 npZA==
X-Gm-Message-State: APjAAAUk/tIcuRTmSj46Nfk34Uue+AG8QWQTDB1iO94hRdaxvp7rDpwh
 R1D6UtQzyaldZJS0xQdbO+x0bQ==
X-Google-Smtp-Source: APXvYqwVSZe24VlFPyfzvR+UEBF2sWx6RuqCeJwmVnzD9ckpRuC0AWI0KiigQPbIXX7bv+HtJ96kZA==
X-Received: by 2002:a5d:448b:: with SMTP id j11mr41494198wrq.218.1554104884439; 
 Mon, 01 Apr 2019 00:48:04 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o17sm9448537wrw.73.2019.04.01.00.48.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Apr 2019 00:48:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH] soc: amlogic: meson-gx-pwrc-vpu: Fix power on/off register
 bitmask
Date: Mon,  1 Apr 2019 09:48:01 +0200
Message-Id: <20190401074801.10414-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_004806_996814_EA76F377 
X-CRM114-Status: UNSURE (   9.86  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The register bitmask to power on/off the VPU memories was incorectly set
to 0x2 instead of 0x3. While still working, let's use the recommended
vendor value instead.

Fixes: 75fcb5ca4b46 ("soc: amlogic: add Meson GX VPU Domains driver")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 6289965c42e9..05421d029dff 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -54,12 +54,12 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
 	/* Power Down Memories */
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
-				   0x2 << i, 0x3 << i);
+				   0x3 << i, 0x3 << i);
 		udelay(5);
 	}
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
-				   0x2 << i, 0x3 << i);
+				   0x3 << i, 0x3 << i);
 		udelay(5);
 	}
 	for (i = 8; i < 16; i++) {
@@ -108,13 +108,13 @@ static int meson_gx_pwrc_vpu_power_on(struct generic_pm_domain *genpd)
 	/* Power Up Memories */
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG0,
-				   0x2 << i, 0);
+				   0x3 << i, 0);
 		udelay(5);
 	}
 
 	for (i = 0; i < 32; i += 2) {
 		regmap_update_bits(pd->regmap_hhi, HHI_VPU_MEM_PD_REG1,
-				   0x2 << i, 0);
+				   0x3 << i, 0);
 		udelay(5);
 	}
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
