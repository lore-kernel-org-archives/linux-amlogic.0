Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649D4C3815B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 18:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39FF2206E9
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 18:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0Jb7nxv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EdxLKm8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39FF2206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4febi/Xa7nVHgA3m2hBjWzAhyLyXxYySYr6z7bwiVI=; b=b0Jb7nxvPtaK+2
	echtV9ek0menyiAVpS+WqY6qaFdExWF2izosC/O79rqGNas7RHlr+DFihtYdJfs0SsV3JdDXy/pWR
	9OZHUkGSHHwxNl2iITE1/9NLenn81VjI552fzfYjW0Rg4BGzrE2Pd2kub5pNF6unIaGOdyeih4STp
	EVUEYT+u/gcNN55Of6o9B4oOUm6pVzTvqRu7m30/IpeM5r+v7ZnFayafjbL42bAZ6uxGOz059W/Kx
	iFpdd4cPfaLn8l1OtMdxST65b9DsQZmpVx/rAJgPyiUI4r4+zxbeLH+C8GFTl5D4t/oMkem3ipYRd
	RvM7r9WqumpqVrgzjEvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP9OM-0004AM-Nd; Thu, 16 Apr 2020 18:37:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP9O8-0003tC-W7; Thu, 16 Apr 2020 18:37:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id h26so6039355wrb.7;
 Thu, 16 Apr 2020 11:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrr9neTYw1gwrfRxe9b60K+aHD8ESV7WJclVd1KpZR0=;
 b=EdxLKm8Tj61cPDw7eX3WTmjNlFqsh/4G6dTliuz0JdGPwTzZGO+gFZ4mRKeUi0rEL1
 6dswX7xSxLlexERENdFCbII4DKbN9xRPMGMJdGYtE5NjZzOD3sNw2GyTavGaNYp1LimS
 se1y0iKPUDnsQ6hHEE3xWGAJL9bdl/0Lxh8fByGbCtFRE9lLkRaHvFVaZBN+qZSccnGx
 z38YbcI006Hu05Njjn36eZtvM4RVrTyP1olWdDZQ5oT+KYVNa84WQeNzAj6eWizF9Yr2
 LyUK+4bZvDoTNpWjl0pwxAcUG9TbPA4JoOmzC99mG3FB1lQvDuDcGlTN8GiD9ThnROnQ
 /fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrr9neTYw1gwrfRxe9b60K+aHD8ESV7WJclVd1KpZR0=;
 b=fYl3fFuLfzJinKNh0Khif+TWhkguBzldxoHRj9tHDyR8NynSAN6hIXkTklVk6VX0q/
 OwMLZI2n1Pqopicsrh45GgcwWsBYz0Qb+QqPh1W8G6HvxG9MO2PCmbpb+kHALLCpd3uu
 NHXmZShgkXTSEvrqzeKnVeaIiiwou8BJc2TImjq+XTMPCZBGMN5LKc9pzO126hereL+N
 NP5HOG5D+Gd3CXUAqFxy9+3pjmNYgFHBomv4GcJLznwtztr4xaLptDvsF+WFjoulsmcn
 UtkD2bJPyRYoE4OVcKARTvln4fjeMWdhnfolonKoc67uZLDcVOFGn3s0jKEnf/UuWmXc
 S4Hg==
X-Gm-Message-State: AGi0PuZv0u5eMdYeg8f4uK4751SnerG4R9VQm2eRlKdgxzJTaK43MtZU
 hK2Aq0h+lflaQocwSc5aDWA=
X-Google-Smtp-Source: APiQypKa30OdRL+FijHqXsK6zwF4JZSn49RjuzTTw95UCtDdcJVy+xbes81OigZhv4KTeL1jlW3xQg==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr12511212wro.36.1587062243626; 
 Thu, 16 Apr 2020 11:37:23 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v131sm4626434wmb.19.2020.04.16.11.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 11:37:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] mmc: meson-mx-sdio: Set MMC_CAP_WAIT_WHILE_BUSY
Date: Thu, 16 Apr 2020 20:35:12 +0200
Message-Id: <20200416183513.993763-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200416183513.993763-1-martin.blumenstingl@googlemail.com>
References: <20200416183513.993763-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_113725_029425_AE47178B 
X-CRM114-Status: GOOD (  12.55  )
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

The Meson SDIO controller uses the DAT0 lane for hardware busy
detection. Set MMC_CAP_WAIT_WHILE_BUSY accordingly. This fixes
the following error observed with Linux 5.7 (pre-rc-1):
  mmc1: Card stuck being busy! __mmc_poll_for_busy
  blk_update_request: I/O error, dev mmcblk1, sector 17111080 op
   0x3:(DISCARD) flags 0x0 phys_seg 1 prio class 0

Fixes: ed80a13bb4c4c9 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 8b038e7b2cd3..fe02130237a8 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -570,7 +570,7 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 	mmc->f_max = clk_round_rate(host->cfg_div_clk,
 				    clk_get_rate(host->parent_clk));
 
-	mmc->caps |= MMC_CAP_ERASE | MMC_CAP_CMD23;
+	mmc->caps |= MMC_CAP_ERASE | MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY;
 	mmc->ops = &meson_mx_mmc_ops;
 
 	ret = mmc_of_parse(mmc);
-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
