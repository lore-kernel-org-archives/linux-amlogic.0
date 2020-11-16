Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E2BC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 20:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B87C120702
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 20:08:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sjGnV87k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u258Of84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B87C120702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cn/7wrzG5if3p7WTbaJua+Z/v1qgO+uBmGiEFD0WF/E=; b=sjGnV87kodtL4Y844y8WB1qL6
	CFpeNvdVlWeHcDFbWW9on4ngtszfnyKzHimtOCN/LqGLHTFauoIGhLYgOoVWmV/aNlIQ0zT1/9raW
	FwU3MnkLEpW2hY8ukrl2B4JVsWaanYV87p3hUsvcZZ5ey5LdBb9Q1XP6gXTyZ/Kz45jyHAeyuqhhd
	0KVT2Cr6Lq26J9Pb8djPvgtl/3O3FKFWRqWob+CvqlJWAZGaJtqdZKDtpOUbMw8WGyfLUR0Egwl94
	yO93hoX0LkItUK+dczECEA1nBfDo2trJDygUHwnTbVPdUzLBjyVOeIW1ASsYmrer6kW6HtyDrdh3l
	MY0J0o0XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kekno-0003J9-7T; Mon, 16 Nov 2020 20:08:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keknQ-00039G-Dx; Mon, 16 Nov 2020 20:08:17 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B14EF2222E;
 Mon, 16 Nov 2020 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605557295;
 bh=Je+1DhnpdkGhc6qYf9RxDbFGJo+EGiP/trGm8cjM7Qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u258Of84CXLzDjjJ8TZF4+UpWCR/a9YF5nSqN0JE40tQfB+Um/IE+9nWwf7odOY8U
 ZyaQ7enP+07vE0fTQrvTMCd7fcBe/ynwcSdZnUZI5r1Ot150+OZ5weCoRaed7J+JYL
 TV4SbZgkKDYUVwihPnECHdD8p/FsA6+ZTsGG77ZE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1keknN-00B7cF-TA; Mon, 16 Nov 2020 20:08:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/4] drm/meson: dw-hdmi: Ensure that clocks are enabled before
 touching the TOP registers
Date: Mon, 16 Nov 2020 20:07:44 +0000
Message-Id: <20201116200744.495826-5-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116200744.495826-1-maz@kernel.org>
References: <20201116200744.495826-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_150816_575654_03B06CF2 
X-CRM114-Status: GOOD (  16.36  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Removing the meson-dw-hdmi module and re-inserting it results in a hang
as the driver writes to HDMITX_TOP_SW_RESET. Similar effects can be seen
when booting with mainline u-boot and using the u-boot provided DT (which
is highly desirable).

The reason for the hang seem to be that the clocks are not always
enabled by the time we enter meson_dw_hdmi_init(). Moving this call
*after* dw_hdmi_probe() ensures that the clocks are enabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 68826cf9993f..7f8eea494147 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1073,8 +1073,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	DRM_DEBUG_DRIVER("encoder initialized\n");
 
-	meson_dw_hdmi_init(meson_dw_hdmi);
-
 	/* Bridge / Connector */
 
 	dw_plat_data->priv_data = meson_dw_hdmi;
@@ -1097,6 +1095,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmi))
 		return PTR_ERR(meson_dw_hdmi->hdmi);
 
+	meson_dw_hdmi_init(meson_dw_hdmi);
+
 	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
 	if (next_bridge)
 		drm_bridge_attach(encoder, next_bridge,
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
