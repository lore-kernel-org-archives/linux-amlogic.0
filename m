Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A19C5DF8C
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YYvYsWYRNMqs4x91c6ZLTn9LCX0IUcGwfJAMnGVvA+I=; b=H4jbvPzLLy1CPl
	GYpQt9zMbX3sZykK/6NwCBXeJFvOXL6+kicmo637mud9AT3bT5eEh7ZCM/6/tcas6nwcf6/2e6PS7
	WDaapzU2AZuZcxpk1mHhRps91ejcokipJF3cw15ymOnStN3HcfbHKOS0n5hhEKvQJvwAaN6yR+tTt
	Y0BAjcUREvq0+n18FDAmMonVj0C5HYnh+S1s4q/tpYwSMz4p6v4pevKY8C9MPTludWIE+YonWM4Bt
	6VUsYW+7rzjZS/4j5gdfPBGiXwlc2ctDCeNSfd/Rqc19D2e31kZq9njcyX6l3XsVHneHBZ/yNCZU5
	xjmBNPSuUGovIICRTI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxg21-0000000EKzT-1rQl;
	Sat, 22 Aug 2026 07:20:45 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxg1z-0000000EKz7-2dpP
	for linux-amlogic@lists.infradead.org;
	Sat, 22 Aug 2026 07:20:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc11a30a259so1814323a12.3
        for <linux-amlogic@lists.infradead.org>; Sat, 22 Aug 2026 00:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787383242; x=1787988042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3iQTnt9oJ3v6w7xIpplt3JgJj2kj/4e9mI/GL4WtqJk=;
        b=nXXhRI+KmBFQC56Dim/0YTAKsD7GlUu18YG3pI14N4raUoCzQsomMECm5kH8FVD8uo
         A0UnYD2phBuB/LdYpxVXkiCCGcKY5PZwKCMO6IKuUmZZqLmb+18OnE1JH+eGs7gIOADR
         +LGa0nXI8M0ZdlxU9ex7tUcbULEW0VhwZEP51nJLvboeY9Ak6fC3NqVDlpMgpfHaxDFf
         UV9TapLwIXi3qk3DWd+TmK+9chxdP6TjupZQfR56W38mFfPwFAI+HcQfH9nVX3TIn8H3
         AhVIvUMYcohhtbQaByaEUK4RmIhuuW+JQZtuWe2cgDBOG1l6UrDNOor2UdqvlGFKMet4
         3xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787383242; x=1787988042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iQTnt9oJ3v6w7xIpplt3JgJj2kj/4e9mI/GL4WtqJk=;
        b=R6N+2ek+dV0ei0aCJy8uPuVoAJIUe5o79oSoElWmjYxuHbrObyuqdYkZxPkuM/MdWs
         seHnvNjxudNhN7agleInaiHLm2/IqG1TfSI33/ETHGF9A24RHK2jgHqZQHzQ0ISGi2yE
         1c+BszuMjTCFeYLLSEKMWP4ZN5SMj5xfi3DGADBxxnvdR6OK94bc21KXmpHu9nVKVyQ/
         0Z4LQWa4IQ8B/TzF+5DcFKtelOhoSAbasIyv8AS7Cf3Hcz9jbqdBcuQpaDmsbZbIpCKD
         zRFFXAHp9rwK7cnScZCnk9XgV+9ubS+XxUZBnW2SUODLI3Yx1EwRufiwQ9UCn1Tiew0P
         qt0w==
X-Forwarded-Encrypted: i=1; AHgh+RrH2p3LgdMx/0j1nfDgauqXwDV0HyBVc7kYrcscjWq0OjAb+0i4juTsg0FhQ2UfC6wEA9ZAY7PrsniAoddG@lists.infradead.org
X-Gm-Message-State: AFuF++lFycx6VKgHUWATumADA1OoxWP+zoAJye261vcbulw4iPTZyQNN
	ZrJrDPukYPhq7XtzHXk8LnjzQn1Bz5KZbRWS6u4dp+rn+6woejn3NE6L
X-Gm-Gg: AR+sD138Zu2UJvHEu7ZQE5gpUTxVzzdZFwQ03L14QqFry8zbQQHrjXgDeSngHojhk5F
	Ol9qhDZF7w+i8JqAdxNvH4fQg9LUa7vLSD4CUCh5KOCeUGiBm++PDLCtB4vSO4zyglCA1Yb65BC
	9jcSrqNda8lewe33Ib+ZukFqGChslbx6As1ZPJyK7m55u9sP1aZJYmGQ0bIWBC9kQ/Nz4HHLNrl
	IwOxYyOLpSf1PP6dUupljP9WRD+nSpGLkZyqcqJeB4ZxEHVuSw1SvqgdHJ1WkBFnosXD5ulk8hZ
	nAkoXHlcSyCoTUx2GNh2dv5hrT5QJmPkcLemwZJD8j2HHq6jsXopnEBVsD5SM+3PVmk16sIPFEU
	whUhmAX2YUInyZFHs7gC7hpZ7Q5swxyVqhhxepVsqenQKbPmqaDWh8EKTikqvB9mxxN6WvBV9TN
	kbQIImYfX9OOaCDE2fkdjM5qwN1nhl4BNFyJvsd1kKnsfwfLDSqACcyB0v8yM6/8syg4cka1nTn
	wIP/aMe
X-Received: by 2002:a17:90b:538f:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-395df29e128mr7734335a91.13.1787383242533;
        Sat, 22 Aug 2026 00:20:42 -0700 (PDT)
Received: from kernel ([103.219.206.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f909a51fsm3290362eec.4.2026.08.22.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 00:20:42 -0700 (PDT)
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
Subject: [PATCH] crypto: amlogic: Fix DMA memory leak in cipher error path
Date: Sat, 22 Aug 2026 12:50:31 +0530
Message-ID: <20260822072031.23042-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_002043_695699_E5ADB764 
X-CRM114-Status: GOOD (  10.64  )
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

In meson_cipher(), if the mapping of the destination scatterlist fails,
the driver jumps to the end of the function. This skips the unmapping of
the previously mapped source scatterlist and the key/IV buffer, causing
a DMA memory leak.

Fix this by introducing proper error labels, error_src and error_keyiv
to unmap the already mapped resources before returning the error.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index 29048da6f50a..fc8569fd83fd 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -178,9 +178,9 @@ static int meson_cipher(struct skcipher_request *areq)
 		nr_sgs = dma_map_sg(mc->dev, areq->src, sg_nents(areq->src),
 				    DMA_BIDIRECTIONAL);
 		if (!nr_sgs) {
-			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
+			dev_err(mc->dev, "Invalid BIDIR SG count %d\n", nr_sgs);
 			err = -EINVAL;
-			goto theend;
+			goto error_keyiv;
 		}
 		nr_sgd = nr_sgs;
 	} else {
@@ -189,14 +189,14 @@ static int meson_cipher(struct skcipher_request *areq)
 		if (!nr_sgs || nr_sgs > MAXDESC - 3) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgs);
 			err = -EINVAL;
-			goto theend;
+			goto error_keyiv;
 		}
 		nr_sgd = dma_map_sg(mc->dev, areq->dst, sg_nents(areq->dst),
 				    DMA_FROM_DEVICE);
 		if (!nr_sgd || nr_sgd > MAXDESC - 3) {
 			dev_err(mc->dev, "Invalid SG count %d\n", nr_sgd);
 			err = -EINVAL;
-			goto theend;
+			goto error_src;
 		}
 	}
 
@@ -251,6 +251,12 @@ static int meson_cipher(struct skcipher_request *areq)
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
