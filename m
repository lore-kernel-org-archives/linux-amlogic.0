Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33927C55822
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Aug 2026 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shIG3oXhVhGqmY58q+LtMdKbP/7cCRTrvBZnjl3opLk=; b=W3d3gcyGSwANWh
	WQoJg7L97a4phT/IJTxpPEl1Z7wIWr8JZoXffu61s2OSh2k9zznLMzyYqz+VhurbFujuw3y8KOftI
	89U10cMlb4lw4EXhHsYiFsX2d/h5ahlfs+Te0/CfHuTeIEuulbaEc3kd9UlDmyRgDXAnR1w/zdA1X
	7AUemP5OffdLDeThEngpGci5sBgHyuZh09Ve/9qRdFliAwlOhEMJD9gv1Y2tiNpbPMLP9hvF6kx6/
	SCaYszS1po8zyQEtE/gxNO0DFnDTPG75UbLi2bYPCrDJ8TOZg16mJmun/Vvcl3Imtv426LZzOog3+
	RYfUntjNeLscI2lAxjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGkf-00000002AXJ-1op7;
	Tue, 04 Aug 2026 15:08:21 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGkc-00000002AWC-2Npl
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Aug 2026 15:08:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8485ef63b68so5260717b3a.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Aug 2026 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785856097; x=1786460897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=;
        b=ZU1BPmr2Us2514IYnDBJ4K+dfYj3vXFa/5GF3xfsext7xLeHMIWKkL4/2WwKZqgJM5
         47dmW4MgAO1spkfIRQHmTG5vQ2fA5mnzXfywKeHOlrhHb1fGYehuEidum6StN4bQBvHK
         t1Bisvuxjn1twxtSs65IpOvtj0AYKHmjWrsGZX/VMP/o5hJtx0EsH/Qj1EfcVhdJESp+
         sh3sL+NTDpdh23HdhuPN0M3wEA9NUD5FYYmG0XtTcKfxHVwfGOQSI3/+0e46dchaN6+x
         EzT6HKrfli0dRbD8xk4lYCIiFfs1EDcFmQreykA8uNuOS+Rzn+Tt7MlCXpVff5MPchpU
         b9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856097; x=1786460897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=;
        b=mCKVM4CuxCbiUSIBespWXS9ZdFbsn7lj6Kz7eidrTgEDXSL3XUa0lhHTgTjzJJXMgU
         Km7U6cMKeB0Zk/3mAjmQdwrg+wzeVobWNlcMoJ9OQ5wwmrgLKPaEkNhoj317V3XWK2DK
         cIEVckiiceVLDFc25/o30oYmSm7IsHkeih1Bs+PjPqTiJ9xu8g7tBywrRVTzhArFfDM1
         stUbwGhRPHR9/00DhobEabjPFrqRe2sIjar3YludNDr2RSKidbowVQY3tQ7vv0vjkbUQ
         ESXzjAafeP1vXmrDMgUoRyvRzh/zWfeR4b8nnxR3Gw3BKjz7qKSWsvnSzMn4u89JuVm9
         Pqhw==
X-Forwarded-Encrypted: i=1; AHgh+RogWy4OTaXT3zIsnZygPMJkZuGeCRTExxSiiqhoHHfSM3yggRbaMjYcm52LS0LjXtLfyuY0P+fMM5XLn34t@lists.infradead.org
X-Gm-Message-State: AOJu0YxKMo1KRtWZrinHDO8vxaBvSi5+xdN8M2+lnfaD4pXv3wCJ71E9
	7lPXH0U6EEyJBJYwIbXCBSpk6sPxKSWkbj3kbMmEp5oE94sWkv22x5I=
X-Gm-Gg: AR+sD105cRKNjXGOWxhS8ghmNxxzopA3TV10a8UmxDn+TGYgzODzT35GyO8r6gQQw/E
	GFvWBPc5QOMBfmseK9HIKxpeFQbitnUtc/nu3XbVZtDDuxyLcJV4QnzWrlbfv58utnzNKW84mwC
	wEUVwRZkbHNV83FtA0kMij093C7CzeJIewtAK3G54qwLsRZV6PwDI0K7ssOz7fLf7xBoCoVp8HN
	mN9XTBiH+N0h7o4dBACEmmKJ8wcplPT85/TElrVl4wabQQ7DgX8r8J7CZaPDm5NUMa7QiszBqcH
	sT0vvBcLgWcgSIO8vcg7A92FZNNHTaJ72PX39ix0cF2aQSNTwiqRde7qIdpAp3sKufNlnYm8BDp
	++ALzuvvzjwKBt++2YL8lOIoQkQ87WFsTvbwjz9zzmrN4lds0ZfyoWPzT7skZ6wBWsoMLitYtRZ
	9KCyoyREFdket/v1+IsEzKogx7Z3G+6rR27EZrSDI9+kfgmBiVnhwwx/JivyBIlURwtQ6BD8f2f
	kPAhcBpbkTkfso6zs+SQ3gf6u87Ljd9G4FuDG8ny1jqY57slwsksBGIZQBspzcedNV+5uzxTcyx
	u1coOT/UHUIhp+2N1+qaYvM=
X-Received: by 2002:a05:6a00:ad1:b0:845:4126:222b with SMTP id d2e1a72fcca58-84ee47d8768mr14159742b3a.28.1785856096851;
        Tue, 04 Aug 2026 08:08:16 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc41ca4dsm5420587b3a.52.2026.08.04.08.08.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 08:08:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] drm/meson: clean up KMS polling on register failure
Date: Wed,  5 Aug 2026 00:08:02 +0900
Message-ID: <20260804150802.45262-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260524160657.17802-1-mhun512@gmail.com>
References: <20260524160657.17802-1-mhun512@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_080818_630271_BC513277 
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

meson_drv_bind_master() starts the KMS polling helper before registering
the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
DRM device without stopping the polling helper.

Call drm_kms_helper_poll_fini() on that failure path before freeing the
IRQ.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Avoid the unused uninstall_irq label reported by the kernel test robot.
- Link to v1: https://lore.kernel.org/r/20260524160657.17802-1-mhun512@gmail.com

 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16..bcc36f2cdc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -351,8 +351,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	platform_set_drvdata(pdev, priv);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret)
+	if (ret) {
+		drm_kms_helper_poll_fini(drm);
 		goto uninstall_irq;
+	}
 
 	drm_client_setup(drm, NULL);
 
-- 
2.47.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
