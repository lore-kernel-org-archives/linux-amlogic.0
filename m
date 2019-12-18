Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77A3C3F68F
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78FB20684
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdYyK2Um";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qn5PFyKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78FB20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=28D7fzAtZ3pehCWwgAioC3+mowsAbMsa+Ts3TZ2N+yY=; b=GdYyK2UmhuzbIu
	p6TTGg7wRYRcr5J+cg3KEAeQbRrO9T4ffuMuGmSzkxmCclWCV43UkQATvcH4sKz04nkVnXVkH86VD
	jRZ4RBtouZ26ndUOPbnD4HL2kGcq5THOWWhocp1pmmISQf4SAYnax3jw4Mmku9b2KHHfyqlkALfPD
	NtW5i6cNRc6RXV++L7LXW4M00v1T1ZX2ICrPN+FalX5m1S3cXugBACsckuWfzh4IrMVur1tbPpiTz
	dorOuCMeCYpLdG7Xlro8rxqvGX+IP80fre2+/Hm5qbey/LS/S30vfKnaQoiAwS83lVeJTYvUoOA70
	cSO4a3Kmlp5WVN9TnDWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXC-00080K-D7; Wed, 18 Dec 2019 15:46:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbX8-0007z0-IA
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 20so2305082wmj.4
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MYOvH0H7ibv1Fa6fIrfwGLVBI8jr1NdK0W3XvJiQ49I=;
 b=qn5PFyKE3DoNYy2lkj45emUmQkf0FvtM3hIZDbyNAv6BIrMS9+Q5a7ZjD+eDdyGgK9
 mT6spRojz3xx/PkGBBbORTygEn1qyDpK+cPZx6tIQSa1v1i0UGrUPKV6iEKlgJF33woI
 IFw6VwqFrprWCXoY+k4c+SlRsefk4DsvzbFVTi0C7Z0dftniGS8/Ng4y3c4uLXgW/C2d
 WtwKQcCGci9AlmTR1A9jMn2mGeUY3r+CnLAtvOZsn4huMJeVVpArVJZF5nSCbur9dXWH
 J2V0ywVyLcLjKi3kGUN52iSvmEqwgq1zIV9UKhIHJj6zEJ6L+ntOZersakaqSO2G2TMR
 jEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MYOvH0H7ibv1Fa6fIrfwGLVBI8jr1NdK0W3XvJiQ49I=;
 b=jx8I2fesXWVF1CR/lpDzGVIHike96hIe8HP9LHECTRljAyQkbQouNUZZzsdVEek2wr
 LG23DZq7XDADK25ny5obfpyY8srp7FJiiF5K4JybiiWu94eo9l0WgOo3RGALdBEm/xGc
 P2PPVrNMXjlJemW7eh+of2Sc1h0xJa+blmWQZJ6zN+fG7/kOfppY1n+zHO2vYu+hewgv
 j/vsll3vikrpdm/I3JZHcIzwO5aBO1WWcOVhXK4owdOZZshTD00DVEX64kYx2N9IieaV
 k1Pbl2o//ko8ZoqCed3ewjgyUcR87jpm//YLYyECY7a0o5JcV0Fc7EDj1Oz1VSNoEcwf
 G3Kw==
X-Gm-Message-State: APjAAAWpJKJVDZhwtZXWorw5xJoMl+VDCDLfOagum+wxYGDqXgtUyk6Q
 WPlpeWd7wQhGf6Dho3xGxgYdfw==
X-Google-Smtp-Source: APXvYqynj1gVzQckDYJahebhiIXEraU4mydUqgfPMFSx/RvYApGRfUTi0R6a4jGnTRdhXKN439p/7A==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr4253923wmf.136.1576684000195; 
 Wed, 18 Dec 2019 07:46:40 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:39 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 00/10] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Date: Wed, 18 Dec 2019 16:46:27 +0100
Message-Id: <20191218154637.17509-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074642_663284_0119C4E5 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is based on Boris's v4 "drm: Add support for bus-format negotiation" at [1]
patchset to implement full bus-format negotiation for DW-HDMI, including YUV420 support and
10/12/16bit YUV444, YUV422 and RGB. The Color Space Converter support is already implemented.

And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
- basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
- YUV420 support when HDMI2.0 YUV420 modeset

This is a follow-up from the previous attempts :
- "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
- "drm/meson: Add support for HDMI2.0 4k60" at [3]

Changes since RFC v2 at [5]:
- Added fixes from Jonas, who tested and integrated it for Rockchip SoCs
- Added support for 10/12/16bit tmds clock calculation
- Added support for max_bcp connector property
- Adapted to Boris's v4 patchset
- Fixed typos reported by boris

Changes since RFC v1 at [4]:
- Rewrote negociation using the v2 patchset, including full DW-HDMI fmt negociation

[1] https://patchwork.freedesktop.org/patch/msgid/20191203141515.3597631-1-boris.brezillon@collabora.com
[2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
[3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com
[4] https://patchwork.freedesktop.org/patch/msgid/20190820084109.24616-1-narmstrong@baylibre.com
[5] https://patchwork.freedesktop.org/patch/msgid/ 20190827081425.15011-1-narmstrong@baylibre.com

Jonas Karlman (2):
  drm/bridge: dw-hdmi: set mtmdsclock for deep color
  drm/bridge: dw-hdmi: add max bpc connector property

Neil Armstrong (8):
  drm/bridge: synopsys: dw-hdmi: add bus format negociation
  drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: venc: make drm_display_mode const
  drm/meson: meson_dw_hdmi: add bridge and switch to drm_bridge_funcs
  drm/meson: dw-hdmi: stop enforcing input_bus_format
  drm/meson: venc: add support for YUV420 setup
  drm/meson: vclk: add support for YUV420 setup
  drm/meson: Add YUV420 output support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 299 +++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 193 +++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++--
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |  10 +-
 drivers/gpu/drm/meson/meson_venc.h        |   4 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 8 files changed, 538 insertions(+), 72 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
