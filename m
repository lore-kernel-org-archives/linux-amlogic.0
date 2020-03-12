Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00E6C4CECE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:32:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42CA206E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 13:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M5rZq4HG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hUCDqIj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42CA206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+ol4/WiZNgki4hKx8++NO3cdSF6oz9sYEB1GObfAeU=; b=M5rZq4HG6uNI+L
	Hrm9pKwAGOtX9Lf6vnSbpIto1vMAdCZSkk0XRx6/5HKeh8Gv3XJNBBWw6pW3Tkb/ydUAYSCTLBWab
	0DloJXEWmFWS+BZhXtWujMZ4g7g0oG2WzQ+AyZ4CvH3OqPNTQBIiyxE1JtpHPnHZyvPl7vr6yDl75
	pjlDI5A9rP3X4GmrkUPKz1V9KDHc4sFZ80C7JtgcGnejhn5p0Do67r/Ojjy7tNeRRs96C+I7sAywe
	hGX+UOL5GyHfFI9ci3GXkR6dogNaPaTLyyoQ0QXzRlLKHaaFyVun50Cl69QGNDNXUdDCSCMsW4QZ3
	Fkyg0yCDjZYA5w7wQGCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCNxG-0004k7-CF; Thu, 12 Mar 2020 13:32:54 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCNw4-0003TK-J5
 for linux-amlogic@lists.infradead.org; Thu, 12 Mar 2020 13:31:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id z15so7497729wrl.1
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Mar 2020 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPH/Dy/CjLCenRWLG2Luxl8lE2WdXQS9qh3kQnsN4TQ=;
 b=hUCDqIj0/ip1fGR0w8g9JiTgR3VggFXz6uXZBIuxQFF8RI6pPBFb0oKUQZqohHTRzJ
 EHaOdl7mpyqXAh2wOch+xrBgXcNlimpN9pUcYfJPjcxIWvdkyqbSg9NQI7L5ScEkAZB4
 rMQWh59snVY+t+sBELnc4M5c4DmKQy+T/hQ5cw5ip7/2BS8wARxIRgItz7sfFyakw9vk
 mlBrjYp4ALqFRuMLjLg7MJ0VyZcGPi4hjaD+7P3BdyiA5CPOMY/d5Ix0Gesh38EQ24E6
 X5/Ga0uTigrBvfoDF9cVkNYXejKr5vaVSAdDmf2Fc1HVBFXkq/IRQFrjALiYCP+VQjwE
 a/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPH/Dy/CjLCenRWLG2Luxl8lE2WdXQS9qh3kQnsN4TQ=;
 b=d+HqEagDLWE9Lj5vbgzpODYDJ7yU8UXBq5C3xHPeUOy/sjLtcI6JIODB3dm+n9KVU1
 cYSg8CkUemtxx2mYY1v+ivkvXRVfueQwV3lJY1zN9XnsqgjqQEz8/lcMzNHy2WBnsbVv
 grENMOFpkyuKl+JzaQny1GTckPK/4+Ao2DVbonZ4zZA6R3j+GkYgM+NSvm9g4u9nS8DX
 /swZ9H4rpfpkcW1Uk9r75BdP64vp8T7xZvgJGJVTz6BO0kd6/qkA1q7NtorrzFulJrnR
 wTQKdAIAIQ8PbxP4LAKmHaILsvCfE7ssBl77W93EwI7HrxgpCefyAh5gPjFqEuaXqJDL
 mNHw==
X-Gm-Message-State: ANhLgQ1EP3L0i9J80MZaorm0WhAVFWZpMtMgPKVSjHPJ+0fyVY6uSwnG
 vEKY6Oswjp48GoYPXtmr62VEiw==
X-Google-Smtp-Source: ADFU+vvDGHCmjJAEW09IY2pn/rC0cuKnx5wPrdhmLydsBiF7dyxe06aMf+3l/75LbVxspehBFH2Fng==
X-Received: by 2002:adf:e911:: with SMTP id f17mr10602906wrm.87.1584019899241; 
 Thu, 12 Mar 2020 06:31:39 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m21sm12242885wmi.27.2020.03.12.06.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:31:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: broonie@kernel.org
Subject: [PATCH 5/9] spi: meson-spicc: add min sclk for each compatible
Date: Thu, 12 Mar 2020 14:31:27 +0100
Message-Id: <20200312133131.26430-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200312133131.26430-1-narmstrong@baylibre.com>
References: <20200312133131.26430-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_063140_667595_76BF1495 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The G12A SPICC controller variant takes the source clock from a specific
clock instead of the bus clock.
The minimal clock calculus won't work with the G12A support, thus add the
minimal supported clock for each variant and pass this to the SPI core.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/spi/spi-meson-spicc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 710b4e780daa..b5bd3a897e8f 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -132,6 +132,7 @@
 
 struct meson_spicc_data {
 	unsigned int			max_speed_hz;
+	unsigned int			min_speed_hz;
 	bool				has_oen;
 	bool				has_enhance_clk_div;
 };
@@ -685,7 +686,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 				     SPI_BPW_MASK(16) |
 				     SPI_BPW_MASK(8);
 	master->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX);
-	master->min_speed_hz = rate >> 9;
+	master->min_speed_hz = spicc->data->min_speed_hz;
 	master->setup = meson_spicc_setup;
 	master->cleanup = meson_spicc_cleanup;
 	master->prepare_message = meson_spicc_prepare_message;
@@ -736,10 +737,12 @@ static int meson_spicc_remove(struct platform_device *pdev)
 
 static const struct meson_spicc_data meson_spicc_gx_data = {
 	.max_speed_hz		= 30000000,
+	.min_speed_hz		= 325000,
 };
 
 static const struct meson_spicc_data meson_spicc_axg_data = {
 	.max_speed_hz		= 80000000,
+	.min_speed_hz		= 325000,
 	.has_oen		= true,
 	.has_enhance_clk_div	= true,
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
