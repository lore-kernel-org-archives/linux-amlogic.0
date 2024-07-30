Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D59C3DA7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KhKb25F6SlmzQyevPx8WrZq52bwxanNsm+ZxHDTqRs=; b=v646rYnUXtTw0K
	MH3QCgUTqi3TiW5AQb482vDLJ3TbruvaZ3bm1mScj9CYV227NmLxWKGK50PJypuBgTqwZenREp1rC
	NA2J/U+uM51nfTfhsg2TxgDAvGjt8j/dchwtYCXtuzqQ9YU2L1yqgql3ffoswiwUeuWmnzg6Xgw78
	FZyEEJOexhyqqyDFjJyyhLlLBQhzeh+ITuCYOfwPhMYWjasuKHi2DJQaN1n/Tjpzett3EOHKJYqab
	VaOELYT/o7CIJpIkt2gY1x+jHbY1kok5UoJrS0VWcJzSu/8RhMZUqT0PIB0Qpo/7UOsukivqNqNG6
	MWo1XWCWNOVQm4XvTd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJc-0000000FAA8-1r9W;
	Tue, 30 Jul 2024 12:50:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJQ-0000000F9xW-2uQH
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4281f00e70cso15242655e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343842; x=1722948642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0bww741v4ESlaOBOd/IxNqqLNy/KYkDWPizVqdvx9s=;
        b=v3TgAPwogLbsTdaaS2Z4FdaudJLXVaTG0GdkwAPJPPw+dNNhWdu09JkEYCmLaZ2/DM
         dFEaEAmDLCly9JG97zRmZGzSxjrZ0avZWEQH+CTcDqD5h4hz3iUtTKvqki9eaq1BljaF
         4wcCg1vFOFIPfoGCBZ0zOHkMcR8ZHYJEYykOItJUAxS8StwbaJ+S+YpRjEINQAXgnM7O
         37E9tPZKFRO9y2ZtyXwtd1rRhaZThMTNwaatqMFeNb6QlzD87c3lpZqqwugE53J/dU8g
         TlD1bsebKv7KWyImQ8SNTE+s18uxTv9PcXHZR76sqDf5FKOpPRNuO9yKjdVmQCH323rn
         BXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343842; x=1722948642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0bww741v4ESlaOBOd/IxNqqLNy/KYkDWPizVqdvx9s=;
        b=iuCEfy2BJSHDeW2JaIOAio13aMstc9hexGef+JnXd0gXoG15GtyyRzbFuPpaEWhQ6R
         qoyzpxnzNErAajDN+UCV1J/30hH+eUwDtl6exbYHsM8ENHrEyb+uWn7jLWbUu/b6VUuJ
         WejMezYWWy009ke7EAWcXq+Pm5rqyCNiVVaZpfkImjMejYXSrXnQjwKqVyiEr2eggexi
         LC3gTrNquTJH5e5TULsuNbupT0PlwPqZAKMNLYlbBNyFAyXpF+jcsvDlO75bd8A6Z8Hu
         7xUrK2ipEVSBmFtcXwcJO46i60HKw4lZXAx0PYwLhFhdxR7Gle7zR+JmJINXIpI3w+0b
         ck4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZU8/zwCmwavwbMbcdujB3e+mbj7AZ0r2e/2BaHH+IEJiBoTSqUHV1aaX00pMX9sd66IGV3n76T8Ul8Rd7fInZ2tE/jRqSYpTqBLwaEnMD5gI=
X-Gm-Message-State: AOJu0YyYt8GfqLZ8a+mDJ0d+S4l4P+x5h12DlV3qrm+1T8dscdRspfdW
	eVKi/ZTSOzm/KfSS4dmGJSTXgS7m5mH4tVaZJ6aOK2WhFaYv+QMJO54Ljd+7asg=
X-Google-Smtp-Source: AGHT+IFLDFq9LHqnUG6FBRbdJiqK71bxJQkIPCuJCS1JXepzU3MHqB97SQW7gMPpjbviNnFl2fKRWg==
X-Received: by 2002:a05:600c:1c93:b0:426:64a2:5362 with SMTP id 5b1f17b1804b1-42811d71586mr72986835e9.8.1722343842261;
        Tue, 30 Jul 2024 05:50:42 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
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
Subject: [PATCH LATER 9/9] drm/meson: dw-hdmi: drop hdmi system clock setup
Date: Tue, 30 Jul 2024 14:50:19 +0200
Message-ID: <20240730125023.710237-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055044_924237_E6572443 
X-CRM114-Status: GOOD (  12.53  )
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

Poking the HHI syscon is a way to setup clocks behind CCF's back.
Drop these poke and let CCF handle this using DT assigned-clocks.

HHI is a collection of Amlogic devices, such as clocks, reset,
power domains and phys.

This is another step to get rid of HHI access in Amlogic display drivers
and possibly stop using the component API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This change depends on:
 * 0602ba0dcd0e ("arm64: dts: amlogic: gx: correct hdmi clocks")
 * 1443b6ea806d ("arm64: dts: amlogic: setup hdmi system clock")

Time is needed for these changes to sink in u-boot and distros,
making this change safe to apply.

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 6c18d97b8b16..b54c1e3093e9 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -111,7 +111,6 @@
 #define HDMITX_TOP_G12A_OFFSET	0x8000
 
 /* HHI Registers */
-#define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
 #define  PHY_CNTL1_INIT		0x03900000
@@ -419,9 +418,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
 	/* Bring out of reset */
 	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
 	msleep(20);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
