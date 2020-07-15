Return-Path: <SRS0=rXaj=A2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52732C433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 15:07:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6F4206E9
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jul 2020 15:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pjVXn6Zg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSvp1cyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6F4206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3OInKf9ngY6Y/8+EMp2X37+WIWXs4SYLdgsW+8z9R0w=; b=pjVXn6Zgbw97yR/vBg3rmrkGI
	xvUadLKNwq7zHY6Examv0hvie4kORY6/v08pgOni9xzJgnsH1pH/RUXKZOUEkCrnPcUuh0lI+QxwT
	HOc3e9P03eba2FPN/hK5yM7li0Rnf+SgesE+wbTPxDQ08sOgkFewoPKkDdyL5OnAliCHOLBnpkwA7
	hW2uZaEN7IB16usJgP+L82D65v7GvjHmh+AjaG84+R87aMk6ShZf5qBDefJIrNS5x4C2bW0TyrccI
	+SWLKyEWEpyUi+ayqeW+78me7mUqIz28hRaRkptfE5d1nTcgd6tMuh7EkPsu6jOEFMYEmhmD89xoz
	jUbDF/Q6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvj0R-0006oh-QB; Wed, 15 Jul 2020 15:07:35 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvizZ-0006TL-Qc
 for linux-amlogic@lists.infradead.org; Wed, 15 Jul 2020 15:06:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id l2so6190799wmf.0
 for <linux-amlogic@lists.infradead.org>; Wed, 15 Jul 2020 08:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5bZU73kxT5M1JMsvuGC6Lo9dJE8hXmdkV8EdjzvhWs=;
 b=zSvp1cyp9NwMoDYQ099HhmCQeArDGEPwCWKkWWzxkXBbj5HghEulOTG6delZXfRB4V
 7pZwKEOvp46RKySf8Yzgtk9eN3B4BrBHD+xBCvj58iH13cRfFWtS2B5C2Nhix1PIZUxg
 JREpBcxLC3C7l0qnK44ImxJ1a2yrz/6U6//NpLOhRGhvW5Ui21FgwTqGG8Jn0swFlid/
 7fez9lVPIMrbEJ9VMehmmZlRi4gHVJBZjIzmMBGGfGCL5Rt4m8lN9MaPazxs8psW/9VH
 iV600X2ZSWoU8ZSzhXfgAfPccHmAflze7iWKZwsSmgjjO7Pft90i2o6F6TpklayyKXza
 Cw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5bZU73kxT5M1JMsvuGC6Lo9dJE8hXmdkV8EdjzvhWs=;
 b=Of4hPcAs9duG31s3UFOMbVxQNtCJkv9zjEoq8RrM7cIjGGD4fb7HcpEg4wOAqUkmd/
 JPhip64P/QaRP+MPZ97glL5XEL7wlE5QaUsMJB7N31+YM6YUkdAByvn1PcQXGrHl8hgk
 UOvcY20RIogVLJBq6AuZMEVLO/d7oe62yR3yWcbuszGMVRrsilWoLH2w9/EVb0I1t846
 pHxjnFqlgqRJwHh0E6e35mIXygbjIBuRRAXmqXeiDzw/OLfdmSRbEh9Q6zVAbw1Dypr0
 8YRDxxGbXKw7gLDJzxY19aKIbSTkgEoaDc3iWVV7gAQueJh+pp2VT5vjZrFphw0ilTh8
 oiuQ==
X-Gm-Message-State: AOAM5302tDk1obthS3igDAn+IhAEn7BNBCyFeS6rfXpwRYFH12FQgkSA
 QI25Vxg171DInAVzQT6n45Seeg==
X-Google-Smtp-Source: ABdhPJyhdfGUmrtF4d7P3vciFQvDcpZfiGbqTTuoOSU/tp9T2pBra1bNvwYIGOrWZFGbTtCfW3Nx+Q==
X-Received: by 2002:a1c:5986:: with SMTP id n128mr8694473wmb.112.1594825600839; 
 Wed, 15 Jul 2020 08:06:40 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id w2sm3906140wrs.77.2020.07.15.08.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 08:06:40 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 05/14] spi: spi-meson-spifc: Fix misdocumenting of 'dev' in
 'struct meson_spifc'
Date: Wed, 15 Jul 2020 16:06:23 +0100
Message-Id: <20200715150632.409077-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715150632.409077-1-lee.jones@linaro.org>
References: <20200715150632.409077-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_110641_999277_2714FA5C 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>,
 linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/spi/spi-meson-spifc.c:80: warning: Function parameter or member 'dev' not described in 'meson_spifc'

Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/spi/spi-meson-spifc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index c7b0399802913..8eca6f24cb799 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -70,7 +70,7 @@
  * @master:	the SPI master
  * @regmap:	regmap for device registers
  * @clk:	input clock of the built-in baud rate generator
- * @device:	the device structure
+ * @dev:	the device structure
  */
 struct meson_spifc {
 	struct spi_master *master;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
