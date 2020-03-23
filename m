Return-Path: <SRS0=Lisw=5I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFD0C54FCF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2020 14:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50BD20753
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2020 14:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLG9xIHI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NqNc9XHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50BD20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFg24mh+B0dA/OlbRcKlgw8ExVtVo+RG+krqKEb4I5s=; b=GLG9xIHIxskm41
	r7Df6kJ/4NQWxzXKsmWqDGSCfL+622q6peZVsjmYpn8UwoaNPRspPf+5k5AFj7e3WfysDc6aazi8+
	QOk+CKMvnEO4EkmTH5VAcoUfL6qERfZcNkSjSAYcOPlGUf7ZE6hdQpYUulOW5/I8eggfEQfeTiaBW
	hVaM+RyhHv/1J8XpywV0xBu98DKoT9sKSpIGoKwkUR0Xmn0M84MUOTw6WYyvddxUSf157LDa0t4AK
	hOxZHxykzf7xdb5ufpUaZAvdISrH5I9UDl4/8np50cwcs7PShp0BqO7VHUQtCvlk0JelRZiPFADhl
	DapGG5/X3IvOHMANZ9Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGOPq-00030e-LF; Mon, 23 Mar 2020 14:50:58 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGOPf-0002gg-8U
 for linux-amlogic@lists.infradead.org; Mon, 23 Mar 2020 14:50:48 +0000
Received: by mail-wm1-x344.google.com with SMTP id 6so14959477wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2020 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i34UbOzUs3REVmAk537DyHJucnx+pUblYHjMYnRBadQ=;
 b=NqNc9XHoIQZ8V6qZY8+MeP1dG+j4Hvxyvf7S0NYS9BnpjAt4yansdlyvBEq9+ewTMe
 f33PqnD7Kr8gQe5qqf8ONzbgvxl8LDkaapE+XnTdergoGgYcJVxD0Ct0dm7jFYJrQzii
 bhOUKF6S5AhgZW6Oyr2xxHMsoXyrn4vseWNFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i34UbOzUs3REVmAk537DyHJucnx+pUblYHjMYnRBadQ=;
 b=Mx7JTDkspKycaVMj3NA4gHoN7H1VV/JK6DwgYQ5qnsGuIfAD3rjelNkuxx8f19YAhT
 MEqbH3nwcdZV+fgFVgnypYIiRZd0rE7cr22JPeP1rBAJczjDlmP6G/oHcVwEmK1KRVD8
 MWXAy0PVnV/Qyfa7im0C7xVuvek0JTHtQY3W3nMujlf+76pLHkRmta5Ef79pCvcrz6zQ
 QRuNhjWNA3Pi91yEXYj8XnP9/nwAqqWDzezuDwnP1g2xfwh/rIT9L8rRye2W1n3vWAtx
 +uB0Fl774hK3dyFO+x1DrR+iJjlm29uoHJGy6xuCKvW8LBUqFTgLi9Pwi1XJ3kTI+K0H
 s8MQ==
X-Gm-Message-State: ANhLgQ0cE1wKMSqingq+uOaEqP6T9VDYrRAt1ldP4NaMOZjivzYcON35
 oOZhwPFzhjbJbKERF5X9hX7w+g==
X-Google-Smtp-Source: ADFU+vvry3T0NfLoW2WN162JPNdEkpQ0wBkkc79L4miLaCxGPcNEj2L8c1iiwD3cwBqU4s7IAUyDAg==
X-Received: by 2002:a1c:a9cf:: with SMTP id
 s198mr26541733wme.115.1584975045317; 
 Mon, 23 Mar 2020 07:50:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/51] drm/meson: Drop explicit drm_mode_config_cleanup call
Date: Mon, 23 Mar 2020 15:49:33 +0100
Message-Id: <20200323144950.3018436-35-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_075047_369167_6E024320 
X-CRM114-Status: GOOD (  12.79  )
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-amlogic@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

It's right above the drm_dev_put().

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
anything hanging off that. Not the only one unfortunately.

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> (v2)
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index b5f5eb7b4bb9..6f29fab79952 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -284,7 +284,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	/* Remove early framebuffers (ie. simplefb) */
 	meson_remove_framebuffers();
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
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
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
