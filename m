Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C234C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 08:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCAPz9LQjPucx/rLlcH+ulIy5tmTEggGITzW+pNntY8=; b=iLEka+1kFEHiYG
	TM4/XJuaK33KQI3LOtPbdwAN2ptrwgR0y+BrSUtWN/EfSto0Dfwd3LV/bw7ee9HfX6J+jfADdopuN
	Jcg/GrfIOSp3zJ9xgDRgTNUxZlkkTFX16MzenlaSIyertRFEsbTJ8ADbsTSSlrnVagWTLOZwr+yo5
	Ld1tMrfzDph7QkFJEbKxZlRizj6KC4yEoU7h+CSTh2ENTqYk7srDgXA3ENXVGU3cT6+vWbJN8fy7j
	yrt4XGgYbnCz9X49PD6+jv8HklRGL2JRysxT7cDKOcE+mv6qanjA+7/fba6hL3Ksu8SXzn3mHyAvV
	I4qXQdlK9R02d/BgeyFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TPq-004vst-Oi; Tue, 06 Dec 2022 08:35:02 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TP4-004uwP-Qy
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 08:34:20 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n21so4368937ejb.9
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 00:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcRZDjg3O3q6T3Sk5c09WrJuoI7e4rWvSzYj/Z5H43A=;
        b=4WirXC4jMxNwlMz6xJ0Jso5tI43SM73m6Z9nAG5UcC6cra+AVeRVqQ34JVt6DgZKgV
         c9hIcYbA/AvXNIM6RMGCohkjPKGrjCTBPl9oU3bNjAjQ/umGlKZLpggA155FB0vJk6Ct
         rVcHJ0ILj6BY4HBabqfD7FJVizZkw3Ldgd5e3xJbSInv7XpX/wYG6HZCmV7RsRmxhpIu
         XkwElGUBdmrQGgZBpaz/Yd6JEAvU7fw8grj8BxnZf8UlHql26r0u8WY4z+Mv4oLZ0koR
         xQtcD4jBbiBlgU3ycjVbJlgfX5rdOKY5JE6tHR1X8QYJktlo5P4BCCoaT1FmCpd7wM9l
         2tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcRZDjg3O3q6T3Sk5c09WrJuoI7e4rWvSzYj/Z5H43A=;
        b=eTYHBErxXjILQ/1I1R5jI1mAXmASOmuMGAtwM3YPNq6hK5Ichy4rufaHxJJSFNfPfW
         Mz8VQ2aPR5vXr267QlE1hlN25MG94uThiP0USGdCpCuZ0Buju9d/e27/9srbMeXU4S/1
         mQYreqYF5oUmED16OSiGaq1eT3n3H5R12XS7DA5FVvDkVnW6YuVdDA8zcGZkCfurqZT4
         02eTr8yADssqgijqRdTyCbVxRmE5P1CfDjDgHEoyuB77IcLSSvPM5w0Ka/TziAXLzXZE
         iC8aQ/cWVaAypyT5CL4iQ7tlBl1nVCHYng9zvhbpItdiMdP9ELaad8BopHHXAiNqbQxU
         4jvA==
X-Gm-Message-State: ANoB5pnGAP2RT8koY7CYaIPLeA1V7QJdKO4KVAaPVgqD5D/HQffUL7cB
	Ygaoa1xyKWJK6c4dJcYlyVgG2Q==
X-Google-Smtp-Source: AA0mqf5gb/HnDPmrEu015wzGjESF27vgWXcc+GMbiF/NffvzbIeSzlwquLLovFxqS8JOcTBj9/5vKQ==
X-Received: by 2002:a17:906:164d:b0:7c0:b602:f9a1 with SMTP id n13-20020a170906164d00b007c0b602f9a1mr17569290ejd.88.1670315651166;
        Tue, 06 Dec 2022 00:34:11 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 00:34:10 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:03 +0100
Subject: [PATCH v3 3/3] drm/tiny: ili9486: remove conflicting framebuffers
MIME-Version: 1.0
Message-Id: <20221116-s905x_spi_ili9486-v3-3-59c6b58cbfe3@baylibre.com>
References: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
In-Reply-To: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_003414_923216_D0BEBDE6 
X-CRM114-Status: UNSURE (   8.55  )
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

For platforms using simplefb / efifb, call
drm_aperture_remove_framebuffers() to remove the conflicting
framebuffer.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 14a9e6ad2d15..6fd4d42437fd 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -14,6 +14,7 @@
 
 #include <video/mipi_display.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -238,6 +239,10 @@ static int ili9486_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	ret = drm_aperture_remove_framebuffers(false, &ili9486_driver);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(drm);
 
 	ret = drm_dev_register(drm, 0);

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
