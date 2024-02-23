Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685A5C54E4C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 19:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AkEb2g1ve7ZjfEwD8F9VDdrPCkd+aDwtl9A14XL/Qvk=; b=O+1e+TWyNVakqw
	7Tt9W+NwFSnqMl2jzk23TqahDlUsrziYotWxZIjrc2jVl4JgdHSo2d8cFtOVCmROw9GqA3amSwW5j
	X4gRiCqJtHMB2le+nef1GrRam5WrFyyS+5xlo5KicziFfdvXzcMZADJwPXTMsLQFtUqdfsRr+gC/S
	RwfkF2IEargL4FdrZmJQCeojjPDeO41X7b9G/ZRy1HOprut+F3yBmUoh92jGkB9xUF4ddrssHmchb
	wNQEwssBAEMpLhR+baVqDsi2YPCUZLlW4pmiBZ3qiQuYX07ii3Udwa0+mLl9JtbzOks5aUYlna75t
	KgDnTUn+gaX7NlOIeLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdatN-0000000AxSv-2jTA;
	Fri, 23 Feb 2024 19:07:29 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZht-0000000AdfT-3kJI
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:38 +0000
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4129738cc81so3877825e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710681; x=1709315481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yu1bwk/GIByUriwvGbqNE3H0ftJWcJoKT333Tzyi/Co=;
        b=K6s1hwhLhzk0HcI3UjM1J7jzpKFHWorFutKJaWzTQLp6gDva7OwGVZC66ZAsz1GfRn
         LxD8cKJk7BlJ56gg6B2nfm9xW9SFpQeCZT1EV/YVPHweLn/Pu4oL6qPVTF6uezcC9Uiv
         wFGXm7g/Po9Ti/B8dwEkv2i1OOTSivsziqyCcxgf3UK2oS3SgUINYCSehq9QMrPBC89b
         +1T51vE8BTPwwG06N+ycJwgO4SCbZB/aPmf633CWUutEIc8L/xAxW/Orexf5oUAbKOOn
         Hhc5B0kPRwAS3lnKuLjrXekwqiw2GW07PQmLKeHWOvIK1Jra57Cio0gamhl0yrLppk1G
         Oizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710681; x=1709315481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu1bwk/GIByUriwvGbqNE3H0ftJWcJoKT333Tzyi/Co=;
        b=M7i6yxHJ4PkNQu+hv9n9YGtO/dXUKNytW8aFkjMQKj+Xysld1/jBhbTaPlwLY9PtW/
         Gy8mWq6srbkdFmuHVnk7Zq/Tr62e/0WTn9ivngqZrPwBM81/rySL90sycl93ia/hsVaw
         PLErhSqI+8N6HsdBE8hsUsLyHi7wJ0mNSw6X4yv8IyRrJXL1nGvUs62qAM8kY1FZ4YWY
         HXEkrS7kM8fNTJRHkDEiYyAqM87xjjNTvsAGjuqwo5bDPX+oKJe9tx55nAQ/CdhlEMwQ
         MkXhd0f550JpBd74jwTBizNTW76kH4u5u1Qv96v7Y00beUB5NyppR7Gk2IDpHvw5PScY
         JRtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpuc42Kp7AvQITsn7mGortvh8Unx7xC8fNak1BCtDPtztKvJAWao0u/JDHlVp/BO5e87N061yd91b0hq9Ubfe+TSOsYD/buMbWOtzs0bAJVUE=
X-Gm-Message-State: AOJu0Yw1exSdjmQK8qRRJDVKnZE2BRLvFxro7m1sAlanRIUB8lcZ36wa
	peNifYoRlYEuh5gcCIpigmlesEIHIlNDaJ3UEooGrUycNPFoaa0SpHLpvJ4JNIA=
X-Google-Smtp-Source: AGHT+IFkYJrBJtukK9q7sO/gOkuklYt7sfbCdKw6TBDgo/yenxFPlAQU3wk00xs7vV/eLiTHDjjHeA==
X-Received: by 2002:a05:600c:1e13:b0:412:94b6:bb75 with SMTP id ay19-20020a05600c1e1300b0041294b6bb75mr362379wmb.30.1708710681574;
        Fri, 23 Feb 2024 09:51:21 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/6] ASoC: meson: axg fixes and clean-up
Date: Fri, 23 Feb 2024 18:51:06 +0100
Message-ID: <20240223175116.2005407-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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

This are various fixes and clean up gathered while working on Amlogic audio
support. These help better handle higher and unusual clock configuration
for TDM, SPDIF or PDM.

Jerome Brunet (6):
  ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
  ASoC: meson: axg-tdm-interface: add frame rate constraint
  ASoC: meson: axg-tdm-interface: update error format error traces
  ASoC: meson: axg-spdifin: use max width for rate detection
  ASoC: meson: axg-fifo: take continuous rates
  ASoC: meson: axg-fifo: use FIELD helpers

 sound/soc/meson/axg-fifo.c          | 24 +++++++++++-----------
 sound/soc/meson/axg-fifo.h          | 14 +++++--------
 sound/soc/meson/axg-frddr.c         | 12 +++++++----
 sound/soc/meson/axg-spdifin.c       |  6 +++---
 sound/soc/meson/axg-tdm-interface.c | 31 +++++++++++++++++++----------
 sound/soc/meson/axg-toddr.c         | 29 ++++++++++++++-------------
 6 files changed, 64 insertions(+), 52 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
