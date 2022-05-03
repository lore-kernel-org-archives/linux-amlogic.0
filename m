Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39396C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 May 2022 07:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KVDMGu+7Xd0u2seVlzelPK8OBWkT0uU75+7RCdpHhk0=; b=kICSoTeoZSI9Kb
	Or0GCMukdXemayrEU606O7GfliHZNLZicW8HRJehS4hwhe7kQ3VHrnrDjNgoR1UQqcH7WhPFuAuZ5
	rLp8fR+rD1I/jvYU8QtdL9HEKfcwH2wCW/bJ9ZNIRqoyo+JG5agvAz50WcMDm7cq5Mo0sV8x7CYRN
	SCdeGJlNzSW0B0MZnU8ivvtS2QEtQYUBEeq2zOjSS0bz7VCylJHW6rFklXFMwj/98LvFyiyuMNDXw
	IzLqPsOdCRVXwOxhKeGdVVU3OfCW24QuOMtAxTOa4U22baUp+38v8rWdmdNB009ShIK9sz+GL4gIy
	IaO67O7ljKT49YGhZNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlmlj-004AP2-PG; Tue, 03 May 2022 07:16:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlmlE-004A3T-Sc
 for linux-amlogic@lists.infradead.org; Tue, 03 May 2022 07:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651562151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fcdc52RHnyOtW2Ji8ao5Mx7dAO83bo9+YY00o6q0qI8=;
 b=iymczZXtFwrJKomltXqSKkBNeO22qbedAaYbzktKzf4spQn6ncMktSdP2Hh6HhI7XEeDs4
 ZCiPY94feiyF+rgG5/g6eJ9wlZU5QlODfAihCiAjDyj81wGG/ICO2HWLSJNaw2WAUP//a5
 UCy9cNgQUvw2thOCOm/RQxm94PSSkIU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-c9shNJjmMp6XJnJJm5OArA-1; Tue, 03 May 2022 03:15:50 -0400
X-MC-Unique: c9shNJjmMp6XJnJJm5OArA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v9-20020a05600c214900b00393fedddf26so417910wml.1
 for <linux-amlogic@lists.infradead.org>; Tue, 03 May 2022 00:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fcdc52RHnyOtW2Ji8ao5Mx7dAO83bo9+YY00o6q0qI8=;
 b=JySD3Rql/L/+T5DMwB1NQmxeHPVXvs/T4IEwdwjo06zrvIA3rG7/iPrU5/0Hkp6jtW
 DmhvyTUwCawb9w9ipUPtEJsg4/QPYHW4s/yAr8vQewEf9Fo7sGNl9WECQ8rafJmMi0bY
 ueomO1GHsFBILJIuPXxchhZ7QVbVbjolbejL+76rRVYu/Dm/YkY47lzEonCKoVGIRWVu
 f2JsOx+H67N/00x1HlEZlRapDooaFpownzn+eIVDOez0xvNn2SSiG+34k39KJnKNEwzN
 7igmcHBoeAbS7eANLRqSvaYgcyA7aRNkum25RWDer8vkt/Oc9JcX3N8Uw1RWx7ajyBZ0
 4bTg==
X-Gm-Message-State: AOAM533T/NtJZ4PlODdwRqTApP7zpmSsoQialMaE9CvtgUuMizvXBK3/
 3tnupWIhpdvwkqR+QGw0wsRQiAl7mjk3QAb1XuAUYPUvl+K2xdnWPsuZSE3SmgS6maAoosLRrMS
 08xOBkhfNLwAvYagSi4x8Fm+DqhLjaxU=
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id
 v5-20020a056000144500b0020c731cc1d4mr1856917wrx.76.1651562149392; 
 Tue, 03 May 2022 00:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvXXP0f4w1nXpXqVVOb+Guc+0Jj2Rw1NklRnskTnVt1GV+W8d6q/MLtZExFVKZCb9QVoENKA==
X-Received: by 2002:a05:6000:1445:b0:20c:731c:c1d4 with SMTP id
 v5-20020a056000144500b0020c731cc1d4mr1856886wrx.76.1651562149040; 
 Tue, 03 May 2022 00:15:49 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003942a244f33sm1035387wmp.12.2022.05.03.00.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 00:15:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v3 0/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Date: Tue,  3 May 2022 09:15:37 +0200
Message-Id: <20220503071540.471667-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_001553_066304_009CE754 
X-CRM114-Status: GOOD (  12.75  )
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

Hello,

This series contain patches suggested by Thomas Zimmermann as a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

This is a v2 that addresses issues pointed out in v1.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

The patches were tested on a rpi4 board with the vc4 DRM driver built as a
module and either simplefb or simpledrm built-in.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/

Changes in v3:
- Drop the preferred_bpp local variable (Laurent Pinchart).
- Add a const qualifier to options parameter (Laurent Pinchart).
- Drop the firmware local variable (Laurent Pinchart).
- Use DRM_FB_OPTION() since DRM_FB_SET_OPTION() got renamed (kernel test robot).

Changes in v2:
- Rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() and make more clear in
  the kernel-doc what this macro does (Laurent Pinchart).
- Fix some kernel-doc issues I didn't notice in v1.
- Add Reviewed-by tags from Thomas and Laurent.

Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 34 ++++++++++++++-----
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_fb_helper.h                   | 24 ++++++++++++-
 36 files changed, 85 insertions(+), 45 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
