Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF11C04EBF
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 09:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75BB820879
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 09:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gB2owMct";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="acVvzWHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75BB820879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q5JrDMuLr6g/f0VXXiphFyYtGTpTvaDfRSP92aKO2g0=; b=gB2owMctMkDfRL8oYNx52Y61bO
	cjTMU9f6neaUM+NSE0b1gAn2IrNp9n5gRkbCxZ2DHkjru0SalSJQcOYfAJ+ujm3BLC/pbNFq87kBn
	x/PX/+VlZXnyODOjChHuhEBAJBjAO3Z4ioZk5LnqSWtc+MVNHFaqrJ3fHN8E4GT3BabY/qGKv1rpM
	xa3MyyakKqmwc9gZTSZzKKSIXlu8QUwMMJHg52tzyd/i7+oB8HKLf46zewrEMekjhl2Mr6rMJ7vxm
	hy5cn2T84YlthTm0NcFXsx6tVmbX3l3/jwKy3zfYaiI4rA58KGlYZAgkMO4gSCkic/LMqa46oH+hk
	hj0vOO6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUTfM-0000X3-9L; Wed, 05 Dec 2018 09:40:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUTfJ-0000Th-Cj
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 09:40:22 +0000
Received: from sasha-vm.mshome.net (unknown [213.57.143.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE7F820878;
 Wed,  5 Dec 2018 09:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544002811;
 bh=Z4WJRzy/lr/v7ucLUZpc/LcfFMR/hqLqIVDKUJhrN+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=acVvzWHvUUr9XXgaErbUb4jt4TmaoMfXKfQUtypTROLbVdkTmyNduPbfwD48b+sjt
 ii/guw/CQQQpjpkTG74nZuP4VTAgxbeMDiO28o2iZ63jzp3S2qYsgGezEnW6SHcdCl
 lwAvpVCN3Qr5Vea9cJ3m3nmzoHccycuYFFBKgQDI=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 074/123] drm/meson: add support for 1080p25 mode
Date: Wed,  5 Dec 2018 04:35:06 -0500
Message-Id: <20181205093555.5386-74-sashal@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181205093555.5386-1-sashal@kernel.org>
References: <20181205093555.5386-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_014021_448902_D10AFC54 
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
index 514245e69b38..0a437a16ad0c 100644
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
