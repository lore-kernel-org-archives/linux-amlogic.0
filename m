Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE731C3DA79
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Dec 2022 16:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa8aoGKxMiIAbNQ00Pwt2liIlieivqO9Cd9JWOQVBDI=; b=iNN2/A1Zwcfhgi
	k0ZJMmpN4nExID2Yyxgro16UbemsnK8YhfuqVP34blzW/s4zdorYsJ1CI95GOWHPFynbjf+Iluclo
	G36AB2xvBzkEFQYc7LErIIBh0hYUG20tWDPmk5JJ8ANNBphSfHIW11ljG2MdKRpEtO65gZ2cvkksG
	14coWSzjpvQ6yQi/IWhXuEqNgHXyt/KXzzMMRl3N2ybLYUd6HZjkHMlAhHsze2axuUMv3ryL6BAeU
	IW1NSVHF3GonqU0HpO5B2T1q/wvgDlWhpb4yTBhtauyOAPC6LGdkW7ifT9dZ7keFz+T9R6AOsJTxN
	cawu6m+fjm/ukRX8em4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6w8C-002mf1-07; Sun, 18 Dec 2022 16:03:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6w87-002mcI-Aj; Sun, 18 Dec 2022 16:03:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 00C40B803F1;
	Sun, 18 Dec 2022 16:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53521C433EF;
	Sun, 18 Dec 2022 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671379388;
	bh=UGuOnxnM7GPmefNXCCPZBE0jOJo+3GsKpHYT1te8Qhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oP+8czzkgNR8RJkxPdHfE59EGgDaEgZY2xbsylV6QCHyRRG12WIjdwlcS1Mb/NLn9
	 kNwXZe79rnMp4LoyyaA1IwLonHTtSNBgO+hhVhQz/bdkGAMDUBO/ufySp0SsQyUQmr
	 HdqlUDpt0ha7uS7lZ16Hv5Jnab5iYbYVStThD15sbkLDOG6lIMlF8egaqAV/pHQc3M
	 grSg5RH8vurSUIu6xGE88RKnCAevnFPlN2ISfziYxCeuPyoRrmOlWfpcL+EMcAdCuA
	 IxclxO15vlBuIKhJGW50mZ2C6B+4svb6tUX1/A53hH2HNEnsIDYJCQQFLbhUIKWKP9
	 B2VOvrqOA/QcQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	airlied@gmail.com,
	daniel@ffwll.ch,
	khilman@baylibre.com,
	ndesaulniers@google.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 22/85] drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
Date: Sun, 18 Dec 2022 11:00:39 -0500
Message-Id: <20221218160142.925394-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221218_080312_099676_3A801CFD 
X-CRM114-Status: GOOD (  12.51  )
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 6c4e4d35203301906afb53c6d1e1302d4c793c05 ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/gpu/drm/meson/meson_encoder_cvbs.c:211:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .mode_valid = meson_encoder_cvbs_mode_valid,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
'enum drm_mode_status', not 'int'. Adjust the return type of
meson_encoder_cvbs_mode_valid() to match the prototype's to resolve the
warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20221102155242.1927166-1-nathan@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 5675bc2a92cf..3f73b211fa8e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -116,9 +116,10 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
 	return i;
 }
 
-static int meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
-					const struct drm_display_info *display_info,
-					const struct drm_display_mode *mode)
+static enum drm_mode_status
+meson_encoder_cvbs_mode_valid(struct drm_bridge *bridge,
+			      const struct drm_display_info *display_info,
+			      const struct drm_display_mode *mode)
 {
 	if (meson_cvbs_get_mode(mode))
 		return MODE_OK;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
