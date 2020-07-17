Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20642C43446
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 13:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBAB520759
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 13:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2dsflpG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAC5kkae"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBAB520759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3OInKf9ngY6Y/8+EMp2X37+WIWXs4SYLdgsW+8z9R0w=; b=E2dsflpGPDDaSUNiZP1sOPubN
	oUsKBA+c6Wds/1gZt2umbL19bpRGH13jnfbpgpXHgW9tfZTsrnh7JjEnbiVU/Sk/urj8ZyVc2D+Ji
	bSGNuqOVHDH+QQc0Yuv5Djku883k1dGjAYcDVrmkVG4Q9sATtIcITrNlunM9b+0GZC8tOHbhj9eB7
	z8WqCJxXrab3SbA86kr4oemCZ+RbaH+J6xYZQXzOI8hqUjJomXOYGrOgRViOBbludslnfZsMpHlqz
	1mooEscs16FcmEtEgCoGYP9TnWDplco+4NgNBor7aZlrtR/chTHR/4+kfKPHNVvtlXuEG8uR5++et
	lR8Zss2bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwQpK-00032l-D3; Fri, 17 Jul 2020 13:55:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwQoq-0002qx-Ol
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 13:54:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id b6so11183514wrs.11
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 06:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5bZU73kxT5M1JMsvuGC6Lo9dJE8hXmdkV8EdjzvhWs=;
 b=ZAC5kkaeD48hDzasHcMFBgI5ok3om/Ag5jSHoowWVEUw02KGIjIWhow3DY2EWpzj1k
 xGIQfKuwkO6ETxRSTvlinnPUEMJh5/qXsllh3rX9yQQ5qtv6gB5OoR9meWBkVvG+GZFV
 aJWhSVmI/c5AX1aCSjblRbbyZkqfNY8nX0kmHTI4kACCAYFjKYyHj9YMFXsOA0U2gl7k
 JPPPn5HFtj+Aq3tDCoBEZqm00dLcmf8Me76bz9eW43D6ng60idi56pggV1F3MsRrKQe0
 aYxadZEomTMoFaJKKr+DcDh6tNOFHztWuOeSlU+oyVZKjITYbEoH53/73ocvYz5aFLxK
 WtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5bZU73kxT5M1JMsvuGC6Lo9dJE8hXmdkV8EdjzvhWs=;
 b=AtbJWfOAbnvXl8Ov7Bdgrjht8ukVjRTIt7O+K7Jz7DYAfbqN7Jd8zqGODrDtI0mJV3
 DMPr0ehcIdgpeUi1hVtPZhEHkSrUEsATnsfgVDCtdmoy/ejCWK9vUYcUtOnRE6o5qD+x
 jh3vGfctRYTkoPvAqkYUuM2gV1ugjdc5xJ1zmfd71nBV8A3XQLPsZW31Zq9j61L2CGTM
 MafhrmzCybLwOJDsdCyu8WD1m6n29Gw/JPEjZ5JVaClyNwQAOzI/oWq/37+c7pAKykr7
 B8fSsJ9U2u2qVgLMTaLYKEbSe8JwijVKnGOCKlpLHHEKGeGqVqzsbt5+PpPIzCqAn/lG
 Ndpg==
X-Gm-Message-State: AOAM530zePF4/0QN76vYfBoA+Dv0Y67iuHYeMU1jWhbrnUouGzJfgDLj
 wIUqC+D9FjT9ucuf4fZTnZoYpg==
X-Google-Smtp-Source: ABdhPJxG9WExdH+no7RsXepaf01G8y07Rip1YGVf8Z/0A+HGPnfCWJrwdTxKjFDyUGuQE69jroFN6Q==
X-Received: by 2002:a5d:4607:: with SMTP id t7mr11203477wrq.251.1594994071957; 
 Fri, 17 Jul 2020 06:54:31 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.94])
 by smtp.gmail.com with ESMTPSA id w128sm16118356wmb.19.2020.07.17.06.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 06:54:31 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 05/14] spi: spi-meson-spifc: Fix misdocumenting of 'dev' in
 'struct meson_spifc'
Date: Fri, 17 Jul 2020 14:54:15 +0100
Message-Id: <20200717135424.2442271-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717135424.2442271-1-lee.jones@linaro.org>
References: <20200717135424.2442271-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_095432_878010_DE8381A3 
X-CRM114-Status: GOOD (  11.13  )
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
