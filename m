Return-Path: <SRS0=PnGF=DE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD39C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 02:55:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C6220659
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 02:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kX6sW6jo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLV5QSB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C6220659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R5qoUVrzHvCAkvFMQnN7O/C0Rn4uSb5AhPTR0DHBJz4=; b=kX6sW6joy+DTbKHITi4hlcihs
	XvillI6kij730lyYcUc4nr9tdoyL99gzuNM72/fInsu3iE/Sgdcw5FwyuUraVFSu1Mam2XGzCzhZX
	1q00b5bui6JhamBbvwAR0RcZulh+pxF5DJF9NgEI9UgF7M2o5lO2rhE1nYHAhWyvIS9aMJAMJfmBw
	Z/oFAHRAcKeNlG+eT6CVDNEJPPHGUdO2lcKd3MxnMVIeYcOWmKhFA3HcAgrGk1s3mnlp7bslVuNwN
	oa3O5JH3OLjwmrTOj34eRQxoJzaVehWeC+V0NZO5lhfgx7fwjP8VVDv0QFjFVJnyE2pj7QkRpOJek
	5Zim6fqwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMMqZ-0002Cz-Nx; Sun, 27 Sep 2020 02:55:31 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMMqX-0002Bu-Ui; Sun, 27 Sep 2020 02:55:30 +0000
Received: by mail-pf1-x443.google.com with SMTP id l126so6393619pfd.5;
 Sat, 26 Sep 2020 19:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wQP8gxQEhJdX16HDBnel4UAqpoVYdnXnUfTDSEGDPM=;
 b=TLV5QSB6+iZuhDv9OY2xSlGaq8eRNcvDh6j54iejbe3kxpC5JScz5CFzsoi/mD+4jl
 iTMBq+BmsjzF7XCyAbtciTRKtcd6hDSkGUoXwXqDYRPXWKEp/GCcFRzmngBUu9EoSDY3
 lc8IfwTVimvx7467szsdWVWljZX6X/u3NSgebzhfoj9QXPSJrGumpj+fbsjU9HYqg+s0
 AJC7DLcHkOE4PHkrseXxzGia9GtcoJy4Tdz9atmceMWqgBiBRALHljUx174OriXS+Q54
 GhkkvXtSyxFfkGFGGZ6pdfcjlxQO+ECqik0JAc/PkFX1cH47yZrDi3aA4eKbRc5PU8su
 axnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wQP8gxQEhJdX16HDBnel4UAqpoVYdnXnUfTDSEGDPM=;
 b=pICfMppmZ3Td+HJRasic4ghHh9YJkYFkUycGtBiiXAqxQSGM0qG51VybqSrT6Elydk
 u2dQZ2xVVSdPItOgRc9Tw2cY/fLPzXU/bX+eiM0hwyVdVPCIgTsOw/6nQvoMQm+zkJzx
 qsH5JreW/dLUY9sW44Q9hKHMkGxP7B4yUDMPIKffgMK8EvelDGv+WqI3DnQij192QoNR
 tBQlfHGz4Rq/GEzlNfPRXNg4LQ0mGZlBJ6HwlBgTI/jHeNo9ilVlWjeW98VWADBP9PIj
 SA5g1QKKBc8tLL3TpHjM8Z9oyeoowdVdsd4rPaUcAgT4SfuRGqWwOnJ4sU4rvYDM01kP
 v7Zw==
X-Gm-Message-State: AOAM530GWlA/qTYxTMBCUgCby4MwPtt/5eJO1sK37OHWrAdkS9GHsMfV
 Dnx8QgpVK2JJA9cOv4L6NSP3ZKQTdg0ALy2A
X-Google-Smtp-Source: ABdhPJyHYKFECut/kiN4Y/hWA1pDsB1jKEgeA/WxE9DXAIAO0u9D9OR094Z+1KPAsxMMnnYwK1Rs7A==
X-Received: by 2002:a63:8c6:: with SMTP id 189mr4623552pgi.207.1601175327606; 
 Sat, 26 Sep 2020 19:55:27 -0700 (PDT)
Received: from buster.buster.your.domain
 ([2402:b801:2840:8200:21e:6ff:fe42:5032])
 by smtp.gmail.com with ESMTPSA id x13sm6685025pfj.199.2020.09.26.19.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 19:55:27 -0700 (PDT)
From: Brad Harper <bjharper@gmail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH v2 1/1] mmc: host: meson-gx-mmc: fix possible deadlock
 condition for preempt_rt
Date: Sat, 26 Sep 2020 22:54:18 -0400
Message-Id: <20200927025418.12382-2-bjharper@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200927025418.12382-1-bjharper@gmail.com>
References: <20200927025418.12382-1-bjharper@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_225529_992071_C75D6E56 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: Brad Harper <bjharper@gmail.com>, linux-rt-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

---
 drivers/mmc/host/meson-gx-mmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 08a3b1c05..3ba8f988d 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -146,6 +146,7 @@ struct sd_emmc_desc {
 };
 
 struct meson_host {
+	spinlock_t		lock;
 	struct	device		*dev;
 	struct	meson_mmc_data *data;
 	struct	mmc_host	*mmc;
@@ -1051,6 +1052,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	host->mmc = mmc;
 	host->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, host);
+	spin_lock_init(&host->lock);
 
 	/* The G12A SDIO Controller needs an SRAM bounce buffer */
 	host->dram_access_quirk = device_property_read_bool(&pdev->dev,
@@ -1139,7 +1141,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	       host->regs + SD_EMMC_IRQ_EN);
 
 	ret = request_threaded_irq(host->irq, meson_mmc_irq,
-				   meson_mmc_irq_thread, IRQF_ONESHOT,
+				   meson_mmc_irq_thread, 0,
 				   dev_name(&pdev->dev), host);
 	if (ret)
 		goto err_init_clk;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
