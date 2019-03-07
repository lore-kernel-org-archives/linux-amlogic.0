Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3A4C10F03
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3FF2081B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 14:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L6A3MkD5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UxkAYps1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3FF2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyVu0dC/5u2F+Ez0Du6tnU0ocvVWuxJKOf0C8BLDEhE=; b=L6A3MkD5o+uDxv
	UJxxFm9eES+NoCD1SQEU90wG7JiO+TiK0Vj8fhn/aeSNxeehR43WrKSURVTLoo4+tuAU2oCdrg7TC
	FYpXhF9JE2LRG9L+0NBiYLLfRTLW84BVca6FEbP1bSzWICv5bCf7itTjigj1USiJ2O7fTZuEionYT
	40IXOvomstSHvs5SajCBro7rI3Eq57gS7F8q/Pmsqh83JBar7Vy9IKcLVQE0JaNRsq2CeMjQPrrUg
	cDqvv2SVAVIXmLWzdjzyfHeKZF4/IEP2Oe1+WFA5PVEc3uzZFQIimC94M3YBys8x7pZzFAjuoAhs3
	D73Dm8g97yDmsm7DHEKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1tb2-0004ur-HY; Thu, 07 Mar 2019 14:02:04 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1tas-0004iy-Qz
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 14:01:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id r5so17550146wrg.9
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 06:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bF9AZzlBu8fUtOoQqmikOZMaNtULZj7Mnfny5E9VbB4=;
 b=UxkAYps1T8dKVh4A5qYQ9F+WrOtMCzWwldBcVXUB4df7LukXZBcj8i1w4RbdYsJN1+
 rCNjoSCtg1WPyMA86vIuAKu0oUC7rOM2iDfIcov7EH98jFGMDfQ0nh8GClyfYpeL1tOd
 2t4Pszo0rQIzRkgnJiec9GTwnXhNqRP1s9J2yuO6emOGWmBfslgBIFjkJeTc5zFB33y1
 JYwLS2UH3LkTd8o+oZHPAui8Cy7HfUOXMJMc0jSX1AxvSrDh8aJH1h/YokX4sWJjEE69
 R3rqYP6QuWHbjHcbK6NnRkqmH7EY5Au0KmSl9vJzJx0rSCO5wWEFY5+mKHhmFiMGBZ0j
 E+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bF9AZzlBu8fUtOoQqmikOZMaNtULZj7Mnfny5E9VbB4=;
 b=XjVA6e4fYmfs8baV+NbrBFZSlmuFT3n/3Au4tYgXn25IaQmMLC+fR/Vr81QbvhaIYS
 ZhyjZ674SUGRpJddM+0vfNa4mFo+Evmr5C0n358GhkScPO4cxkt3Wkxf/L1X6N4uDdLy
 NUFpnxT28/5wT2boOmlIKSUJ9REpg+vuit+nEYV41RiEXpb0g6lFdIP5tvOty/9rlY4G
 wsrZN3A0o1ZnhOCrxFkI45BbElcjhfSg2JE2McnPNEpl/iHzBGnwPde1vYaF1SvTxwte
 /uEHdLETZCOcngdO8Gq5b3gKKrZ3anSgfC/NJoW2eDikJDgr2vaaIbYJ+hxjTzj6vNYH
 kBYw==
X-Gm-Message-State: APjAAAXIXCmn22f6d4QFaw8FL3FBZH9eNyXmErrseNMp+OHjThra3aAu
 NdCtXfVkyoqbcmp13HdpS4/Dig==
X-Google-Smtp-Source: APXvYqwhG1xRFbVRSgMiSCarrZZx2xIhmA4EvlY/SwsSDDj0FlXOpI+HLNZNwCrRhTyBAbQtHIUbFw==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr6931120wru.198.1551967313024; 
 Thu, 07 Mar 2019 06:01:53 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h137sm9892098wmg.41.2019.03.07.06.01.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 06:01:52 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 2/3] soc: amlogic: gx-socinfo: Add new SoC IDs and Packages
 IDs
Date: Thu,  7 Mar 2019 15:01:46 +0100
Message-Id: <20190307140147.22047-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307140147.22047-1-narmstrong@baylibre.com>
References: <20190307140147.22047-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_060154_867209_AC9CD984 
X-CRM114-Status: UNSURE (   9.43  )
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

This adds the:
- G12A SoC ID and S905X2, S905D2 package IDs, found booting the
  X96 Max and U200 Reference Board
- G12B SoC ID and S922X package ID, found booting the Odroid-N2
- S805X, S805Y package IDs found in the vendor U-Boot source

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 1ae339f5eadb..c8d138d85f34 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -37,6 +37,8 @@ static const struct meson_gx_soc_id {
 	{ "AXG", 0x25 },
 	{ "GXLX", 0x26 },
 	{ "TXHD", 0x27 },
+	{ "G12A", 0x28 },
+	{ "G12B", 0x29 },
 };
 
 static const struct meson_gx_package_id {
@@ -53,11 +55,16 @@ static const struct meson_gx_package_id {
 	{ "S905W", 0x21, 0xa0, 0xf0 },
 	{ "S905L", 0x21, 0xc0, 0xf0 },
 	{ "S905M2", 0x21, 0xe0, 0xf0 },
+	{ "S805X", 0x21, 0x30, 0xf0 },
+	{ "S805Y", 0x21, 0xb0, 0xf0 },
 	{ "S912", 0x22, 0, 0x0 }, /* Only S912 is known for GXM */
 	{ "962X", 0x24, 0x10, 0xf0 },
 	{ "962E", 0x24, 0x20, 0xf0 },
 	{ "A113X", 0x25, 0x37, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
+	{ "S905D2", 0x28, 0x10, 0xf0 },
+	{ "S905X2", 0x28, 0x40, 0xf0 },
+	{ "S922X", 0x29, 0x40, 0xf0 },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
