Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A7C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0A4outEtbyu+P+nucLR4GWHzEHcCkMBk5XRGv+W0G4=; b=MppMLMag3j9WEZ
	SunKE6QdZWJsd5Jpz/V8lVpdcepG8xbxOrj4tXzSaf7FDPo5ZLogA8PkEpmRrzeBlnpKpvhK0TZhD
	/G6n9mppexelH5N8C5L2tUr7jGpOKaUnJr8rK6GShK2YGDJG/MaNS63dF0yPutpGNAq8p6WVBqvFh
	fi0XKjej+vIQxPs1N72q8jGOxLc41V5KlnOJAi9lwLGRPoYN70AKGY8UErBTKBU6L/OIqPA578MvB
	0ACobm/wLhmMtZlWBLONUo8SpCoqbOBHJ22AAmVIJkuNlO7oM+UNnP/r8TdBRe9xU7OcFTMwupFB2
	1P3Asii2WbELmx8esraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqG3C-00BtMg-Vi; Wed, 02 Nov 2022 15:53:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqG3A-00BtLF-Il
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 15:53:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D5F25618B3;
	Wed,  2 Nov 2022 15:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A406CC433D7;
	Wed,  2 Nov 2022 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667404387;
	bh=1uIdbgrfwhx0R+OMdlVdLSgX+ISrJXXxfTiu3acQa9U=;
	h=From:To:Cc:Subject:Date:From;
	b=sn5mQZD634YpH/ylGcaZeJgoWJjEt/rRHp//FwBRskERP9XMhH8hFrm67lq//pOEM
	 wcFApNGwnNvxV+hegJzONrBrVjQscveyo5FeBV6T+0EaXzETciaFd1ISU4x7vYiOR2
	 8WObpBaaOm/2XwUXwyK6oDPkhC0u2cfl6oJ+ws0JNrylnoMqbgldOX7l2WRGJEswdJ
	 hq7YFTylOCYF2UCSE2XkHaPBhh4LZZpy4MpuAo70C7cXqG772kPuCObxo3WTgOz8+u
	 74iZGfnj1dvgokxCwaLInnvheb2arkrj6caOhNXgPYAPqmuRffHz+9qi52hmIMzxl0
	 XXOqBKxcCj5dw==
From: Nathan Chancellor <nathan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm/meson: Fix return type of meson_encoder_cvbs_mode_valid()
Date: Wed,  2 Nov 2022 08:52:42 -0700
Message-Id: <20221102155242.1927166-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_085308_676372_4ABE5B4A 
X-CRM114-Status: GOOD (  12.94  )
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

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
