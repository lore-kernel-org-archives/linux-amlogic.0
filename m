Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3557BCD5BD1
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VRffj3IzsrwRktEgXcmPoOs8RggaTdGAQ1Ebxu6xQkM=; b=UWSm4EUaGDkH7Y
	VQPQ8bEm2IoaWJ1MJ6oe6Q/Amt90eWJPeM5u+DA7KbQIbjkknMf39Jw9rdO/g1pMYJrHM/Fv1J71r
	HtavO9Lv/3/mbuKlB8cV0gh1lkQRVoEApBbvAzvZvrEfkmfO98DxLxArx5u1amBdH2Cz1tQIqA+8Q
	DWFxyXrsJ4UYh/FwnnfwQ2oEkjo1DB0G0M/0NA8xxJLQ8VT72bhnoDk3mxgFcy0w6t0tSrLFl8ylR
	nKZsoHTTVURS7cwMbeHaH/olIPryLwrK7zFzwiM7407K4zIoMfEzSlm8Jeh6asMfgirb5lJwoLQJa
	QmgbEhfRQB77O9z0VLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaig-00000009KOT-1pqu;
	Sun, 31 May 2026 07:36:26 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaid-00000009KNX-3Sa5
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:36:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84229481d44so305615b3a.0
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212982; x=1780817782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4UPEtYv85DDTxdGxZ3GOa4tyKg7+fMqKk+6YoXF2Fw=;
        b=JenlJnCQ7tRsugnbFQEDF+v7bJGFRsAeBbWb4KTWRqHfm3dNUhTUwVmYVmYaQnpsbJ
         wN+NW+gzLl+9M0/BK03363dXWWSHAnzcgu/XcWTdpnPdX0PHznlCj429KDFd6C5MfRSI
         gRTo/Al9zaGj8FeOjA57zLT0TlkmDFlAEbTnWpxQRlJAwE6Tz4g6kjKkoG1GWlX4aFiD
         CmbfeJh0QUkH/YeMNPzO/ArGXd6TkjMTvouHWWeW+2mOEGxwJs4vFhQCwNhwlz2FdKUr
         kZWv+PY6BVP6tu063Mj33IsW4eoT25Fsx9wORXQgABvfkgbFi4tDlo0yo4Oi1pVMYTDa
         53+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212982; x=1780817782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4UPEtYv85DDTxdGxZ3GOa4tyKg7+fMqKk+6YoXF2Fw=;
        b=QfPUe5jiIQCg1GLHoyNVQb19IqQmYWg61WpVdPQ0P4EPvWtxhSscNxZvGAfC604SPE
         X1EemjPGcRugAsVRLMm3tEDyLVbqw8uVrSxyFZaStN1sBQSifcMcFwDXWyvN//UZW8wf
         KVF952cpAltAwiyImsUBsCVTXVILoZ9672EtXTRaRRKC6R6vLQ4/50RkLpFwIF5QQYj5
         l9X/qX/96iKtWYgvB70cqye3pk4jBkk+uPvTrxDYakn2m4Q03hQXFSK3D2yKbVOXct4q
         WfzpAQ+PUSfk6jsGhMe0835JntwfD4Y83PH4yTJPHYsuzgpKx9UDuAy3zuTWcdbMDRkC
         FcPw==
X-Forwarded-Encrypted: i=1; AFNElJ9VWZTSWl+fE7FSahJjaTxAvaOYvCcYV2CW4nI5D2pubLALUpXM/+UI9tTIXGqorN71x7w8O4gsB16Mbmp/@lists.infradead.org
X-Gm-Message-State: AOJu0YxSSntraRTZ1YdzuMCFiuNBX3PWbDZe457WCVcgcg4YGCZN6Y64
	UVBv6lWR3/+LTInYFDCThFpIIxjpGp4JPiRQjcFFENHrdYh1+EMvxEu3
X-Gm-Gg: Acq92OGXUOwm+fUcgwFzvVi6QcjUdVQRs0vtLqRWgvvnY7eO7Q/SQYvBWRhFMF6IQ9v
	ZXIomhNzYyNXy5Gfg+Q4rJRUz05tdzC9+CroA1FgyeXzxKIuWq61lVjgVzWj9lSwC6PXq1cD2wx
	o0iuVBS5ZfaMOU0DWR11s2IfBG4S0P3w/w3qHQSscPIp/cS+utB7IVEyfg3qLhEFNXTWIEKAOrw
	glnvpQIOidgbIkY8mpXGnyAj9btd2qop0ucOr8/EaS8OdHtKtu8lVXlQxJ/u+DGsGowz6sUT3N8
	ZD0hWrKOC00DzhBgZy9+lrAq21fwwFNYSUWCmtDRkNP2OhukTIpMAuifO+96YPwHgXp8BQpeIfV
	xHWrItU39IBLPcCNYOVlAyzldiFwx9hh7ypHMRdGcZreG7XaNCvRpxANHln57LcNlCdTjHY97qI
	sibmNo+/2Klxz8du9ztNVpF3JiqjlR42rNlAenNoUw4g==
X-Received: by 2002:a05:6a00:1d15:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8422579f2c6mr6160781b3a.42.1780212982185;
        Sun, 31 May 2026 00:36:22 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:36:21 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 0/6] drm: Open-code drm_simple_encoder_init() in several drivers
Date: Sun, 31 May 2026 13:05:26 +0530
Message-Id: <20260531073532.8609-1-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003623_865632_9FBA7E79 
X-CRM114-Status: UNSURE (   6.27  )
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

drm_simple_encoder_init() is a thin wrapper around drm_encoder_init()
that provides a simple destroy-only encoder funcs struct. This series
removes the dependency on drm_simple_kms_helper in six drivers by
open-coding the encoder initialization directly.

Each patch adds a static drm_encoder_funcs struct with a destroy
callback and replaces drm_simple_encoder_init() with drm_encoder_init().
The drm_simple_kms_helper.h include is removed where it is no longer
needed.

Drivers converted in this series:
- fsl-dcu
- tidss
- virtio
- meson (encoder_cvbs, encoder_hdmi, encoder_dsi)

Naman Arora (6):
  drm/fsl-dcu: Open-code drm_simple_encoder_init()
  drm/tidss: Open-code drm_simple_encoder_init()
  drm/virtio: Open-code drm_simple_encoder_init()
  drm/meson: Open-code drm_simple_encoder_init() in encoder_cvbs
  drm/meson: Open-code drm_simple_encoder_init() in encoder_hdmi
  drm/meson: Open-code drm_simple_encoder_init() in encoder_dsi

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c  | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 10 +++++++---
 drivers/gpu/drm/tidss/tidss_encoder.c      | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_display.c   |  8 ++++++--
 6 files changed, 41 insertions(+), 17 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
