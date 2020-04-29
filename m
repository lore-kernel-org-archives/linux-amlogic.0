Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA28C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:18:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C9A2082E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 20:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DoahUv4/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tqN2p6cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4C9A2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVEG23HPOKC/QCxnGH384iXiYG32nwY4sV7P65SM/nQ=; b=DoahUv4/Lr4NgD
	Un1JTdvhxZuHUTkV+l4QPSr1kVWCb9A22sXiEh5b7nL782gccSI/P3Zmr4N5nhKKyOFEDyk0oqEGh
	qnpLKVFn7gJJ18f0deYgskD4kkcmOUwx7TmM4PJgTA2I+C5CkzNMF3jIYEJ3ot5kdzjk4Cq1uRyGk
	j6HY9TdazoAQlnE+u3SHKA2zlo44nByEwMOKAAGxUD/azGMXiVs+xVZqXcgplVddgJh39CUqREql2
	H6aJG+MWVE+HYYQRN3py2kPP3PxMH84jX6SCA+g9Qdq2TWkxWPrwOoFyuTs6e2ZG/gZFSKyODC04S
	PH8MNTxkG0+6BGvmceRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTt9z-0007yn-QT; Wed, 29 Apr 2020 20:18:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTt8t-0006vN-Qo; Wed, 29 Apr 2020 20:17:17 +0000
Received: by mail-wr1-x441.google.com with SMTP id b11so4113134wrs.6;
 Wed, 29 Apr 2020 13:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cq2CMCfNFIo7pBX1TF7b/dKJdrRkh6g3At8GmpCqDn4=;
 b=tqN2p6cbLg38vJgSeASbAQo1ovE3VIDD2t6o+S/8v2Lg93Hj7R1SKjQY/BzKe6J993
 NeQdaiwezZodZrXhrRQUyCAblQK4cEY4lihoGyIkxM3x+XHfvlCMWfvJ4MeHjxuIV/Vk
 5QLthzNaA/zn+hDa8T2iIllR1IDkd5wEjhPPu05sOHFBwtbWd5dwlGQpNBDcms5I6+cU
 XZJR1oo9AKQ3xWOi21Jp2EFNjMCSUotqDSq9j8kxEyDdSr/4vlN/EWuc8901AvJDobln
 Ho/dLv8zBDCb+Jw+HU6qBl7nbc0eg36OUpCKAUz4UdtRpxQFDO7maikXG1YkZZfRI3K/
 DwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cq2CMCfNFIo7pBX1TF7b/dKJdrRkh6g3At8GmpCqDn4=;
 b=h7RlSJDYgiSSrm+Ml/5JNxrowwi7dxVwzvd4G2zw6KgLVphokz6PuyvqpjIcn5K39r
 L+XzuODgOEG4wfZka7hKt6gssK40f0F4SrF4HX9Vv99gqW4ct+HCtg3fhRgshpLCwsAH
 Fr/8RU5GtngL352N3M4VzMqnmXx18efBTIqAaVJw5eIl5o6W8m9G8HSchlRnrk+pKzMy
 fBeIgEjKSMufS31jHBdUbhP7KWG7+V5NBcXm5CG4k40isjxo0OczfEjaEZwBdYFmCqxR
 I9FTitbUadk+4FaEyS+ILkNUfmq1m2UczpmZlr36NX96u6RJWsyGtNR9m3Lhe46ITa+t
 BhAg==
X-Gm-Message-State: AGi0PubWluOtVBKXPOXEiDTCjt9su/n04xvrANAfj3Ftmo8cfHq8tRqn
 QdRUvhCtCpdbWivXpGm8K44=
X-Google-Smtp-Source: APiQypKKrc+VsYDd27uw8w+8me5jo1cYxiOApSLcXUWgmctOf6zkILYraWmMsPldaTWfAC2eBy2dKQ==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr38575871wrt.98.1588191434647; 
 Wed, 29 Apr 2020 13:17:14 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q143sm9923623wme.31.2020.04.29.13.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 13:17:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC v2 03/11] net: stmmac: dwmac-meson8b: use FIELD_PREP
 instead of open-coding it
Date: Wed, 29 Apr 2020 22:16:36 +0200
Message-Id: <20200429201644.1144546-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_131715_868892_3A8DF277 
X-CRM114-Status: GOOD (  11.20  )
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

Use FIELD_PREP() to shift a value to the correct offset based on a
bitmask instead of open-coding the logic.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index a3934ca6a043..c9ec0cb68082 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -32,7 +33,6 @@
 #define PRG_ETH0_CLK_M250_SEL_SHIFT	4
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
 
-#define PRG_ETH0_TXDLY_SHIFT		5
 #define PRG_ETH0_TXDLY_MASK		GENMASK(6, 5)
 
 /* divider for the result of m250_sel */
@@ -262,7 +262,8 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 					PRG_ETH0_INVERTED_RMII_CLK, 0);
 
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK,
-					tx_dly_val << PRG_ETH0_TXDLY_SHIFT);
+					FIELD_PREP(PRG_ETH0_TXDLY_MASK,
+						   tx_dly_val));
 
 		/* Configure the 125MHz RGMII TX clock, the IP block changes
 		 * the output automatically (= without us having to configure
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
