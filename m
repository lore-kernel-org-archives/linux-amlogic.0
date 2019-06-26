Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CD2C48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E885C2054F
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IRC/S09r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EnSOVVnY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E885C2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pgto+ejrVDEego03nFylMnhGPGfVjtDVHgyDkkc7xtc=; b=IRC/S09rSKSMzi
	Yhx31ACJFu+ZpeUEbZd/kyb9HXkjzyU2OD4gSXRVgdhA8Ek9VMAXRgGf9Tdow6InhNz9k9NwxoE+G
	aDGY5yqD2BU4K4BrUckxU4Ga74XXCe0VGqkv/7enNzBKKNkoTBoHuckYl2LiCtMXm11jBQM6UhQ8s
	gBn8+2Xe3FgT6Qyml3RqSYU0LyVQDRXPTONqPZKQGT0zliCYAwuccecEmQjWPibCQRVHZL7ihTa/N
	15SmkhgmDZ94pmkzoVaYJgAUFuD7/WoIQb1vLrTVBgbftFFL/q5xcXKkSrHX1SJlevuNCrUhr32Te
	UrSLE4O9fKQcECZjwYJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3vz-0004TQ-UL; Wed, 26 Jun 2019 09:09:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3t7-0002bg-0H
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 09:06:46 +0000
Received: by mail-wr1-x441.google.com with SMTP id n4so1740385wrw.13
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
 b=EnSOVVnY6HmW74fsUG11uqh4W9Ca4fhJ6b5ER6IbuUpbfQu++NdU/5WF603Kdm+tcR
 8Qt0AUaAuNZ+O0/4eJBu22IJ6rLN+IhUSoCUJFwXv98a8K5b6osxC5AJ4aHO9p9ryvJX
 qBbMvEAY/TDyWVnHEMQp3n+nr+M6YuHimQVA17Oglt+iPBFs5OgtmJPG+G6M2BEdg2QR
 gr4R89VAPzlxxwU3/vgiVpjydXGpqNYFOQcN3/dkh8M9IAkZfzq+NwCLa54zL7RvpQoZ
 4YQGtIQ3hpSRX7qed0bdC+ASgPHKNsZD09k7UmbT5JnuK6UM+bEy0RsllPrsz5Aams3U
 ce1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpe6ifKz7SuClVLyY+/xaKksjob7YtLZf3uysFqr17Y=;
 b=BXt5QM2N0bDUMkzT+AkfOSARt9kRywHs6EWXrbdR38K5aH1SNCZZX6bVGocDWlRLr7
 ycdB578Pfb9fSFxvF1rOhVL3LdIRayc1KAuKtfkRsQccN9MwgPFdS2MhWJI64ei/y6MO
 XwW/5cLqg1wJJ7OCatJavJ1jdYOqunTFnDRshUBKCCd5nlgKvGj07R2ULsbyiTBbveyl
 zYL2FKv4wCPMZhRU+PYt81MKvqNnr9PE2Tnz4OQhHft9hwhHhPmOHpwxPwCr3Xx1OtwO
 s15l6FQMnIN5Zf5dqQsoPcEa5BmEc4dRwu0+3DKznV/dnATEivwwZoJ/HSpcFMS7NlrU
 JeoA==
X-Gm-Message-State: APjAAAWIH1ziv/qKgigUNaFRXoezXB0J+sesaQ9lkaX/+VQeKH8B0aJ7
 7NTcSMCu63xXKFKurQLwGYM14OeECL4=
X-Google-Smtp-Source: APXvYqz+1B6DzS6Kjekyrh2jZBiRU6kd29TGoNp8T45F8kR2z/VFBuW6kGnRaU/9KV8IL6dxlckyrw==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr2893052wrs.21.1561540003566; 
 Wed, 26 Jun 2019 02:06:43 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 02:06:42 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v2 06/14] soc: amlogic: meson-clk-measure: add G12B second
 cluster cpu clk
Date: Wed, 26 Jun 2019 11:06:24 +0200
Message-Id: <20190626090632.7540-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_020645_230873_EAF8DCFA 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.

These IDs returns 0Hz on G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index c470e24f1dfa..f09b404b39d3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -324,6 +324,8 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
 	CLK_MSR_ID(84, "co_tx"),
 	CLK_MSR_ID(89, "hdmi_todig"),
 	CLK_MSR_ID(90, "hdmitx_sys"),
+	CLK_MSR_ID(91, "sys_cpub_div16"),
+	CLK_MSR_ID(92, "sys_pll_cpub_div16"),
 	CLK_MSR_ID(94, "eth_phy_rx"),
 	CLK_MSR_ID(95, "eth_phy_pll"),
 	CLK_MSR_ID(96, "vpu_b"),
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
