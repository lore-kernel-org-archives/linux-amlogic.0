Return-Path: <SRS0=FxSk=45=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F116C10DCE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 06:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9B820578
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Mar 2020 06:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fgHIA5ZM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHn2t8Gp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9B820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=K+N0X0r6vPbRpLw+gPJhGjrxKP3UbnmLLmVxYoYyRTQ=; b=fgHIA5ZMeUxfAzVIA+3cfmV/qi
	yw1ij87Mspwp3cac33lsfq5y6omFlc4RqqJe+pz5vMWlZjMcEo7g+H1cHRDPxRTdM8UTzz1GXQxVr
	YljraKr7LylcA6ECxifKxpOPP4ZTcdqWOVpOeGZI3m5SZyAjsA8Ku98a80M+Qxj9F46bIzJxY3lGC
	flpuHu0Zjfhww2FrxBx3Oro7St+0Yopj1UUUrBgYJ002mbCrR37hkDh/0Ds9C45wmvZzM3e/GFhR4
	mIWJi7m6QdPNnmm2WgyxaxJqCtl1WIou5WZGVNeJZVDEmwsqllpoRZl0qKWkHK0k/5E0PL4TFwR7z
	63pZH4RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCHdx-0002eC-QS; Thu, 12 Mar 2020 06:48:33 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCHdv-0002df-7F; Thu, 12 Mar 2020 06:48:32 +0000
Received: by mail-pf1-x443.google.com with SMTP id x2so2393344pfn.9;
 Wed, 11 Mar 2020 23:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lxjxhXNAD3AGywNMl8H5owtCRspegZReTpVXsaoFlvM=;
 b=CHn2t8Gp6E99syTcM5Av0LZWL8jbCoQ5jap7ar2l6fwwQ94ld29tvZ2SQaDyM2UU8G
 PW/TBP58I1SL36LotuxvC8sTUJ6ISHI1Ks+kH0bK09zP46a4aZ3tE9av/ya27yUt8qbU
 XoE7fVdMiU85mCK52RFMbR+nutYGYwxFK1LezC6Hd/PY6kJseH+I6HfBPlAaAtROTs/P
 VTtY/fhkw+1KfQ6s0fqwH3xjOPJE9GLWoYvrPtTJkhSTE0waj6AkPoJPOO+8yybr6HG9
 j5zWZWCdxKJE7YczJZnE4y4AJE04ML1XF5ToDQYzB6fERP0UIHA9gpvlQ4Os0pnmcpIt
 8dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lxjxhXNAD3AGywNMl8H5owtCRspegZReTpVXsaoFlvM=;
 b=skKXIfa4hewvayGZlIaS7asS3EisXRdEuwu5pC7MoKjIjG6GuW3p8etSzsUMcPqs5B
 V9D2lEJHAZB4XQJzeh3H1ksrghIJOvufm0BSTkLT4s8Vo3Czm5zPeRok+oxje73eUmAl
 /9AA5r0BLSRmTzzgxXO37lWjy/5VURKIKTffmd4l9qO10eTWJTDlR6hpEb4+DpSrICUZ
 NjfHz68xj3iI4fprp30GeIGTXqGMU/4Jy2mHhWmASFRbNGEd+vi0e8jTwLuFWLwKmhNI
 I/MRvgdR6Yn9BdmxHbSKjE3uk8wc3cKG9GpRuKjiHhj3AzTV5/UAjWH/JKgziKxzHZ30
 +hrw==
X-Gm-Message-State: ANhLgQ0GHOYhDS5GrDl0bTOhmLac1cwvC9/yTar2Z6q0d9fCMDlf0mfe
 6qhxQ/d2qg0frIvH8GG4ELs=
X-Google-Smtp-Source: ADFU+vsZyABanN90ZhdifavscU6wtE4scsZ3AAJ8cEf7mvO9vLvMg7a4MP11N/8+VsKLJKB7fS7zqg==
X-Received: by 2002:a63:4282:: with SMTP id p124mr6575179pga.59.1583995710764; 
 Wed, 11 Mar 2020 23:48:30 -0700 (PDT)
Received: from localhost.localdomain ([106.51.232.35])
 by smtp.gmail.com with ESMTPSA id z20sm23429783pge.62.2020.03.11.23.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 23:48:30 -0700 (PDT)
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: daniel.lezcano@linaro.org
Subject: [PATCH v4] clocksource/drivers/timer-cs5535: request irq with
 non-NULL dev_id
Date: Thu, 12 Mar 2020 12:18:17 +0530
Message-Id: <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e47ba222-bf4e-d13c-fbd3-6e7952097188@linaro.org>
References: <e47ba222-bf4e-d13c-fbd3-6e7952097188@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_234831_286438_43F0E3F1 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: kstewart@linuxfoundation.org, linus.walleij@linaro.org, shawnguo@kernel.org,
 festevam@gmail.com, afzal.mohd.ma@gmail.com, f.fainelli@gmail.com,
 khilman@baylibre.com, krzk@kernel.org, kgene@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 u.kleine-koenig@pengutronix.de, rjui@broadcom.com, s.hauer@pengutronix.de,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, allison@lohutok.net, linux-arm-kernel@lists.infradead.org,
 baohua@kernel.org, sbranden@broadcom.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux@prisktech.co.nz, kernel@pengutronix.de,
 info@metux.net, nsaenzjulienne@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Recently all usages of setup_irq() was replaced by request_irq().
request_irq() does a few sanity checks that were not done in
setup_irq(), if they fail irq registration will fail. One of the check
is to ensure that non-NULL dev_id is passed in the case of shared irq.

Fix it by passing non-NULL dev_id while registering the shared irq.

Fixes: cc2550b421aa ("clocksource: Replace setup_irq() by request_irq()")
Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
---

Hi Daniel,

i have assumed that you would not rebase your drivers/next tree & put the
SHA-id in Fixes tag.

Regards
afzal

 drivers/clocksource/timer-cs5535.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-cs5535.c b/drivers/clocksource/timer-cs5535.c
index 51ea0509fb25..d47acfe848ae 100644
--- a/drivers/clocksource/timer-cs5535.c
+++ b/drivers/clocksource/timer-cs5535.c
@@ -133,6 +133,7 @@ static irqreturn_t mfgpt_tick(int irq, void *dev_id)
 
 static int __init cs5535_mfgpt_init(void)
 {
+	unsigned long flags = IRQF_NOBALANCING | IRQF_TIMER | IRQF_SHARED;
 	struct cs5535_mfgpt_timer *timer;
 	int ret;
 	uint16_t val;
@@ -152,9 +153,7 @@ static int __init cs5535_mfgpt_init(void)
 	}
 
 	/* And register it with the kernel */
-	ret = request_irq(timer_irq, mfgpt_tick,
-			  IRQF_NOBALANCING | IRQF_TIMER | IRQF_SHARED,
-			  DRV_NAME, NULL);
+	ret = request_irq(timer_irq, mfgpt_tick, flags, DRV_NAME, timer);
 	if (ret) {
 		printk(KERN_ERR DRV_NAME ": Unable to set up the interrupt.\n");
 		goto err_irq;
-- 
2.18.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
