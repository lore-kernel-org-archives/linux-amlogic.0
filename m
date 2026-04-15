Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1767DF43830
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPfor9Qb9IGBhQfOA8NkMCTpeqjuAJlXj4wB8WXV4iI=; b=X48tUxeRPPlkX5
	vipa4mtqoSvf7dTks2h+ysCR1PyIewwnwBoOx3D0htk4et3nLGxmRe5FoYGKAZjPYFCUMtt0R46I2
	WK8KTrv4zwXmVsZw6GPy+Wwdkxp5TcRUQXX/D8VyFcO9PT6f8/DTS0k2pKGLyfB4qtiK/IKGFAcGc
	KNgBMyUsrTrLs6sy0eZq7ttnuq1dfyGBSSX5GRdkMt2pAYeGld4xOfmeuHhVgKx2fiV88hoVQ4wCN
	udO2VgajH24SdL9dhyaYJTNGQ6SZMUyJ1ipJIcOHJm3vYB0yl0bxkrXLmzVJwOcCUW0LessqR2dpI
	tGO3zBjSnmEOxFzOHiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Yl-00000001GCO-3LqL;
	Wed, 15 Apr 2026 14:49:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Yi-00000001GAx-0lcH
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Apr 2026 14:49:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso70734685e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Apr 2026 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776264578; x=1776869378; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=;
        b=hnwJd59LYICMyBlzY2Q/+GBuKYifhgdyjkZiBKJhGBvLvn3hgxgvCxoU7iuIKv+rYn
         bDXcT7z7UewBlqGxPr3UNGCyyuWR1df3kC3GN+LP68NFKxgnZcHLdSQlxiaiYqzmzTLu
         X4c/4nVriVCBatKlgsfb/zAwuuKpqxnkAH1dhuhbguQKrZ+gOf5b4qoUIfL56Ce8sHVg
         IUq2M/NEJJhrZdTdA9FAE7I5+sRufTffmFQ7ex6541/u6h8sf2vN6rc03LCw8GGBXbzE
         W4hFB+Zw2qZil+MxxKzRcE1TZRa/9CO24MuKRPpm7RvkaPVlXWS9o7Aihkp2XyHvwT4g
         cg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776264578; x=1776869378;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kouBoqr6P4jG+Mv6vuyl0ITjsMQHgxhlf4XzCxyXCno=;
        b=YBfgDIW/7kCDL2b+kJ9nKa7WTGz1dGTD8KsSyoR1cUjJu80xqZo22U5b2pMfeyykEu
         YBEg2Ms5uM1FirrvxAm/JHkQL2AAqfVG+aQGLiKLSvmv9rzx+knHUjcYOnj9jt2Ph6rp
         5fbTn6u3d/5XsfS3YHHjOcGmT7OEyF9lPXTL9VtrXMfFdDvSnMveAqZZdvEp/C+ePFT+
         g6tCzwYGJ2kK0uAsWCyNcYPhd5sHWwIMWeaYxHmLUSqHxS5QJVcsM1hjPydKIihhoON+
         bzSslbAv+2ezFjtTPiymAl0AN73hvYhrekUMydZUQ14JNfEMeAkp9OaMk9Tc7cdkbNjA
         /mLw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZhbkpP0eueK6YbtlcUVNHFpubaE6ZqByeqPlNRBFt+jBjBaAwviuhUYhYFU0QOj+0xxbfVSfgIJMsn1m4@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ9hzC9saoyfiqOaLfIs/DfSaTtCuSPzDpJc4OCar+gSHRa5fb
	AKGLD4mWa43SRq8HIqE63ntTgEl4nr2QY7XTLOeIEowbgcmmOH2X/N2kLGL+Qx6+y5M=
X-Gm-Gg: AeBDieuoRA0Z5m+nXvTvQpCR1Nyx/AQSVWe24xT1UKZDzWpjk0zuEk3oQlAnk1EAkje
	T4HkZAIS05mT25+EXhOGlUi2pbDpYQ0v9nL7hDL2+l3QqkgR1ceogmN843Yt/XSj+Nel90PU/15
	tshboX6tVWjo80Evz9pBwPvs+Db/NO4jmQU6Kam5spMSi0jfed4j4ZfBKg9Qxy/2YXe5gyQt2xk
	QuE5/ruQKjSJNY4aiEx+L/z5qgGwO7uqXcfnJiXxRBb0S/WrtTT261ob/N0dcBh2ojCIoyb5pIl
	H3kBAXdsRdW5txZYJDP6PG0q0jyrXqlQBQlAoqtOZ3Kk5FxguXDZrILh+QfKJ5BMEvJn3gSjk9y
	/BY3iCcrHKS+WQPMDC93E/WASHjwV6X0CGL6kGMq5pkTkRBLUnHdHY6g2n4hg2MpTfIegbjADmg
	o4CQWs/hnX1jvoM8sfBDGV72/l1FHR/lnJ
X-Received: by 2002:a05:600c:871a:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-488d67f0b8fmr318861465e9.9.1776264578172;
        Wed, 15 Apr 2026 07:49:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e64b:985d:5292:5ef5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488f095e68dsm38307595e9.2.2026.04.15.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:49:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 00/11] Add support for AUDIN driver in Amlogic GXBB
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com> (Valerio
	Setti's message of "Sat, 11 Apr 2026 16:57:25 +0200")
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 15 Apr 2026 16:49:35 +0200
Message-ID: <1jh5pcs2gw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_074940_239933_34A9C663 
X-CRM114-Status: GOOD (  33.38  )
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

On sam. 11 avril 2026 at 16:57, Valerio Setti <vsetti@baylibre.com> wrote:

> This series adds support for I2S audio input (AUDIN) on the Amlogic GXBB
> platform.
>
> It has been largely reshaped compared to what proposed in v1. Instead of
> adding an HACK commit to allow AIU to export its clock so that also
> AUDIN can control it, now the design closely follows what was implemented
> in the Meson AXG platform. "aiu-encoder-i2s" becomes the shared interface
> for playback/capture and it controls pins and clocks; data formatting
> is implemented in formatters which are named "aiu-formatter-i2s" and
> "audin-decoder-i2s" [1].
> Formatters are DAPM widgets which are dynamically attached/detached to
> the streams when the latters starts/stop, respectively.
>
> As of now only I2S input is supported, because it's the only one
> I could physically test in my setup, but other input sources (ex: SPDIF)
> are also allowed according to the SOC's manual and can be added in the
> future.
> This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
> NXP SGTL5000 codec connected to its I2S input port.
>
> Since this work brings GX platform very close to the AXG one, once this
> series is accepted, follow up work will be done in order to unify
> GX and AXG formatters so as to minimize the number of implementations.
>
> The series a bit long and it includes changes to drivers, dt-bindings and
> device-tree. Of course this only happens because this is an RFC and I
> wanted to give a full overview of what will be the final design. If no
> objection is raised, this patch series will be split into 3: one for
> reshaping AIU and introducing formatters, one to add AUDIN driver and its
> dt-bindings, one for the device-tree changes.
>
> [1]: Different naming for the aiu part is related to the fact that
> "aiu-encoder-i2s" is already used for the interface and the goal
> of this series was to introduce the minimum amount of changes that allow
> I2S capture to work. Renaming can be implemented in the future as follow up
> activity.

Thanks a lot for this awesome work Valerio. I know this was a lot of
effort. With Mark and Krzysztof comments addressed

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

For the next revision, I think you can drop the RFC tag and split the
series.

You have spent a lot of time studying the existing amlogic audio driver
support. If you feel like it, you could add yourself as a reviewer or
maintainer of the Amlogic audio drivers. :)

>
> v1 -> v2:
> - Reshaped design so that GX platforms will use the same design
>   pattern of AXG ones. This helped removing the need for an HACK commit.
>
> --
> 2.39.5
>
> ---
> Valerio Setti (11):
>       ASoC: meson: gx: add gx-formatter and gx-interface
>       ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
>       ASoC: meson: aiu: introduce I2S output formatter
>       ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
>       ASoC: dt-bindings: amlogic: add schema for audin-formatter and audin-toddr
>       ASoC: meson: gx: add AUDIN I2S Decoder driver
>       ASoC: meson: gx: add AUDIN FIFO driver
>       ASoC: meson: aiu: add I2S Capture DAI
>       ASoC: meson: gx-card: add support for AUDIN FIFO
>       arm64: dts: amlogic: gx: add nodes for AUDIN decoder and FIFO
>       arm64: dts: amlogic: odroid-c2: add support for I2S audio input
>
>  .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  |  49 +++
>  .../sound/amlogic,meson-gx-audin-fifo.yaml         |  63 +++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  32 ++
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  34 ++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  26 ++
>  sound/soc/meson/Kconfig                            |  17 +
>  sound/soc/meson/Makefile                           |   6 +
>  sound/soc/meson/aiu-encoder-i2s.c                  | 219 +++++++----
>  sound/soc/meson/aiu-formatter-i2s.c                | 106 +++++
>  sound/soc/meson/aiu.c                              |  37 +-
>  sound/soc/meson/aiu.h                              |   4 +
>  sound/soc/meson/audin-decoder-i2s.c                | 218 +++++++++++
>  sound/soc/meson/audin-fifo.c                       | 432 +++++++++++++++++++++
>  sound/soc/meson/gx-card.c                          |  14 +-
>  sound/soc/meson/gx-formatter.c                     | 304 +++++++++++++++
>  sound/soc/meson/gx-formatter.h                     |  47 +++
>  sound/soc/meson/gx-interface.h                     |  50 +++
>  17 files changed, 1567 insertions(+), 91 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260410-audin-rfc-243bcbf95e43
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
