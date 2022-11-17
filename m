Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C7EC43217
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vs+z+CNFFqR18Uhb8IsYoTaY9PBLGLkEHZajwcrTntc=; b=B998mz/vM8oV/r
	hUiwudledgxUMFiHgGTU1nG6bS9f2alE2LFOOP9fYUUXOF8xIZqDK8gz4JQumuXdLl3113/NCCB1Y
	Y/kDhipVRsE5rjurYu+wgqzopVGJTFRYRFq6Cv4h3yOF6ts7H1/bpI/UjhLjsm26yBIZbg2xqHQby
	KdkhpqRFLBbBTSzfIja0SNtuXFC7wSQl5Etemrm4heZonBS4R0MBarGMoehn1/SWaZ0Eij+4xnSqX
	Kw0TyePiqigsjWp6lNA6JGHSC1OBYxrIkUsoq/JKoSX275/JL8mbvaC+4I/ni0phuweF/UfTkjaXy
	RssNR9h8n/bjFmNzzcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaZ0-00BoJt-1Z; Thu, 17 Nov 2022 08:48:02 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaYv-00BoCW-Sm
	for linux-amlogic@lists.infradead.org; Thu, 17 Nov 2022 08:48:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s12so1536531edd.5
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Nov 2022 00:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=5sycVuNTi+/lWP5w5Y+7Py7HL44YtQg/RIL/+2UUkSY=;
        b=LerjEkGDet8twDf7kawTGEK6yjpahMcCxhAgmIj+Uhp5Y2ToZA2vL105irqZLSsKfU
         c+LQ37p+1ejyh2oDDCwlx+71iys9g+yYbxQOSVTdRIPpMZKMebD3L6vbY7xvoYTj2ysA
         dA+1tq50hVlm9jtGhn6ygV7yQvatY5f62oJr0EllmSAhG1qR9mcE7PHFmrOHZLF2HrTe
         NXS/KTJ2K6dBfbV5Zar4Nm8GSb5Ol6M2VVfam7vqizfUetbz5uvxzdbINt9a3yc7z/yl
         RJqyEWRb93Q8tblau3bK9Yl/7ROUCkYlh+IeZDpHfHy3HSWP8vcLEJ/nu4cLNNs3gNDH
         K6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sycVuNTi+/lWP5w5Y+7Py7HL44YtQg/RIL/+2UUkSY=;
        b=GhwiQLgA0m1wNsRnxWs3MqMlNDgpd7/Al1K18rxH0h5tEplmo8+O70iUrulNRcxux+
         hZGht+FFUr6cPUga0YsNuFrsdVtF9PUkMA68rZW4EHCy0GAUQ1uQP7sn8XzMJSHCbeEs
         5mVwRFa0eDsiCWyp12M3ztuury50bYzePvCKSOsKG1gPqk4xJHvKoX4JUqjZ/az8fx0b
         jj7CVzTpCQr6O3h+f5KkO5CGGDnhQThoPWPgP0sP/84BrHQ8/EieYlELOxJ90ouTos2i
         s9+/lDPczLKjW0gr20rcv6/3heHNdPeNctXDagoyggR1T/7hqj2dSF8YxuCt4Tby9zo7
         i2GQ==
X-Gm-Message-State: ANoB5pljy7c9ZDWyB6z4k/tLazhya/uUPUQcCxUMJxfTfZ4EIOlHD1Qz
	7xkuB6NKTxwQAdMVQwcjrKFhmA==
X-Google-Smtp-Source: AA0mqf7JP9+5lVRU9EXpUjP4FKM/FMDReRATO9BwVt89A/oOf+IKkEbT+OEv6hzjSAn10BUJHykrPQ==
X-Received: by 2002:a05:6402:3895:b0:468:15f1:54b5 with SMTP id fd21-20020a056402389500b0046815f154b5mr1306318edb.8.1668674871621;
        Thu, 17 Nov 2022 00:47:51 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:7a60:27eb:954c:5ab1])
        by smtp.gmail.com with ESMTPSA id s22-20020a1709067b9600b0077205dd15basm77332ejo.66.2022.11.17.00.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 00:47:51 -0800 (PST)
Subject: [PATCH 0/3] Fix SPICC and ILI9486 drivers
MIME-Version: 1.0
X-b4-tracking: H4sIACr1dWMC/w3LSQqAMAwAwK9IzhZMXVA/I11SDZQqDYpQ/Ls9zmEKCGUmgbUpkOlh4TNVYNuAO0
 zaSbGvBt1pjYiTkqUb300u3jjyMsyTMuTHIYTeWY1QnzVCymaT3FFnumP8vh/jeo0xaAAAAA==
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 17 Nov 2022 09:47:38 +0100
Message-Id: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_004758_186240_013AFA50 
X-CRM114-Status: GOOD (  10.45  )
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

The color corruption and the performance issues are actually due to two
different problems in the SPICC driver and in the ILI9486 tiny DRM driver.

We try to fix both in the same patcheset to be able to correctly use the SPI
panel again.

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
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Carlo Caione (3):
      drm/tiny: rpi-lcd-35: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
      spi: meson-spicc: Lower CS between bursts

 drivers/gpu/drm/tiny/ili9486.c | 14 ++++++++++----
 drivers/spi/spi-meson-spicc.c  |  6 ++++++
 2 files changed, 16 insertions(+), 4 deletions(-)
---
base-commit: 15f3bff12cf6a888ec2ad39652828c60e6836b3d
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
