Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6145C982D9
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bf6YzPfKHK+1Nj+XM2s0SJ604yJm8fUwtQeFQFmpQ2o=; b=W3G5yKXuz+0gpE
	asexoof8y9tSOaHDKmspBy8EMWfhtxhQzrbQVq0VJ3iJBLpJfCz9kaeXwX26YO8EVLmoSvyDT9Qt7
	D3F2xLC/vd90oy+9WO+3ZHLKTlx7CI4ybwW8kZBQDJRPHcL87N0FkNNlFFEyGPh4uHhKD04PrnmL8
	YmM+YAyDhxlmMsSm5PHxN/yLXF79Myxqo+nWGDB24J7ewSdDu4c0hHMpAdosVGxRF7DLeEfgrFmA3
	wKLbplDnN5yF1zDDgXFSZ/WrGq83c4SrQ7/iXnOusdJgwiIru1bSH2p7R7Z6i43I0Ma8MNeMwCb/u
	/B2adISmIo81QRxc4LVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WPA-0000000EB5G-0W7U;
	Fri, 18 Sep 2026 11:05:20 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WP7-0000000EB4u-1u33
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 11:05:18 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ee1f38so5401825ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729517; x=1790334317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Df5rt+V5n08gio2qwrmwg+kssDbj2qjq7f0a+gBkW+g=;
        b=miAwrpsAA4PWDJyD3o29USi2WX7U1wgDYc7cCOKoBrgzbmi2oDW53wY+4V/eWyVGmc
         ISZhvCNSBDOLWCYl1Be7/hHsZaKev40d2lCYoSWJUe7tSc2Le7XTIbYsJTdMFC5EtUOB
         QhL4+bcUV0Xdcq/oyeI/U75ulNu6O75IrUaHDJDMdPoV64Xdmi6y/s8/KOL1JCYkPp4l
         xcqNp1Vl4Wl+hXAT6a2VQSRK1n3Zjr8OKtmucHn8PhU5oYHixM5yLkZKeuYTcKaCvlKM
         bsHzY7IzJRvnUf6XK9QsdZs9qafzPl2YWXf5uHi8TohHEysSArZvMaAdVzuXrIX3x+de
         Atng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729517; x=1790334317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df5rt+V5n08gio2qwrmwg+kssDbj2qjq7f0a+gBkW+g=;
        b=j3rEQNplsEXKnygThqb4VviEr4khTfWQJLYaA81W22yffoxZRJMSoQTgMzY200XKX6
         Se1a4m5QcZxmVaDsNmAOZpEJg3ois8bNUnfe9t1QnJoSbX4S1Od9xTTTHHtmCcPNNEkH
         b5okqDdnk9N1y91OfBZPW8YvTlxfTtBkSFsruSqB1KjbZe2y+OKzhZG4HMaYq92j/yp/
         7gbrw2F86mI0l1a4sfCs1h6uJG2hnNd/oF7X9gs5ZvAR6qyvujnI9OLUElE31E6OrE2p
         GdI+uMcwcVbDDQwsVWavWzzfnSp9bGXXqAz70GTG3Bp3vdq9J4gmfwU3cIeBN4ZjamTu
         eqXw==
X-Forwarded-Encrypted: i=1; AKwUvBy31Aw5yGLb/pYLdZg0cWkD3xQZvlZhkRBT86SrskfYUCFRgSnLktI7Vk+zJ25vqSM6BORYIZjMKCxow774@lists.infradead.org
X-Gm-Message-State: AFuF++mOwdtdmDDZRqgAdYbG18yJY4BK65lwwEVTqXIp1o+GTLpcQASR
	kio08DTqpZj+eKcruKUpHc6keo9E5efZmqJnA5s2SAxJsP4Nnjju/7YN
X-Gm-Gg: AYBFou39M5a85u6OYSlGNLa3WHUfMUiv4r3aFeOvQpFUUalNfeT/h72/rkBp1OHNjc0
	ZdvsB4jkL/Z+Y/fudOtaI80wOA4A8JDd0s7FO+u1MKhUYV6LPhhugDTc5ca1hdq4JA/9LopBCIW
	zC+vMiceetaL52ig9XgCIoCXghmQIc9bMK6U/9eXEQElr5+eG2XKr+l8LAnEQSGQ2SRzBpmJbjA
	Be57KNmt/cvimnLHXEgWDXmzab2KmhdinKSo37YtBFV71RKwfLeaB1ZTur7VNT/1MEm8yrFk2CK
	Yw9nlZgsZGcbZGZddQiKPygij1xOmFz/rxrNnzar8L1CSYxqjPZkUMF5FV/pLVPcGnXz1ZYlRq5
	BaJ/5xCGdfEhqfgjrpqYOT2sZzKTSRgfyTBxcRPgHHEvxxcXnvMc3NGWXhPMUAbMQzC5+7Ll6rY
	sKF+M7RPwFg/bKZLTwOleRxGdsfhwqKVfrZ+L6RJJQPeaTnLDTRa+2MuKJz8mZNvrlKoCt5141x
	/F+CQpraEJ0z43HG8E=
X-Received: by 2002:a17:903:3d06:b0:2dd:ad73:5b73 with SMTP id d9443c01a7336-2ddb1d5bd18mr43767255ad.35.1789729516398;
        Fri, 18 Sep 2026 04:05:16 -0700 (PDT)
Received: from kernel ([103.219.206.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c28180a4dsm4721501eec.0.2026.09.18.04.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:05:15 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: clabbe@baylibre.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] crypto: amlogic: Fix IRQ handler return value and fallthrough logic
Date: Fri, 18 Sep 2026 16:35:04 +0530
Message-ID: <20260918110504.7207-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_040517_705142_6023E3F6 
X-CRM114-Status: GOOD (  18.07  )
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

In meson_irq_handler(), when an interrupt matches a flow but the status
register is empty, the driver prints an error but doesn't return. It
falls through the loop and incorrectly prints an `unknown irq` message.

Fix this by returning immediately. For empty status registers, return
IRQ_NONE instead of IRQ_HANDLED to avoid masking spurious interrupts and
allow the kernel to detect interrupt storms. Also use
dev_err_ratelimited() to prevent console lockups during an interrupt
storm.

Additionally, the handler return IRQ_HANDLED for genuinely unknown
interrupts. Return IRQ_NONE instead for unhandled interrupts.

Cc: stable@vger.kernel.org
Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
I have addressed the IRQ specific issues in this v2. The other
pre-existing issues mentioned by Sashiko are already addressed in my
separate patch.

Changes in v2:
- Return IRQ_NONE instead of IRQ_HANDLED when status register is empty
  to avoid masking spurious interrupts.
- Use dev_err_ratelimited() to prevent console lockups.

 drivers/crypto/amlogic/amlogic-gxl-core.c | 38 ++++++++++-------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..d5d84524c110 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -37,12 +37,13 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 				complete(&mc->chanlist[flow].complete);
 				return IRQ_HANDLED;
 			}
-			dev_err(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			dev_err_ratelimited(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			return IRQ_NONE;
 		}
 	}
 
-	dev_err(mc->dev, "%s %d from unknown irq\n", __func__, irq);
-	return IRQ_HANDLED;
+	dev_err_ratelimited(mc->dev, "%s %d from unknown irq\n", __func__, irq);
+	return IRQ_NONE;
 }
 
 static struct meson_alg_template mc_algs[] = {
@@ -243,34 +244,30 @@ static int meson_crypto_probe(struct platform_device *pdev)
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
@@ -289,9 +286,8 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	meson_unregister_algs(mc);
+error_chanlist:
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -306,8 +302,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
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
