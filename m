Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AD2C3A59F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 14:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 057F7217F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 14:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E36YFGqh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oOsWkVyy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 057F7217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8m2/jkQfdD09BiqKmtWSZjLWeEVMvJuf2c9E1FzqxUs=; b=E36YFGqhZOlHli
	ztb9/Uc4Zsz74Kj96M9x55h+YsIBl1IUTWSw/hOvwXd36+Qgl9Mn21p85qsvZCzmF3YXbUvvoG0cc
	Jq8l3m9JZXVR37VmOlz9JI3T34QZve+2/fYi19nA4Yf6EyI5uxXtju3VEkzbZksgpyeq0CrQ5aSka
	/BfrjpYF4bNFAEcLDiVp04lrhwCE2BwcoJYUkPtzN7MpGMTEh0t7aT9TWeiCSP9qg13UnbyqWrlxS
	BjEfGjFLcaCtQjKkDkl2Sdb0ybtB+zbXCtQsTmgQHKydFkbDgB+Oq8zlfEQMJm1gwT0AEYBFVOQ2B
	dNwOyxFX9jvTA/tTgHmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2GH4-0006QS-Md; Mon, 26 Aug 2019 14:47:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2GGk-0006CJ-Nq
 for linux-amlogic@lists.infradead.org; Mon, 26 Aug 2019 14:46:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id j16so15587335wrr.8
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2019 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKqFlQ5uAweiWoy5Q0NBtlqDIxAoWdFqAZ3hE0aWMrA=;
 b=oOsWkVyy0OVNO3GEWtL9KUlBPcNQ8EXb5NCLaRrryxI86WLE7itY1IhCRJ//gMudtE
 MI6ag1jiTbVVcDqAqXe22G5Ebaq5BNPFjs6B3Wib8wz4iLstk/g8GUietWVUDOVMtFLD
 B72moJ69pMr5bro4U1czlxVb8JfS6SU1/pnwUeOux5P8jlS5AmQgmodOo1MfubsAtRFd
 6thkrxpAUURZh4j5Bx+8fONziNmU3yKSV12jDFNhld88vr6ZzSyAwVmUIXXrkmddsp89
 B3dw+IJyZkAPVaiO4vKQIwopRI6ZxW7dUD8oDdsLLhWbf2C5s+AV7/4TTATXNxBIP2Vf
 RzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lKqFlQ5uAweiWoy5Q0NBtlqDIxAoWdFqAZ3hE0aWMrA=;
 b=X+F6sRrvxvi6dpF2D5LYtRBbPdipidZxzV/LRNFAyHIaptwtOVCcyqEXbabKK4ZZ9F
 WyRufgHP0dmbSjo/Kl/08Ln3iooaL1GVUJySwLc/A0VrYmbLfKzzS8SkSt/rjr+wrzFi
 fnXutTMazjLFkliuONH6d2yFhuNlFh7iI5GQxOMWfTT5esq74LW7C2dQRXqgHm+DVgd6
 yISqtmtDuOnYKOfy82f6M8qVCr/+SB9R8RtgmRxWJleOFbL3/+79N1BHAsZLTydhBCEz
 pJTlYk2N0JpcCJYpUGHnM02JDuNBzRlj6w/JX4873DGD4GwftRuIiwe+ZHEL9/ihZkLw
 k/HA==
X-Gm-Message-State: APjAAAUBRgLiQ4KgbuvgmknGrTtS+LxRFr26J7jSGw+zdn/T0QuKZpRv
 kcxPUlYYIyHJ9dUvU0VzjBCfyQ==
X-Google-Smtp-Source: APXvYqzj8GflBpfqyAQoqHVpAUfVZVDf2xgGir3LWPo8zTibAZW8llY0SCOEuBpqNLk+uWaJWp10ZQ==
X-Received: by 2002:a5d:408c:: with SMTP id o12mr21617046wrp.176.1566830811145; 
 Mon, 26 Aug 2019 07:46:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e9sm12984595wrm.43.2019.08.26.07.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:46:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: vclk: use the correct G12A frac max value
Date: Mon, 26 Aug 2019 16:46:47 +0200
Message-Id: <20190826144647.17302-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_074654_814453_1F10A89E 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When calculating the HDMI PLL settings for a DMT mode PHY frequency,
use the correct max fractional PLL value for G12A VPU.

With this fix, we can finally setup the 1024x76-60 mode.

Fixes: 202b9808f8ed ("drm/meson: Add G12A Video Clock setup")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index ac491a781952..f690793ae2d5 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -638,13 +638,18 @@ static bool meson_hdmi_pll_validate_params(struct meson_drm *priv,
 		if (frac >= HDMI_FRAC_MAX_GXBB)
 			return false;
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
-		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL) ||
-		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		   meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXL)) {
 		/* Empiric supported min/max dividers */
 		if (m < 106 || m > 247)
 			return false;
 		if (frac >= HDMI_FRAC_MAX_GXL)
 			return false;
+	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
+		/* Empiric supported min/max dividers */
+		if (m < 106 || m > 247)
+			return false;
+		if (frac >= HDMI_FRAC_MAX_G12A)
+			return false;
 	}
 
 	return true;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
