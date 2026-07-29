Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D137C53219
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbGwXTPDkOl94fSI3jZRJLkkCcoICH448mZhQ4M5PEI=; b=xGSL6Ob1lIHEE3
	cRWTpq9np+F2QkJCB1BYYJgSx+cIa9wv3By3SgzuXziGQtWZWOuS4mRogLXaRxk79kEXGPYQWn28Q
	JcxOJWiW2YlHizuJcQUkWJd/hl2dHjLgiDrbTuZqzCKr4Fa6KF9WVVZx91Z4k7UyxnOso6nfQSn0I
	ULwPjz0iKEFxBhHrdwIPVUwJEPHC+Q2l1Q+Vev8fEt3LFpulNtPxJjIxYmEqAtfxfV/aKj2vp0N5j
	89dbrgI4pO/2GHe82kMK6zd9Lp8cQvTyPyDHU4gERkBf73AvdNNR9Y3ov4o6xf9ccMYtvsA1eDx+4
	LAD6I7YkyUcU6iREB0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67t-00000008O2e-2pic;
	Wed, 29 Jul 2026 15:23:21 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp67q-00000008Nzc-0hw6;
	Wed, 29 Jul 2026 15:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338596; bh=FPiMPTsDBCeuqi1jdZxuahf+2WmJa1g7FWViFCkj4rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JzdZz4ZpFiFE0FAi8KMn7/NPybLVzjqXcVo9X97OIrsn6hvJx3PbC/+gSWLMotY+r
	 BTePcRd4am7qoqLQD16vgGeodEhqy0q4AolZz8xje0XTm8RL7ddZj9Y/XC8Q2zL6Go
	 fOB83HKs8H6cwv1S69JOlRiby3N4U8I3PEWXKNQil9tS/tS9DKup/8jHzuXJCMRUrE
	 8Bj7ffuMX7uYEHT2Gm+mLFIQEKiD0cShEgBrwF9u7d7xmoIWExuxXvEUv0+b34x4C/
	 eOQar11XNTh1qyii7gAfTt//9J2a1pL2nJ6HAwiY7nhGbpy/v4n7AwiodBqzRSdwSB
	 dwty7cSGGNYjA==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 8D5BF42528; Wed, 29 Jul 2026 16:23:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1785338594; bh=FPiMPTsDBCeuqi1jdZxuahf+2WmJa1g7FWViFCkj4rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rvE8Jx7xyv7RiQhCG/2iOmLSJjWCCdefVMdqfv6WpBjPv2cxziv5TxyYE44wlWcSF
	 w9E4c4DFyGL2te9FWQK8odw9Vu1LyGZEb8uwAr+bDiEXHco77VgzwhHAoI0do/HDMv
	 cy+8tJfYW9VxroJpqK/OxBq03gFbs7aizfMbiEpkIRXi9mkshlfNw66AlEkc6wK6sH
	 kZQXziHhv62AouUMiAeQrW/9gPtYjlM1ETN0aTOZqknli0HNwFyg9t0Wbj944nEJBx
	 kCZG50X15KUCzxL0bg5WPsFQeGewFdjyd9xOg+Ezv5N1WDfSdukp4S7o8aaMvElpP5
	 nSG/gTffLzTOA==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 5079D4254E;
	Wed, 29 Jul 2026 16:23:14 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/15] media: meson-ir-tx: Ensure probe error is propagated
Date: Wed, 29 Jul 2026 16:22:47 +0100
Message-ID: <205ba0a9ed3b3235b0029bcdf279f74eaea16f86.1785338381.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785338381.git.sean@mess.org>
References: <cover.1785338381.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_082318_425575_C2B437D7 
X-CRM114-Status: GOOD (  13.29  )
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

devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
propagated else the probe will not be deferred, it will fail instead.

Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Cc: stable@vger.kernel.org
---
 drivers/media/rc/meson-ir-tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index abb107d19e8c..174d5135e1bb 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -290,7 +290,7 @@ static int meson_irtx_mod_clock_probe(struct meson_irtx *ir,
 
 	clock = devm_clk_get_enabled(ir->dev, "xtal");
 	if (IS_ERR(clock))
-		return -ENODEV;
+		return PTR_ERR(clock);
 
 	*clk_nr = IRB_MOD_XTAL3_CLK;
 	ir->clk_rate = clk_get_rate(clock) / 3;
@@ -324,7 +324,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return -ENODEV;
+		return irq;
 
 	ir->dev = dev;
 	ir->carrier = MIRTX_DEFAULT_CARRIER;
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
