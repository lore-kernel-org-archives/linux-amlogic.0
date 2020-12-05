Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC05C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:32:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A0D20825
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27A0D20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K2FlAefWeO1LQgv3wkYo8fnsFGUmxGBY8ENVPBsDlgc=; b=qx41bO6u9Yf8FSBbH+GR4yVNIU
	CzPpxQuYQ6ututMHpsicjDrinW2HQ0+o2dpBR/PYCWbYNAP7ZhGoD9qZyaiL/9ewRNjvpXCfAOMZn
	1zfHPEPuNvuZtXQw/26QVm0J/NArnNpgWCpPQPfAp7MOcr56Y5Ukw1s+6JuzUZywIAWHrP/giGIWu
	wndEQ+3Sp7hHjueAUIHCP1yWCsrd4jO770RJkEH+pTZd+klqlkJdV2ZE8Ni3ib+NB/l/uLr5KyW0a
	odhqOb/RXAy/nv7SjyFEBs5wlEz3N8pi0t7B6r7HP6GAlkL9wv3LhLpp0EmlmCf0+GL9lzurnrzF9
	qgq8XHZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klfAP-0005Sr-6b; Sat, 05 Dec 2020 21:32:33 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klfAL-0005Rx-5m; Sat, 05 Dec 2020 21:32:31 +0000
Received: by mail-ej1-x641.google.com with SMTP id lt17so13934754ejb.3;
 Sat, 05 Dec 2020 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=768hUwf7RIx859JFI/Ccnti1I5MLKPZtvOJEmoM469s=;
 b=aSFvGdOuicYAbmart/NUe+EXb25VcEXMR3LQh1MsDktoFQE+ArJnGaXSak7srOkMUD
 UP3SjEawoork/pRLFqUQYSFhGcxK9YZn3ns27EulCQWxoFZ0ej/YHM9d2WF5U4KeiVKI
 F5xXEHEJtyCboF3BvqFRogeqyt2OkhpFNVXqFNzhUH/tYj5Vw2bo9S/97zSCDegY2B9J
 3odTLUsX9wHzmGeE4Yy2ZkcMZ7rU6H6+1dXbExTFctx/MyBmw4EBYbbqS715AcgmQpMF
 QnOOmvcnUrb9X4fgHW05BrLQOzXqb3Qdi+l57fJqK03mnoRA0xINGbuXQBgaXWqVIr2X
 QFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=768hUwf7RIx859JFI/Ccnti1I5MLKPZtvOJEmoM469s=;
 b=IY7/6zDBdRD6MCIs0f0dzXtIl1LtqyTXrjSH46QVYZq/P0f/jPphiHzw4MztZh6t2y
 gBOd46vSiNO4F+r2jMmzU9IUHlxHWB1DFeOIXrNPzEIMwXZ/BrMqdd4rHwIkb5c/PYlT
 NZQsxaUy259BY1PmyQ/jEB4ANczfQ4KNklw/CR3Ims1lpSwT93zcdAeRLTijgtNaPEz1
 kZZwalrrSBIUjTfCqyFeacoTRluLDRmX/zSXUGDIUjPJTcY21A8fj4ukHRxfxDm2mwdP
 hFfx0y5PJy7s07VFkr2iKZm7ro9Y3oHP2pIjxo/aoI9L7RDIKPJ1rkZz4rkhgZ/92Qxd
 wIWg==
X-Gm-Message-State: AOAM533jvgfXABv394y249SD1/q3oDnHYys264/k4wb0l4CI5MRkFcbu
 ml3DeHwtjMLfP3j19BhjlfE=
X-Google-Smtp-Source: ABdhPJxsHoEh0SvQhHnb0vF6LgkmxnQALnCbO52raQQhcCfrUMmFXSeapOZ/UNbY2Vvq7HWJk8eEJw==
X-Received: by 2002:a17:906:1955:: with SMTP id
 b21mr12849375eje.236.1607203947393; 
 Sat, 05 Dec 2020 13:32:27 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13728d200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3728:d200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m7sm6390133eds.73.2020.12.05.13.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 13:32:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] net: stmmac: dwmac-meson8b: fix mask definition of the
 m250_sel mux
Date: Sat,  5 Dec 2020 22:32:07 +0100
Message-Id: <20201205213207.519341-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_163230_507463_86934471 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The m250_sel mux clock uses bit 4 in the PRG_ETH0 register. Fix this by
shifting the PRG_ETH0_CLK_M250_SEL_MASK accordingly as the "mask" in
struct clk_mux expects the mask relative to the "shift" field in the
same struct.

While here, get rid of the PRG_ETH0_CLK_M250_SEL_SHIFT macro and use
__ffs() to determine it from the existing PRG_ETH0_CLK_M250_SEL_MASK
macro.

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index dc0b8b6d180d..459ae715b33d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -30,7 +30,6 @@
 #define PRG_ETH0_EXT_RMII_MODE		4
 
 /* mux to choose between fclk_div2 (bit unset) and mpll2 (bit set) */
-#define PRG_ETH0_CLK_M250_SEL_SHIFT	4
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
 
 /* TX clock delay in ns = "8ns / 4 * tx_dly_val" (where 8ns are exactly one
@@ -155,8 +154,9 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 		return -ENOMEM;
 
 	clk_configs->m250_mux.reg = dwmac->regs + PRG_ETH0;
-	clk_configs->m250_mux.shift = PRG_ETH0_CLK_M250_SEL_SHIFT;
-	clk_configs->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK;
+	clk_configs->m250_mux.shift = __ffs(PRG_ETH0_CLK_M250_SEL_MASK);
+	clk_configs->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK >>
+				     clk_configs->m250_mux.shift;
 	clk = meson8b_dwmac_register_clk(dwmac, "m250_sel", mux_parents,
 					 ARRAY_SIZE(mux_parents), &clk_mux_ops,
 					 &clk_configs->m250_mux.hw);
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
