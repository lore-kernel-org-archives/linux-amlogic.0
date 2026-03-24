Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE34DE9A776
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From
	:To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=njS/FYK4pw4j5Dr9O/x+qeMeSfdcVPjS96AEmrQ9Xpg=; b=279jr4ohgMVooY
	hyzukXgaqI4SkIhIcmu9MerqhnYdexuSSueJY5A/l8pUzxr5T0urqZyhfWCiRCBDGyUqE98zKVQut
	/EU0+F2ybXFyRS97rzhBrSHp3yQndHUjhiCNIKNf0M1Hog7tMvTVbNnjk5nRu1+MsQ6CTYnA4uUPW
	iE69ucGEYBeqTzYmO8FmyELOvMhDIHA4+4Mc0h/xyxAf2Rp07RqPayIi4YDSQeaBAjiAkHYGEPald
	dK+42wwnuU++s1eJ8pPYpLHGiYDo6jfPVUnfFNWNcFN3Ubl5mdzUhAlhIKN+4pTpd5kq7Qq/ei3RH
	ocN15ZOzEXZvMGBkdSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50F2-00000001IxI-2NiM;
	Tue, 24 Mar 2026 11:48:12 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50F0-00000001IvX-0PgP
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Mar 2026 11:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352886; x=1774612086;
	bh=Bd8puGPsyAqrkv3KsDLsSC/8GgPDmqGf8nZTwBgCbY8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EQc3mgI203+O6uIdKN1cbKBrJYYKtopOnFWgus+/77ru5URIvTFagSqZyHFir824s
	 aE/ASlIDrv+C5NA2iIpVKVD8hSMJeGXMc4S7Oh63GOtdELyQRcyrLzf6+O1hzDWg+6
	 TgdhAVimU3kpsmmMNZWFUiUUfDnCHZVIpCtFJ/PNaTgzc9VUOxSjLCUD82ciSw/jXL
	 nW4ds3oUIlflSMLUvmx1lC+n+HghZvUSfsHdRocVFMmZCUA6+nLVKzOsYIs/N9qYrG
	 cmVVQkJfdPSug0HAqBvF0es085DZddnU1Hr/JZxVsiyTtdCu5OxwFtJI2FFfrze+H9
	 YNg72gCqc8p3w==
Date: Tue, 24 Mar 2026 11:47:56 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 0/5] drm/msm: add RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6b2dc60d395a13138b40b2adb8565c23b7c2566b
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044810_297771_352FA06B 
X-CRM114-Status: UNSURE (   8.44  )
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

This series adds support for the RGB101010 (30bpp) pixel format used by some
newer panels.

Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v5:
- Add comment & warning about RGB101010 support in compression_en && !wide_bus_en case
- Move RGB101010 check further down so it has access to msm_dsi_host_is_wide_bus_enabled()
- Use default case for meson_dw_mipi_dsi pixel format switchs
- Link to v4: https://lore.kernel.org/r/20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me

Changes in v4:
- Dropped dpu_encoder_phys_vid patch
  - Needs further discussion and rest of these changes can be independent of that
- Pick back up dropped drm_mipi_dsi.h patch (oops)
- Fix meson driver warning from adding RGB101010 to drm_mipi_dsi.h
- msm_dsi_host_version_ge -> msm_dsi_host_version_geq
- Fix msm_dsi_host_version_geq to handle major > major
- Link to v3: https://lore.kernel.org/r/20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me

Changes in v3:
- Fix typo for MSM8998 DSI version name (V2_2 -> V_2_0)
- Add msm_dsi_host_version_is_gt per Konrad and use for RGB101010 check
- Fix up comment & commit message for video mode DSC INTF timing width change per Neil/Konrad
- Link to v2: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v2-0-698b7612eaeb@pm.me

Changes in v2:
- Only allow RGB101010 if MSM_DSI_6G_VER >= V2.1.0
- Link to v1: https://lore.kernel.org/r/20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me

---
Alexander Koskovich (5):
      drm/mipi-dsi: add RGB101010 pixel format
      drm/meson: use default case for unsupported DSI pixel formats
      drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      drm/msm/dsi: add DSI version >= comparison helper
      drm/msm/dsi: Add support for RGB101010 pixel format

 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 34 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 +++-
 include/drm/drm_mipi_dsi.h                    |  4 ++++
 6 files changed, 45 insertions(+), 10 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260318-dsi-rgb101010-support-4956b1cd8657

Best regards,
-- 
Alexander Koskovich <akoskovich@pm.me>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
