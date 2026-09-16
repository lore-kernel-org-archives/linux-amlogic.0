Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDC8C88E7F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xex+R/3T1DhXdTywfIAI+vINpIdx7JLKxJ6NN15Oj38=; b=zoSh/GV+SjLG8A
	E86FPwLsXwwqixWfWd64xnQuz4zYd0tgp5OMGr8IMil+thsl90nhP4gYPBBpOWkw2g3cggoEObu+M
	C0zSplG5w9Lnnt/rkUsw03/h7Zbiw3J6hCgJwuOXtEDGql/evGlOt0s1L/6O/Hmt69z+b6RzGfuWZ
	RHKQeJwgmaeJalpfWl6yDvfViXvhU9MeADPIqZjNSg9q0+zu6Im5SsNB1m0Ozu5UC3HzFtQgs4mfg
	lIMzY0q49XR6oqVmbP+/UKNB8bk1RKKP+0Pctx3IVPbVmI2D80lz7DicnxoaBIIThnYYsa4G8kxKg
	BJjAp7UW1eoVNaM5okxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6tea-00000009t5u-2AXK;
	Wed, 16 Sep 2026 17:42:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6teY-00000009t5L-0ZMc
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 17:42:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ee1f38so12602235ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580557; x=1790185357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwgEhBXTngR3El+sf5PzSxyA5w4YUY1fd7mrK0Hv9aA=;
        b=UfZk6r2VUu49sDcGCQAlN/Ea8fSZz1a/FS340uGa0mSIh1RbcoaHHTt4Xd257AZdqa
         7Q51McDHhmrKI9UfxJXE1mrHIaDUMFAVoz+5iwxvnTK6STHVmD9g5oWsGa4Tp3m5weIl
         10I8XD1IMwH30RK7lCIpB2F4dTE+g1mI562mRrXzQUzH3xrdgQgRAsLkmrBXfIwg7WjM
         vjB93G667gI3bvQlNP3bBr5wYeOR41CIIV6Eum2aUCaPCBoKo3LOCtzxvZ8wSsG35li+
         21QaIJHnjOYIK+f8/8wfV7kmZRoHu8Np4xpGhI1XUEX0ano9crbqBmDwELM9G+xolHhM
         DaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580557; x=1790185357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwgEhBXTngR3El+sf5PzSxyA5w4YUY1fd7mrK0Hv9aA=;
        b=Esu6JkpaWnqzXUkcF/Zn+W225LOAB9rtrFZtnNcVstB7qR8dio6fQazIPT/3KDZGcL
         KKiEkBpe9TxeF4Ah+RwZsrCQS6BoTQvUx6/H9LaZDPZA3Xdah4tdr3EHsOntMn6ozJP2
         w9inxl2eRanYnEgsJqlY1raTrym2KuwI8s0RrdSVSTPVcsMmnC2SKrn1uwRCptcVMCJ6
         da/PwDm3hl82+6YORi4qupWpi08JVfLni5dZOhL2hq0O2mwObboLTBxnuvgjMR5RkDZa
         5Ii/n/7Zoz9rUG43LnGTzXBBdYj4HO61Xnuq+IzSb//H35AZJB7lDDuVJBEgPj5DIuv4
         ihuA==
X-Forwarded-Encrypted: i=1; AKwUvBxsFvHQVOduNvwrY1WKhc6v+kUro+ICxtu8Beoe9NBmX9M7+YD1me+tqRc3e/2B3HsivB1DYTCns4CwPo2i@lists.infradead.org
X-Gm-Message-State: AFuF++kli9YFQJNxjjn6qr3ZzOB3XRXk17TDNEtkwUCS0IBCpIEgbvmL
	DNU2Mlaa8AiCbkOIAD2pSIPBM0kWXwhrxRJ5f6aR73l3P464nPhTinQv
X-Gm-Gg: AYBFou36kW9tGrgxa0V4vLptj3gVn9+ikzFUSxOBoKk/iJDBh/oCIN/HYPGQ0l6MiP+
	PX3L/YAK4fHU4g/+aqDsKHGN9Mifk/MW3nAUGungPOL1/Ay5ZxRMn/X+AlU/pd6rrBOiSS33nfc
	6f25vkf0pICITM+ZR23aJukGnUvdPNuuSK5meySMcftXiOZi+utiXZW51BGF/Rvq4RPVMrPD5oT
	oknhbEArFH/zmH/tMaPHiOjUEMhozepo/yu8CZXD0IFCmwUBbr0RFAN42nVl1iXAR7Mf3jUS5by
	wjNfyNP4YpOF9C3aDtYByJ3kPFBGChA3J2/1ZkNacInQuvmR+3aF08uo/wpnFU4oeWLU8VlymCx
	Y6iQqbBBHbbany9NXUiSrVs51PdiyETXPBCQQmiJFgshI16vKB3Rr63heUoeZ2pyzgknLjekMXX
	peogm+h7dT40zAPFHuP8jXeiIh4K5p9VPzcDYiyl7nwOsr/KDc9uuEoQPY9t2OM7cJqumVwkEUS
	ANZ6KH7ngTxll8Dxw==
X-Received: by 2002:a17:90b:582c:b0:39d:f18c:1ad1 with SMTP id 98e67ed59e1d1-39e1e2501e6mr10461602a91.3.1789580557234;
        Wed, 16 Sep 2026 10:42:37 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm7286360c88.11.2026.09.16.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:42:36 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	clabbe@baylibre.com,
	davem@davemloft.net
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	lkp@intel.com,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v4] crypto/amlogic: Use devm APIs for clock management
Date: Wed, 16 Sep 2026 23:12:27 +0530
Message-ID: <20260916174227.5581-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_104238_175503_6352DBB6 
X-CRM114-Status: GOOD (  16.87  )
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
Changes in v4:
- Fix typo in meson_allocate_chanlist() function name.
- Add error_chanlist label to properly free chanlist if IRQ requests
  fail, preventing a memory leak.

Link to v3: https://lore.kernel.org/all/20260916154941.7254-1-raizudeen.kerneldev@gmail.com/T/
Link to v2: https://lore.kernel.org/all/20260901024302.5407-1-raizudeen.kerneldev@gmail.com/T/
Link to separate IRQ fix patch [1]: https://lore.kernel.org/all/20260908160120.4805-1-raizudeen.kerneldev@gmail.com/T/

 drivers/crypto/amlogic/amlogic-gxl-core.c | 31 +++++++++--------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..f292bb25674f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -243,34 +243,30 @@ static int meson_crypto_probe(struct platform_device *pdev)
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
 
+	err = meson_allocate_chanlist(mc);
+	if (err)
+		return err;
+
 	for (i = 0; i < MAXFLOW; i++) {
 		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0)
-			return mc->irqs[i];
+		if (mc->irqs[i] < 0) {
+			err = mc->irqs[i];
+			goto error_chanlist;
+		}
 
 		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
 				       "gxl-crypto", mc);
 		if (err < 0)
-			return err;
-	}
-
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
+			goto error_chanlist;
 	}
 
-	err = meson_allocate_chanlist(mc);
-	if (err)
-		goto error_flow;
-
 	err = meson_register_algs(mc);
 	if (err)
 		goto error_alg;
@@ -289,9 +285,8 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	meson_unregister_algs(mc);
+error_chanlist:
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -306,8 +301,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
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
