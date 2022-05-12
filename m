Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DCCC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IUwM2d7Z5t+RWX14lbG5BYH4ZSdpsynBdntOKo+iHys=; b=cWhY85nZV0GtI2
	KFfNuzrm/Y+9Tsc/lLTnb5YHmljQLY6WvD8cxXimRGhutBrU2aWO5nMpiwlBJDtmCNgxYtLDW1bKm
	ggB9i2OM0QbwLCLzxDnHrZfwYabFTgVpHbGuRkMyr1TYveIoYaAoRB/4iENAT+rYCzj+1Jm4aL4iP
	67KAzyBTsPZ+CVW7S3bgoXxcNl4xSw6xNoa+SE3ket26rlPJ62waMSO3kyU8vQNtg4Gqy5fVwSvD/
	UvPq5f4KBVKVey6Fwj3F4fBJft6hRzWk4q46XexF6zJZtTGoa18l5iqeGs2fg0zeSJIH6vBX1pTbJ
	ICPT5sRwfMslZeQ+UO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np50j-00B8gm-Jj; Thu, 12 May 2022 09:21:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np50g-00B8fb-Pk; Thu, 12 May 2022 09:21:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id i1so4316274plg.7;
 Thu, 12 May 2022 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=trstv+pRRGZWnVg0+iN5UCLh2DdH9t4IV2sdILAbWVo=;
 b=KDQhOyYHM/ghyxsyYX2XznPNtfLuxQL/rD+vsMnBO34aYxBsr9ceM9eDUWXAMLJM1g
 9qJpLzk42GzZaBZbcgWUjy6LOebVHmF9bqI7MPkd/10lA1bpzvrEX45t8Y33GLQnbz1E
 4xjhKznHXiYyv4C74c+8dkaHPGwnM2Xr5nFisIkCTmppBiVXORiPXCaEqfAxG9UA6jiV
 iL9Ahrh/AabO+F2dHjvO1YsOn69pZxSPvrDoiSdzFVMIhkAU5/Q6mldf5ISJuihXbdN9
 8ApW3DsCjYYcUVvQ+vqQFrvDS6DEiNcNP1oYqHta/uiDkShGesbOpsU+nrVUkSoMHASh
 qtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=trstv+pRRGZWnVg0+iN5UCLh2DdH9t4IV2sdILAbWVo=;
 b=5gS+hMgjIxVmWaD2Ou2h5Llv0hPLh+AX/xvDh1oQqHtb7ewFy3ZDBCXWNHYwzPJbyR
 d7QYpZ2M47CjlQAghxVH5gUzGTlqlkGPH2bzs2A33roY6ZWW6wfaReshlHEYelErgbPf
 LRTKdkbd9vagg9IDd50CdfG++Q6lA8F4yWYleXLH4Sj8M5ji1TUuvs7gymeSfGBztIAq
 jDZ6Gvyof6g1E6IvGzhrxbwBysc55hlABk6bdfu3KPxUxgafZaTJeK06drEGcN4Ny7QM
 HIkvjY9Kvpt1MiQ6fejZZt5eA128ZalnEEBgOnF6Ia1jj0SXV+v6HnPOO8RXUalm0apy
 xeKQ==
X-Gm-Message-State: AOAM530V6u4kgHg/hbCpV2rn6VW8m8UGmA3qiO2JrBW0/ZBjrZ5lZpnD
 LLZ9OknWROXB5VswnNnDMzVR/E9YcWSDG7XhliU=
X-Google-Smtp-Source: ABdhPJzZwN6t9mhBq0vhDH0XiM6VYuy8GmDZ2wYMYQ05gapLnZQ2or//JNGRUEmvLf3VxVplWrAO8w==
X-Received: by 2002:a17:90b:1d82:b0:1dc:ba02:52a0 with SMTP id
 pf2-20020a17090b1d8200b001dcba0252a0mr9773736pjb.246.1652347284037; 
 Thu, 12 May 2022 02:21:24 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 gj9-20020a17090b108900b001cd4989fedfsm1336874pjb.43.2022.05.12.02.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 02:21:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Date: Thu, 12 May 2022 13:21:13 +0400
Message-Id: <20220512092114.38426-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_022126_892852_D6E3F321 
X-CRM114-Status: GOOD (  12.58  )
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

of_find_device_by_node() takes a reference to the embedded struct device,
we should use put_device() to release it when not need anymore.
Add missing put_device() in error path to avoid refcount leak.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..de87f02cd388 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
 
 		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
-		if (!notifier)
+		if (!notifier) {
+			put_device(&pdev->dev);
 			return -ENOMEM;
+		}
 
 		meson_encoder_hdmi->cec_notifier = notifier;
 	}
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
