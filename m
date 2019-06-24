Return-Path: <SRS0=y5YC=UX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E7BC43613
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716662063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2019 14:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tJ0mVi01";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1t2stW6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716662063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DdATqYDF+VOybEO6RuAvCEuEwEitdYyeEThVlo9SDD4=; b=tJ0mVi01T1Xs5a
	PAv9v6XsLtRn9ElsGCd/XpzDP+VG+sy/MMOZErBjYeofLWVfr+GjrcUiwQgxcPieJzRoYKqdZtTDY
	IchGC11Yc3eeTGLAmNQtmUkGOFX1iJwXpvRGvOCBp79wROaDOBa07FwJrjF4qxe3Y7hKKzGZXTraR
	G8Mh9NWoKI9ykd5TZsuNyhVv6o1E4402lAKzyXKEcJOyW3pKv3J3UbOX8Hk1laAMyxkO/Fmvt6uYE
	+VJO+gOGkomN0LWamtEeC5eVEjRvOsfmzw1ibJgtyRW2l6bnhESgGKxlHRh7fphF/pXnD0Gm8HKkI
	OsaROcr6Jz5NNJjiVCkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfQGU-0007YK-Ad; Mon, 24 Jun 2019 14:48:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfQGF-0007ND-FU
 for linux-amlogic@lists.infradead.org; Mon, 24 Jun 2019 14:48:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id f15so4343695wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2019 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dIRgQ3ynOpjhyuIVnVuPJTcE55pI12BhgO4qsYJmHWg=;
 b=1t2stW6KFcusBgmgb+vjxCC6D/mAJkeo4PWwfQTJtiO7t+wgz+REk1m6xRvG5PdvpB
 N5Cfj0WIDM23ujK4DsoZ5o1ow097YCS3oiJGmCJJLc5kPXI9NQjDO+jaevjCq4y3MDyi
 RwKqbnu2Na54f0LI1M23VY8Iq8pGBws7IXzE5sNIaK7HzGq0HBb8ZEcyorT4YW2sK18x
 cQHHT0avopamkHoV1U0VKmXeQpKbSOAQpadRqHyELQS+oT5AGEeyL05nMQWknKwiEzY7
 kaNz21h3qkJfc4TfwevGKTNdhk0RfDvec7zs18vmX6VVcVS/qiaLjeq43dtTUSp9cngj
 BBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=dIRgQ3ynOpjhyuIVnVuPJTcE55pI12BhgO4qsYJmHWg=;
 b=M7PcwLX+nNL3biePh5ue8wE7/ECT1skvmRlNJGEjvxV7f9V0Zk2MUs/68/P+6NWHEf
 TgeDjLiVQtr8q7vWhl8/0TXoM6zdCVntm7X3dj7jy+EWpubEKuQ5Y/JXDC19FEH3duxH
 sH/AWFAtcVN5a1Ai4bEA/KUP/d4HzqnZ4qR9pA6pvzZLUZfyelRuAZbI1dZYMvYbyZwX
 ITNol7F+FBhXBxg38wxvmUXobK2obcd0E+o1bIj86FjLb9fMPCx8TAF1rXupyOAfiZgF
 gMvwhSqrVWDG/v3DPEmYQopyR3tpmKu/OXs3FUgktZn7QWiAjaeyhbedGBNMpXQ/PTrP
 J/pA==
X-Gm-Message-State: APjAAAUArYHodF9EfSUt4Jpx7RcvPnSF3IlZaETKH50lMbwxKOQzd9Rg
 HqR5y/3xuzXPAVcQvDIARLqRJg==
X-Google-Smtp-Source: APXvYqzAhY+ZzLqrg8P9+Gjky58V/7Mins9CYwy8HmsCLCi6hwSDb1K4orr31YS8ZR7Cuubi4to67Q==
X-Received: by 2002:a5d:4642:: with SMTP id j2mr11688565wrs.211.1561387676728; 
 Mon, 24 Jun 2019 07:47:56 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm13228366wml.9.2019.06.24.07.47.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:47:55 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/9] drm: meson: global clean-up (use proper macros,
 update comments ...)
Date: Mon, 24 Jun 2019 16:20:42 +0200
Message-ID: <86zhm782g5.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_074759_548832_3F1E14A0 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


This patch series aims to clean-up differents parts of the drm meson
code source.

Couple macros have been defined and used to set several registers
instead of using magic constants.

I also took the opportunity to:
- add/remove/update comments
- remove useless code
- minor fix/improvment

Julien Masson (9):
  drm: meson: mask value when writing bits relaxed
  drm: meson: crtc: use proper macros instead of magic constants
  drm: meson: drv: use macro when initializing vpu
  drm: meson: vpp: use proper macros instead of magic constants
  drm: meson: viu: use proper macros instead of magic constants
  drm: meson: venc: use proper macros instead of magic constants
  drm: meson: global clean-up
  drm: meson: add macro used to enable HDMI PLL
  drm: meson: venc: set the correct macrovision max amplitude value

 drivers/gpu/drm/meson/meson_crtc.c      |  17 ++-
 drivers/gpu/drm/meson/meson_drv.c       |  26 +++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c   |   2 +
 drivers/gpu/drm/meson/meson_dw_hdmi.h   |  12 +-
 drivers/gpu/drm/meson/meson_plane.c     |   2 +-
 drivers/gpu/drm/meson/meson_registers.h | 136 ++++++++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c      |   7 +-
 drivers/gpu/drm/meson/meson_venc.c      | 169 ++++++++++++++++++------
 drivers/gpu/drm/meson/meson_venc_cvbs.c |   3 +-
 drivers/gpu/drm/meson/meson_viu.c       |  82 ++++++------
 drivers/gpu/drm/meson/meson_vpp.c       |  27 ++--
 11 files changed, 362 insertions(+), 121 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
