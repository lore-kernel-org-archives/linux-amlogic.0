Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2D0C61DFD
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2026 02:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oSGvzeNhEgquG1FNB6hvTqt8fpv2B8MA3OwydR3xmqs=; b=OhvSQcN6zt50Bm
	L3jqtGP7AX31l1n3AOSXUosQk79RfetI/enq+zmGUqqjRbAAUjMhXnJfdE9C7Kp6814qtL+iMJpTD
	x7NCLrTPHkH1OCS/mssCVIMo8aOSIM/ZyivdMFnm1bXEHzlzQ9J+O+IiKJXTNkP0Jy6sZrymSD/jA
	MgGQfZYn4/JvYq24tgVIlDGZ9D5RUocD2cJNVQLVYEs84xpkblng10v4975+JVialvQK1qpsedINz
	zS0pS/XakhK6VCkMrhx9v0LRsi33t1zBEUNAxggPzw7weCXWT78tM86VWW/O3kZCjhemjmyc9fL+b
	UDIW2CEn5K5Av/v3XTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ET4-0000000AtbY-2aQo;
	Tue, 01 Sep 2026 02:43:22 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ET2-0000000AtbB-0W8L
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Sep 2026 02:43:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so5060581a91.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2026 19:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230598; x=1788835398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aT/QRgr4ndYt36XthRqqu1FeBl0sSG8mE3kwTPAN3z8=;
        b=p81h80dFKMhlDvRIgzLXKZIUcApJO4196fHRguoCVFBcIOKWQZOMEz4ixrcMfna9Xu
         xGApXWT8uAGr1GB7DCmA1axZJqwDqpcWJta6CsYjTZDCeVYUBtlHdp036c3JQ0EbXgwP
         ZHLg592ueJ6xqCbOkcWFC+vujuab+cB1miQQcpB98TOpSZR07P+Wl1sIThZNvYvVT9gG
         BXIth9uS6jsix8ubMcIrxOU3WPdnexoAkyw04iDiKai7LTMr+zBC/BBe9raPcSPkhbfQ
         9H5CnnTrNQe8ZO3FxxHn+K6RA+0IMjgrGOGz9afS4HtnbTVOWoMXQoHLG4ESexWyD3xZ
         GK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230598; x=1788835398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aT/QRgr4ndYt36XthRqqu1FeBl0sSG8mE3kwTPAN3z8=;
        b=RB52J0RYOa1BguFsTFffkD1Xz7/X6z/ZTWh7HuqAzCyTkNxSnXEnaAeUFjO5kni3g7
         2Lcu+4bH4uS1+AOwJQxbcoxzFok2TA1wKZOhfWon1c1unLsbA3Yeyc2khm+BButpsGdO
         46QEjogsLAv+GV8lr8c0fM/3moGhTnlNYHCAued1h/ks4ke0AAix5O1aLc5hKTj/X0bq
         g1a+DdF8G/FhFnQ+rUiI27CEcNxCQoU+8yqyzwba+aSCpeYoRMQGCEdKQFHH9GRuR0F0
         inLpWsyzc20XSaHljCgZAZeAkRaWTKngZuDvGTcdTeV2vhPXTo7deab45pm2fOlK9i0+
         FLUg==
X-Forwarded-Encrypted: i=1; AKwUvBwmJebkDgR2SAdMatc8r7/nDmSak5kEZ/R3W/ysbb+8rWKWUFWCI9PePsUtopwpSyun4Mrf6OVcRcQ0Moe6@lists.infradead.org
X-Gm-Message-State: AFuF++kdeh2XaFaRrtZFKqxU8wOgGQTpwkXxrcow78mL3aa7wY02GfE6
	wPZqglIaMPbKVmhV+3qw3Q6jo28PFVs64VOnoTNUowNn1XeqNUdEzBQs
X-Gm-Gg: AYBFou17TxXjq72iM8N/m/evHt2ARWAhKksGB+Rww2sVIL9rN5tL4DjQI7AjULxNBiK
	hYoGx2dmtqmf8EUaKkTr3abH125KIqxqiyOLQgtdIJvK3jQsgw8bglSBTeoO3kr4EjvNJCgyP75
	217MAgFQ8yzKUwxxyPO5FFPx0CDIS+mKgiEs3zxbaAUKuJIVexO79RHSjsZhu12vDEQvF+QmBeQ
	Gn6k5dqntLVXseEtAsXGC2S6G66E6ujzhJpvuuHA6rDuUIRhC07q1Zzd3pP/55uVvkv8nhjybap
	n5LbyQnkdKBfppofRuPw3pEIm3drznvIDloQzttUZrr5Og4Gy4MbUuvvseOqljQGP+sRovqoRMD
	XQ1bHbNV0Q+Q98WbRj96jF47irdQO/N6aXHu5RKFha5UMdtiFhg14bux/4BwX/tVqRYkwrDHooa
	h1mnh+ySXETYjDyHEGENf5kcMkJIQYLGX2G/XMyIFhyGSXHV84eC87Gx8YIyJSxGBcobkFbr6yG
	H/ByGRv5Yr/Lpj7
X-Received: by 2002:a17:90b:4c52:b0:398:c9be:cca8 with SMTP id 98e67ed59e1d1-39907b66006mr6760084a91.2.1788230598432;
        Mon, 31 Aug 2026 19:43:18 -0700 (PDT)
Received: from kernel ([45.251.35.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm30366812eec.25.2026.08.31.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:43:18 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	lkp@intel.com
Subject: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Date: Tue,  1 Sep 2026 08:12:52 +0530
Message-ID: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_194320_165869_042E788F 
X-CRM114-Status: GOOD (  15.14  )
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

The driver currently gets the core clock and manually enables it using
clk_prepare_enable(). This requires matching calls to
clk_disable_unprepare() in the error paths and remove function.

Switch to devm_clk_get_enabled() instead. This lets the kernel handle
enabling and disabling the clock automatically, which allow us to drop
the manual cleanup code and keeps the probe function simple.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Dropped the devm_crypto_engine_alloc_init() change due to build
  failure reported by the kernel test robot.
- Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
  this patch.
- Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u

 drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..6f4c62ddaf89 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -243,10 +243,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
+	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
 	if (IS_ERR(mc->busclk)) {
 		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
+		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
 		return err;
 	}
 
@@ -261,15 +261,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
-	}
-
 	err = meson_allocate_chanlist(mc);
 	if (err)
-		goto error_flow;
+		return err;
 
 	err = meson_register_algs(mc);
 	if (err)
@@ -290,8 +284,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 error_alg:
 	meson_unregister_algs(mc);
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -306,8 +298,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, MAXFLOW - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
