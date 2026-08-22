Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65026C5DF97
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2026 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LcmA89hk2u4GiBRci1WZbuH1rLyySTfNFxCBLQWIblk=; b=s0BqjhpoOp12s9
	r7/NOZKsQb3qtp6hjxOBs7PU9XC++igJfa46ETdppheGMumjuLZhR0+s5973lIyQg7lif7WukQooy
	CJ89ub3sQ/yG0PY2GNV2Ia78/w/9MXqT+aihWe4S//xfmXmq+sMJbqAiNeoipBn35h5rjYflKGT90
	yGSjBV8a23EIWPk34RuAYYzrlcPgAJbC8yN8WcM1ZDMLh+l/+AzReGmO2Cmy11+Cb0jck38o3UOKe
	lrnlyxypNpjn7SsaEUNdTWj7ZNZBMeujaD+Rl//PoKAeRyhN2vB1iyNA12KvKzFZv29LAJHQaXTZ9
	nL8UzUfpg+Oz+sp5TiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxhLs-0000000EPCC-2uY1;
	Sat, 22 Aug 2026 08:45:20 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxhLq-0000000EPBr-2aSt
	for linux-amlogic@lists.infradead.org;
	Sat, 22 Aug 2026 08:45:19 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cc16c6dcae2so1851693a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 22 Aug 2026 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787388317; x=1787993117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=74796tnDJ+NCSB9SFK75OzCa7nSnHKFX91lyqQmVcl4=;
        b=h6u5nh9dfotfu8mDq6NQtMYPG8hetCWTRw5ZRCDv4gEmJALpfbcgFDK5xmiIXEDovj
         b0QVPKWgG2kSbnTlxpzQs06OOYkAH/twYk7WMyUxloJVanQkCRmObzJuqbLCWis7p2he
         q0SMog/S77r6+8p/L78Z9/fgnj+7B1r51iGtTcy1i3Zbx+mqCQloZK6MmZmY4WGlkmoJ
         7oVxrXLDwIaLIVNqd9wlC1qEwHKA0kx1fesJ09fyU90coC6MbwyG+LlYdR16MBv+vqGP
         Q//3Q/bnuzNcqH1DUWe6mwSEfvQkwnCnMMXTGOpVk4xutkhApTkTfZ/nkEvGDMxR2ivZ
         bMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388317; x=1787993117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74796tnDJ+NCSB9SFK75OzCa7nSnHKFX91lyqQmVcl4=;
        b=OgLWmDb6aCluBbSDGE2roTHO7blWy3yumI3kGbi5y8C6yQmhDK+H1j/8hKOqOX7ZAg
         oBq0VuQkBUI4YtaDTxwsYVGM2fx6q7a6hc4A3Xk+1SRF2zLcYIFLSrnr4AbgG1D2SbGT
         uxU3gPYNfkNn9Hnagd/Fum7tpPultOGVQljgP2lDOybB/SfNrFGdrV16yetJFU4T2f6G
         ExVYI4jq5xuMVPdKGla31wcr1dCdZq2u9Z3I0XM7nsqmpelzUcIo0nvzZLO5EIg6xtZy
         yCV0HrJQxGvtBPXNrLpPh+o+N/NEso2kKgZLw/EsuWbf/yMIEc/pZe+OXNUNkPUR1smY
         ZeFg==
X-Forwarded-Encrypted: i=1; AHgh+RqnfSNR/1WJylpATONNgCemlvAlJZedT2fJO3rFotEve+SLYYUxaKhbSXj+jsVOtmV03KIkYMXM+Y2rne23@lists.infradead.org
X-Gm-Message-State: AFuF++kvL6PZT1u2kWeK+meCH2WJiWYfY+x8VSyFYIUxjFtFbVJECZAd
	ZiLRAmrg8BCzKm1S37soZExiYzk3uTCgcMy0Mw5TZQNibFcy1px7rLAb
X-Gm-Gg: AR+sD12wiNIXhnItOGibKabISwnu3LGJVMXg+VsI9nhXLJA9WCtUP6WjcHN54RB17fr
	Te294Mz0jiN3gU6eCgm99RNtJsVJ9Kp9Qm1WnieZ41cf67dsxUSVTNaQdkUACMGwPKXJ+lD/i8S
	iI2Bb/9yahXuGpVIx7L/14ladlMXXh7fZXiuRam0DqTwWDfmOcs2iQX8f/ut1SE5Ujj64dQS4lU
	rmCPRY6NPiPRt5EZsES5tpOYDJwFLMFNo21auKwdFn/71eN5ZCA0A3neOeknll8pYlnstTZcyxn
	8TG0Z/Xc/EomwzUTymGFQvrveE8m71xLWdxDiJQCm0frbgCXJyNTj1m6Fon/xymURqjoMpAtuV1
	xDhvcWhD+V+ABQcqGin/jDaAVabPBGz3XHBk1huwbRWDZ4rPwn2UhXYhC3NQviKnqoLA37KHh+H
	+OZqDlsiA54KGS73OB1+0i/XnGOC3q1PYq4TOegwaMH29zVq3st/rn2WLPs8fXgOfuzXC3T8UrW
	bP+mim7
X-Received: by 2002:a17:90a:ec8e:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-395c2f2a10bmr22322171a91.0.1787388317445;
        Sat, 22 Aug 2026 01:45:17 -0700 (PDT)
Received: from kernel ([103.219.206.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909c6c9sm5467855eec.6.2026.08.22.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:45:16 -0700 (PDT)
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
Subject: [PATCH v2] crypto: amlogic: Fix DMA memory leak in cipher error path
Date: Sat, 22 Aug 2026 14:15:08 +0530
Message-ID: <20260822084509.26385-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_014518_660888_BDD5ECDA 
X-CRM114-Status: GOOD (  13.89  )
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

A DMA memory leak occurs in meson_cipher() on the mapping error paths.
The driver jumps to the end of the function without unmapping the
previously mapped source scatterlist and key/IV buffer when the
destination apping fails.

Additionally, a memory leak occurs when a scatterlist mapping succeeds
but the returned count exceeds the driver's MAXDESC limit. In this case,
the driver rejects the mapping without unmapping it. The BIDIRECTIONAL
mapping branch also lacks the required 'MAXDESC -3' upper bound check.

Fix this by introducing proper error labels, error_src and error_keyiv
and unmap resources immediately inside the calidation checks to ensure
all successfully mapped resources are cleaned up before returning the
error.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Add missing '> MAXDESC - 3' upper bound check for the BIDIRECTIONAL
  scatterlist mapping branch.
- Unmap scatterlists immediately inside the 'if' block when the count
  exceeds MAXDESC - 3, because dma_map_sg() actually succeeds in this
  case and the mapping must be undone.

 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 25 ++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 29048da6f50a..39b44ec89997 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -177,10 +177,13 @@ static int meson_cipher(struct skcipher_request *areq)
 	if (areq->src == areq->dst) {
 		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
 				    DMA_BIDIRECTIONAL);
-		if (!nr_sgs) {
-			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
+		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
+			dev_err(mc->dev, "Invalid BIDIR SG count %d\n", nr_sgs);
 			err = -EINVAL;
-			goto theend;
+			
+			if (nr_sgs)
+				dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_BIDIRECTIONAL);
+			goto error_keyiv;
 		}
 		nr_sgd = nr_sgs;
 	} else {
@@ -189,14 +192,20 @@ static int meson_cipher(struct skcipher_request *areq)
 		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
 			err = -EINVAL;
-			goto theend;
+
+			if (nr_sgs)
+				dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+			goto error_keyiv;
 		}
 		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
 				    DMA_FROM_DEVICE);
 		if (!nr_sgd || nr_sgd > MAXDESC - 3) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
 			err = -EINVAL;
-			goto theend;
+
+			if (nr_sgd)
+				dma_unmap_sg(mc->dev, areq->dst, sg_nents(areq->dst), DMA_FROM_DEVICE);
+			goto error_src;
 		}
 	}
 
@@ -251,6 +260,12 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
+	goto theend;
+
+error_src:
+	dma_unmap_sg(mc->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+error_keyiv:
+	dma_unmap_single(mc->dev, phykeyiv, keyivlen, DMA_TO_DEVICE);
 theend:
 	kfree_sensitive(bkeyiv);
 	kfree_sensitive(backup_iv);
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
