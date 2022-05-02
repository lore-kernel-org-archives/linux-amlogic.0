Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97F4C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 May 2022 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bts98yfb6fRNLDNVlR8LF/NgaJJM0knSrDficT5f7hA=; b=K00J81FpAgQwn6
	oTNuYIKZUVcEAZqr/PEjZr7nxIEntBAXQxnrpStm1mmPGq6sou6S+YlfYXb3bTuLfzOaXaNtivRqM
	NimTgGeUO0kOuvMWmaPV3QFBnyBzjTJLKh7q97ePzOKrRWaDJNUsF8gy15O1eNLIaXBy6Pwo9c/ss
	WivTbJXExVmg+m7YWIWH3nbSpB0Xe5yg91T34dYYg+fU8baB092unwufe/u07qzZ+C7iPNsRcSYeQ
	QlbHInnnz8vFOVsVnofYn6juZfPXCFXKkgQIn9LBPfFpmO/0ClzDhVnLy+pwhkoSs1DXwseiQxMLM
	r4TjS3G9HlIE2CdAaDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlY91-001YnI-GW; Mon, 02 May 2022 15:39:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlY8i-001Yes-U6
 for linux-amlogic@lists.infradead.org; Mon, 02 May 2022 15:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651505948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RxZ1zA8nQC01DJB3x+D5mWs5PQSC8mjj8OCqdkOk8ik=;
 b=N9xVmOaYgqZk1E8WUAaOOrWaUs6vcH96hTumJGgknZ++sCZNELLhyZ6uwEKw2t8S2uN0Q4
 0hpYIyZ3zJvkbx4UI7Y24Wc9CvmZ9WFIrql8K23e4iDjchfswxzO+XV1qfkiuHSVg/9GzS
 5LXu6SgfQbcafNTXQlkTH6juO/pwckE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-At6sZay9PHmGZUPZYEqHFQ-1; Mon, 02 May 2022 11:39:05 -0400
X-MC-Unique: At6sZay9PHmGZUPZYEqHFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so3012115wmr.0
 for <linux-amlogic@lists.infradead.org>; Mon, 02 May 2022 08:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxZ1zA8nQC01DJB3x+D5mWs5PQSC8mjj8OCqdkOk8ik=;
 b=ckEdv2pYX1mKFsILSKKq0i+I9O3wi7LQXCU1HdWuIhELhbgXiho+UlMlwU85d0xCyG
 CdLhrVb9XyEEsSeu23fxX7C77lg3WHpRWF8Zw7sJvasHD2uBj9A8oktf7CZOWkRhpbyE
 Hi5Q477Gce64KSKY+7klXp0QK/0Fs3NHa9U7qOdgd3z+y5Ae88/UWG05kzKpO+m7LPij
 zmW+fUbH1e2Kk4f75exqo8xztP/zfHhhxootFCXJjiRyjRAWlu7TE5wC6ps91I/YCQtY
 /NL8xCSLLG1rTqH66cllSnXOLumS9CugB4ac6wrswc03br9wANKvA8nw82u/txGdAH5Q
 oSjQ==
X-Gm-Message-State: AOAM533EP1fiTj+2kLAKkNkzUCQpGR50Mj991qJG24ehCw3am+jiL4Iu
 5gAe45cWCUYyZz2ZL3VcCEhcKMNPJ4+9tCkljxN9zGNw6aKZhD1MTsdoqA+QcN+7LMHWyxiMsHS
 xxhUOqfUMx7M0TCUUFo72c3Yydg9oDVQ=
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id
 m22-20020a05600c4f5600b003943fa397bbmr3455848wmq.83.1651505943849; 
 Mon, 02 May 2022 08:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5iF7k5TDSOSlgHfyQz+pcyPcHCX6LV3RnlxGS89mLob4h+ZdMgib1ArSojImIhdyBYcuzBw==
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id
 m22-20020a05600c4f5600b003943fa397bbmr3455805wmq.83.1651505943296; 
 Mon, 02 May 2022 08:39:03 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v28-20020adfa1dc000000b0020c5253d923sm7294489wrv.111.2022.05.02.08.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:39:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Date: Mon,  2 May 2022 17:38:57 +0200
Message-Id: <20220502153900.408522-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_083909_165642_646A61C1 
X-CRM114-Status: GOOD (  11.20  )
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

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/

Changes in v2:
- Rename DRM_FB_SET_OPTION() to DRM_FB_SET() and make more clear in the
  kernel-doc what this macro does (Laurent Pinchart).
- Fix some kernel-doc issues I didn't notice in v1.
- Add Reviewed-by tags from Thomas and Laurent.

Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 26 ++++++++++++++++---
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
 include/drm/drm_fb_helper.h                   | 22 ++++++++++++++++
 36 files changed, 81 insertions(+), 39 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
