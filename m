Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEEECE582
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFpmB1f3mwYvSsVYInXaFuCgDCX21l6g9MiQYln1GI0=; b=iC5ufinoCZHGNQ
	bxDYOsb79HyEA3BpuW/zpPfsxbOFyyoAHI+eZMcjiFJvk6wbYPnNi/EsGxdvNBgcvifREdv3edFaT
	1aRRrgBtPNNXswh66ulmFgyxmh7C33F1Uu0QpGf0jCAPt56dnXBJ/AsV0mRgN8e3eqsnpcwXbgK0d
	jgEl6vffZa79NeHoTjOkQ5qX1g2eIGVlolf2MylifZsLi+h5OqORIyPfLqVlp9xtM4gGg2OgrdH+L
	YSrUAQ6nxAO7Sbgtm1eLLxPSoJ7flrHjNOM30doqX+FOGonBE8o2nR+xpTSfuL2j0tT8VTPRtOJtN
	BhbECmY0xYOQfBcFeGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxn8-00000005Alo-0QwL;
	Tue, 10 Sep 2024 10:08:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxja-000000059jL-40nJ
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 10:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725962671; x=1757498671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WKqIK/ZmFsJXPRHNyOF84G9TKFW1bzTau2Aa5vuIsSE=;
  b=Rwir1BPXgEmfzAvYH5ogpj9hiaz+sbMoR9s3KBs49TPtR0nXGbJn0LSk
   KhXsPF4IZkaD4V40RPWKsrSUdm04mnD22uEhtWaLBGfFhL2Ge/W7aot56
   LJQmUvhb+xB5/GRJBRT+kyRHl3aZ4zSfarWe0NU6GHoDG8KRkjPGWSGH5
   eev4CzpkR3S0/xR8UKv+c+m+VTsYyf356WWSFB/1MQ/2ZKFa0bwVgC6ng
   gLkJm8gaopvcqW6+RZ7s3//3a8Aow1iZ4F3mdVf5hvKF+WYtkibLi95jp
   68glNZqtF174f8OQ541vdv63b+06BxZighGPtALNfO+4SgirqUxsJ7n1S
   Q==;
X-CSE-ConnectionGUID: YrTDA3AuQO+YfOtBmyqbyg==
X-CSE-MsgGUID: S6I2TdiyQh+bS3SoyLTq0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50112851"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="50112851"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:04:29 -0700
X-CSE-ConnectionGUID: jj7kEEvrRgCFIGl1kkE12g==
X-CSE-MsgGUID: K8yj2zkQR02nFABJei6yng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71762389"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.43])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 03:04:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	jani.nikula@intel.com,
	Nathan Chancellor <nathan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 6/8] drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits() with __maybe_unused
Date: Tue, 10 Sep 2024 13:03:42 +0300
Message-Id: <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_030431_032563_07B72366 
X-CRM114-Status: UNSURE (   9.13  )
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

Building with clang and and W=1 leads to warning about unused
dw_hdmi_dwc_write_bits(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..8d99d70a36e3 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -273,10 +273,10 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
 }
 
 /* Helper to change specific bits in controller registers */
-static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
-					  unsigned int addr,
-					  unsigned int mask,
-					  unsigned int val)
+static inline __maybe_unused void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
+							 unsigned int addr,
+							 unsigned int mask,
+							 unsigned int val)
 {
 	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
