Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B569FC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 13:33:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FEB20883
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 13:33:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKt8QTCZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcdFak/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81FEB20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGABNSEynxtzqO/pBN7wWQqdoKK+J8ZB2zPPFw1Em2c=; b=NKt8QTCZ0eeE/G
	+v4fEk8IaGtLZ6BJwc/YWzGh9GZLXVSb2jcdsatb0Z1HSjnQ+7p0NODqX5jR0PTn4XMxtS+lEM5qu
	U8q4jCzYzTENY/LoH8OhqyFwzd5uv++rDonARDTqIk3MPWLj99S5GrvTcJ+E4m4u9pfMF2lblTBTz
	rlGtKMB82O42wD44lT8ayjRsDIkLU2110p9+W8ofo+qvmYRWpDtPbPsJGAhhnfQ++YHaiN5NcA8c1
	nOC2ycawKFlc6fDQfGGLTwO88dJtI0QVS4eJrjECsGBaWofMNm55dt2pr+Za9lxvxkH8KG9Q14fly
	KWOcJyzP9k9+m7VSIk3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUGT-0001kn-Jd; Fri, 18 Jan 2019 13:32:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUGB-0001eF-36
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 13:32:41 +0000
Received: by mail-wm1-x344.google.com with SMTP id m22so4545021wml.3
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 05:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Xp+nKelidfK4SZaINMJkVY4f2/xHwAm1MjjCrPdYpM=;
 b=HcdFak/511aFkc5GzJLwfvfIz/UPvaLXAVcisntz61f8X+tJQenMDC/T8mF39Zdag6
 3T/PQktvoSGVVnoSV15m7N8EKe3UOC9UwmygLaDWPFLTyYM90jawJOr4dTW/cjfv+uCx
 hjLo+xoTk2XhbXUSDs8HAaqKFKbF5wsuMmXw5TWmcsla5N23/ybT6eue1uN8Gh2jwyFm
 068k+ZH5NZdNPNIwKGGj+4nunkl1txqWHj8CSPnp6h/+Mq6MuWjHwVH7/lRFlORZHjaC
 NSVFtpBNVWgrmxf9eejQqSrqE+rc3i1GQ5+Pgf/A2qiErFCaDhkYJeYza+AoOtmhyLQS
 WAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Xp+nKelidfK4SZaINMJkVY4f2/xHwAm1MjjCrPdYpM=;
 b=ovKLgDojTXwLkWoY0Hp3Hyzwkhy4Z31NGfKPTXgUd2SrWSr7y0aooubW1j67q7U4/K
 Xrf5bc1wzERlrFv/R951VavtOVMMaxeBTorusW7hj6QOGacnHAg63aPPEsqVzJgQP1xv
 4eXMT0OXGfxReJQ6l77Zg7eoRkZVABHuY1JUTv2YHGgkV8TS1BmroQZnzfNND01A9E5c
 cvSmRc0QkqMHSwxM19nSWjmlbmGpfoQg/oXxiRtl2EekmTl6KSKHPnzqXqQiTuP4H7L2
 INXST3Hqvbya3lp/vzcUOdwHouwQLH9HocvlVJGBc7GFUImPA9Vr0sy7BdnqCffikKV6
 VYnA==
X-Gm-Message-State: AJcUukeKaPLqgoHgSliHUS1CX+RMYV+QHzC33S5Ir79K29BNyuyqSFSr
 lO8WTpobpdMZnXKQGKYBrpM=
X-Google-Smtp-Source: ALg8bN63btby0A7dihAbwDHv7m70Ik+PpoCKV4hhV6+aTCmclJlxbYyLRKbXnacdicrMAW3temQcUA==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr15216492wma.19.1547818352670; 
 Fri, 18 Jan 2019 05:32:32 -0800 (PST)
Received: from muskel.lan (ip-94-112-190-127.net.upcbroadband.cz.
 [94.112.190.127])
 by smtp.gmail.com with ESMTPSA id e9sm70867307wro.16.2019.01.18.05.32.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 05:32:31 -0800 (PST)
From: Andreas Fenkart <afenkart@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2] mmc: meson-gx: enable signal re-sampling together with
 tuning
Date: Fri, 18 Jan 2019 14:32:23 +0100
Message-Id: <20190118133223.16650-1-afenkart@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <3d03d45f18e8b3e10edc7dd7dd03c5b7167abcbc.camel@baylibre.com>
References: <3d03d45f18e8b3e10edc7dd7dd03c5b7167abcbc.camel@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_053235_596195_A7B8F156 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: "open list : ARM/Amlogic Meson . . ." <linux-amlogic@lists.infradead.org>,
 Andreas Fenkart <afenkart@gmail.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 krzysztof.michonski@digitalstrom.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

card detection fails on "BeeLink Mini M8 SII" if enabled too early
mmc1: error -110 whilst initialising MMC card

Fixes: 71645e65729f ("mmc: meson-gx: add signal resampling")
Signed-off-by: Andreas Fenkart <afenkart@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c2690c1a50ff..dba499009d0c 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -738,6 +738,11 @@ static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
 static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct meson_host *host = mmc_priv(mmc);
+	int adj = 0;
+
+	/* enable signal resampling w/o delay */
+	adj = ADJUST_ADJ_EN;
+	writel(adj, host->regs + host->data->adjust);
 
 	return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
 }
@@ -768,6 +773,9 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		if (!IS_ERR(mmc->supply.vmmc))
 			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
 
+		/* disable signal resampling */
+		writel(0, host->regs + host->data->adjust);
+
 		/* Reset rx phase */
 		clk_set_phase(host->rx_clk, 0);
 
@@ -1166,7 +1174,7 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
 
 static void meson_mmc_cfg_init(struct meson_host *host)
 {
-	u32 cfg = 0, adj = 0;
+	u32 cfg = 0;
 
 	cfg |= FIELD_PREP(CFG_RESP_TIMEOUT_MASK,
 			  ilog2(SD_EMMC_CFG_RESP_TIMEOUT));
@@ -1177,10 +1185,6 @@ static void meson_mmc_cfg_init(struct meson_host *host)
 	cfg |= CFG_ERR_ABORT;
 
 	writel(cfg, host->regs + SD_EMMC_CFG);
-
-	/* enable signal resampling w/o delay */
-	adj = ADJUST_ADJ_EN;
-	writel(adj, host->regs + host->data->adjust);
 }
 
 static int meson_mmc_card_busy(struct mmc_host *mmc)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
