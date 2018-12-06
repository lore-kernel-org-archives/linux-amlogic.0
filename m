Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA6AC64EB1
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0058620700
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Dec 2018 15:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrpppXAI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V69wUMG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0058620700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nX6SxjfqAnxby9fNI4fqqTJJibjgj+R8n4JPAttWPKg=; b=mrpppXAI7DaypF
	7QqqZoGB91qxwJ5aWpJRYMLwvzexf3m2jpyBNQPRszkXZ9BkVcgVNfmoYpe+fSxnvrfPI2sb8lskA
	K4sxC7Wck6LQzbHB9xNiF4IW5nntqKTjX+X3B/TxOHh9EfSQWP1jBPoLrLZLgBK2RJkEaFYDO/+IE
	Gpegi8A/wGfkRI5l1WAqSRzxUiH9POwcrW/rmhrcFzxss2itkyot+CAgTLN/w6ONz/J0SqB/JmTRe
	dv8BX02vbg5DAvagLCRkMPXfvae5mGUG3IhLzmInW8COCdvlag8WZ4zw/CxM/H4hfUCMrSf0U5/2M
	xR3bHfA/JgLOPN3m63GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvQV-0008Ga-Ke; Thu, 06 Dec 2018 15:18:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvQS-00089o-8o
 for linux-amlogic@lists.infradead.org; Thu, 06 Dec 2018 15:18:54 +0000
Received: by mail-wm1-x342.google.com with SMTP id f81so1416217wmd.4
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Dec 2018 07:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9D+IWNIkzvM4lr5AWVEe/1dPuYwCLo7SNBs7kvA6F/o=;
 b=V69wUMG28wtoJtdJvClt8+e4MNUFCgT9w5PW65OzLv56uK4D54BydOiREZ0QqqI6Yj
 nk587zOLB50DozkpeJgAVwuTXyfanIIiYzRWAk0+RmO0G77yvCTt1HQe0oF4D4U4gIX/
 K+tH+Ei85fXP/cer2qzJ+E+nrrcsr/el3V1DRlWJ76S8dnjfpxCG1leb++zeQUGNt0sg
 6XjfvIOLWDRXhd5mRCAZ1phYICvS+rKtgvMdf5InGSXVlZ4+w+CAg0FQjtIbn43RSCj6
 QUOHKIBu5tWVUobolT9ZHj29k1SSP8jzn7rFngmbZFLolMiGJnzHhBVriKGiMENPrSFY
 Jnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9D+IWNIkzvM4lr5AWVEe/1dPuYwCLo7SNBs7kvA6F/o=;
 b=L4EX6u7wQpFOHGZJTgLXfIoXYot0h5Fds2Wq1jFCMYTFk/tnceTTt3AaU4jR32nvwu
 2USJ1f7JkV39BYZO1P5g/YiV3ygrAMaUspWFTPLo4PnW4u1EtjfSCMySmfx8cQJvMTQp
 tmcg3sT5sM5CqjUlvQ0s+O0Bwkp8qzqfC0+BAIrjllRnPzTpwj04ib4dloaTpyABgVVi
 SQR94EiMXSuU1yjXxh4Hz6r8dDop517U08dlhTKp9CJlDMjhF/0KzOGdHcvmST0rdRNy
 3Ip3issJ0Qqk4qJycbCpfTnlJNgvzz3hsKUwsX8hpKJ33UW3Q88CkTeXByD837myMAY+
 7yHA==
X-Gm-Message-State: AA+aEWa8qGDNdtF5Y6hvz2Ir55dA4JDB7SId/+eCf+XIJibURqVSS4qe
 T24tb7RSr6+UBBLHVUoHbkQ1OQ==
X-Google-Smtp-Source: AFSGD/WZLKmAh/mxiuXK9Ct6fORvClnB6EooPxfPYwnm5i979312KWaCMeM6NJhlv80pX5rsGOOQTw==
X-Received: by 2002:a1c:9d97:: with SMTP id
 g145mr20578555wme.152.1544109520556; 
 Thu, 06 Dec 2018 07:18:40 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id j33sm939652wre.91.2018.12.06.07.18.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:18:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [RFT PATCH 3/4] mmc: meson-gx: align default phase on soc vendor tree
Date: Thu,  6 Dec 2018 16:18:27 +0100
Message-Id: <20181206151828.24417-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
References: <20181206151828.24417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_071852_661569_BBD25585 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Align the default Core and Tx phase with the SoC vendor tree.
Even if the Tx phase is different from what the documentation
recommends, it seems to provide better results.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 5cc31e434ca1..837bed0b8c01 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -634,14 +634,8 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	if (ret)
 		return ret;
 
-	/*
-	 * Set phases : These values are mostly the datasheet recommended ones
-	 * except for the Tx phase. Datasheet recommends 180 but some cards
-	 * fail at initialisation with it. 270 works just fine, it fixes these
-	 * initialisation issues and enable eMMC DDR52 mode.
-	 */
 	clk_set_phase(host->mmc_clk, 180);
-	clk_set_phase(host->tx_clk, 270);
+	clk_set_phase(host->tx_clk, 0);
 	clk_set_phase(host->rx_clk, 0);
 
 	return clk_prepare_enable(host->mmc_clk);
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
