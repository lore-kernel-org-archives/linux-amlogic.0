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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA62C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CAA420740
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbig2VIz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EQtUaySO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CAA420740
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jccOmrwJo1PVpUr9U4aaISfbQZHJ7nhOqmKTWfWQ3wo=; b=rbig2VIzSje2Y5
	5wHT00KIX0oRv92WtYqSPV748iNlwODIy+MhLspF0HF+LeKYb82TChT/Yh3HP7dxDiIuv+rSNaBmU
	zqPnWx9Lu3Qbp1OV1ILz3L224bGre2ToSR0OUGUsMwgDpTxUNs2AmE0FhnL8k+N6NLVbdXFHttOlc
	jKrgcJjkmFaZFa/7ZRjFnS0r5UQE3H5WqzXffbgYkZA3+N0D7lfxIh/qZde+yXHbJZvtRdg/2pQsk
	8Qkv70LeU1/G9OKxXWRT7jQnn6RQkK7o/J3HzEYmOP2k0anyBS4FrtKURqpE2MrayJSgJJavWgtbm
	buFUNRkFzuvJOpBsl17A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcCZ-0005vg-5p; Tue, 12 May 2020 21:12:35 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcBO-0004r2-8j; Tue, 12 May 2020 21:11:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id n5so10628818wmd.0;
 Tue, 12 May 2020 14:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QCz00tmEMOWf1BfX6wm6Ux86AFt3zQvcnwyO0soJUcY=;
 b=EQtUaySOiER3DZmqgJUZlvsEXfJQvIODFcA0vQdu43vOD4gOXWk5qpBubi8TfBg1cf
 ppcyXlTMr9NvEYgcZoRg4JZwZzDoHNhIk6pGygdUUgaQRNt2TOikOQD45CgNEtMlPrzm
 /A1gs9ZmHnK8vmkSo7dPUREqq93sMcJNpiT5GbYYnkTFfI3dGq+oeY/KNB87+SlvBaK3
 kmV9bqKwxmaNocUDjf3XDmCBz6mlK4PgSxnmdGcIFHGHeKt83Uhlzn7p51vejpJmXvaT
 aE3dmGINyBFgD2HngZ1zI1z3JNM1Xrv1aVoUSwjRANzsoWq2cTjvMYPURsSWSwHW/kQI
 eIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QCz00tmEMOWf1BfX6wm6Ux86AFt3zQvcnwyO0soJUcY=;
 b=GSAX3NFbkw5X+VOgyvAcriqmx94R8OaAmigsAbL5R+bscTNRg2YFGc1f9pwcsIV0Ht
 B5in8nEAHdkiSJUz6POGaOhTK2rDgf2S2pyGkvylXCe6SjjGZ9RpGWw0om+E6C8CXL4F
 4H4K2tf+QK1HVqi99Cc14AaZkAi2mGfblGM5TQwXPaliJOOp3gKAHzncUtiuC27Mq0h8
 BfYotS/pptzPNJMUBGOwVnn8uqFGXLhrfaAAzGruatx8dQ4+4lx7y8EySJ/oiP5wrKBa
 j6zl/8w0RT69tCZkS4L+3OAUbxqX/s9UcDHmIA7zyhPZEuBKiHtXXRAuH2yyL6QPsADq
 4EmA==
X-Gm-Message-State: AGi0PuYWfMKBi4H1GHQxwQlcREasQMEHVvvN1Igb866nyzbyC+ds+mUg
 ogvAljMQkJSBq4cdmBVreA+j0DwY
X-Google-Smtp-Source: APiQypIwG6YlDqv9Ym1mV9sH/sUllSp3MG0tyRa6e+gg0yIgvWrhNsgaj8VAtpPtWCH8XSAGGhc1aA==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr39502551wmg.177.1589317880711; 
 Tue, 12 May 2020 14:11:20 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r3sm9724228wmh.48.2020.05.12.14.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:11:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: Move the documentation for
 the TX delay
Date: Tue, 12 May 2020 23:10:59 +0200
Message-Id: <20200512211103.530674-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_141122_342385_60724B90 
X-CRM114-Status: GOOD (  11.49  )
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

Move the documentation for the TX delay above the PRG_ETH0_TXDLY_MASK
definition. Future commits will add more registers also with
documentation above their register bit definitions. Move the existing
comment so it will be consistent with the upcoming changes.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index c9ec0cb68082..1d7526ee09dd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -33,6 +33,10 @@
 #define PRG_ETH0_CLK_M250_SEL_SHIFT	4
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
 
+/* TX clock delay in ns = "8ns / 4 * tx_dly_val" (where 8ns are exactly one
+ * cycle of the 125MHz RGMII TX clock):
+ * 0ns = 0x0, 2ns = 0x1, 4ns = 0x2, 6ns = 0x3
+ */
 #define PRG_ETH0_TXDLY_MASK		GENMASK(6, 5)
 
 /* divider for the result of m250_sel */
@@ -248,10 +252,6 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 	switch (dwmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
-		/* TX clock delay in ns = "8ns / 4 * tx_dly_val" (where
-		 * 8ns are exactly one cycle of the 125MHz RGMII TX clock):
-		 * 0ns = 0x0, 2ns = 0x1, 4ns = 0x2, 6ns = 0x3
-		 */
 		tx_dly_val = dwmac->tx_delay_ns >> 1;
 		/* fall through */
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
