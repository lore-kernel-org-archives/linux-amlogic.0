Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D10C982DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NNmpIbzw7rPDt62Ntbh2GXbm/s2g1y3xBE7Yh54pP+c=; b=4Xw5RVFd9qmGj6
	8S03PVatPZIryFtnTs9J9Zlvq5oBHAecBywH8VVdT1e5EIIgnqZKykj1m36mTVWrAZkv96n8ffTcS
	T3Ndl19+KMk3yItVxV2TZH942UVef1OhTNFztiJqpT++b1n/Q5iKAblknzipGBoDIZmGpBCzMkDnc
	QNwc0liA3EPecwppXlmKCeF4ENpZ1EU8OMYnHtFn7M8hsyzLqhK/JcDJI86Lse9YiE5l3dl1n4n38
	IIoHG0zSEhtR0NYye8CLm4Kw5mE7FnNrI9Cth9unT07SGf6gSe7e9SDEg9XsiigTSojThnLNkCDB8
	q/kYH88R8DVuVbivSWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XG9-0000000EJQ0-0Wag;
	Fri, 18 Sep 2026 12:00:05 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XG5-0000000EJPD-1WZP
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 12:00:03 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747ed6d6eso6301755ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732800; x=1790337600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYcJRra+LcCNHLwBdH8ymzEfMxOB7CWtfUUDK8cCiZQ=;
        b=HvpssqwM56zEG8SzqZXT/uiP+HBlc6Zsr83oPxnL98GQ6CUwX0cUQ4jMfiXRHSOIpP
         uFGndCMZkdbbaX9F6Z6ZGIol8VfrrbY877W36HEsthVlCN4Kl+rV6VQ7Az7LJpWEn9XI
         FGN47ZNngHgpqeS8tPmgVytwlUvYG58FmdVaYOyIUnkoUC7w+N06th0OTZSPg+BYJAvY
         Egizw5WgVUrsAjQvivWkrwgWvcF4t/TQBPIPM3R491YmBD7A3UCxLggmGEcf1rByyxpg
         pY9RG+4wPZu3uzRf4oq+8jn0e3BnmooqmNTYHsOK/F8MSPbZR4Y6tIcOsau+DEMhDDcR
         yMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732800; x=1790337600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYcJRra+LcCNHLwBdH8ymzEfMxOB7CWtfUUDK8cCiZQ=;
        b=EaWUxlrzT67QaZVy0sY4QR0wQx4ASbkzAVKo5H9M5kTTfln6LtNBRSOZaC5mlNMJQZ
         Uu5LtugNW8C+AsWPsRFIuZ6H3xYD3tU2uT22A7w7y5e6m6I2SU+qgWflZ6zXVLNBSsDG
         EItH6QwEmWbBwy/nczrq6VdFPeXq/zfW+T3FJYBw7vvlB+c2OOOpb4T9zZlKkhVFRpG3
         +AKOO3hPIv3nJN7i9+ic4x+U5lwWezKVZE/LPYHlz+hbqYHtQ58j35CJ147Ll+aNuAF9
         BQ7LYNcIfayzLlL//i/uEkMTFJp8fmrHipXyVmyRuBxeALWEAq5h3tdu2LAXl8qgG0LX
         d0/A==
X-Forwarded-Encrypted: i=1; AKwUvByK/2m33EDKntjXYJRUWtVJwUZCmLSTaGNvlNz9Zx6/f8QYZd7OgZ5GnorBLTVWZNGG7IDGhi+hw4Oa9Y/T@lists.infradead.org
X-Gm-Message-State: AFuF++lx0Xg98lp6+kF0HP/Z1O0giPS2pe6qNyfkwjf/Lphf/cc82zsW
	1kpowkgtpxswChewDLjnNx2iGQUQjjLevvCfoFYB05uVmQvpI1dD81Is
X-Gm-Gg: AYBFou1/oRQoeLXCrm+aV3JSlxuMMBlZCPRo4yhRoFcbOXD6pVgty5RVhuopuKcltqn
	eB7U8GxqvrRQiEue6K22M6g040pqGe2uH/tMHvWLEKi+0M4LjflhC6ROPI4BxXvXyjVD0TWZtn/
	U4XzHEYcv3lMRU9LresO6f4XD1oYqrLTxMdyrk1Sh84m3mQPeRnSEPIImvcGGZZlLe8/ooyWhu1
	wyNGRkqvofhldbu2j0GDlAHU/PKYHhksVIUjvPblyCEV20pKfoqJZZ6cGh/ggNjwNO1Nnbv0pjf
	R4EVLSa+nAshMqNE99BLvj3Bxh3u2wN5gm64s8UFUxtLpkTSldS26S6bL31wmVKCfikR3hMBtrt
	Zr0o9jw7D/xilV30MmvxNMpGoSX2k4Lj3mBi/TDaDagRmtbvNb7gHoOOUWdvr9AH5bTQw+5ZNwz
	4ghmaDxl4bWgxFm4T2D8fF0t+04R6w6r18PqXbcF6hwNjAycTLgmM40WwiDj8ZgUJtfA67m3WTC
	yegNpxGc4fkyboMudc=
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id 98e67ed59e1d1-39e54fb121dmr4831022a91.22.1789732800428;
        Fri, 18 Sep 2026 05:00:00 -0700 (PDT)
Received: from kernel ([103.219.206.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2876a52esm4179626eec.20.2026.09.18.04.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:59:59 -0700 (PDT)
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
Subject: [PATCH v3] crypto: amlogic: Fix IRQ handler return value and fallthrough logic
Date: Fri, 18 Sep 2026 17:29:50 +0530
Message-ID: <20260918115950.9121-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_050001_408455_63AB0997 
X-CRM114-Status: GOOD (  13.07  )
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

Additionally, the handler returned IRQ_HANDLED for genuinely unknown
interrupts. Return IRQ_NONE instead for unhandled interrupts.

Cc: stable@vger.kernel.org
Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
I have addressed the IRQ specific issues in this v3. The other
pre-exisiting issues mentioned by Sashiko are already addressed in my
separate patch.

Changes in v3:
- Revert accidental clock management changes that were squashed into v2.

Changes in v2:
- Return IRQ_NONE instead of IRQ_HANDLED when status register is empty
  to avoid masking spurious interrupts.
- Use dev_err_ratelimited() to prevent console lockups.

Link to v2: https://lore.kernel.org/all/20260918110504.7207-1-raizudeen.kerneldev@gmail.com/T/

 drivers/crypto/amlogic/amlogic-gxl-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..09d3ccd92b80 100644
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
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
