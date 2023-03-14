Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BE5C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 11:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y5YNKL6hqurs8HxPp+emu93NStq64OcZQ5XLeNaMiTU=; b=i+Bq9U0voWm0EF
	euJkVM0e4Mn2+Ydb/9stc2tvaYX5EuIPuAmMYZ/yFZszuh2k+xJeg03eRmZwV8/Hrza/ftsOueZcf
	73KFOL6rKOHmN6noOKMH57s2t9Jfki5l3VZTGLeMJ6pCvqupHrOrOHuFHPi3H+Z8woQJO2EjCSGE8
	+PKRUGlC0wfDwKINYZcNECVLq9NnYws9eSQv79twN49+kfbIqWrwbnO4d+mm7ufxskGdQiCWyfL8n
	O9Kh1kfyr4tzjkLRRTGB0eDbJVM3BlhDArOC3oOIsRK00yDtdPG08+STau670pQMTlO+LwokVDWix
	Mo5mgXkjzggLxJcdkwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc33v-009wca-3A;
	Tue, 14 Mar 2023 11:43:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc33t-009war-10;
	Tue, 14 Mar 2023 11:43:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so3035180wmb.2;
        Tue, 14 Mar 2023 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678794203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooBUhVhCqisZJ8iFuqAxT4qE8PBELCGSQnXBwgwo9FQ=;
        b=jrvesbJQwoSIRLAzVMo01IbkpsdrM0EQDt8iOZB8IWYVcA7NSDtMBnzu4TjhBAgEeg
         RazP0UPxBHxBJ33oJZ2rdAlqN+9sVAN27fVDHEiEtkNyljrAYHRESiRZBJpw+Z7sxUhI
         QEiEPD0dV7sXAy/FGKbNTmKJYpabkxzk1K4tBkiOT0rDeOzXgFZAi7frM8bcOPJW1aKC
         pSrVf2gJo92dg7G9UHS5Vzjt5d5XPSm25BXe7cU9lI9CyoWLg9Wkxq/AlOdWdHJq7NEc
         4zXYNBvCW8oOcZrwdU3PQSWpkZZJxSNagFRiijVAv+JEgM9prPcaYkCxfZYlhm7xOnzq
         wgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678794203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooBUhVhCqisZJ8iFuqAxT4qE8PBELCGSQnXBwgwo9FQ=;
        b=lO1DhcP6ZEHp7R9UAGJKQZ783E6UTiKR9BA2mKRTJiDS1Wq+YNuoJ/tbVNwfsoTl74
         ROp4xlt973+DAN4gU9HRR+jVoHcPR7mPa0ma0Bri3QfiQp5K2LZwtzTCRmaUwxI/qEtV
         YVcQ82mmA69GzJe+EvN2XeXkJvqZ6en05Ddgstadb5EPeM0KpYbYjjQCTw/EpR2RwP8y
         M8NULvPoY9eDFkVTdHtSdMXEFhPQJ6bTc8s/YeTSi3ZkaLaqdcihdRiATMSwlV+uS4lS
         Fc2N5102+dNUocalYJbUApLTB9pU4El6xiLZ2mpqepAl7WfNXn11WpZjMQSo66H9TeGg
         2MXA==
X-Gm-Message-State: AO0yUKXvs5nCgGN7ng3g43Cr44ygXfN8S/XgkrAKGwx8B4xakvFR/Gr4
	n9vND9WtZkNOP7Zh1JAVXBU=
X-Google-Smtp-Source: AK7set9RIIQlNtVhSOoG4lHHjC76XZo3/vmwVv6WFjbYYf+QoYb0pNd1mdUJwo8feqwrICAb65T/Ww==
X-Received: by 2002:a05:600c:470a:b0:3e1:bfc:d16e with SMTP id v10-20020a05600c470a00b003e10bfcd16emr13901241wmo.39.1678794202958;
        Tue, 14 Mar 2023 04:43:22 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b003ed2a458a7asm2710590wmo.44.2023.03.14.04.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 04:43:22 -0700 (PDT)
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
Subject: [PATCH v3 0/2] media: meson: vdec: add HEVC decode codec
Date: Tue, 14 Mar 2023 11:43:16 +0000
Message-Id: <20230314114318.4057353-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_044325_349488_CE0847F2 
X-CRM114-Status: GOOD (  13.70  )
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
work in progress to refine the FFMpeg changeset and send it upstream.

Christian

Changes from v2:
- fix memory leak reported by smatch [4]

Changes from v1:
- Fix unused val warning reported by kernel test robot <lkp@intel.com>

[0] https://github.com/Elyotna/linux/commits/4.20/v4l2-m2m-pr
[1] https://gitlab.com/benjamin545/linux-amlogic/-/commits/aml-hevc
[2] https://github.com/jc-kynesim/rpi-ffmpeg/commits/release/4.4/rpi_import_1
[3] https://github.com/jc-kynesim/rpi-ffmpeg/tree/dev/5.1.2/rpi_import_1
[4] https://lore.kernel.org/r/202303120441.YFGHDOya-lkp@intel.com/

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
