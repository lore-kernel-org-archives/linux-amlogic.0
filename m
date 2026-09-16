Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF234C982CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6/N2iKg0hyyxUGthto2ProwIwBawqn9IhoVqOT3g4HM=; b=Zab5YICO1FSk+K
	+QbjhRAW98lzM5u3ItUsrX2sgXJI/faqJNrIQbaIc+KN2IDTe/3ISL54fkfbx9M3ELQ76WcEhjjCJ
	Yzcdg6ti6EF1RZb8hFWXuV7mC8cHDLydaiUrhgsb1+7IU5yq2wrEqguMYgHPdvIHQ+r6QkdFZTVeQ
	zGQP9Mjk3CNlwxBKA5SZ7GCn7h7Zp9MmpSz89IBuCzFyzXdBgaCCIfBhwziKdgOfeHl3IMhAQcMSk
	uvkoSPZwLWyCYksjzGoHlY7rhwSyqhUDfMLA7uJdnlDGkDxIvhGYrNqGNEMiROR8qkHfdSQ+va3G/
	4l8SpsMuXVDWpWLN7i1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rtU-00000009dgh-2IGv;
	Wed, 16 Sep 2026 15:49:56 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rtR-00000009dgB-470t
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 15:49:55 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398beb616f5so418188a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Sep 2026 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789573793; x=1790178593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIWCqUJ30TP1pyF27y3sPeUzqO5qqMNYk7Psxgwew+I=;
        b=LIzVpcOt4U5jZbg7ZNXBBhPOCT1HEbrJL1lrNf6q8zhdxuoXbWCy70tm7y/e7hdfZc
         otLXL2Rr+mKhfZWJzkEPejhIKETECay6JFoOzre482lrSzOfBFr4jIznSUmlb6H5MuZB
         hmmIniyww+o+WwZ+dYuE2K5Y477Sm/Yxh4RLTAxCKeCDFM0GL7vWWy+UMIZepPKR7RP4
         kcXh4mR2u4W7snaTi8feirh5SgyQk+EK7BmaqHtzbvnAM1hc4ys6ACfaRm3tKHn3XKIg
         xk1iNqLdZUfx2mRV42PfmH+YN5ZYFMrkxNf6D+CDRHd6ozotwkwSu7Vscf09XZZOTwEZ
         3yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573793; x=1790178593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIWCqUJ30TP1pyF27y3sPeUzqO5qqMNYk7Psxgwew+I=;
        b=mLBTeK3vmkEHkVy6DDmI32pn/tyGcc3Ydnt2+re43pXACfyFSHyEzA3y2JyHPGco4f
         QvEmQtJe5zJGPBHPro95Wo3kzHwfgRe3vP6rs7Kiowe/YYFxBq9ikcYX4GoVOcQtScFS
         d/YniUov6+v5J7lOYFcibgQh6nB47IT79dc8XMbOwFbUspgWntbMs/QO38tmgZdLiHOr
         iHHO0bLfTo3rOTu1OjvrUH/ncTKbaBQq6JlpM+XhilCW1trpMvE9xsARjsqG8tuY/nB8
         d+K7W/d+wTeux0mk9woqX08vSPJYpWyNxO1xVIwZkdvmV6CkOjSWarBSEfJ5SRfrCy4f
         cguw==
X-Forwarded-Encrypted: i=1; AKwUvBxoSZqbtgj3zH5mYw/cFbts2y6MdoIV9mP8Iw/o2JYqUcF+JEr5pV1MxSr5CJc0E0OOaEZTKIcmO7KqZcUF@lists.infradead.org
X-Gm-Message-State: AFuF++lf1xBCFarzlWrSAnbvnYlwG+QL5rVkyIR/1q5wu10eFSJH3Icy
	sJCSJUrguu2gxdyYda9Q4tXIOxiAcCUSF5qOPuyqS4/2MEQJBFNGsJOw
X-Gm-Gg: AYBFou0bH7eJC8aw4R+AETdsnb6Taz2v0W9QZIJ9qSl7d7ONcIIqVonzckdITnmG9zM
	qEECU3oUjUFhBBbhMVZj6vcUbf2B9RaaPAN0/mUh98QdSCph69imMs8b/FQA9b/+ukoJDg4tmuW
	KX1NG0EV72lDaTwVmE3EYO4Y6Y3uNhIAPxRCjZM69h+jjHv5+mfhpINgJNQ8P9VFo/lj6Jp7RzA
	FdCdIJgCeMaw/dgzzVeMXvmNAOk9vO154g1N3Zcm0wZoDAmuX14E/5ObfMctcUxSjOI2KjZndWB
	WDg0xr+pkWJ27lLksy8UvH36qFd6B24JeGsmz/vhoUgaD0EJGCVSf+pmlUPYgY53J8UE1OLn5Mi
	a6DuFhBkf/sXhY2DqgZcEQ/VWG/YFTh1Y9xM2YOmtudDGGkmPVde6RiLjpdSW1z6s1nssgYNK/c
	PdMaE8yYZWYPIRZU9+O2yPJsqU6Ln2UCFRtPsukm2TaJCExrIRafsiQ2VUp/A/MGB4/26HjtRIz
	Od/DUH3xiPksuIYNg==
X-Received: by 2002:a17:90a:d446:b0:39d:feca:f48d with SMTP id 98e67ed59e1d1-39e35daaa88mr113481a91.3.1789573792950;
        Wed, 16 Sep 2026 08:49:52 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35dab2e9sm142687a91.1.2026.09.16.08.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:49:52 -0700 (PDT)
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
Subject: [PATCH v3] crypto/amlogic: Use devm APIs for clock management
Date: Wed, 16 Sep 2026 21:19:41 +0530
Message-ID: <20260916154941.7254-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_084954_021172_6D6AE3E7 
X-CRM114-Status: GOOD (  16.77  )
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
Changes in v3:
- Moved IRQ requests after channel allocation to fix a null pointer
  derefernce and use-after-free.
- The IRQ return value issue is fixed in a separate patch [1].

Link to v2: https://lore.kernel.org/all/aqpmOzURNFOm78ls@gondor.apana.org.au/T/
[1] https://lore.kernel.org/all/20260908160120.4805-1-raizudeen.kerneldev@gmail.com/

 drivers/crypto/amlogic/amlogic-gxl-core.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..d2d23a443c53 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -243,13 +243,17 @@ static int meson_crypto_probe(struct platform_device *pdev)
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
 
+	err = meson_allocate_chainlist(mc);
+	if (err)
+		return err;
+
 	for (i = 0; i < MAXFLOW; i++) {
 		mc->irqs[i] = platform_get_irq(pdev, i);
 		if (mc->irqs[i] < 0)
@@ -261,16 +265,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
-	}
-
-	err = meson_allocate_chanlist(mc);
-	if (err)
-		goto error_flow;
-
 	err = meson_register_algs(mc);
 	if (err)
 		goto error_alg;
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
