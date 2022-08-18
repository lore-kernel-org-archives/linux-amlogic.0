Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF96C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9k8i2jUCOM0XgAIhOeYJ1bwuHreANdhfpX79bBrTSc=; b=st4NNH6+L5g4tw
	17scHaaLHfP3ooqcSLlZwzu7yap02LevFjU7nh7O87eo2GiSQmIk3nOgXxV7efuaGpuCX/PpQ1U/r
	5xdxte34+pmgaaHNp2F/255oI5Sztj8335VbhZQ7sdwwxnvDLPEJyBPEt2eKysu+Ggv6jZpaF0JxC
	vG954uUqAaFbqWs8vk/sB3AaReDyZacH7hnjYb3bEGMmzOn1/oa1yci7iOa4Io8FCoYx40OVzIJd9
	zBc6WFesKLEnn8axiTDIfiyTkeo403IYdlZ69iP2xUcFobxw/EkAhKZrIR2FfEsVqm0z8Ekndq8e2
	UJDzqBu0ta0qfOC7r1Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZKX-00HIAG-KA; Thu, 18 Aug 2022 06:48:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZKL-00HI0R-KI
	for linux-amlogic@lists.infradead.org; Thu, 18 Aug 2022 06:48:27 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE1C840AFC
	for <linux-amlogic@lists.infradead.org>; Thu, 18 Aug 2022 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660805301;
	bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=MmnEediGta8ktbU2v4W4h4XPEg5+u9OlqmamFDg57wAR+s91yYxU9+63eMktL3BrW
	 zk0RbZwKZJgqY60XVmGPZaAV88l8NVGK7Thw5ki173A+UMWh56yk79F7Y8PpAMA9Fr
	 tDVyGWo6OpS3PJKyEpIqn6I67YmdY5QfXtiaZdzWEYHdamu9jaINDdrWbfCBoZRw3L
	 lEAejPPnuz99BDSTCciZhk2sNPSmCUI5z1n2BNSoUAnMBHam6rNTJU3iK3k7QAYg7c
	 69pJUN9ZbnmS87xvsN4dV1xCl+0xRTby+hqcg0QPDx1E78CXQtoC4JiUwoRrDhOLdM
	 UOFr7VMh+o3RQ==
Received: by mail-ed1-f71.google.com with SMTP id y16-20020a056402359000b0043db5186943so399566edc.3
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Aug 2022 23:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QSepvCE+QvU8qyq2q6n9pYjju+rfRtTHn1zPijhNAtQ=;
        b=YhNHeymyub1egvEHp+tQOyJCxdWEwTheI7gO+oYt7AHPZFwqm9ANm2CRsmOZz3emHX
         UWvJynucRy26QVuqI78G+bIcRGVCbsUbJvsrfiSZZGL7V0q1tsSPX2gGzRn+u1D+eYvK
         k7vWF7BytnREw1aAvoPX/DN4n6cQCtQgLPNvPEkDiQbWLflRIgZdRMdsH2jP9QM8bMXg
         Uz5RYIAqyplBFk+QyTN9lVqsi10Q6Bmu4FLbHS9LVgRLyhdoJCqVCSRSW5VjTpbBHTgS
         3DQKxRbfFXYeYZtVmYF1Vfda9v3yu+R8XuA5jaOvy9ZLWeq8hiFKRjTK2UXB43WRhWtp
         XIxA==
X-Gm-Message-State: ACgBeo0opCoaStaVKMrmSWhRXQc8IB1aUfiy75QuGAxFloQ4i5qyJ5Y3
	Q89fEj/PUZmADMZd3ZPPSX6YQoI8KjMI+OeagYQG5gwk4/Z6MvzqAYs9voT2bclOtQqALp4NACT
	WDU/fOMB134q52Wy8mUX//3c+VsiWk51LvxeaBjS3f5Fn0oQh
X-Received: by 2002:a17:907:2c48:b0:730:cdc9:2c0b with SMTP id hf8-20020a1709072c4800b00730cdc92c0bmr1021422ejc.482.1660805299877;
        Wed, 17 Aug 2022 23:48:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Dbe0SHDmhO81TnTzDYpNAjxnqwXxvYkMUgdOn4rij2A9rkDj6mEyDGejb4El1ju108l/O+A==
X-Received: by 2002:a17:907:2c48:b0:730:cdc9:2c0b with SMTP id hf8-20020a1709072c4800b00730cdc92c0bmr1021416ejc.482.1660805299753;
        Wed, 17 Aug 2022 23:48:19 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id g20-20020a170906539400b0073c14e7589esm59157ejo.161.2022.08.17.23.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:48:19 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH v2] media: meson: vdec: Add MODULE_FIRMWARE macro
Date: Thu, 18 Aug 2022 08:48:10 +0200
Message-Id: <20220818064810.17856-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817140539.150013-1-juerg.haefliger@canonical.com>
References: <20220817140539.150013-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_234825_919146_587C2E9E 
X-CRM114-Status: UNSURE (   8.44  )
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

The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
provide that information via modinfo.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

---
v2:
  - Drop duplicates
  - Add Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/staging/media/meson/vdec/vdec_platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers/staging/media/meson/vdec/vdec_platform.c
index 88c9d72e1c83..70c9fd7c8bc5 100644
--- a/drivers/staging/media/meson/vdec/vdec_platform.c
+++ b/drivers/staging/media/meson/vdec/vdec_platform.c
@@ -280,3 +280,12 @@ const struct vdec_platform vdec_platform_sm1 = {
 	.num_formats = ARRAY_SIZE(vdec_formats_sm1),
 	.revision = VDEC_REVISION_SM1,
 };
+
+MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
+MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
+MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
+MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
+MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin");
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
