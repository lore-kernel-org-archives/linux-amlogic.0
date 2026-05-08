Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320A6CD342F
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 May 2026 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v86NrFn2Tq7m8C1CiL78XFIn6QYAz1KRBsQ812nisW8=; b=hNLS+OGZFDkM6y
	XJyuXubHcGh1yigqnWjlhMn2tNXM5kHru9EbLNc7UcSm2NCDCu7T78MUjZasD2JiNVHSX0MOTxsLQ
	+nshsZqr/rjlTK+ZGVJNe9HEsEuFKi8YmP8YCyt4oGDUMfuCVFP9cOu2LwAi2sZ5mn7rbh0vzrrVm
	0ahKDYQjM47ofXsPLJlUpg53TvnNSH95G46XTK9Tw2IRFBkDCh1PYaP0cEuOy6jY60Pw8ARit9Mkh
	9t/52qtOlJkTJ/89NacUSosN/wpdbQAm9J6M1VskhNz+Rok/bTn2bYsByB3NLQXaZplk85rMPUZCK
	GG5fWnYB1b08t9A4EINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEDc-00000005gR2-0YKm;
	Fri, 08 May 2026 05:57:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEDa-00000005gQg-46WK
	for linux-amlogic@bombadil.infradead.org;
	Fri, 08 May 2026 05:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=; b=oucCbRyieCERNhXtaN43YugWDG
	9SjG68zBvIhcAz2GVwuFZL8fskaeYd+2KM9OpGe3EcQYJkifzv3IzRG24qZ1p5dqSeLIqSQRJdJiX
	1PRlqwOSYlW8iNN/IGO0CyQ2W0aCO6WTujw93Rdr/cww7wKfMRSyEgqB1KP4NEl9xICK3oL1A7kaG
	bUvmbbL2qu6J5UubHM7Y3KCaeScnBEow7Y03n5UQ5oQ7yaJve0K/KffQlkgFaNBIOITANWrdkfCwB
	MCEXwefA0H5O8+Rlom9zfPniKXb0iVIhdm4Tw4QB5HxnA2ZL+lHGx2Ke+zbVn367WaH1kKlxWd3ok
	UcE8w8XQ==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEDW-00000003nX2-2O0C
	for linux-amlogic@lists.infradead.org;
	Fri, 08 May 2026 05:57:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488b0046078so13240665e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 07 May 2026 22:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778219860; x=1778824660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=cERp31WqpjVU6ibonPHqCU7flwUgArLPkbPoK7gWRAkpg1CnbNsch8jTDwzRL50SQ1
         AQFcvhunFvZsp+JtmFzk4iQhwZernUwia89+leifJmT/6SfM2blkaMUnnOkYxct9ZB0N
         kF99/6AvfAes66Tfo6pciiswFDlLJkR+iHbXNQMfmhAyPZ4lDgnmsEzEqY7Jn/2tGI9w
         K1nHZ4lGDR1GwpbMpZQ1QHYUPPm8xQeTNxScs9Qxo95PTOIdQ+ebhM0Oc+Pfzey5dAcM
         hnViYvaEgCntqEiIUvd0OTjCQ868Q9+eGrlip09jsiqD2T6f/kl/es7XxRHkdZ+xiscj
         jahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778219860; x=1778824660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgm85ZTzRm7Et/N4PqeSajuQEpz4ZP+SV6Szdoh9oh0=;
        b=f4y0hsbB9ZoBg/EY7DVbhyVzTqPiiX2ma0AsnaJhkbaIKU3P7h6z18EdseMvBe6EVi
         DVLNA3coQyymoQ1uhdxo8X81YzUejnx/j2hfcdQEcEGGvJdOc7yAli8SqC3Osag2J39Z
         3uAAinQ3c/m2hgbhoRWCPt+VskeptGcNS2Q4GjD9TUwTTKCChP5bXqLvgbw+q6dp/LBw
         T4TKZnF3eYvqFPocc45QfKBqVmf9qx2fkK90THnRl5ZXHzGKGHMYCNPs0cCoPXJGuR+d
         lFjl6MsP+oSxKm4/abaZakQiZhHEhy3UASTUn51i0xx7tAuWTzJ9aEKk9dVwGvv/pKQ8
         i+dQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZrNFiNzs3QSskjXG/Et9Pz2WqHPh/eOSGkFEO/OxpXxVWbIdhkNhYdK9+f7RPZ5tp4pJtYo8RG82o0z46@lists.infradead.org
X-Gm-Message-State: AOJu0Yw26ReEyUhWN27gDRel9qoEGypcN4VAD8HiBC55yo7KF5hOkAxb
	UEyKYwJWDKbKApvxtccble7hOZvFb/aJam2UF7n6EhwEgoDqXG7My0K0
X-Gm-Gg: AeBDies13jFjj2QAp5Je/AjgxXhv3oIQYkBJnhdGicgckqF0C1daj0SREm4bDRJPwhm
	QBwYCRjHOu0eDTV3rhuzth7Hl4dDpY+hoJAUHyt52m2pFGw2YAihRN7B7Iy0my/JOSXo8IzwjJH
	yCjIgpqeWNNJa8wfzHs4Cor6KnN39LFs9FAWoILQ6wI2Kj4dhLgsZc5uvO25Af8LB4dU1ytiojb
	HpC/CPZNWzRAb7cuEDjdsAr7I4bO/VuWn48ZeS+1AujrL6p9GF36OVAwhN+2yO/fsx45hSQ+ret
	5Wmv7RsRigovMV2t7cLByQR5v72Z6C082wGDfbn8fmJex/rvLsvMsCcXWTqy7hbJyF73qVRNBkv
	aVS9Z7SailHQ481jp6wnSmGlqpWZBgav+GskO1H6JxjukUsrAW2BVhhmL0i9IlVmTmXniSqd1Fa
	jzB7wk+TVO0VdYNs3EVKANdPAshw==
X-Received: by 2002:a05:600c:1c0f:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48e51f3deddmr194731085e9.21.1778219860332;
        Thu, 07 May 2026 22:57:40 -0700 (PDT)
Received: from House.. ([182.180.27.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5d48fsm10278735e9.14.2026.05.07.22.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:57:39 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Fri,  8 May 2026 10:57:31 +0500
Message-Id: <20260508055731.19784-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_065743_232156_5D8571FF 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
Changes in v2:
- Combined both meson typo fixes into a single patch

 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
