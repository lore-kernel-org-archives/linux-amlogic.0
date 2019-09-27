Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCC2C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E144F20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nk7gX5fV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oi7neAwW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E144F20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=evTaCI++0bAa3Lbhzf1akO0zr7QjLYdxsE3PX/G9Ue8=; b=Nk7gX5fVkeCBd2Von1CiyBE4HI
	/accKoYLwR57QX9TW0E4J7mwLrdqEng2KwV1PN8+1Tuyy/svEq3Feyoje3P9bcgX93nT5MBHrRwtv
	/RaRF/DCEg/GLYp7Qpkojofp07r+4y0aqihwoGUgPSXqNN0NH7R6TKuvXlWggsWZUkFP3fpot8OLc
	93zxr17ZH2TAFzXju/XXuxYaNnCtUCaE+8VGeF9e77+K2jxbglF0F0H7f7O2Zy9D7qLmqVAiCZaIZ
	U2KjrVJfohJRSGNRA2i9bPurtBy3vkK8LXWod1qzgBzb9LwlqOvluRuyhOwPAwO9GZ7pvjAfbYKuO
	+2Sfh7yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDphv-0005p5-FF; Fri, 27 Sep 2019 12:50:47 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDpfH-0001pr-7r
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 12:48:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id f22so6042623wmc.2
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 05:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HzQhDkqVyohi8147rI3+BgZwRO47r6m1rOvI8gEcCVQ=;
 b=oi7neAwW2LPL3XABbjq079ydlG5AqDgyurTggZMicVjKIV5UMxxiyLM+baxNYU7LMn
 KX0awqzp3ut3v6fG74urUYMNC7Us0TNh9cFPafo8aX6keUN84SNN8/13CiS2mOaNYVXW
 51GjVuPtTereISnJig7mP/IpoNpIQPIiC9dIHozWqZj8wKaFul+FMr0+2WVtMfP9Pit0
 iwshl1qVi1DzPPokQOFhT608amsRwajCmDibnhxZ2uNGfJGVClCLRHl2oTzSMrGuU6BL
 VMNsZeZHCwXRvn8wMc3M95Xc8gy4zBAopdQdfa29TD3KYqD7aefu+UKji02tx/K8JHiL
 3p0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HzQhDkqVyohi8147rI3+BgZwRO47r6m1rOvI8gEcCVQ=;
 b=iy2So0dpoE5xXpu6zhN3w1j4DSsR7nkTWq4GBKgRI23Ez+MDyjdvu89NB6/N+0DVmP
 peaLE4sk/x76sHFAjkxQBUPSch387Vsgin4Qj1yGzGJrLt70KUaCjHtr1bJkzF0DVPOK
 xv1hnaLBCf8hkZqF7rqphigb00N6+IhNPSK4rSGoQIQRE2MdC//PnvsrsKJAK6M+tLch
 0ncitmKQI1qYW+zN2ijf5m0OwjNPedk7tvVOrElB4srUphJMPPuIVS3uwuKfHXEHFIG3
 7FpigjJ7/gk2MG4poilfthib9rFmcGgQMxgNywv+ry/PKYdYXb0GTbVLD8ytLyY/ZGS6
 poeA==
X-Gm-Message-State: APjAAAWVb6oJ5PLJXe/N6fX4Q4M809yMPlT+Fb3zwTe0w6/V+50FI6NL
 bG0MDqP3S73HlSz/K27uFNianQ==
X-Google-Smtp-Source: APXvYqy/1/MJyl2yq0JNJ1lJAbS7sXpETew3r6arHgnR/Bo+YJC+IXAdeOl3m8wFVO8i1kW5vfviIg==
X-Received: by 2002:a1c:6508:: with SMTP id z8mr7418209wmb.93.1569588481463;
 Fri, 27 Sep 2019 05:48:01 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm2985564wrv.30.2019.09.27.05.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 05:48:00 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v5 7/7] MAINTAINERS: add entry for Amlogic Thermal driver
Date: Fri, 27 Sep 2019 14:47:50 +0200
Message-Id: <20190927124750.12467-10-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927124750.12467-1-glaroque@baylibre.com>
References: <20190927124750.12467-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_054803_421906_583D675F 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add myself as maintainer for Amlogic Thermal driver.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 390c3194ee93..bdc30d740342 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15932,6 +15932,15 @@ F:	Documentation/driver-api/thermal/cpu-cooling-api.rst
 F:	drivers/thermal/cpu_cooling.c
 F:	include/linux/cpu_cooling.h
 
+THERMAL DRIVER FOR AMLOGIC SOCS
+M:	Guillaume La Roque <glaroque@baylibre.com>
+L:	linux-pm@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+W:	http://linux-meson.com/
+S:	Supported
+F:	drivers/thermal/amlogic_thermal.c
+F:	Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+
 THINKPAD ACPI EXTRAS DRIVER
 M:	Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
 L:	ibm-acpi-devel@lists.sourceforge.net
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
