Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AEECA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:16:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87BAE20659
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 09:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0pPAq9c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iSovWQ76"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87BAE20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2meNbOfa5ro3ENj2oKBeC9tOEeznbGKq+tZUNhxFEg=; b=k0pPAq9cdblVeB
	s/4MNbRTP5g7z/r3FlhvQhmU0Z4XDHwjcgPygNs/MZxKnG/t+FNJU3EUv8DmOsrbvJOWdZL9Tf9xO
	HAB4TGPsqrw33DNYhPglwIjxjDFp31cF6vgNf0PYbg7EVTTdabFeWE1Lluh4i1qc0wFMm/VCzfOlf
	tr0m8HBqAC+moUjjyK46J2gvZKQRnbNesUBli7tcPNOKDvCKpnDFCSd1+1Dhfflq8WVnd/z5XB/8D
	dk8WrCM5Hw5m/ZLkgBa2xX12A2ZjVJ2fUE9oMVOXAn+jmn6d+32WwQy6WTbPS9ksxRIJoQcsT1Xp7
	7xWIglLwg54kY+/i0xsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMTnu-0003lA-TB; Mon, 21 Oct 2019 09:16:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMTmV-0002gM-SP
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 09:15:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id s1so4242426wro.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 02:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=iSovWQ76UjmCftKFJbXaN1S9tgVirSzR2wf54seLBeUq05Tdptc99TIkl8UHIJIsTx
 E8j5wU7SI7JpaIfHgkDc2q1gBaPi/kP7Fy8iYCtJ8nbcrS0829bNjGX8EF3sXYB6+vdy
 L9Owc5kpCkH+ErjcLT5IylGzsulI2ChbXupb/9l6l/PPfXrUBR5q/vjSIVnOkIrSy0AJ
 +8CBf0FibOMnKUSYOX+MMZS9s/xFw5+qvtakq10Ze3DD3EbXItoa/hjCauhc5xgBW9IM
 XETQMakM662m7yaIlGownhIh0YZHu3fUEU2+wdE6jzgiRNU+VZlZDJac2r3cXSduTD8V
 BXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=uTddAdkLkcBpmbleglWokeRtuQ8ZZ9D8vVg7JuNO0Zpug4QzpwRT1KWWdFI6BtkO6b
 bVRJg6YmURwMLu0CQag7iqRd4BJYHEkmr2fdEaJo45YyyIB1FfRLLtNqI3z0bi13Dqa2
 E8fpq5AcavxpUmxD1GyRzHHFJwl+eYDC1HQR2qsFensp2bKVL6WW6MgRM5E18Mleieaa
 OIRXlkRt4kPrVz2uZNlSbiY24GVivibCj0NoEKm9mCK+jnpL8BW/XITZogIUkZ/QFMpG
 rnilYfFacK3Npp0xrAVVTnxK0Kr4KTZyyVdA9cLUQ9AQSglSY0Zu9LnnWs3uX25EdqrU
 68tA==
X-Gm-Message-State: APjAAAUMTM+H8yTCI3AyRCIBK94ULWWveYjUYBlM+qj7RmpEqPd/S5wF
 bOFj0QiJCcgxqy4d25A5NM4R3Q==
X-Google-Smtp-Source: APXvYqwv4vYzn5AU7M8iqjKunnXBBpWfvjgMY6voo0owV+4UMwcjdHKEx+EizXbR5EU9XWVYvymV4g==
X-Received: by 2002:adf:e302:: with SMTP id b2mr17729852wrj.298.1571649314188; 
 Mon, 21 Oct 2019 02:15:14 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/meson: store the framebuffer width for plane commit
Date: Mon, 21 Oct 2019 11:15:03 +0200
Message-Id: <20191021091509.3864-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_021515_912594_E3B3C2AC 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Also store the framebuffer width in the private common struct
to be used by the AFBC decoder module driver when committing the AFBC
plane.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.h   | 1 +
 drivers/gpu/drm/meson/meson_plane.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 820d07bdd42a..3287282450a9 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -52,6 +52,7 @@ struct meson_drm {
 		uint32_t osd1_addr;
 		uint32_t osd1_stride;
 		uint32_t osd1_height;
+		uint32_t osd1_width;
 		uint32_t osd_sc_ctrl0;
 		uint32_t osd_sc_i_wh_m1;
 		uint32_t osd_sc_o_h_start_end;
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index ed543227b00d..5e798c276037 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -305,6 +305,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	priv->viu.osd1_addr = gem->paddr;
 	priv->viu.osd1_stride = fb->pitches[0];
 	priv->viu.osd1_height = fb->height;
+	priv->viu.osd1_width = fb->width;
 
 	if (!meson_plane->enabled) {
 		/* Reset OSD1 before enabling it on GXL+ SoCs */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
