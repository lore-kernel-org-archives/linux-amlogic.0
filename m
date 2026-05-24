Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C277CD5BB1
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 May 2026 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OGBBUyS5QY2oxE9z7qNV9jXOBC+iLszZqGYyhlsUbUk=; b=4fNzlZLEVwD2QX
	RG1OF1Nqq8xcvxkLYPR7LR8GytxhUMxSbHFxc5dnDRrNVxLvpshHHIJAgV29MWM92ZAr8oxqVz+aV
	0skVgrruegHVur2fPWbkRl8K6rYLr0wuLhCX8qbPBUrcX9/TMxv/KAzGfxbuuZZJpnagQ2qxOoZSG
	De09OyO0yD2bdF7KIwiB3J3J9/1IJyE/IfttTm/FDDl/O1iwrNqorjK+5iJ7ce0zXSdnIDl65UVHB
	1lMQlpdylrH3NsyuGrsgybnC2nWgFp9wWVLXRGHtJ64yzCRGitHkiZ6PE3Hyb1XU9DmSUizVNnPaN
	2IvYTok9uNF6FpaebLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBM3-0000000FEll-3Feq;
	Sun, 24 May 2026 16:07:07 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBM1-0000000FEl1-1tvz
	for linux-amlogic@lists.infradead.org;
	Sun, 24 May 2026 16:07:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-369002b26f4so5006180a91.3
        for <linux-amlogic@lists.infradead.org>; Sun, 24 May 2026 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779638824; x=1780243624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18MxIR0tdVmzmTTCjfqveL+dgh6nwJgg/2YQDWJQQr8=;
        b=E0l02kE4YWmGVN0gnQzKus+mkVmFKqFGOmcT360YAbsWP/I7qQl36/LL2pj7jfUbEP
         Jv6SpuQms/FQBcn8L9srhcRoR9Bpdzb0lwhstFqNFWX5kZbbg3xT2WlbLwezJY+S9vIr
         L6mrYogK0+lDtNtFy60p2nkZeNWLt7nENS4OG0A6MYijlMGq35xfvmRHJC6utsljfzor
         XKi4RFOWGYVbX6OGUXhrZAWv7jtmbxyUuwWTnE1qJPHkYuFPZYqJ4oD+rmVrQZLqwI1q
         UZKPMFVOrYZSrLHSZMQePrUuIksphRxNOijyM9O19EueY8e7dI1Kt8YDv3WAu5DW+A41
         txDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779638824; x=1780243624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18MxIR0tdVmzmTTCjfqveL+dgh6nwJgg/2YQDWJQQr8=;
        b=G2XxxJD46UHnAXcP2F7ZwBrz2y4qYYbPWvRzLdZZo4O0Xe1rIkFN4LhzbywSi8n7ma
         y7hoa5NAK029B6/VcY+wcEG0SzLiiK9p4Ghq/ybHFT3iA4MHXawr/7kqK6tTuBYBNT4E
         NSzuRvaMz4P8gYw4KgpCa37CwFklsKM0MFA869+KLUBjvKwVFwABLvL+OJY/menqRws4
         7rGkmmWDFat8mxMOdq1frgdM3gKQ9eWImDLjy3nnWLj181+VSx8PWoeu8FKPWEXKds+6
         i4KeNlqbO624+Apiu9tqKDlBhu8jy9GfrgW7BbRa+Tcx5wDa8bKfOtgxiCyD4RZd+DbH
         TfwA==
X-Forwarded-Encrypted: i=1; AFNElJ/ADGass1pNPtDzuubHtj8qB4EQYOZ1HF0ggcflFgZcH+0WPaFwFTEgQWmOg4YuV/2/S21ZKA1vAkRkLcmm@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ6QqJG8aJZfq99ynWCZqvKFmIi8y2l021yIEpmLA+Q3louoDe
	+YwbhWfYcHJBOTazF/IB+j6SArZNWcuVrTVM+4WkRaeMG8mcAhVzqv0=
X-Gm-Gg: Acq92OF5gym8ElPyJzSULRLIyb6f4guqSHLiHBcyTjFr8jUM5EIMdq2UmknX8eJ6XMS
	dvP9Cc/3KizsvUQwhUit35r+MdjsSQpj7eAdhq0QFDLFi0bZNF44B9N0xVWlxABmH5CK0o6e9kU
	C7K7CCBsaSnwQ94dIvtVH3SwZdaRP2GqATtb3d7IEEEuZ+hiOK1Z+sF/mDFLEutshGvQH6X/SCY
	csomOcYGD1Dw+1IQdTFGTBycxZrEL+AN5TSjSboVixNGHEwbxbV7cdwbl99Fj8WQmLbJGCtNkYz
	CX5eiYj6I1M18roSW4YW1N/a7F9DAZsBjGcL06a0u5tX1xp3B4m7uY8/rgUnQdJwI05tL+QjQaC
	+DxNUlrbXn7kEOvlK10orO1o9FyEzPuw3nJ2KEc7SpIDC5nqnbsjhj5x2zfPwoZrrGSp8wOB+Je
	KcM5DOgwHtVOe/9RUl681xIWiIJypkMa5mt4JBgQz6ekIZ5TwAa0OavijbOo4c/1OX5jaw7zw=
X-Received: by 2002:a17:90b:2585:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36a6788e0abmr10212406a91.25.1779638824285;
        Sun, 24 May 2026 09:07:04 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36aa73da32dsm2082541a91.4.2026.05.24.09.07.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 24 May 2026 09:07:03 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/meson: clean up KMS polling on register failure
Date: Mon, 25 May 2026 01:01:39 +0900
Message-ID: <20260524160657.17802-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_090705_497407_63DAB0AA 
X-CRM114-Status: GOOD (  10.47  )
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

meson_drv_bind_master() starts the KMS polling helper before registering
the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
DRM device without stopping the polling helper.

Call drm_kms_helper_poll_fini() on that failure path before freeing the
IRQ.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16..e49de5df73 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -352,12 +352,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 
 	ret = drm_dev_register(drm, 0);
 	if (ret)
-		goto uninstall_irq;
+		goto uninstall_poll;
 
 	drm_client_setup(drm, NULL);
 
 	return 0;
 
+uninstall_poll:
+	drm_kms_helper_poll_fini(drm);
 uninstall_irq:
 	free_irq(priv->vsync_irq, drm);
 exit_afbcd:
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
