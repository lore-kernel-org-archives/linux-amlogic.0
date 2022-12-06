Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1C9C352A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Dec 2022 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r3JRv3Hbj1VJ4mwGv5Yv+3CSxAcALuGcF4aisp5MCQo=; b=P2iAkFop4P4vZW
	Hq03GCxgIhd0BhzXGE9PcNrwYXbFm4Fnbp1/XKQaNyfAXGav2rjhBBQjad503DCkNkfNlgZLjKuoP
	XIgFyXfMIfLsHVeRlShTZwFNjf9MPC/Aex5S8+/pKSaQ71MaDigwpguQloNGJx2bqqx8xJN3U6YAK
	EZaljGGgMi2X4BAMqG/aUxwz1jwEbFoFfvXddZ1y4X9tp/baBttTKY1Gj5NJi7mFhMKmc0d/ZiX0e
	zoqfrNaVsKXel6Kvo5T1FJG0ppy7UOaOgf79KwxxJnGd465/l4idqv6HtCgE5mxfzPjZPFn5L6rdM
	9MWrOQgsb4yKDzFRcElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TP7-004v7P-EM; Tue, 06 Dec 2022 08:34:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2TP3-004uvY-BK
	for linux-amlogic@lists.infradead.org; Tue, 06 Dec 2022 08:34:15 +0000
Received: by mail-ej1-x635.google.com with SMTP id m18so2855668eji.5
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Dec 2022 00:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca42HDnAzaNif+afl629upfFjzp/uhKchk5gezZGNys=;
        b=WkyZ7rqxOey/vVPB1CJ2VdlljdAI5pGla1R9B/A3vystAGfhB74ZSGseennRhlzGHD
         CH7tTPGdr1KWnymVVEdJwxMxmSRZK+DY/mF8VdOwU2ddopQhlYRJmhf6YAWNFmYf7tmT
         Ii7Ct6hITejF3eOweUPoEUU4mef9Tn3DAnI5PXZt8fjSjBL/EJh85Uw/Y89AQvgwa3ON
         Cg7VrRTNRC/xHQpoGjRRODNVdjTMeR7ezTiv1kxEusc0RPkS0+H3IRnOAX1MmrxUr8Zs
         3NzeZGvNUwRUMLt4O3l+GokBFxSIAUWN1QLEk/NLLyAgfn6iuQu5Dx92xFYmcik6i4HO
         0sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ca42HDnAzaNif+afl629upfFjzp/uhKchk5gezZGNys=;
        b=kBYiexZJ2jllsIEJlbhJevdxft5+u2k3SfVLEaBlGJ9WmHC/M+0Ofy8IhQOKcdei9a
         IugSvKlojh1aJ04z907TIh4BahDTRjRpS0gtOTnVoyk09jNEOUHuUThIYdMrqunu03/l
         /dAulwU11dxmKlmwhoSFwTebutkv1W5yV6g6rahjOGc13kG0mVU4waMpZJnbpnB6oAop
         uPdcjbMjD6HlG9Dh+Q72gioZnIACw+NXwQJNQlgL4buzgifnOS/fTjdVkjYtIftJRVd8
         EFacCO2W6RxXH8IFhcW8WOQ/1CBv0k1el3ouvtsxY6P7/cTi0Uiadk/UZCuQCvI09VZs
         f9aQ==
X-Gm-Message-State: ANoB5pmvQWZA2i4ftDcp2QRDoMNalUYyKeLLMKI8Zja5WOw9oxrKQodU
	zh1MTqQGIKdUpIZoor2QyvP++w==
X-Google-Smtp-Source: AA0mqf5JJQz8h87aHVLqA619Gb7k/7pjbk6XcCV4nl5pWXDqNhBKQ6pGjnWf/cu/qaBdHS2ZZQi3eQ==
X-Received: by 2002:a17:906:f0da:b0:7c0:d609:4120 with SMTP id dk26-20020a170906f0da00b007c0d6094120mr11095894ejb.320.1670315648363;
        Tue, 06 Dec 2022 00:34:08 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 00:34:07 -0800 (PST)
Subject: [PATCH v3 0/3] Make ILI9486 driver working with 16-bits SPI controllers
MIME-Version: 1.0
X-b4-tracking: H4sIAHj+jmMC/4XNywrCMBAF0F+RrI3k1dC68j9ESh5TOxBbSTRYSv/dwaULXQ33wj2zsgIZobDjbm
 UZKhacJwp6v2NhdNMVOEbKTAmlpJSWl040r77csceEnWktdxAbMww6eCUZ7bwrwH12UxhpOT1TonLE
 8pjz8vlTJZ3zL7JKLrjVwggZvFWxOXm3JPQZDmG+sQuBVf1FFCGiNcGCDrHT4gvZtu0N6P88jP8AAA A=
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:00 +0100
Message-Id: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_003413_659114_E5629BA4 
X-CRM114-Status: UNSURE (   8.06  )
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

This patchset is trying to fix problems seen on S905X boards when interfacing
with an ILI9486 equipped SPI panel.

To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Changes in v3:
- Added trailers
- Added new patch to use drm_aperture_remove_framebuffers()
- Link to v2: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com

Changes in v2:
- Removed SPICC patch
- Reworked commit message
- Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com

---
Carlo Caione (3):
      drm/tiny: ili9486: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
      drm/tiny: ili9486: remove conflicting framebuffers

 drivers/gpu/drm/tiny/ili9486.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)
---
base-commit: bce9332220bd677d83b19d21502776ad555a0e73
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
