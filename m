Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B59AC5DF89
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vo/iy3M6+wXdF05N3WDfaQZ/aSnru2v5z9nYyJUwpgI=; b=a6n/Ew//Zqu8Jr
	bBjKZdydzgJNlOQBH3OFwPlfC3pzXN1XLaogpHyN7o96bp0MhJ1Q6aVoemUSnj4nxL7a86sE6Qzn4
	Mja7NguQgEdc93l7jR3iwbrk4ed1skq6t6EbV1Mpoe1B0mP4bRBbxJbjrf1R/gkoSFNKf1VALESey
	x+GAq6G+iwUJi7zO3qjcnSo/a8SDciLouqfilPiD7kySYaqddAVv4fxDgzC1UwnkBmNXhBpPEA8P9
	jnaWNLhxeHH6zzk8umAnt2h5iBNyYgOB9wW08fUcoUB2CoKXI4Kf3iuFmfvtwZmeo4twFHWj5fiKg
	48987p7rPIkCQOoOBhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQvR-0000000DddC-3plD;
	Fri, 21 Aug 2026 15:12:57 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQvP-0000000DdcV-31St
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 15:12:56 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1009813a91.0
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325174; x=1787929974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HavqBuvOK9+7hkcuCpVB9Cv/dvjoerCr3RPaWhvFOI=;
        b=WgAbRposotI7D0Sifkf1krOepDeHvc7YQE7sMofC/ABZiwUzUowxRv8Z7vaHIC71vP
         pF3SjTt6m7Oiu2lVjHg/vGEsjGgVLuY0OcBDZd2CzKpLYo8CB+cNVDZdbevZ/uDyJ12d
         mwtj7pL+NZQjuCofvIPuMBffRV+rbEYKCqabjQyunvP/rlMgn5nL9dBk8jE12zeBq66f
         DysmkBQ4xCe4Odo5JnT0u6KS22V4UBNWcnJvqxlGuOERv21vNPKWBOBVPUvDBupYlR21
         X/B/02UmEtAL1Nkj/5OM39wKXADC/kGgeP2P+2bfRSWnqcA/KlTBxZq3VuLZuVfLrf8i
         /T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325174; x=1787929974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HavqBuvOK9+7hkcuCpVB9Cv/dvjoerCr3RPaWhvFOI=;
        b=ZkEuBd/fMxaW6Y417pDbveYWIpOEX1NRP8VN9C0hrFqPyNthR9wjQNaHsn38KiFzTM
         Xn9q6JPHhB/GjJD+xWGlGQkbPFxhufFOALkSn8337STYnLzsGHSJtR5SfuWHxmNX59kV
         j6mAecE4s3pN54/g4gvm1YurQXhcUTjF7ENUdun8lFbOYJlyQz1O1J+W89h4C5ZZ2pti
         6XfVa1QDtpaNRxzrcyHWSj3NmBVSXXzpHHdmW3xmveMHQMZeKCQ6f1900Xw+5vZyI8yh
         85a6jDTV97c+7ztEzNhzam0W5d8ICUzprocd1a1eWnQjYTk/cjerYMEi42JGVqsWer5l
         /N7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVKIwBRcnpQ3ryiuv6WzWsKtWeuz8It0u8hShQD/QF0ihF/9N46y39Kad2C4i+Lkaq785jFIQcfo/6lgZw@lists.infradead.org
X-Gm-Message-State: AFuF++nYMoFjHLTxPddhmbZoPG6cReSkjmbNYryGMdTyn9vaBcnDgxeX
	siMpfuaHiionElqq4Ksm6VCNKlGowQC9lrWMeTVHxETAz/4p36li/n2v
X-Gm-Gg: AR+sD132p+IBrV2RG8q3hbe55tomBWF8nTTnvFb2Dn0F0EELGAaL0669JVW/tG/ovV3
	u14lj0tC8Pe6eOlN3pG6R/QL1lhntd28kLwHHeYaeZvm6cp9Ad8ZtgUmXy/SoBds1+WAiFI6h/3
	XRLCJlgVSsUjAFanIhnahZ5EpgaD9fzUuPo+/rV1+n5Wtw1VdcJfrsqVBUyvceqSVDxRVwPsU0U
	veAIBVUFrh6qypmuXjG4R+7LyQExPbYq017tV4aDuXdsVmll47oxWJB/IM5QU6SKU756n/T8KUy
	aJWPDz2j4LF5MTp54344mvCt2quewktWVH5o0f8VYU1LqNgZANipvxcsnQHbZuAUZP7W5EZEMxH
	I+J0saf0y1nKdGH8W/J2lqF2vyToOkyoNGstSGyIUUzme2NNTZ0StqIFAOysWOCSg/o9MKkt+7i
	z6vweMxjaUGolhxMAfOAJbbq/wpkiCNdCnAmuyaF7zWqymq5WCPNfg4VOHJGxx7nGoFh5ejrgao
	HuzJh7B
X-Received: by 2002:a17:90b:4c0a:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-395c351386amr12380816a91.5.1787325174270;
        Fri, 21 Aug 2026 08:12:54 -0700 (PDT)
Received: from kernel ([103.219.206.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4be666bsm3779132a91.11.2026.08.21.08.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:12:53 -0700 (PDT)
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
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] crypto: amlogic: Fix IRQ handler return value and fallthrough logic
Date: Fri, 21 Aug 2026 20:42:43 +0530
Message-ID: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_081255_758877_EBAC398B 
X-CRM114-Status: GOOD (  11.32  )
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

In irqreturn_t_meson_irq_handler(), when an interrupt matches a flow
but the status register is empty, the driver prints an error but
doesn't return. It falls through the loop and incorrectly prints an
`unknown irq` message.

Fix this by returning IRQ_HANDLED immediately after the error print.

Additionally, the handler returns IRQ_HANDLED for genuinely unknown
interrupts. This masks false interrupts and prevents the kernel from
detecting interrupts. Return IRQ_NONE instead for unhandled
interrupts.

Cc: stable@vger.kernel.org
Fixes: 48fe583fe5417 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 6cb33949915f..302b398405e2 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -38,11 +38,12 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
 				return IRQ_HANDLED;
 			}
 			dev_err(mc->dev, "%s %d Got irq for flow %d but ctrl is empty\n", __func__, irq, flow);
+			return IRQ_HANDLED; 
 		}
 	}
 
 	dev_err(mc->dev, "%s %d from unknown irq\n", __func__, irq);
-	return IRQ_HANDLED;
+	return IRQ_NONE;
 }
 
 static struct meson_alg_template mc_algs[] = {
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
