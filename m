Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CC1C34047
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 10:22:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D58924658
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 10:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CkDvGo9a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="PJzH6ke5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D58924658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJbzigDgpTZzl6WhXqPfhCNWXfR+uKyBcC3iyoQXw9U=; b=CkDvGo9aT9+MH6
	APL6E2HfJnySv32ET2OsZv5812RVNhh4ZFrTiGXT7WWuqxJouXQWyCAQXrkKDP8dNUKmlTIoYUSRY
	cb+dmz2el1KOwPM+2+X8wjz9d5nwQ7ohh4HCnWFq1XS+s0FxCcDiVR1OaofaFwpVA1gnW0BY2T4n/
	+P+w+gt+6vPFIguYf7WriKNK8FQcoa0hegvtLdDmMBITH8LSRyBX6UROw5I/LyU9MQqOwTWkmPFbd
	jbadxs8PPKNsJUNL5ePIlo8DN5kEu9q0U1O63JYcdDGoN/2motcfcsctRtafFK7e1NsGHezH+/plm
	GEQXmA4p30dIwq3Coq1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4MUt-0004ei-Us; Wed, 19 Feb 2020 10:22:27 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4MUh-0004UB-CN
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 10:22:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id t23so5867992wmi.1
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 02:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HvFBn5C1ybJ3Jl6cvECGju7iOD2DUuUpqtaZAjKhPo=;
 b=PJzH6ke5ACy+gnyH1H0O/EOH30mw1GGgrDUmk5BBrZ/PUN2lMzraTEUZ80YFeUJy4i
 BT0R8EBhS9ae4DJVQVeEUw4g7yETEV2yMkMheO3s0PZmlK2E8r1Rt8aaMMGH+iMrxZ2+
 6Km7jEfY3B17urqmHlHLEOm/FfWvNqws8o+K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HvFBn5C1ybJ3Jl6cvECGju7iOD2DUuUpqtaZAjKhPo=;
 b=HD6v9OnEFPtQ+BGFEWKvmxCdfdpd7m3SM9QYs6QrEJ/CvrTgqH2fpNvwYuXzXGk4sL
 xg7W3Y8evNP115FjIWvlhn/3DGtuWACp9JWAtD1zozTXJ1ilDOdyCZxL4EkdurJEJJMK
 40AD7ObypPya+JiISiB/Vq0tTpoNNRGTf3HG0SpdID0CYD7FAAACsUmxM69iJ1BT5Zil
 l4b+hQ46c58NmlZQNCrIbuksXNw18zyBAu4IxccB0rgTcKSfTbqr4a0te0he+BZyCp4P
 +DQ9+pGML6N4yiqBqk1Wus8HPjk24zefrChtMPvXfQtTVNoGFU6miFJ2sD9NlaSTtnXO
 hEpQ==
X-Gm-Message-State: APjAAAWXEliiDB+pV0zUNewe0U7QudkE043fbZ7oQFsSegQFvzODRvR9
 Np0eVXN8EuB9j89srP3jlGlMHw==
X-Google-Smtp-Source: APXvYqwwkb8pYBRO6k0sbQ0TfL7rK6fN22BCq0dEtf+gNB0N9I1n8/PTpRHwumXVfIV0/n6efkAHzg==
X-Received: by 2002:a1c:4905:: with SMTP id w5mr4798090wma.129.1582107733246; 
 Wed, 19 Feb 2020 02:22:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/52] drm/meson: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:05 +0100
Message-Id: <20200219102122.1607365-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_022215_487489_E867D157 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

It's right above the drm_dev_put().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b5f5eb7b4bb9..ae94d14ab7bc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -284,7 +284,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	/* Remove early framebuffers (ie. simplefb) */
 	meson_remove_framebuffers();
 
-	drm_mode_config_init(drm);
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		goto free_drm;
 	drm->mode_config.max_width = 3840;
 	drm->mode_config.max_height = 2160;
 	drm->mode_config.funcs = &meson_mode_config_funcs;
@@ -379,7 +381,6 @@ static void meson_drv_unbind(struct device *dev)
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
-	drm_mode_config_cleanup(drm);
 	drm_dev_put(drm);
 }
 
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
