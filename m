Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B9DC54E49
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Feb 2024 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKdJ+IgLf+RG0IEq6nlPXmyDkJZPbTNoAPxEWga1Gh4=; b=PY/7erQu0De6Ux
	wHI4DUu2qUyle4Rn0uDE6hN5ZWXC+8YpePVdDYoxYokjRyid509/n+78TzUH47MgwiY2r/SCLu0sq
	4CnB4vuHilW5fVEUutx3KDgBcV4fxaDZrsdeXBT1ZrbAz6GWYc7pvYSV3DoGO6fffunXRNuFQikKi
	MEkGH+n30y/uZiHfjAj84hb6rlZxXmTM9LSAAXKF5hEbomR5WVVoAP491K/Cg/9JFOuKtWsRZ+ITK
	R5ENvkCtoegu+1BadoX6PdSb2n2X4301h+tg3N2gcA46Bke+z5DMmMRXsD4Tn7Y7C2CClD/2KfVLj
	GGsMYk9ZCAftv1UEpeCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCa-0000000F9Ay-1JHH;
	Sun, 25 Feb 2024 15:14:04 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCV-0000000F97M-0bhC;
	Sun, 25 Feb 2024 15:14:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so3033841a12.1;
        Sun, 25 Feb 2024 07:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708874034; x=1709478834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmS4gDNEWmUck8GHVINRNCbZHkdEW63y1bKjUv7oLPQ=;
        b=DtdIOOfhNzJdZ+dz6Xzm/QTkFV7s7qRVXAEvnmlCAJvtAkfczunncSAxrb8poCTun5
         mBaYdtX4lpjFTwKrptDvspZg5aCJUQmfMnxoqhmPE3FxylCyO9/FRIgNJVs17dSvbV3o
         M17NRJDHfz7h214FMrpQfZDtsGtovGpm87tYbISDKGlwxoNgMfmV2Tj+TDIN9vrw7bU+
         YWsKuG8cDRGYzLp3xSvOR+mVymBE2n2fLxd2joj+Vhv0xdp1XcpIkOfgpPPbJhl8b/JD
         H5zAwF8zpRXBA4lt0ESfV1z5F6vY5/pe+DcQrEqurgP66CgbpeBDgs6T/fR9G2NRy2Kc
         KDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708874034; x=1709478834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmS4gDNEWmUck8GHVINRNCbZHkdEW63y1bKjUv7oLPQ=;
        b=vUyjrB+2zkMy4IVgBpOa4AhdbM0LFpTI1od2YCzJHEuCAQAVHSpN9uXlQTrCB/6sBh
         2pCfNSlN4aESgUEGKdyD1bvczLUCsML4WtFxdHhkYodoJqRbOiRL86pHbFbJGjlp8Dwj
         6uqNyhk8d+TU0HxQNTGZjY72DKDXaWxAV6ovNyCluY8mH5RZJ1X/NfuUMKWoGwfQVZFZ
         a7/syKAn8Uh5Xr9uCsmoAbOsvU2P8n2fdt13TWNsRNJkFyBx9n8i/YqpNVZlTnDOK6dL
         GnNumQypoSJ7xfVY1Sio8ntA8vVD6DGMF6StpR1LCKBZLLljrLRpgplmPEVA2SGNC1Xu
         S2eg==
X-Forwarded-Encrypted: i=1; AJvYcCUFG2tr114psoGBwd2oKOW1fJ2VE521q3dLTOefX5P9tRWEZeUDPLTvIArtdKGd9+34yC/qT2xXl4AwERZl6JD1VhsbDOaxpijCA+6eOCwEZMo=
X-Gm-Message-State: AOJu0Yzv6TY6HHFsPRoBg5LHrNCF0qhewE16zZFbwNBOoYCR37ZJ5vv2
	J1XbP4blgtKPJglaKBxXcLX3rg6WCC/MIBeftp2gqMgSa3c/SKMW
X-Google-Smtp-Source: AGHT+IEkhbI4nG+Vw4+mL6QrL0isP40UUWu3tf2QCFS7NrKvQ48vP8UHbsY+NMoO6aJCF078nPvsqw==
X-Received: by 2002:aa7:c34b:0:b0:565:d125:221d with SMTP id j11-20020aa7c34b000000b00565d125221dmr1109817edr.32.1708874033937;
        Sun, 25 Feb 2024 07:13:53 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-94e3-d600-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:94e3:d600::e63])
        by smtp.googlemail.com with ESMTPSA id f5-20020a50d545000000b005651ae4ac91sm1588450edj.41.2024.02.25.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 07:13:53 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/3] clocksource/drivers/arm_global_timer: Make gt_target_rate unsigned long
Date: Sun, 25 Feb 2024 16:13:34 +0100
Message-ID: <20240225151336.2728533-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
References: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_071359_236842_439B4533 
X-CRM114-Status: GOOD (  11.06  )
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

Change the data type of gt_target_rate to unsigned long as this is what
we get back from clk_get_rate().

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clocksource/arm_global_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 8dd1e46b7176..fb3ffd54c822 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -52,7 +52,8 @@
  */
 static void __iomem *gt_base;
 static struct notifier_block gt_clk_rate_change_nb;
-static u32 gt_psv_new, gt_psv_bck, gt_target_rate;
+static u32 gt_psv_new, gt_psv_bck;
+static unsigned long gt_target_rate;
 static int gt_ppi;
 static struct clock_event_device __percpu *gt_evt;
 
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
