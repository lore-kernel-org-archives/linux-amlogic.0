Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67E4FF887E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qNKtGpusYsZTHxyNUPDeYFzmugAbEKp637dOwNSyCdY=; b=yLjwCOnG3r5Kz8
	RIIxKPjPsKw/3mAKEUbwZfLn9r1j0ToRW9AwyQ4nw34yP6HO2y/ITRzmppptgdD//ejdSwF9gtzla
	mf/hhwhWY7Bdiypelr20KhxrhBs/SL6DrLie5xR7+LTRLKVwVy4pp93SKE2cKqFjH/KixAvZKu7Fm
	h2jdJEXkAH88WjKCLinTRhY/XSe3NH/8nU9lD8MHnJFIQGCqU1wednewL9molBgMe4GN6fORFWxAu
	GWUDXC9lm74CIdl6p0rxwxJkXY0deEeaMf8h94fWsXnpVwUE0FoVygKJQDewQ0pHrb6o+zGg6Tnz9
	GXGTDXvs/X9whWvssKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6i0-00000003pQm-3E2W;
	Wed, 29 Apr 2026 15:20:16 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6hy-00000003pQP-2Stn
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Apr 2026 15:20:15 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-506a6cf8242so89579481cf.1
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2026 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476012; x=1778080812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LoV5LvB5TeOBPAogjEhvUJRmTuyIhJKQITrSyrp0dE=;
        b=f3sjCSdW2PfgYPY/H9CFcbWD6tdg1IhQzetfUrxdOWhmLGvSy5R6SDLnJA9oulQ1Hn
         +3mcWYNYZfmRXyp55OuEBry6jd0WHEobvQnZKq7Tlp3ywNhJ5OuPNYSlBnvJPojSioHl
         1bP4be66kcnj3s8t7iIFvahGK9tWGO8UTFZARUhprkW/K5l4GSjLOWauphzXw52OJ1Pe
         bPCBKWVcLq1OI0e4/mwJAoJYNyK4ua7Kr8+e+I70s1Jm5xkqIt6Y4HBE91Fn6PvyGJ7K
         SfwrgmQioSrNHyLmsVg79yiDrY539ARjrFw8Dp8KpZt6q9DSIi2jZxac247ulJM8OIQT
         q0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476012; x=1778080812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LoV5LvB5TeOBPAogjEhvUJRmTuyIhJKQITrSyrp0dE=;
        b=A6H403DxcTQ1tCugdmj7THSeF64QyaoBg6VO13k/FEUGy9hap3/QAUSvz0NFo3TJDf
         7frw1KrDluh4zFbu0ZBh7ENRBemOW7aP0pC+/BJZQj4whFBFvgomXm/atMrpLqfR8Svi
         2ayp3DKI3EKpiIGJZvPwBgBr9yjzQhzKSwAEEG/6vzNCPvwXxQ2qKFui2s9svhH7xIjk
         XfFmbZfi0swQb9kd+UbSY6Gt6dfoIW0584bXH8QBssaBnYRKuhdjX9dzOueY3nAJ8JWX
         ErkHME7sXGEqQ6WdrQWFrZUZnmXATezN437xRsEkzSYjMCf9hx1g6/xST6WvQe6c/3+D
         rERw==
X-Forwarded-Encrypted: i=1; AFNElJ+jnhpX5gZkO6uwfbSHCTXaWsTYKnSDzLLb7OauPKn0HBCCZ+xaLKnerU4A+q6Y+rVC6NSR9ifDuGaUw2Zs@lists.infradead.org
X-Gm-Message-State: AOJu0YxkaDvEZaK32nDJxMb1nwBQ6STh0fZWdMz9TauN3fKSDBfnx6Sd
	aSReekf4DAuamz/GVNm1F+ra+TnCDKlSzerVn1rn0JurxVjy1v8bRF9n
X-Gm-Gg: AeBDiesNl/sIXlAzwP1yz+G+7dcyrjYOxjYgANWZS1GOyVQqTCCKkjP7IpuTz5IUFOX
	Tb21bDiW+5y8vzuIanKky6VR/uqUu3vMbDQtri6zZg6qr7vUDSH1R4/SxTXQm1dWB8bwe6cAgRr
	VOXXPVzwHnBLwYiOvDYi+z+zlD2V0j5vBli/wunqwKgDxsbhKlu6hPpdVXjgbriDq2yEyFnsje2
	o0hfd+wJFkMhRXJc7foCbRuF124fKpI1J2CDKw+pdoFFeKqXjlL3ozyulQ+m8s8Ex+FiKIBwWmZ
	UwpTNJnPuy4toyAQ4D2WhfN0R4DysVqnYw6WwOADubRtcglphkPcMQkRil0+GXDw2jOaPegzO+t
	07k8Kc9x8FzearDR2xhp7tjQjugATc7/jSPACKgnCRR+14vf3iSo2T76Oxq7FkJNTGxnP0DVfgK
	11/HkuJnVsmk5HSAib/w/0/E3mjBANvp8oRLIwvDrphwhaLGXR1zVla2Xj2cKWIvNncaRL
X-Received: by 2002:a05:622a:4a89:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5100e101278mr117552321cf.5.1777476012272;
        Wed, 29 Apr 2026 08:20:12 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:84bc:8954:e2b9:d27d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101aeb58desm21712421cf.29.2026.04.29.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:20:11 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Wed, 29 Apr 2026 11:18:58 -0400
Message-Id: <20260429151858.28761-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_082014_628874_EDE106D0 
X-CRM114-Status: UNSURE (   8.95  )
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
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
