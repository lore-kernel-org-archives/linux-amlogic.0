Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37B7C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31FEB20740
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="azZ4/169";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OiO8Wis3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31FEB20740
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mjnpxg30I0BgmNi3CSSKmTzayoFIyrzLO3z+Nhympi0=; b=azZ4/169GS8U5k
	VuDRbofi/mL6BhN+RmVzTnEVr/gL2xAI9zSYRtkvcuIs3hL9Lsu3kecQR0kNLneEOH0prDkOPlDHh
	Xe36CfDgPhw/nDQNf+LjHnVw05TP/Oe8W7JdJauZKbq+CNvnrWO9q+Oa9adMcmQtXteW5OoB9RZ03
	d6YEPAsBLD3iqz9uyq6x4W/YlNvK2Vkxtp6WaEkBiOaOFnXXnfu7kvPSr/j1s6f4yn2YscwTozpv/
	uN0wPol13PCWD5yKyajPgK4Oox0QOzc5JAmgjIGNqi3gziOvOIjY+tBBUzCptm+SRaFAA6TSa0VKp
	RFWYhUY3zV7xovQ7FCrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcCc-00060Q-Tx; Tue, 12 May 2020 21:12:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcBQ-0004tC-LM; Tue, 12 May 2020 21:11:26 +0000
Received: by mail-wm1-x343.google.com with SMTP id y24so25562043wma.4;
 Tue, 12 May 2020 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OY3vNHlapeEjakaFn6yCzHumviKMyl5frOy9KAAuLbc=;
 b=OiO8Wis3VDyMB7dnvd0E7wJPqM/0z6PNwEWg4fXyVsQg9BqMqXLtI7vgW/aFewdfvT
 nt0xYWXHjez6nekOAqnFec9B+o/Vpghwq7UO+fKl1pzE5t2zYC3dmFC3mE9pCg1HT2pn
 /YVk0K0W79p/mkgVWzMTdyFW52ocRtcGtkJuRQXSDEwlnGNZrWABXXcYqa5WRRgwAV2l
 JlY/Fsr0jkKDf6DhDBcQKsjE+Fd1udb5DLziGCslZJzw9Q6wzOpkR1hZ9t9rWI3vGHYP
 XAusR6sSbe1VN6LxmG0z0nYaufEgaO6VT2lGIfeXIFWLaXBMNPHzsn2aHCHpN5C2T2XI
 X+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OY3vNHlapeEjakaFn6yCzHumviKMyl5frOy9KAAuLbc=;
 b=DW7sVQeO7cA5vvwDgqQ/qdh7rbKbbd8EAlsvi2a+ETxTdz5Hw1HBeVr3Rr8NxWx4F3
 rW1vNw27Iy47cMCEqqMfy56zlobc1GTxI0nUVXgagoX97XhKEJ7zG143n7/lYNrUg3Jk
 Z97Lo6pxR08U/0R0AkMJ45m5z2UTUO50oD7pDGpFhQnCnoV8wYJ8eRPYxVcKdWiWq5/o
 jynv2RAZmTdN4FlILv2KTsjteY2KQKwu0gg0cLAo8ShVz4ppbyC6x+ujeP8+A9t6gpDK
 3aDWzsYsnzYgP3KPEX7rLVnJ0Uks50C89UZE0yyJNloABAfRDxJrWXJj9rb0diNZW142
 53cA==
X-Gm-Message-State: AGi0PuaqVdvo9AeykNe4hnBx59kLN9GjZ37Ukrx8VCXAc4Gy6FiMow36
 muV88x9bVBI6YRG7JsPwj1o=
X-Google-Smtp-Source: APiQypKo4FfhjEB0jvse1SzrdPMKKMpYk6wtVndZPK5RYEm8G9S1oNCzaSXJRUIPPcXA7ymfIlWncg==
X-Received: by 2002:a1c:1b96:: with SMTP id b144mr15118813wmb.6.1589317882863; 
 Tue, 12 May 2020 14:11:22 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r3sm9724228wmh.48.2020.05.12.14.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:11:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 6/8] net: stmmac: dwmac-meson8b: Fetch the
 "timing-adjustment" clock
Date: Tue, 12 May 2020 23:11:01 +0200
Message-Id: <20200512211103.530674-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_141124_720807_EC3B7884 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The PRG_ETHERNET registers have a built-in timing adjustment circuit
which can provide the RX delay in RGMII mode. This is driven by an
external (to this IP, but internal to the SoC) clock input. Fetch this
clock as optional (even though it's there on all supported SoCs) since
we just learned about it and existing .dtbs don't specify it.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 70075628c58e..41f3ef6bea66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -85,6 +85,7 @@ struct meson8b_dwmac {
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
+	struct clk			*timing_adj_clk;
 };
 
 struct meson8b_dwmac_clk_configs {
@@ -380,6 +381,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 				 &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
+	dwmac->timing_adj_clk = devm_clk_get_optional(dwmac->dev,
+						      "timing-adjustment");
+	if (IS_ERR(dwmac->timing_adj_clk)) {
+		ret = PTR_ERR(dwmac->timing_adj_clk);
+		goto err_remove_config_dt;
+	}
+
 	ret = meson8b_init_rgmii_tx_clk(dwmac);
 	if (ret)
 		goto err_remove_config_dt;
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
