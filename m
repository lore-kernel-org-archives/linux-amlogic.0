Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EA3C44506
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2026 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I2TD1zlgvCsRgLyopG1xIU3a+Ca01V+hNi9SMiFBSW0=; b=F06XqK/Q11Xkc9
	+yoIo9C7bl9A26SkxtgUWAHCev5y8R3ciCYJ6zP5de9LSW4QFoBSfJP3BHn2S05G+scfz6O4hw+E3
	0in1GNPpjjCTbLdSanzu4X0Wzl0tBNlvDmOQJIsasNgOzBbl8bd1WlCjF1rDYvYyjVittKdAJ32TN
	sP2tO0rc9fF6NBs5nWgz5xcaDE5ACR+Jk3/sFjlHoeb6O36FqGedwaXCxLVPB1Lk9E3mhl0voeCvv
	P+EuVfqqwEDzpvSQRRtgzt7THNH2P1nqGWbnmIK4MX71wbzDo13K8ZJZOIhbyNfGGxez7mVwQzEEw
	jmn21Rv8yC0QLswrF1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvmy-00000003eGg-47n2;
	Thu, 09 Jul 2026 20:56:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvmv-00000003eFP-2wAd
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Jul 2026 20:56:06 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c15d47266baso37706266b.3
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jul 2026 13:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783630563; x=1784235363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lieoZSrETeNqfqjggjcg7YjI6XZdYix99GC+0aKI1SE=;
        b=B2A8woM30j/LL1Mm9SEhHGpBHPANsVuf0ksDAk3sv8hfYI1nvVhs0o5EMONYQ6Py5f
         itYUCzIzNK4ZNQ1hM24qm1DNTzmPwkmMC61EZwPzyi+xg6QHz54Bgve3Xtspu3pDmaJn
         n9dMijmbWNexwkwYoauKOoRA2KP5a0lznFDeiuNQLgh+Thh4HTORJyinKcavRzamyBf8
         lrPA3bI/migbmLdW9WKAWedKuZn1KVBOso5idCoDZnwc7utisOjCpAraGjkWtrKdWWyF
         z8k27xSmSM/oVtfAO4p4NkRtoDnyUkrTZQWKfIpbpCJggz3lV3KW7oB/rApz9hV69NP9
         PTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783630563; x=1784235363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lieoZSrETeNqfqjggjcg7YjI6XZdYix99GC+0aKI1SE=;
        b=KQ70LDw3IrgxxRa76lVFeaNUWSVguEXFCPFXf0Ngg+3uFm9qK4S0TQKoGNe+Hf5bpW
         V6EspnDxqU1429jlFBJcQt3eRN3+HNAt58ao5veqGklRkTGYHFoMq7ADZHxWNVjHc18g
         ny8iJml5hYqxzn0HinZP2PjyhsJFHy6vQnS1uBA8qL3esKM/BX51qG9Y0umsBcsmTudc
         3alwBgqcIL4A5uYru/m6YZQYley2HR5X9zlmo8S5xA9c/r5wXR8M6WvrWCOewKFPa6wA
         31GAkpji+CzPAc4TsfF3IXTQBaVb/Ec++dduTVzqWTrTtZ9BiOB9UG4t5ZPUVln7koDa
         jiaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpviZ5X9aDa3NvxMxzZ3K+D+C4weT6pF/8+zEuzMMkUu7G1UFQuEuCLwsn9RsgGsS25r2K8yKCVYRwWfJjv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx99qnyOAYko+9CDpLd5j/eocyDiI2msx9y3KhGuLSeQfG/OvEL
	71rTPvolHjOdFPuHmS6Kma8gKZw1eGKSeSeocIuDp6ZhPEPEHQIs8wCQ
X-Gm-Gg: AfdE7cnSyOZk6O+8af/+iZ7WzAn15H+IfHNF331fnWu73h+Kim2oaLyE25UdLXrrYZa
	ueLZXZo7XxYmpn+iMQgk36586gxic7AHCv39uzTTR+VykL2wfuzagR2WUt2XlCZxjTaMRCG/mOo
	UMi0VG3bOU3GzTFRlyTaLIm2+4mtqVN8GPvYYiJ7ePB9kzsKD8wFDGWGjMXYuGMLQzoY4Hc6hue
	K1r31C3PPK5Nci7JuVn9MF7dnEY1bjS6fRSaveIkuwCZIJBR1MrKlT6HjaO0+AijZMdNuhkgTKL
	xsSQx7mYpZ/yBnBUJyfNTBc+1I4RWJswyEfd60vY1GMHmVlnXtFXbYOAqXe+tyrPJOznv8DL9pT
	tOjfUwNFpdUA3AntIp3K3p6yaurZLbYpfwHUedi9oBb1aqOuF8M0iD/8Ogl6Y83p89QSchn6/XN
	Lcz/INUuPHRfx/fVWBvwqEk+/lr1KJWcKoM9ZwtZJ7dwXZqw==
X-Received: by 2002:a17:907:3e11:b0:c15:f26a:342f with SMTP id a640c23a62f3a-c15f26a5b0bmr128439166b.23.1783630562908;
        Thu, 09 Jul 2026 13:56:02 -0700 (PDT)
Received: from liam.home (233-51-98-95.ftth.glasoperator.nl. [95.98.51.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm369352866b.23.2026.07.09.13.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:56:02 -0700 (PDT)
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liam Zuiderhoek <zuiderhoekl@gmail.com>
Subject: [PATCH] GPU: drm: meson: inline call to drm_simple_encoder_init()
Date: Thu,  9 Jul 2026 22:55:38 +0200
Message-ID: <20260709205538.73157-1-zuiderhoekl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_135605_938217_D6F1C377 
X-CRM114-Status: UNSURE (   9.45  )
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

This commit inlines the function drm_simple_encoder_init for the meson
driver. It replaces the simple encoder init call with drm_encoder_init
and a custom cleanup struct.

Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 55c0601df3c6..0dd3a76ad959 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -44,6 +44,10 @@ struct meson_encoder_hdmi {
 	struct cec_notifier *cec_notifier;
 };
 
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
 #define bridge_to_meson_encoder_hdmi(x) \
 	container_of(x, struct meson_encoder_hdmi, bridge)
 
@@ -407,8 +411,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
