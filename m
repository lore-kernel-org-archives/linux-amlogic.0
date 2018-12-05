Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93004C04EB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 09:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D4D208E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 09:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UcnpUwwe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="deOrn0QN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D4D208E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5ROMGkSemmcoiGMzL8jPPCX6R8GLOpMNDbyXgSv7ka8=; b=UcnpUwweOIQmoza3j5AVk2fsXk
	NSbQe8kb6E4JgfP8W61Mw1Hj8T7/3m4WpkGpvbwtpLNtJXZ4qAbKdyCojG16P9mZf8Ie4avJx4Ayh
	ZldgLRxh9GUAL2SHO3njxhqLCXQ5ytwynNaWsx6ADmvwn6ud9/wsul8iunce3Xya9GVg4fs1gElxk
	wgp7X0hZkGYsLn3JXM+YWWpQ1tVfBp0uicOKV4NSJ+yOPT+Peo9taPq9UCln+SpDB5KgspxzhfxQH
	hGpG0mSQ6+jwvyeDxQ3ST/tBqOODcSgsPoNwZsr6FIykyqY/e1gWvqzDkdz7MZ3I+sN4JaHifPeAF
	ntFOfFYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUTkX-00032e-H3; Wed, 05 Dec 2018 09:45:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUTkV-000318-4F
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 09:45:44 +0000
Received: from sasha-vm.mshome.net (unknown [213.57.143.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5CFC208E7;
 Wed,  5 Dec 2018 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544003132;
 bh=UNPqv9u2iY10gUFG8UJeI0z2KIeZT51xf/3NeiiWVOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=deOrn0QNLvoE+eUL1N5t5XVjYP2piw+a/N3A5GClDVdecsKjw2fMu5uKCrxEBFC/d
 9IZeOL0+U5rdeRNIA2KJUrWiodcF6oMmkgt3vPxYPpLbIlJgc6gPvCT1vz1KHeau6d
 4ZFmIb1h1tkmb2quf/mf6Z+ScXR3GgcVQwuIPfjQ=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 39/69] drm/meson: add support for 1080p25 mode
Date: Wed,  5 Dec 2018 04:42:17 -0500
Message-Id: <20181205094247.6556-39-sashal@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181205094247.6556-1-sashal@kernel.org>
References: <20181205094247.6556-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_014543_186407_76E69E12 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

[ Upstream commit 31e1ab494559fb46de304cc6c2aed1528f94b298 ]

This essential mode for PAL users is missing, so add it.

Fixes: 335e3713afb87 ("drm/meson: Add support for HDMI venc modes and settings")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://patchwork.freedesktop.org/patch/msgid/1542793169-13008-1-git-send-email-christianshewitt@gmail.com
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/meson/meson_venc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 9509017dbded..d5dfe7045cc6 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -714,6 +714,7 @@ struct meson_hdmi_venc_vic_mode {
 	{ 5, &meson_hdmi_encp_mode_1080i60 },
 	{ 20, &meson_hdmi_encp_mode_1080i50 },
 	{ 32, &meson_hdmi_encp_mode_1080p24 },
+	{ 33, &meson_hdmi_encp_mode_1080p50 },
 	{ 34, &meson_hdmi_encp_mode_1080p30 },
 	{ 31, &meson_hdmi_encp_mode_1080p50 },
 	{ 16, &meson_hdmi_encp_mode_1080p60 },
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
