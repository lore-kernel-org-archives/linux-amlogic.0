Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226A8C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 May 2022 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hyYsyaNCBQCTtn548JZZcfMkjy3F1HmSpstxBnKLAAo=; b=YIM5XCeGs/VBIZ
	YFvnQ79VOUbSBPkUrmBOhUsIs+01wWRjtPn6m+kqw/2rBnfB4unqTzIc2sTig+ZMcP3s7IvSduGiw
	tpuRebmrq2y4GQ31F7YpfNfH7MnYoVrIrF/2x/04R6j5Jt2B/6JJA8b2SCf4bHdYjcKZ8RHxHCA0P
	Kl2ArnHrv9X/GQMxla3UCEKT0pVFJfQrxrj9FB2sBx5Wipvx1183zUxEa6HPj3DwLpnalURfaPSuP
	xRj2+WoacPMiahsEgQ062GfIPEXsn9U9+ydGSUFi5V/j5MtUDAUoSeWygXrDRkUODzSjpAD+njLnb
	m4ZYMDmS97GKU0BYSAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Bp-00BLt7-5P; Tue, 31 May 2022 14:49:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw3Bj-00BLrV-Ig; Tue, 31 May 2022 14:49:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id h1so3831055plf.11;
        Tue, 31 May 2022 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
        b=cV7Mz+wAIW+PUEe0iYCSMFq+uwxZ91W/LWcYZNEYSILqBIgtLaEyH4um2dlf1uimil
         Hi01/2VYvnNhg5DSMEI7jjDXglilceVlkoiPmjoJ7T37eqTTua6KsZfxs7YJoqo9iVYF
         ZBze3AfYyWmvNzLR0j+MK6mh8wov6wK65LrFma3m1bAzxLgSpHMraTJBX2Bx14ExdN3Q
         p8kWMI3acpRst921i2EBqp2XK8bfYwjbpd4dNcxzRkq0pyMxVqQoxW3Et3XaRFHK9XGT
         2OCdR5DusT0ZqUmE3AGkp7ntPwr7BoFNaUddygiHIKy4/LvF4KgYPvWivit4UnnS58j3
         OWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NAOtSJQ0e7lMXAVSUZPZ1qHrCN9pnSWlg6iMnewBSfg=;
        b=6vpcDmc2Dc3/5DkY8l2HT+WSubmvOLtuszWEJYcdwGWUzBLPjbUqoRC/NTiofyXGN6
         OTW+JvnzXf9bO+hIET8yDaK9X/s9MPq+X1F05/0WpIe47/0YwjrL+sVriVJjlXUD3Y++
         QKEp0XEMG5JVqBp6luzWEPEswRQYc1hNRye90jQCT2mLNZzVWsqJTkngnIZc3MRp0lA3
         Y2gWnfFHL5mcAMCbOhXY1iXqujSUPUfmOvVzh3Ico+BiT5pt2Hyl58+Op2WaE2nAbGld
         TwNDgI9iTs5I2BnzndGIIBkbQu6C77aDbxRxQFML59x0EtXDw7Y6Ix37pD0KmYg/u87X
         Ol1w==
X-Gm-Message-State: AOAM533/TifQ/hhRgZgZOyK0UXhQt+jZoFxPAs4Tu8KKIuqiAKBdKRA1
	W9A6Sib1TlCB8BllGYD1Wp0=
X-Google-Smtp-Source: ABdhPJwp7L4klTmbrkke0YpYCLWkj2Vr73IGnj3X69pgKGLK4gcgENFTfpGqAgXHRx3n2vVZJlo34g==
X-Received: by 2002:a17:902:e80c:b0:163:d222:60b7 with SMTP id u12-20020a170902e80c00b00163d22260b7mr12131714plg.54.1654008578559;
        Tue, 31 May 2022 07:49:38 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id d3-20020a17090a8d8300b001e2d4ef6160sm2007215pjo.27.2022.05.31.07.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 07:49:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH 1/2] drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
Date: Tue, 31 May 2022 18:48:15 +0400
Message-Id: <20220531144818.26943-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_074939_684563_A6FCDF8F 
X-CRM114-Status: UNSURE (   9.98  )
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

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 318ba02cd8a8 ("drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index fd8db97ba8ba..8110a6e39320 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -238,6 +238,7 @@ int meson_encoder_cvbs_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_cvbs->next_bridge) {
 		dev_err(priv->dev, "Failed to find CVBS Connector bridge\n");
 		return -EPROBE_DEFER;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
