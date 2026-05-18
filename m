Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9CACD4F4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2026 19:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dhleJi1POzJg0Jxxs7jZoKbKUA7hFvJaNF1j+Eju8c=; b=knwHy+M7C4Q3gV
	/s9/K8PbOsy6DgIpM3KHRUt9vkNRewessccC/Sngh5ZqtjrmNBNggfl0EXpj7+KjdeaqZKHd/6g0r
	cWgSykuvdLZgl21trDZHYcfp9PBwiJNNrZZg6H5agsYOYVfn+OqE6VVU6Zxw33C1v+D+FEVNSf2Vy
	AspVW3jPwX3RxMBLLb9uvGHnTywSHETxHwlqRd8CgwVAoL7BtUIJiXgTUzKFGe2xyH9ZcdVGdLEcx
	61Q1dLzZXIA96ZvpqVCNJ9I4Uz8HRgSFq8pq/74TIcWHeE5PBCg+EPAaMfvu0qtcWzTb9Ya78COo5
	giFSFQRk6M/EEtQl8OCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wz-0000000Glc6-39XN;
	Mon, 18 May 2026 19:48:29 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wx-0000000GlXE-1ymk
	for linux-amlogic@lists.infradead.org;
	Mon, 18 May 2026 19:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133704; bh=rUWzeTlhp2CU5KEvkS4D0u4FPJCTowD3dhS+chglbQQ=;
 b=daem7E5YOIGIM/ad1PPsKxwFhmaJYuzqvBsBFMp+0pcXoAjFoOBIcbvy0N083eQZy6GSFCyox
 aZbwiTbZqbvmEmHRnvR5i2cVcNYzi48u1QuK4FCWDabuxQA5oYAQIn00PMOtJQZtiCAg/9ThCMV
 8GTa/scYI5KZgyp0n5fpirCgem+4Y4/TCxXyG/S1dD22zJ4rlOwHQRCX/anQZ9Vmilc/c5WOolI
 MuYOJVjqDQOL1XxmpjYW0+3X8k4V39/XQhMhDtSSvihkPw3PI1TuyVmAXJO4KlxuYr6x8rFR9pl
 mUU/HXWtAc8yFTGwp2E4Dvz3BrrJVJtAe2d6R991DEbg==
X-Forward-Email-ID: 6a0b6d06b74b0ebd362eeee1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 07/13] drm/meson: encoder_hdmi: Report ycbcr_420_allowed from encoder
Date: Mon, 18 May 2026 19:47:35 +0000
Message-ID: <20260518194744.2483580-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124827_601190_8832BEA9 
X-CRM114-Status: UNSURE (   8.18  )
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

The bridge connector report ycbcr_420_allowed support when all bridges
in the chain support ycbcr_420_allowed.

Report ycbcr_420_allowed on the encoder bridge so that the bridge
connector automatically can report correct ycbcr_420_allowed support.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 45104ef35344..484675cb8284 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -354,6 +354,7 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
 	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	meson_encoder_hdmi->bridge.interlace_allowed = true;
+	meson_encoder_hdmi->bridge.ycbcr_420_allowed = true;
 
 	pdev = of_find_device_by_node(remote);
 	of_node_put(remote);
@@ -406,9 +407,6 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 
 	drm_connector_attach_max_bpc_property(meson_encoder_hdmi->connector, 8, 8);
 
-	/* Handle this here until handled by drm_bridge_connector_init() */
-	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
-
 	priv->encoders[MESON_ENC_HDMI] = meson_encoder_hdmi;
 
 	dev_dbg(priv->dev, "HDMI encoder initialized\n");
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
