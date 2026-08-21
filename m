Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BABC5DF89
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hQEYj8gB4eOR3g01kTbuZQQ+k9rbMYC2FHDgtAxK45c=; b=G3nA+mTbAMjEeu
	5Nsr/lKssf7dxyOBdXWe5qBvGfL0Bfm8zDDEnHq3pAagDRfeGD2h5lS2PKyweO8zbJ5fqday2osAS
	MS9EnZjWqd+HUV5Z/ApagrDtscxbdHkFCq3y8deXEWPf6yrlHyETEXjFkrBpga3DA/WIFljic2mBs
	4z1Tsq30g+4vY6HtPFKCrq8l0Yuqv6i5G1JZEy9hTH9OSL/H1wtpb/i7BfS3ApBn1f/mP191Z1BoR
	NUAD3+R6usgrvfc7bhtLHalHgN7Lnw8bf44UCcWQjlecno9bvf5LXpXNqGx/u9vn1c+RzZSnE0MTk
	aPyS7PxGQpRkMypU19CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQvj-0000000DdgC-03qy;
	Fri, 21 Aug 2026 15:13:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQvg-0000000DdfT-1CJY
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 15:13:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso12425875ad.1
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325191; x=1787929991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pNfd98g7NohQi3HTw63l9CeOQLM+iGLJoEq3pvm3KGI=;
        b=q+YjmPL3bzY9pxZLqeXYIgZb/pP3YoIFeceKbr1PiqNoDMk2+keV6FM0foi/UVpsjC
         wPVsHmgE5d2LAC+NgjnchCa+mH1D9Me5pDojMmbAOk9UFqudSfoVzZrLZTgp9nBM41LG
         AJBqsqswejjeXfTV97aGuW9cC3EUiTRUvSks6PupHyAP+8bLZapDkEdHJw7F/ucTbxQZ
         gNQA/7yQoTLNViWgaMnQcdnCLZWnmoTYCZhYHbBOX7wAxDJDPuMMDfWXMwYuuUK2o+Ma
         ZjAz/6Eh2Ecyvt3u/xkkasGxGKy/nzsLBqc0yfpBa70IWkiFGjbRSH1sJqs6nyQlnZKW
         Gulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325191; x=1787929991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNfd98g7NohQi3HTw63l9CeOQLM+iGLJoEq3pvm3KGI=;
        b=AlU+kW6HJgXDvyj84/9RQcCjrG0yUju/ZkpYpD2wWdhI/pNhorZr6GsW69rfC235M1
         vVPk4dUxvua3ows4capP8hPg6zL8DYI/n0Dp8cgilmDYkNb/ToHWk/DKf/tXOJq0z2i5
         YiXEZsd3rfYERVy0ef8GAlMTg9VZYxfRbtZ31fHT+ybqwaiHs8RQ1MqGSGT1JbWqrQSX
         gmG4WldfYWC/PN54wFIwA60wXbVTlJ7tFqpfPY7l7wBW3eteNp+syoumCehvAhKJh9qt
         Sc7lb3bu0/jXNIAChEHhRc8eJvukYSEgUg6vez9K8R8Xfw1a794hCGF9EwEscPD294VG
         y6XA==
X-Forwarded-Encrypted: i=1; AHgh+RqYXeto2VISGoIIOSxMLzjBgcrZiP0SzLPHPHqIc6KcdUMsBnXoENLEyYF5zIR2zoHBGyHp1tp4dC8eyXCH@lists.infradead.org
X-Gm-Message-State: AFuF++lUVCDZAg6bUf10hYls/rgdZrNvsfHFtr3ni3jUhSP4qyClwdHC
	LNYk/TGf7oYS4iqNNrCGB8YGvlCklLJIANIVlJ/Svndvil3UnvYhhTlNtxBCoci/
X-Gm-Gg: AR+sD11rCLbocd3JF27zgVnBuxNggZf0aK9o5xvOqFxR8KJp+UularDf4ptriy/qpjZ
	n6GHrdnRGjmeVg3I/qzDeexCYxc61cHw0BnPkwWE2CNsccT5xe6+05KLpckskKzr0OiWEaNXfdu
	CPfEq8tlX7/81P8Mch0G6uMT6OpkMGDj9Nf/9F0mIlp5uIEAZ3R8Ve0Q5lJhJcPyyOVc6JYvUvw
	1/0MgEWJPjQh3lh2g+S58yn8fHGmd2T+55lX7w0PRgcEwa1cpHvAO0c1MfwZWFBnc1O4JG0S92u
	hZiita+IfQyMI3Erzrgsb/v3gyVXDIqVDCZ7xPRdsJaXkaMH5dqpcniOAVodDw6Z+Aa5ZZpN1rm
	BOsKjMqUKsFKPJrpcZZrJdsD5g5+N3unYBfiJw8HgQIFU1/2B1AGePg5dN1w//o4TLrwiPH1G9Y
	m6ioEBozOw4yVCEgu4IA1IU4VlH7cQeierT/itRsDvaTXLehKr764qEB8xbLrrEkd+YfxqDwVay
	cVCWxAh
X-Received: by 2002:a17:903:390d:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d64af4eea9mr143169085ad.7.1787325191275;
        Fri, 21 Aug 2026 08:13:11 -0700 (PDT)
Received: from kernel ([103.219.206.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5912f4sm21059155ad.29.2026.08.21.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:13:10 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH 2/2] crypto: amlogic: Use devm APIs for clock and engine management
Date: Fri, 21 Aug 2026 20:43:03 +0530
Message-ID: <20260821151303.8150-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_081312_353260_31102BBB 
X-CRM114-Status: GOOD (  11.98  )
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

Simplify the probe and remove function by utilizing device managed
(devm) APIs. Replace devm_clk_get() and clk_prepare_enable() with
devm_clk_get_enabled(), and replace crypto_engine_alloc_init() with
devm_crypto_engine_alloc_init().

This removes the need for manual cleanup in the error paths and the
remove function, eliminating calls to clk_disable_unprepare() and
crypto_engine_exit(). This simplifies the code and prevents potential
resource leaks.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 302b398405e2..950735f620e9 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -140,7 +140,6 @@ DEFINE_SHOW_ATTRIBUTE(meson_debugfs);
 static void meson_free_chanlist(struct meson_dev *mc, int i)
 {
 	while (i >= 0) {
-		crypto_engine_exit(mc->chanlist[i].engine);
 		if (mc->chanlist[i].tl)
 			dma_free_coherent(mc->dev, sizeof(struct meson_desc) * MAXDESC,
 					  mc->chanlist[i].tl,
@@ -164,7 +163,7 @@ static int meson_allocate_chanlist(struct meson_dev *mc)
 	for (i = 0; i < MAXFLOW; i++) {
 		init_completion(&mc->chanlist[i].complete);
 
-		mc->chanlist[i].engine = crypto_engine_alloc_init(mc->dev, true);
+		mc->chanlist[i].engine = devm_crypto_engine_alloc_init(mc->dev, true);
 		if (!mc->chanlist[i].engine) {
 			dev_err(mc->dev, "Cannot allocate engine\n");
 			i--;
@@ -244,10 +243,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
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
 
@@ -272,7 +271,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 
 	err = meson_allocate_chanlist(mc);
 	if (err)
-		goto error_flow;
+		return err;
 
 	err = meson_register_algs(mc);
 	if (err)
@@ -293,8 +292,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 error_alg:
 	meson_unregister_algs(mc);
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
