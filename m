Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6772C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 17:58:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDFE360240
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 17:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDFE360240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Ws9paGthx0AQZw10ckP72TJxt1jsvkadMhNDSrvaI0=; b=OARH0P5IENuHFC/KH9pA2BOd4
	ITwybY1+Rx4Eyv6gEaubMxJCDrwKnyZx1mIydPGRykRDsb0cDR4jJDc11gEV3z3+sHX48the2QYek
	Blc4GJmFf3q6AeRxgKnsysMZ+U3dEq4xTxLjWoWsFHZRn/C0sWrPDrFmIavMX5y4ZnPXaL3P7tb/K
	dnJp2if40xzmkUeMbZmZBfhvpdSYVKwb4/1l26Th1u6ehgYjHI+H8j1HL7aAp5lvtYa93m3g1vHhz
	I2PZt+DxNQvlnY57W7Ha6wxzmwqf0kjmEJ5H7nD1zwE2A7ACL4owpectlQq8ukFtFFCyDEUvA87Fy
	EEjGH1SSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5V8-008Dwg-GK; Mon, 26 Apr 2021 17:58:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5Uj-008Dsa-3H
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 17:58:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so5501077wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 10:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXJyUHWR9e3fNX0FUmU6U772zBN6/EZYEgPq5y0F7sU=;
 b=HmA0y/KfXqh0WR8B+dGX1F1VSvMeL7nN0dlZk81QnwmqqY4JuLYxHmW3x6cpIs/Ykl
 eHnhmBz5M2iVY4eYjA0FlPYL2+0btrgJ3C6d6QI1ZvfwbuFDd1LZ5MHgG9AEv2EQAZnK
 gc7HkrvFAtsj5dyp2xvUIZR9dQDoplELrLIqHbsIy6/cc9d6ibhAV4TaumRCN9Jg+lIi
 RTdcdtIVsBOfeXYYpEXyAe8YMNgrkEmAPbT7LpIbU/sFloriEqIOaDaawA7pgFWahzH4
 rzJqwWLE5pl8vE312f19VAbPCaLHTB94Gd9p58TFMil5kae1aojdRKNtI/5iax6XkIpt
 trnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXJyUHWR9e3fNX0FUmU6U772zBN6/EZYEgPq5y0F7sU=;
 b=jFGsluuzCN4uij5cyPoJm4FH21Zm6+HTf+N2oxIwu8eTbcEhdaHwRQKuJudwV4mknP
 h6VoQ+8RQXRNKmL/XkFpIsG9NWvLftQ21/7uq1xDFkFeH4yhCfGGeAFfeY5q9aVAtPmE
 4UGH+6etsV2stlwCIJfH2jTX96R6WCxVDrNcJ7HP0rDW1ip8oQl765xjCXLaKXINf+4+
 9xu3aODrQnd8SbXSk+TnByWLPrdf6LfcYvEVV0LANofusbS8D8Bas3uhIRgKvpDcx46l
 CHc9WDkz5ISWFt/RTrwqNODTG0gls9tMwSPSHU26J2ZOtiqUaH3W3fkpebPFdgurtHCm
 MmIw==
X-Gm-Message-State: AOAM530+LoAZvOytEN5B2QG3X01U9T3x4l04mm9VKjPBnaxAaBaDSVJQ
 vYeSpvzeWtYqS2aOGtmcd04QHqIoSwZRPmI4
X-Google-Smtp-Source: ABdhPJweRkUEYw1DTQ233pzJ6WEIYcpHgNl0NI0BPe1YM+sLl68gqJqGh/27N0p0TvQ9iP5Eb/6ceQ==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr222855wmk.83.1619459764533;
 Mon, 26 Apr 2021 10:56:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id
 l5sm18001806wmh.0.2021.04.26.10.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 10:56:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/2] mmc: meson-gx: also check SD_IO_RW_EXTENDED for
 scatterlist size alignment
Date: Mon, 26 Apr 2021 19:55:59 +0200
Message-Id: <20210426175559.3110575-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426175559.3110575-1-narmstrong@baylibre.com>
References: <20210426175559.3110575-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=0iE1gydo5IoVoHEdTGhZZiatpUhZ9Z5MLK2Vn7+Gc1o=;
 m=v0oQgZ0JKMrLqEjNdBsLtL6pDaOlXk58P1dmCAEdj/4=;
 p=apUW8R+B7rDuTY8jQzJbY1kUstg02pFzve7cG1Srg0k=;
 g=120693627996a6c50f2c7d63785a51f2a4a796fe
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCG/pMACgkQd9zb2sjISdHFYQ/9Hil
 hhEr9y8pHCmwmEbctpy3poQJ04OI8iFGOlMLw6SKvRXTyjh6C0+YuqQFyCSBO797cuHXqDZ6GgasD
 qzDUgEerAnznpLY/OSJCwLyTDCTxdAFjR9ueDLCFKrIYN+UQC6ZcQlB0yO/opcAPNlhq5r+QZ1XbB
 MpQUSH6XAzsOnFd+r6Ww4oSAsT1dheDS1BIM1Q1ZbTev36uBuVbFRxrpip6RzGtB/Yrm/t0qRCX2K
 MUTa5ylDPWthAb4Qw01P84Tkoi3lwXfCPUCSSckQMiYC2G+HSzbijZESXz5FIITebXEep6l2Qu27c
 m3b2yf2EKIdvdyN9LgrOIAeHjzUcGdAs4zSCABEj9RQMDmbxf0NlX1dG1eWLKdw67kot33GTUmHhG
 xjBSshBGPCRxVcH05TX8jvNfBWyca1Tj5IxZohUccSpM8dQs7673a20sEBAdw+hxAMMmuTKphZbRS
 FZ7X4hb4D2nDxEfVUBl7Un92QM+fcsjsbrNnNvTGIp+Ns2pKv1/jxHpwqywkR+ovEz4E5OBgDVzMY
 RWo1qCx/ICDLJRWnud0I5bAgPk12t/MAHawWZ1IKO5dyq17FyErMVvJ9bkCd7LoA16I3d9gwqsjSm
 8DrrqlcrLswi71Pl6eKju1EMwVMMzuCz9srin2aeFp2DI+1jpHe2UTF8KaQKreME=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_185805_310045_1874DD8B 
X-CRM114-Status: GOOD (  15.24  )
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

The brcmfmac driver can generate a scatterlist from a skb with each packets
not aligned to the block size. This is not supported by the Amlogic Descriptor
dma engine where each descriptor must match a multiple of the block size.

The sg list is valid, since the sum of the sg buffers is a multiple of the
block size, but we must discard those when in SD_IO_RW_EXTENDED mode since
SDIO block mode can be used under the hood even with data->blocks == 1.

Those transfers are very rare, thus can be replaced by a bounce buffer
without real performance loss.

Fixes: 7412dee9f1fd ("mmc: meson-gx: replace WARN_ONCE with dev_warn_once about scatterlist size alignment in block mode")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 1c61f0f24c09..016a6106151a 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -236,7 +236,8 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 	if (host->dram_access_quirk)
 		return;
 
-	if (data->blocks > 1) {
+	/* SD_IO_RW_EXTENDED (CMD53) can also use block mode under the hood */
+	if (data->blocks > 1 || mrq->cmd->opcode == SD_IO_RW_EXTENDED) {
 		/*
 		 * In block mode DMA descriptor format, "length" field indicates
 		 * number of blocks and there is no way to pass DMA size that
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
