Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9487C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oUetj/0Og08ybiB8IYtsFqvEzd9bXFyABq1SYneDF0M=; b=0DIwjJAjeKP4np
	VFerPcUxL7fLnvFI/Qm69QUCCSVQKGk6Mvdt0ujdx+o1z2qGRNecyc8G5KegIWi958MDtpoc2gpJU
	d9m+BzqFLp9LveHKuakPJ3MY+metrLRjGA+6oZ1RqayvIJYfijT69MV5a++XqKsX/SmCoxd+0yE24
	IATjXCUXTOOuXrZGKCq4zQD3YGECRkutL0/CrWbci8yCiv4Ffjt4vn41nNf6S2UZjvC2mgeI5Mprf
	fwnaGaHTRVCVxqCARzHdQx81P6swND5Rw6sFKP3rHszBxXJOyLB9y+zGxS7A2Z9foA51zOWdjgErm
	3a0agQAXDLFMEOVTAFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C2z-00Ay4i-1G; Mon, 19 Dec 2022 09:02:57 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7C2t-00AxxU-EE
	for linux-amlogic@lists.infradead.org; Mon, 19 Dec 2022 09:02:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id ud5so19869437ejc.4
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Dec 2022 01:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=5Rp4mcTJSZ+/bNcPxaj4q2SCzytDdxI+ZDZbCvWyFwY=;
        b=09YmwOcYRbx0IIV+b93s54Yvmrx1RvOGfAmKImQ2A/9Y9uEMozIwEZ73kTiEL6gOsr
         R+5I9ZMMdtIE2EHTkvZ98ZKAXzAnmLhE5HLe2W6VOeTVJvzbB4g7THrCBetDAQxbwqA3
         VD+clHbGbFn/QUQH/BGEoqvx5KiWspJ10iW/0sEKFSl8Dggj8fA0CanPQwpvqG5Kv9bj
         UmCxq0JAjE9jSz4L2dgJmeJBHFvBpIjJQnmw4+PC24qDd4uDYVd/wkcNQ+tzbYQ+gmGd
         pjCduMu43mJoND3I8qx2KFffmtuHlZQx1RnjJThCAEpZxT1478sMVJGKf03ChT4d5USr
         ayaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Rp4mcTJSZ+/bNcPxaj4q2SCzytDdxI+ZDZbCvWyFwY=;
        b=ZNcM9OUe5hDX2s2XgJJXmi+tQ6C5uwsZtgOiPtS9C8VNI//xUMaFhYXp6D5J8Y+XQg
         DhbMQuWd+2yCM8+6R8Vif/hwDL7zdqc+GIVNqv/PGJ0zXUzZS4NLsOdAbh43FMYxeMtN
         nvWzAoCiwSHtotQ86DCotcK9+C+hbhb6zm7H9ytdSYJdiyQpuC3hUD2+lJOtTFMVdwxy
         EwqiSsZlV7eFU4keRwD90YEqAwfdp/7UBros2vLifflQxgB4bFPDSKxqs9BGgGVM/fQX
         rvGyOi+RZ4KtlG33efv2FMTgYrhjtE4ZqTepr6QUg1Tb5zzl9ja1bGkEuT2yE3KgWJiT
         CWmw==
X-Gm-Message-State: AFqh2krHUc5cLCIV/01JrskQtTjgs+hDHXEt3ZP5XiC/cHdcwsOu8kAy
	qtzaGGoAJ6HJXKErtAUGUsMo6A==
X-Google-Smtp-Source: AMrXdXv7I5y8yp20tcxCivFoH9Pn3z0juo2iGDbm9DR06XD8zFMsm1DX233OMYOQg7Tap8wcTTqw0g==
X-Received: by 2002:a17:906:cb9a:b0:7d3:8159:f35d with SMTP id mf26-20020a170906cb9a00b007d38159f35dmr14327985ejb.9.1671440568517;
        Mon, 19 Dec 2022 01:02:48 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
        by smtp.gmail.com with ESMTPSA id u11-20020a170906b10b00b00781dbdb292asm4082721ejy.155.2022.12.19.01.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 01:02:48 -0800 (PST)
Subject: [PATCH v4 0/2] Make ILI9486 driver working with 16-bits SPI controllers
MIME-Version: 1.0
X-b4-tracking: H4sIAKwooGMC/4XNTQrCMBAF4KtI1kbyT+vKe4hIMp3agdpKokUpvbuDSxG7Gt6D980sCmbCIvabWW
 ScqNA4cHDbjYAuDheU1HAWRhmjtQ6y1Mo/z+VGZ+qpdlWQERvv2tZCMlrwLsWCMuU4QMfL4dH3XHZU
 7mN+ff5Mms/xHzlpqWSwyikNKZjGH1J89ZQy7mC8ihODk1lFDCOqchDQQlNb9QOxq4hlxNcQkq8gtW i/kGVZ3hwls9dEAQAA
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 10:02:36 +0100
Message-Id: <20221116-s905x_spi_ili9486-v4-0-f86b4463b9e4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_010252_148040_39FCCE1E 
X-CRM114-Status: UNSURE (   8.94  )
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
Changes in v4:
- Removed NAK-ed patch from patchset
- Link to v3: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com

Changes in v3:
- Added trailers
- Added new patch to use drm_aperture_remove_framebuffers()
- Link to v2: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com

Changes in v2:
- Removed SPICC patch
- Reworked commit message
- Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com

---
Carlo Caione (2):
      drm/tiny: ili9486: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers

 drivers/gpu/drm/tiny/ili9486.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)
---
base-commit: 84e57d292203a45c96dbcb2e6be9dd80961d981a
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
