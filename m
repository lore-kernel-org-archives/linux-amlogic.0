Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F245C52D1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oK/ZPItUMcYiJBs3viCDCLPi76KjjEacTi6qM5Keyjs=; b=LoP+TlBUFbSA52
	3LdampHCfIPmA3w/zXJbLvL7RYjvSu82ajNuMVAfARtKvNIQ2XZoQmOV55rjddyttVEyUN+3ZAZ1T
	/IydzRRcVkXXzIe1SVsCjTjhpuAnEuY+Zex9nhU5r5JZI0fKR84+2DtgartGV6ESUeWJy5oZXz+vU
	lpzxz3IaHuhSHHK9LEvRZm8EIlf9QuEgkgTbJJhdExa7h8aVLq/N8KQUV98DltdQs7TZau+1QZAPz
	S/x7ILb4pscm919Jp+CKb707wMDLZovARvji9Ku8C/+R7oCNA0j5S1Q0rCrGAojejLtzJaCFqurff
	RfMMX5ZyFeS0JBOD36Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJM-0000000F9vh-3eeW;
	Tue, 30 Jul 2024 12:50:40 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJI-0000000F9sb-2vhW
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so26815555e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343834; x=1722948634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4fILNbTnV4ZUaEZHGGwWYZeuafakFEBk9A0Y4htmCY=;
        b=1g328Thh7qnGqNvdG45Bo9RSkoZcj5I28QGlyn6L3n7EXpX5jYoPoYwet86vYLLEVw
         ig13R8dt/5BA1oHqDoJjcbPNn/PWNqb2aQF2p1l4eY0siEbnhjH9g9CYPvUUlc+8QGMD
         FWWXCep9D7GZsqkUamvU4GPuRTvumw+t9ULbSMTuhlU3Mx6lTaUx4t6OYOPfDYYkrzZN
         RW2S4sQTIGq2hDyRUkVme0i9uwiCAXwwNicxtgwmYIT8uhsy1XnyfaSb0Qk5Tr7DKQ2X
         6w2+8z8WlAU5iACInZYNBbh7P2EeJsYPy/SQm5qUvJZBQNIyU4MArjfiSmyUmsn3mTnT
         8wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343834; x=1722948634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4fILNbTnV4ZUaEZHGGwWYZeuafakFEBk9A0Y4htmCY=;
        b=cjo56M9+NG4WGtJO0Xl7TJJSl0p1u2D5je+54fPOlDAZR8n8WBQbuBrUkVgKhHztw9
         G2DjZxgZGvvlW50hC1Vs1OGQ81FQmoYx1LJ8ne0wualA2/7QKGXjSoAk1dLdXkJyAiPc
         kiGzxPcBSuSPbY+b2wR+tvTOp7O7H7co4M5Iv431bX+btQ/Iy/qnTmc9Q3jk8/1GvVmR
         BbA8Xy5wCgkoq9wRRTUXeBbQInoOTcyuylNno4TBXsGiPsex+9kgUfEm+aKXUPjZg5gA
         v8iXNYZBhsGJhyp2KF46M/LIhjE6DEeZPkiy6pFJE6bTznnzb3KY4mEkPv/u21/fOHGV
         4KUA==
X-Forwarded-Encrypted: i=1; AJvYcCWjwcYD8jvG8SZrttd5ngIj6vGdFJbPg5G1XNntSH3dcxSV+1LsdM1T3DMESk0MUboKmaXBjBM4FLlN/76gm46+oDxZU+0naEUWhbTSTA6pV0Q=
X-Gm-Message-State: AOJu0YzLim1eZMGwyE8bJn662d3fNQXwtBT5Jx5Gi/Twwg9DO8VNwuhB
	h0+SgGNstzAuBnFMoKslXLMI+oH5QwokVQWL+wOEeM753E8Ax1Z00J8bQM3m8Pw=
X-Google-Smtp-Source: AGHT+IGPWSWAb+fvyUmPtwRvrlH6PC4ifMEhNzFkX9yIiubcqRcDAdw6bR9TYsXHuvl/XIZUdNlSDw==
X-Received: by 2002:a05:600c:3547:b0:426:6773:17 with SMTP id 5b1f17b1804b1-42811e12d26mr72308275e9.30.1722343834506;
        Tue, 30 Jul 2024 05:50:34 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] drm/meson: dw-hdmi: clean-up
Date: Tue, 30 Jul 2024 14:50:10 +0200
Message-ID: <20240730125023.710237-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055036_763682_FACBA461 
X-CRM114-Status: GOOD (  13.45  )
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

This patchset is a clean up of the Amlogic HDMI phy driver.

It is part of an effort to remove the use HHI syscon from the driver
and properly use frameworks, such as PD and clocks, instead of going
for an incorrectly global register region.

When this is done, it should be easier to remove the usage of the
component API from the Amlogic display drivers.

To be clear, this patchset does not go this far yet. It stops
short of making any controversial DT changes. To decouple the HDMI
phy driver and main DRM driver, allowing the PHY to get hold of its
registers, I believe a DT ABI break is inevitable. Ideally the
register region of the PHY within the HHI should provided, not the
whole HHI. That's pain for another day ...

The last 2 patches should not be applied yet. They depend on DT
changes which recently got applied. Time is needed for the DT changes
to sink in u-boot and distros, to avoid breaking platforms which don't
take DT from the kernel. These 2 patches are provided as a note that
this should happen eventually.

Jerome Brunet (9):
  drm/meson: hdmi: move encoder settings out of phy driver
  drm/meson: vclk: drop hdmi system clock setup
  drm/meson: dw-hdmi: use generic clock helpers
  drm/meson: dw-hdmi: fix incorrect comment in suspend
  drm/meson: dw-hdmi: split resets out of hw init.
  drm/meson: dw-hdmi: convert to regmap
  drm/meson: dw-hdmi: use matched data
  drm/meson: dw-hdmi: don't write power controller registers
  drm/meson: dw-hdmi: drop hdmi system clock setup

 drivers/gpu/drm/meson/meson_dw_hdmi.c      | 746 ++++++++++-----------
 drivers/gpu/drm/meson/meson_dw_hdmi.h      |  49 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  16 +
 drivers/gpu/drm/meson/meson_vclk.c         |   8 -
 4 files changed, 389 insertions(+), 430 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
