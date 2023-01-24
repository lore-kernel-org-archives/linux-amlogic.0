Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CBCC25B50
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 03:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HFD24YUKRkMmQztDO6Ewfh6peu8HvVp+3mQwUHw7Ne4=; b=f4H9fSujuY1OS5
	5Q0832PHO24SpI/J9B6Rli+BdiZF8ugZ4zi8Z4JA46/0kRkCwOxLSExYEn+0ddLdlhrA384s5AAAX
	mFrOzGgJYd0FQGFZHi+pJJAGg6/t3eSzQDY+8ibTvapQjdExkXumU2wUddsF3dMmibZ/vWG01AoWn
	r1gRGan2/sLHXXEgW/Kw67UMuNVvW8yF+eROrIQB9E+0ePB4ctJrbjMvl0echkOGVEFf24agJp4Qi
	nZeOlTsFGii2S+yYyrNK9rAFa44OvTyjeeZ056ergeC7q0/uPgLO7oHjGLNGjS1mvObbqNgkuDFQJ
	xN16442iLMMP49ZrY+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKABN-002BMH-Gx; Tue, 24 Jan 2023 03:41:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKABH-002BKt-Qx; Tue, 24 Jan 2023 03:41:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id g10so10477199wmo.1;
        Mon, 23 Jan 2023 19:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YW+j1R20ctI265KRNSOjTxDVRq8qUoJJnec9sKEjc5I=;
        b=QacssvAIDku6BBhYk5HElUe/kzNss/+aIhsXY8hmtP+KEGGe0qI7X/+MARPfamJwAG
         XTJv6wtwpO728nUqacxcsgC6T+eb6lhvHJ0CYT6lueg7SxxPxerA5cUQpG2bW1Z0gUtc
         cvoSwfAwwTV4aj6AoRr2U0gHPXzOD4uU1zzA4lMS4oPxChIMfV10Sjiolq4gWqJlMYjw
         Z3OjZAB8PT0sG0yaVwhd3wvFQhTrZLyGXcoG5WLLngsfV294biZZN1UwZ49JONXK2110
         y+M9mg2tjE/kX+UF9AhnUHty3WbhGl2dtlY5PainLNb1LsDhn2HGMt5MUmor3rYFKEza
         q0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YW+j1R20ctI265KRNSOjTxDVRq8qUoJJnec9sKEjc5I=;
        b=KGfXCdnwRLM7D64P+rgnWO3BKiw0qwQr9p3mM37tqfA/rqwToJQQbp7BZ5oMSq3BuY
         KM657q23UQklviJJCejsuKA2dQVUPauoFdpdSAjk79F3iMFDoc+I5w1hH6dNeBQBz352
         /NGdaERTrDxHiIA3E/ThcHfTPuI18y/JNIqBHeijWcgGAzr9ezmWwVLWQvdqTpTrO/lN
         g7bzyH2iToqfY7WApBbDrtz+1G9+PewI2dDxBa8LX4whodBvoZ/1CI8Lo18Fr+5ZaTTW
         UBLzFIfDnIRgpcrM+kDxtqEgGq2w7/QFlijCiAAZPHerADkw5xeyRJw4qLW+lWvmX9Uu
         GsuA==
X-Gm-Message-State: AFqh2kpj841j5bl1W9fr9yY4J/UQBepEtZpZqBgLMFKExvEHnJCgh4Kj
	0mR9B/e8+n/L6VyeEc575S8=
X-Google-Smtp-Source: AMrXdXtpg88sRjLNXZmZB6PBI4TM0NJziEBJ3T2qGyFoH8GRcylSlT26sY+YVnwuzJOACkipiigiEA==
X-Received: by 2002:a05:600c:ad4:b0:3db:11d0:21e2 with SMTP id c20-20020a05600c0ad400b003db11d021e2mr22920790wmr.29.1674531663179;
        Mon, 23 Jan 2023 19:41:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003db012d49b7sm1085132wmo.2.2023.01.23.19.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 19:41:02 -0800 (PST)
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
Subject: [PATCH v2 0/2] media: meson: vdec: add HEVC decode codec
Date: Tue, 24 Jan 2023 03:40:56 +0000
Message-Id: <20230124034058.3407235-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_194107_913183_5E545335 
X-CRM114-Status: GOOD (  13.86  )
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

Changes from v1:
- Fix unused val warning reported by kernel test robot <lkp@intel.com>

Benjamin Roszak (1):
  media: meson: vdec: implement 10bit bitstream handling

Maxime Jourdan (1):
  media: meson: vdec: add HEVC decode codec

 drivers/staging/media/meson/vdec/Makefile     |    2 +-
 drivers/staging/media/meson/vdec/codec_h264.c |    3 +-
 drivers/staging/media/meson/vdec/codec_hevc.c | 1462 +++++++++++++++++
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
 13 files changed, 1677 insertions(+), 99 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
