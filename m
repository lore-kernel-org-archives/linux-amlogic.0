Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF990C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D7E5613CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D7E5613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBnZ8Sf1rtVlFqOSX0ST6jUZyJtROVYmdYh2QcpGlfk=; b=GIYnHrwlb/pXQO
	pbCmL+dDfTuUQrIzwTbIWVmKwpLMKPeAXnx+QtwD9/cORFoHfoNN86TKDwDsx2ANV6kv1wYK2P0m0
	7/m23EbBHlQChxIZw0WGok//Qq+yfX95znxNnEXrZErMRtbtVlbQwoSkUoenNrYUV+oXAj8mVgqHd
	xUZXir9UF2BrU14Msxoon90N44HG8cpZsxp8d3ZWDbiEgQo1aHSTJTS/sezHzDCvNs9y5XGufK7c9
	Igd1pgf2Fi14OWq6Qw0+CfNXnRht28ULoWtR6hmqbxTEHfdpzRgLDDJ9l5r7C8s6cy67iehkev4x/
	mzYwBj0rnLWUSz6BJg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxvY-00BaXZ-8R; Thu, 17 Jun 2021 19:43:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxvE-00BaMZ-0p; Thu, 17 Jun 2021 19:43:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id o21so3483858pll.6;
 Thu, 17 Jun 2021 12:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IphS2NfYy5YZOfBpgQZDF/SMsovEiyi9nwsRO6kEmeA=;
 b=W/pVQVs4NBXtAYB44k2FtP7IHprt6d6EQ3dpcGJzbORkjzsTXC497kYd5Ph5SvW7On
 AQOK39Cn16MWTOGPzVp1O2FYev8QYj+EfmqZlnkpPvMw068YdCfdq58EssXhzPIrWn3l
 YTmqO05Yn3QKdXQAj5ntx2kInNGvcqNCv1vLDE3VhahwWsHblJqjx90cDlqI6EqjTtrG
 3/KMyZvPalXzJF0rmMjIdJX326IspxknvB45A0NbzN0VdXGDk3UK1+gSo54j5jTmKKjK
 VgMBkuh0vBvr4g48oU8cQfNbbPovAzJ5E9Qe4New5O8l17FRfuCHWAfDXp1TXNvfo5ma
 aUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IphS2NfYy5YZOfBpgQZDF/SMsovEiyi9nwsRO6kEmeA=;
 b=slsh7RExkTFLCluAT6DUdvsz+gxnpd1zfA7Z/MZlm4foi4BYyDoQ+gJYv372r4YC+8
 dsgFvF6yyf6Qd8QJIG5z0ToWCrjA0XW2jhFR8KAHaPo081O+QXFG2pAl/MDQKLiFqXvx
 ZknU5oLZW2//Gako6V+kOBFXcKPw0ymRAOZKTzNX7YaKG+XX/5aAdRmke6m/FirbbYmu
 /LbM2NypmriuzFiusf1/v4zrEaIi748J0FaXWJvpZOgjxdPz6D1WCK1B6hlvf/0DeeFM
 3DBFjSv2WM7TDBeFYbTd+603LF3kJqCZkwubpcDq3s5zniubHtLBSIGwqmiDVG6L6HoX
 BU6A==
X-Gm-Message-State: AOAM531SSNd+Akd2PNuDwt985Z5JV0SQEp0/bXnokwQSJe5iO0bp00xl
 GGumKnxLkuzpOLZycz3sjQ3y3IjynZQ=
X-Google-Smtp-Source: ABdhPJwx8ZB3IeQr09msM778ELNHTToq+Qc73hhIl+bWtjosPtRLzG8166FGLfKwgITZ18ya2OFIXQ==
X-Received: by 2002:a17:90a:5795:: with SMTP id
 g21mr6988218pji.235.1623959006613; 
 Thu, 17 Jun 2021 12:43:26 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:43:26 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: --to=linux-phy@lists.infradead.org,
 --to=linux-arm-kernel@lists.infradead.org,
 --to=linux-amlogic@lists.infradead.org, --to=linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFCv1 3/8] phy: amlogic: meson8b-usb2: Use phy exit callback function
Date: Thu, 17 Jun 2021 19:41:38 +0000
Message-Id: <20210617194154.2397-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124328_086870_03A8E8C3 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Reorder the code for phy bulkclk disable in .exit callback function.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d48171b0b32e..2b32a3eabccf 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -164,6 +164,15 @@ static int phy_meson8b_usb2_init(struct phy *phy)
 	return 0;
 }
 
+static int phy_meson8b_usb2_exit(struct phy *phy)
+{
+	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
+
+	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
+
+	return 0;
+}
+
 static int phy_meson8b_usb2_power_on(struct phy *phy)
 {
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
@@ -220,13 +229,13 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 				   REG_DBG_UART_SET_IDDQ,
 				   REG_DBG_UART_SET_IDDQ);
 
-	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
 
 	return 0;
 }
 
 static const struct phy_ops phy_meson8b_usb2_ops = {
 	.init           = phy_meson8b_usb2_init,
+	.exit           = phy_meson8b_usb2_exit,
 	.power_on	= phy_meson8b_usb2_power_on,
 	.power_off	= phy_meson8b_usb2_power_off,
 	.owner		= THIS_MODULE,
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
