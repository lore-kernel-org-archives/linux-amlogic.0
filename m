Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA28C79F82
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vo/iy3M6+wXdF05N3WDfaQZ/aSnru2v5z9nYyJUwpgI=; b=2IYEmlnnn+NJO3
	m4E5FaCQAdvDGDCj/KLrz1cKWkNWVf+nrtRnYE3sgZGFF59RlCf8/2eKJ1OQhIqWxtyTVX8Ty7uRu
	Tekk4HCq0xJgiQ6d+wsX1t8E/esjBTnDfczqi+mLMcBdpIWn6tjqKmw2ZlSbQ1plClvJkLWz3Omhx
	m5BukBR2c9PWQEBhMYSKXbBNxzdZTHvWkyvFjRjKw5f46uOjL537jHAWQDEsmEUcbQjeoxJPlcirx
	g73iix2BnclcLkVX06fBpf9UpEaAVLtv/xNp6v8um98aA8DqlZX5t+219endKvIzf2Yj68YSfycIf
	6mFloo0wBsXu+rbHR8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yGX-00000009a3f-1lRl;
	Tue, 08 Sep 2026 16:01:45 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yGV-00000009a3F-0QOx
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 16:01:44 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7f4f53975e6so4547144a34.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883298; x=1789488098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HavqBuvOK9+7hkcuCpVB9Cv/dvjoerCr3RPaWhvFOI=;
        b=NEZW/THB4m9aYMfdgx4j684Mpl+j9fhgqjVUs1RwpTB4OKqMMzsO5ef3843zyhIXOo
         bg8l2/sz1v36/fPkT/RgcRH/HhSR6erBJB8so0QahnD5ymH4+iTunc9+nJ/FZJ763VhX
         dGPZ7NJRlXJ4KMODmh62BZN99fsRI1lmr+W7ntfpjobzSRVhw5URo/YCvxDF1kBnCfv4
         /yQAwkKhLVzrd4nPbCN0pso9NCinWAOMEEhhwaHBDpOhBL+dDWPc/rPX8dOBE/BTUG5m
         TOO4s7s3XwA9S3qo6Sje9n6kr23BVZzh287GI8BbnmEBSrk2AJbs0/+S1+6Rl4954x08
         9/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883298; x=1789488098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HavqBuvOK9+7hkcuCpVB9Cv/dvjoerCr3RPaWhvFOI=;
        b=QJywCYCA5PwePpo0ihP/ajkgmU323g6Anmf1EysiVmfmGPcY6mJMlEXHRNE+b/dPvP
         VlTEg/QiHTJdMHlvHTTv8hNXL/yna7+0M7cagzgKNKh9SzVoNpe2hgS6Yp/2nvagPeyw
         9oNVl5jipSDgZir2QOXxxtZqbsOW74MViA4WSwCX2JJZwfg07/cpgce6/IoXKYFkY9WF
         jfZBnzk93mAucgqEUIrkTWqXB+cpGjtKeg80NbAvgGOcSTjuD2cBkdr1sOpx1H8Utotw
         o9xt+O8a2VmqiojDj+I4C6iMoPOrhBrkT/FffkJa8YRFDgodLpdc3kCJRg6edtpdmKnk
         sjfw==
X-Forwarded-Encrypted: i=1; AKwUvBwntldTCDhSbel2KBf17BFFt2KWQOOIfbSWmPgX2lTf0bma948eZd0CuWIF9ORNtZu1oKjeeSVQL07Ylgql@lists.infradead.org
X-Gm-Message-State: AFuF++leDVlCOR8okyUInSZb9jGdSJWQbeGR85RKHzLR86XWQxG4UMG7
	oktyEGBpO1HHxU45K5+HeFXx6YQ2Ln+iSv+sW6cxV2zi35YvNu9mfDUJ
X-Gm-Gg: AYBFou3JA+B6bLd1Wck7o9sh1aRgCZeIvVv9UA5BEAsakfBnCc0Tuv7E8aMUuvFER6d
	ayJ/ZK5huVE6CfAAhYVuotQUlpQk48C1BPgM8hKy8wlfzdwiplwRYhlLRoCYkT9zlYvU9rYZjIe
	nZ0H6WEE+dSsHJ7s97kyEFD6bBtOsEJWsuDExQ3fAgoGcjPxecbeH93OYQRCsJI3Ic574utAqhC
	A5QQ2Uz34ncLghKgueu+h1L7Uf5CInnhYWTBAQQpKEe98vA0GC/bPnCpjHzgDGc5aJMfMXn0c/N
	7WfLCZJUOf3ziXCWFa71Ns7v0ooHfVGCKqTNIGKGg6YpTYmcfGvAurh0MgL4y6aD0SB6o006Fkn
	3RoS8dHmbnYuLatbVxkYX5WHYV7KL36EZ/u8MwRikqKdaGTc0U7LQL+ebmLUsAeYYBjl80SY5La
	bxMRLWFD7uTcuELMEfY4yCgOfn/sxf1FUpBeRcLqzgwpiqQ4uWqXY0BNWtFknqEsD/RJsZuUaqB
	w8w9g9v
X-Received: by 2002:a05:6820:6ac3:b0:6b0:4170:59ad with SMTP id 006d021491bc7-6b6fc7d1f64mr19096852eaf.24.1788883295449;
        Tue, 08 Sep 2026 09:01:35 -0700 (PDT)
Received: from kernel ([45.251.35.112])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm43084171eec.7.2026.09.08.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:01:34 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	clabbe@baylibre.com,
	davem@davemloft.net
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: amlogic: Fix IRQ handler return value and fallthrough logic
Date: Tue,  8 Sep 2026 21:31:20 +0530
Message-ID: <20260908160120.4805-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_090143_145074_A3EC5FD5 
X-CRM114-Status: GOOD (  11.97  )
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
