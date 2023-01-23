Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD2C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g75fbAn9NGIa59sv6EnJf0RlpEE71VxcGP6bcXk0rgw=; b=D3NL2cAN4IiKvu
	4Gn1wWoauKZhgevzP4urLaBy6YfCOIZfXR61Cuzr4qxCrvX047T//K0NgfDRrFJbWibjQYS4Kf8Jp
	YRJ2IIUcl1Ir/cLRHvS4gmG948/YpZlqGfmYevta8ojZbMe5tLq6v7R6eLwaOBfbMKIAlK0PCYRfm
	1UBqMaCYFtPX6IE4qZ/a+tXoWaSFZ7aCLpAtED5TarLYXhsXCXUJ2TafyytAMGp/cy78cEjhVCL31
	G9EBvUZ3yc5HXuwNzVnQgRred3eXSMs1ymmGqEg0eURfHyJBfPmD9NkiW9FJXWlX2J9LxvjUREH9t
	LqfTwcmzbpSN7YnZOsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJwv0-00HMhw-Ci; Mon, 23 Jan 2023 13:31:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJwux-00HMgZ-Ls; Mon, 23 Jan 2023 13:31:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k16so9015805wms.2;
        Mon, 23 Jan 2023 05:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IiQpuXpBb4cBOqCMVo/w9+06S5nTuiyPXun0t7GmDww=;
        b=NVK//NF+MovBPm0sYrlCXYaPcNA6vLY38zW+/h3NHzA6cTR+clA2pTzSaa0eB//Lfr
         g+3wN42AqhsFLlUMyBzD6JxHcLfBNgYwDbTzvwGY4YFTE3HUUsc/fk7ETR56/SirG2QL
         sKwabKDl89npx3nJYFBb2puRkwZAl3tDD/b0Ukqs/j7MbwPWJ2XxvwA6M8KK0bGqr1pY
         bC9T4VN+R1b22TegF+q1maCF1LLfsX60d92+Go7aVizwUYZASA6CNDVNiz8vlq3TeAPl
         9pK6gXWsLJA5vd/8nPQWf6OAn3EyYy5mwFjHiALVbdro2fT7SjXnMpEydhzJNtOzTr8R
         gk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiQpuXpBb4cBOqCMVo/w9+06S5nTuiyPXun0t7GmDww=;
        b=RyX26hUi0YS5Uw+VUjx+6AqJD5x9wWqplNU3R1xvwN1AjObQlCGaWIQNth/KTqjyQF
         Dgz/yOmaU7Ja1rMeD62cJTl6BqtUknks1/fWtcvNw57WiVx3Qys4oZWbBj1xx1msOdrD
         z4vKenmDZ1B3XOqviiLK3+akazRzem1nVxqChBl+AsMEydMOyFlcNcTiCgdmBjON9ELF
         MaFgW/ToJhePRHltI4NxwZ8vVRuOIEWLuyNLQAZsDDpbt9nGIP6TwopSxYoJDohF8Nt/
         8qjeik82z5mgR5V9lxGXiLc0bOCl6tTjLgQYqePrNDy1OzO5DW4C5HG8lYXrZIWpJuiL
         1OHw==
X-Gm-Message-State: AFqh2kri0nDHEKXDic7tEkAgq91204MsyOR3DS7NM7W1T7OPBiXn2R0C
	nuM4oMY9UHmQzTAullLL3xs=
X-Google-Smtp-Source: AMrXdXvI5gYLj1NVCeuWSquycOAxs42i3j7nSK8uG5+v84VTM6E2hQJuJhbaAb1h+jgfeeiba/O4Lw==
X-Received: by 2002:a05:600c:5d1:b0:3d0:761b:f86 with SMTP id p17-20020a05600c05d100b003d0761b0f86mr24205469wmd.28.1674480678338;
        Mon, 23 Jan 2023 05:31:18 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id d28-20020adfa41c000000b00286ad197346sm4199253wra.70.2023.01.23.05.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 05:31:17 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: meson: vdec: add HEVC decode codec
Date: Mon, 23 Jan 2023 13:31:11 +0000
Message-Id: <20230123133113.3254659-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_053123_751942_A3E0768C 
X-CRM114-Status: GOOD (  12.46  )
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

This mini-series adds support for HEVC decoding. It combines the original codec
work done by Maxime Jourdan in 2019 [0] and improvements by Benjamin Roszak in
2021 [1]. Only GXBB/GXL/GXM are enabled as decoding currently crashes on G12A
and later SoCs when trying to decode a 10-bit HEVC stream.

The goal of upstreaming the driver in its current state is to encourage greater
community contribution towards adding missing features, and fixing the bugs and
conformance issues necessary to get out of staging.

The HEVC codec presented here is generally partnered with FFMpeg sources that
are being maintained by the Raspberry Pi Foundation [2] and [3] that contain
numerous improvements to v4l2_m2m (and v4l2_request) support. There is active
work in progress to refine the changeset and send it upstream.

Christian

[0] https://github.com/Elyotna/linux/commits/4.20/v4l2-m2m-pr
[1] https://gitlab.com/benjamin545/linux-amlogic/-/commits/aml-hevc
[2] https://github.com/jc-kynesim/rpi-ffmpeg/commits/release/4.4/rpi_import_1
[3] https://github.com/jc-kynesim/rpi-ffmpeg/tree/dev/5.1.2/rpi_import_1

Benjamin Roszak (1):
  media: meson: vdec: implement 10bit bitstream handling

Maxime Jourdan (1):
  media: meson: vdec: add HEVC decode codec

 drivers/staging/media/meson/vdec/Makefile     |    2 +-
 drivers/staging/media/meson/vdec/codec_h264.c |    3 +-
 drivers/staging/media/meson/vdec/codec_hevc.c | 1463 +++++++++++++++++
 drivers/staging/media/meson/vdec/codec_hevc.h |   13 +
 .../media/meson/vdec/codec_hevc_common.c      |  161 +-
 .../media/meson/vdec/codec_hevc_common.h      |    3 +-
 drivers/staging/media/meson/vdec/codec_vp9.c  |   35 +-
 drivers/staging/media/meson/vdec/esparser.c   |    4 +-
 drivers/staging/media/meson/vdec/hevc_regs.h  |    1 +
 drivers/staging/media/meson/vdec/vdec.h       |    1 +
 .../staging/media/meson/vdec/vdec_helpers.c   |   44 +-
 .../staging/media/meson/vdec/vdec_helpers.h   |   10 +-
 .../staging/media/meson/vdec/vdec_platform.c  |   37 +
 13 files changed, 1678 insertions(+), 99 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
