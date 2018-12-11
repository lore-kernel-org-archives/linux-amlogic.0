Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82733C07E85
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 12:48:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529FF2084A
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 12:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SjfI7ua5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EHkXMpXc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529FF2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=54IuL/euveP12m5/WKVru9i8nJgYTQmld4p8aybSTcg=; b=SjfI7ua5+6S3CO
	/H4hZRNDeCuMMB2gF0lCpaBT0wx2cOjAvU6WHAW25YHNmAw/Hbny87zXhIiYSu55fhRp83rDABaq4
	oyrxE1Waam6VwHK830SivixcJlt8cQ9jqNEctouvza/7X4JZQMXfOWqHqLPL+6mFwHJnDAIfWtlZD
	0lGcZLr7JUDf+eq0eeXmvjX0WTX5qCopE4NB/l78uPZTPGkp+D/EGPMXa6sZfpN3iXPe0sfUrD1ar
	7JdGRhvmU60nThfBd3lvLyR2YsX3LVC0GGPqk1fO04t5MNoAgej5Rri1Xzsewi2l/Rw7Cygl6FR0Y
	qwKzuDMwMVcNJok35KMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWhSQ-0000te-8O; Tue, 11 Dec 2018 12:48:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWhSN-0000sA-44
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 12:48:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id g67so2113515wmd.2
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 04:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6+XGQxF1M0YbsuzVX9nWRsvC5OlvjeQt28ui753cWI=;
 b=EHkXMpXckqku1EiWXfzvqfyINTdg8l2dBTCB4cvD9cmQ9jf/w8DzMVWluXzDk8SLMg
 WuPaqMSQA/Up9WZT01efQZKbKtWW7mY08nSGQKkJCHJUu7upE664KBV9f5WGs1SATT6z
 8nf6JrTGJGxwbCOmRnWkGd8U0brA4cm4AbU9av6TZPb+mYxUVGZXjYLVNSrsCD4VfUkS
 SUdrOrXf9gwFqgl7VAEJw2af8/bzkd+iRHNEd5sLb2OJFQ2Slkg0gOe+Udny7fY+CARk
 pZlyMOVjuiMQ4I80Ll/k4kDM0h/hZsJlg1CXeavbYFuQAsZR/CZJqDxKkcMNytvseXNl
 HHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6+XGQxF1M0YbsuzVX9nWRsvC5OlvjeQt28ui753cWI=;
 b=LMOfXGix8A3UE+E35+TKB2OVaqbheY70r0XBEGdHUtI7lVrFUCb7nvwpHJPe5Fvoiz
 waHMNkIXws65q/rQCqxktPsSkLvZk4qw0TKkeKfndDYvLncCm7TuC5PuX+KduOpFrmU7
 tNTMV3gmd6bi997JtKnDp6tr/HDh9mA/QjsDN6HekiahR0x323NRsVXfA6ANOu/0zyqa
 jlnt5P8jiA/GVWzQMnqscDcHBqoIs37kJqLdI0c5IzqJp76yXNrnwk+4ZWwTHKm0s/yx
 TAq6AG5KSOSTGzWRuKXtOp7s3Ws4Cr4CqxaaKfTIyb2wiNX+XVIt2VfTgkJZkP7cNiUb
 1YqA==
X-Gm-Message-State: AA+aEWbyIyQnan7aAw7zxFHcB0zG0V10gFoIktXWsTZvb4nYEdHQ6Jtl
 /ILLZK3OaD7ty4GgLkL1q24WFA==
X-Google-Smtp-Source: AFSGD/UECDTCl14T9opPngcd3qbUVg+oqqoZ03PmcnI8tsJQfxwtQr3ghdLjY7+QdXIsGDV6zFAf4w==
X-Received: by 2002:a1c:18c:: with SMTP id 134mr2108554wmb.88.1544532478851;
 Tue, 11 Dec 2018 04:47:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id w18sm10620406wru.54.2018.12.11.04.47.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 04:47:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH] clk: meson: axg-audio: fix input clock name
Date: Tue, 11 Dec 2018 13:47:51 +0100
Message-Id: <20181211124751.30108-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_044811_160380_9B662C9A 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The name of input clock is not aligned with the rest of the tree
Because of this, the audio peripheral clocks are orphaned.

Fixes: 1222ab89328f ("clk: meson: axg-audio: use the clk input helper function")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Neil,

 Feel free to squash this with commit 1222ab89328f if you prefer

 Cheers
 Jerome

 drivers/clk/meson/axg-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 72b717e61a68..8ac3a2295473 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -752,7 +752,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	}
 
 	/* Register the peripheral input clock */
-	hw = meson_clk_hw_register_input(dev, "pclk", "audio_pclk", 0);
+	hw = meson_clk_hw_register_input(dev, "pclk", "axg_audio_pclk", 0);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
