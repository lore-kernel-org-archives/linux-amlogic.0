Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8D3CCFA13
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 13:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Zfsza/6hl5El7qM5KHhWWT0dUtpn6f81T32rV4hF5M=; b=kuju0/YdYeC2Ir
	OV3IYCmM3fahO7npBuYhDmlatR4kNPQLp+o2RMBUZ3fZ2Sm6LoDkuPYblLEFo6IGHxAbxE18rsN7F
	miB+r6a2mcW4wgUSmsBD3y8yW40vff5kyRtAPtPAOWhBYbcqTu7JHfBsOE4q45qI7BEcX/XP2QcW8
	DHjhNIg23YRwGPE8r4NAK6+wDTy8wG64QMhA+QvZZdZjFGAiT7OQyFxIDievbTbVlVkI0A1TPTyuz
	dFCncpdVaL9hTgb1Q9GvVqs33DlxIY9KgfsoDltoE0rmUBMBw3InJ/riL48otO9YrRYetHQtl/IJP
	fW+XvSHd8tiU0skXbX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjFA-000000039yu-1ExN;
	Sat, 08 Nov 2025 13:44:42 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjF5-000000039y7-1qpO
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 13:44:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so202837566b.2
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762609473; x=1763214273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=;
        b=NAseqkcxXsEVCMYY11SKtq7FS5emHl7RqVpDfPcJGAiBCyCjuttU+qq3GGbouadUo0
         GghMSCSh+daRUOZgapVfhXyZ2tbYFpSZPPApe2qlKD6/WrrZ73Ho4ttFhHeSSmkCfBXW
         pNH1sxEgBcNwQjR7nMhwpICuWfQ9kEFCLH4r1dJAtkl8jMJ2NgE9cjCukyz55RcEQ8++
         ZhUOVkMWmmzXGSLyEwYsuLQkzg20FPGtkrdl0W1XwjStFjnOvPghbVcu1/wn9gtjFBHw
         yJmZch4Cf1Dxc6jZUmlda3gJq1P8wycIenpDYAdzloh4Iu6kSs0YipZ63dZfEEA2inLP
         jpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762609473; x=1763214273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=;
        b=k4h/IgQ9ng1K33X49N4HBCxwp/f5FyVW1mv21FJXoKnpLb5O/EJJBEhk4XT2siNkJI
         3gLOKnIgttJpKWHc8kc9maFqONt5vcXuFo8YWVMPIlyy0Zj9gq1YGTNqJIlCbryFMG5l
         a3r4U81ZAom8go4Oy+2davfw1lZCJypQX9wUTL/g5C4r30gxMm079Kl7d4cWXm45z3eA
         P67UpPWp5aXOxXyQ73X/6negbxLPBpj8dybdS1vs7KUWO4wnI4yS0jOkmjCoISlrmiX0
         nK65//24BwltYgueZt+6Z2uwyWyfsS51wOU9C7QLFhFeyNo+fB5D2DF1hF3IfC7zOvG+
         4NDg==
X-Gm-Message-State: AOJu0Yw8x5OF/Hvsz0eSlCkFr6hHTqX5NUa+6JcGvlV4mQ4th3CzksWh
	oelIq/bVL1IYsmjvcGPR8viOneedZnMobq5emqjZ2/Q6HsW4pVHBk5FQHkjmnA==
X-Gm-Gg: ASbGncuVZ2UH1yFwB3KOGgGHWm3FNVObbn/dvAHDS1wAHJW81bvBwi8tEDoMjg4LXan
	WmaJJaLyvmbMW/eUJPsPeHobBg6MNvWTj6uRAzvwZC4bw2BzSI+YQUzPFlu1BzU4MZ5waiAx7al
	BKC8+z+ZqNAIYchMlQsgDdQKk3c7ncBVdsOFaBFN6AKSh8Xw3HRUkdNhVNOMet7buivD9KQbC/g
	aXbXlqH/vS4jmsKXHHDR27kpFtfRorfOdwQiFcSCF5/CAeRau4+UPOPzWTuUXYvOcPUgKE4QfOa
	2d5q1fRjd0NLdQWoupSUnFAtrI7pup2EbznV9uSKrp5BKMfLND8yRKPMyGYXLY5lBS91x5pFmjX
	Cm4G5hCNNgXoOQuEdSOMhe1aqOj0ht9shJgtA00cI7DUgY5aYymarCLI9BAhubrPdeUuEEjT9nK
	E3ckuvOMNBAL2eSlJU4KvSg9ViLMFQOlafcnMbw8TRchSyF8/YdC/6VR9aWpe+ysJBebCm2CwVv
	Ly+qZBX20/DZoQEBCnh/ajFwICRJc5lnVUKZ8HWkW0MxKb9FWVj
X-Google-Smtp-Source: AGHT+IE3t5XHoEClnas6c0fwEVjyNk2axByTaO1rMD+gsebxQxdsSRmYQhKPt6+QjmiTNvXr08iIdQ==
X-Received: by 2002:a17:907:6e8f:b0:b6f:9da9:4b46 with SMTP id a640c23a62f3a-b72e056cc6dmr230845266b.43.1762609472959;
        Sat, 08 Nov 2025 05:44:32 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-ae88-0800-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:ae88:800:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b72bf97e54asm531374566b.34.2025.11.08.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 05:44:31 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up to 3840x2160
Date: Sat,  8 Nov 2025 14:42:36 +0100
Message-ID: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_054435_492737_60E6846D 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org, mripard@kernel.org, tzimmermann@suse.de, tobetter@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
the code is using the DMT code-path, which ends up in
meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.

The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
clear whether "4K" here means 3840 or 4096 pixels.

Allow resolutions up to 3840x2160 pixels (including middle steps, such
as WQHD at 2560x1440 pixels) so they can be used with computer monitors
(using the DMT code-path in the driver).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I'm sending this as RFC as I'm hoping to get some comments on the
"4Kx2K@60" note from the datasheets.

I have tested it myself on a GXL Le Potato board using a computer
monitor at 2560x1440 pixels.

This is the spiritual successor of a patch titled "drm/meson: add
support for 2560x1440 resolution output" from [0]

[0] https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshewitt@gmail.com/


 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3bf0d6e4fc30..4abd0c09b442 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 400 || mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
+	if (mode->vdisplay < 480 || mode->vdisplay > 2160)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
