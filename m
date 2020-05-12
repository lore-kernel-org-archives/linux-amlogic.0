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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19DEC2D0F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E50320784
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FUBGRU9c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IkVWXnOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E50320784
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/U88rhOoYZ56ShqmTYiaMZImDcL6b/0+BJ+08KTT454=; b=FUBGRU9cl4IqZ0
	FmP+d831F6at37yojzhVGO19N7aVR8kL2A67AIPKI0ylf77hbRiqS35WoGpLw6u+5yO1/90lKYcQR
	+GEJngJxI976lsJMBd2xNa78sxNrr3SXuIQekvd3FinuYUMl6+6MYY/x/QdF3X0UND6AFHpnQ9oAv
	pcDk18N5PgdfYOFnEp4rXJnLMm/1qzxbBrkyZsbl870a4gePuIlMzjC2kA0O2PcAjHkaDERDJwzCj
	giYOrc8H+GCj/iEXoHSucOYY1SbbyEBfs4OvVjEgOLlg0OD9DOON2GflQJy64coea3Zuy/rKCDM+h
	feSTAZN6QBdALUrsE9xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcCH-0005gr-Up; Tue, 12 May 2020 21:12:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcBN-0004qf-2F; Tue, 12 May 2020 21:11:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id j5so17727787wrq.2;
 Tue, 12 May 2020 14:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IyUJ8JvMJsGc3cYCEk/oX9tXJ35lckpImRBVoKxDiuw=;
 b=IkVWXnOcNw0noWwVJlSaM9F4DAuPiIUDhBHErPYnrAZkqahoBPrDGvXKfEhorxRdGM
 ZwhBeOoMFwmSfqjS3Rc2m5dKhzrtTm19oN4gEywvsSuuGwrdS5JleQ5gRbM2TsCIDekV
 cMMpkU3b9D0DCSEsknWBf2t6S67nm03Zcyi5Lgd4Nj8nx8ihf4xHp3o9eTWjHuHuqqeJ
 kobxhX70i8jXDePKLclusubDdFjnpfm24QTYCr7RfA4X8Mgcx7/Xe+YQVemebk85XnX5
 wynWisTFZIsY+0FCEbc7I6PxionoLBNKAFXNKqIAcvoU01xS0lpTtgE5ll/BBfJwH9Fm
 ji4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyUJ8JvMJsGc3cYCEk/oX9tXJ35lckpImRBVoKxDiuw=;
 b=Y68wZ4Jr0ITRWYD7Xlv4yEPhAq12s4HNBpbzfqZTCDzkbFMHTGpiNI3dih0FI0fidf
 4ryWH8GZBPAzn0EuGu5CGbV1CWLw5BinBgKbg/CP8fFKEbi6IsNbLASsC5g4ujiUyE4T
 lsS0Zt+Y7YgXVdyCsFEfwLr7hKIkbuNPnqlyfbAc1KGgLIlqn6+qYcJC1XrRr4QHmuDc
 bHaaHoiAs7oqzU0IxL7k7f1E5b4jR3mPHh4zCbHiULRrEg20Nlh6HMmmPnhNigQzNwkz
 CjyouHJ6XFhV+FzTt8liw6l4jcI2yswoCMyMOsZvPcMNwFWJxlWMulZhYeNBHJuYhSD2
 Mi1g==
X-Gm-Message-State: AOAM533EgvTq1oqldaQtAvKn/aEmfNveTdlUXL/KWbpFKrJ6iSOIwep1
 B/jjJ0vZtFIr85Kt7d9OQRI=
X-Google-Smtp-Source: ABdhPJzsZwd39f5Py0zKbOGojILcU3AAoMhXT85YlKr2nSXSJ0+n1SX9DQL4m9CQffWJHRNUrocNXQ==
X-Received: by 2002:adf:806e:: with SMTP id 101mr3351863wrk.225.1589317879749; 
 Tue, 12 May 2020 14:11:19 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r3sm9724228wmh.48.2020.05.12.14.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:11:19 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 3/8] net: stmmac: dwmac-meson8b: use FIELD_PREP instead of
 open-coding it
Date: Tue, 12 May 2020 23:10:58 +0200
Message-Id: <20200512211103.530674-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_141121_102618_2E8ADA7B 
X-CRM114-Status: GOOD (  11.45  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
