Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD06CCF2DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l9h5sw9kH87arrbjjZZx7Gc3VLupE3IwAE3RDym/qRs=; b=zVV0yLuLPN8ngM
	QGxdxzzuJRFEq7Q8vjd8Hh1FIkQiBMvo8EogaiGJ7AnRxq71IQARRT7HPKdDeLk1gHkWcqlPwvfGd
	XchMKPud4/cTF3R123Yuyq/rw2gPJs3qMW5YKjpfNc6f+rszmKZygvvTf2A1NUfvfQYmPRfDTkM8v
	xGbLaPqHYWMV98ytmCK18P3jNfoJo9Ob77J6MDfnMR57ttimLVyrAkzw2qCbGq6L1gejrDiGmEgKK
	aTv1sFxH3V17OLt61HbuCidTjKcOMB6S+OismTl1IK0qd5hQsiHdsJkpoosUR95KcRrjpjxbJtqlL
	4WHTMxX5I1HnUuAIuCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmhH-00000001nEY-0Svz;
	Mon, 19 Jan 2026 10:41:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmhD-00000001nAw-0npl
	for linux-amlogic@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=l9gn8n87XJ5T0VI7Qxiz0fxtpXeAFOD0jhdWC60Um7U=; b=q1FpkgrhVeqJn922/EdFnSguzM
	drM4/N4OJP/E7yGctTDifciqiFaiMtfKj20oHvMWzUtcTB8ea03nqsEZ9J290viAEwAfkHQpUTzCs
	3U2vxN7JvE/nAu7xNcgRf2qivCt8F1pUZBmLob8iPgB0EYni11yxjfXdvXTm5OuRJWSjDKL415bwM
	wyrCc1wfENs3t8wZTXj37qjcwzjXhYBhoacO+BSNZ+3XLDXTU/ykrfACXuBZWPAe+MwmufhLzx+5L
	y2yh0inOAPuQ47QjnReMqNY4JtVijcN6lfk9Y7KzYljvLUm+3UH6Ff7pdDb0Yh8b2Oox/bJ2ayO+v
	WTLR10hg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmh9-0000000Bsnu-1nBl
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Jan 2026 10:41:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-430fbb6012bso3327741f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Jan 2026 02:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768819273; x=1769424073; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9gn8n87XJ5T0VI7Qxiz0fxtpXeAFOD0jhdWC60Um7U=;
        b=vN8pSRQu5pVksYWnv9RiUbIPa9VMCPaP2i9HBaZvuye6DAdDmZVfXd4GWY8EBinHQE
         7tUtqRneNnCWZOQnnhsdDeXYjZV/RMNuPgB6zvRCiYwqJuvnvAUiSad0oxJ0xeZdwAsl
         cYpAjiX6CGrmuvUY0trbI2Zt0mhWkw8YZHkzr/a2lMQZW2MV4w9GQgOSlZi81LXsz1cK
         /1dKHa1+Wy2+pO4pFQ6YEo6iFMsk9nxzA4J2HmUijfXjmljQGNfq7YZpAriDN4st8URp
         QAJKseuqvZ81LJnI4jA9wL67bVLSGsBFxqtKHKS3kePOLzjs0dRo1Qpb63T32mOBUGLd
         pxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819273; x=1769424073;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9gn8n87XJ5T0VI7Qxiz0fxtpXeAFOD0jhdWC60Um7U=;
        b=fDbqEbivXwc6UbPSQXoQqjTlOvslWPjyFDpL1Mhj0Tc8sWdSOrQ4NpAUnep/5Ko4o2
         0YDqM2WauhslfztWKFj1RasBf76kPBbyYgYUe8M0j9HYR/FFcKcSjWUa61ycVZ+AAOQC
         aqkuNO9/1wRPsrQBgyuD9lG3bEIbKpfrVuKaCF1UwSgLMkueIIBndwqkILgJIsLUrkxi
         tsKj+KGaPbRvkfb4xx2WEKwtsN0ARu6aN6R1Bm8NcA4dRAbNjj4GxgEfpXYifbcRpOD6
         cDBawn1odNZcVc6c66DezJHN/iACsvcVa5eIv7vfywAoChANDSI9sU7qQo7i7PlwMlhI
         MotQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRBIiNuz/FOs97TtWruSg65kK5HAk2v/Ix82SdIxDFZYPMl99pcqzES98wfPs/XX+Q5q2FwoMZwSXajB4v@lists.infradead.org
X-Gm-Message-State: AOJu0YxUfd27HLs/GvkAnKAZVnZCuPF+YUdfOrpKdsCqvQ9ocztLQNWP
	vWSf39ahPIRVjdcQ1bFgx6EKarKQuzCefwZ1oVzrmlXMcSGFhP4LPCg0xo6bNm1CmtU=
X-Gm-Gg: AY/fxX7tyuQf/ElXYjatpxhktJRaNeNlDSAGXFSZjc/5M30dXrs8QPTbwDtx5SmusD9
	HFN5DQpOmQ/5T35XsHHjexmqY4WRP9LqVD8fPkBO4FZS53nOy8DB8nlzKM6XHcWXIqe5Bzl6QkC
	g0KJSInlI9VtismeTCTQr5tNFBms4m8sgUwdNrv6h0llpo1/AvPMb98JPFWuULjfalYcIBYFiZL
	dl8sTD6W/a9tbnQmJQrXPAEUCEMisTaoNxymfBnph/r5IN1Iu4g20rrtownZCn32IE0LU3vEfvT
	INyszf/sdZkv8CK2BvvH11+D0+cpkJX7GmW9/92ir7ch1OPK3KDkQ9Q37l7erXfvqRCoK4wxWHe
	dhE4Bk/4jkCz71fR5ZhQ9Y/tQQrw9vkp+rqVfbEKNNwCmWK91uhu9/FhnqzgWDKmeQ/zFL9QIy8
	DqVxzbzFzNUTXqW+GaxKU0
X-Received: by 2002:a05:6000:186c:b0:42f:b9c6:c89a with SMTP id ffacd0b85a97d-43569bc5a34mr12693121f8f.49.1768819273243;
        Mon, 19 Jan 2026 02:41:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:4154:6ad6:c781:df9c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4356997e79asm22422921f8f.33.2026.01.19.02.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:41:12 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.20
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 19 Jan 2026 11:41:11 +0100
Message-ID: <1jjyxdvq9k.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_104115_536362_C9F15C2E 
X-CRM114-Status: GOOD (  10.49  )
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


Hi Stephen,

Here are the Amlogic clock updates for v6.20

Just fairly usual stuff this time around, a new clock controller SoC
support, a few clocks added and some fixups. Business as usual.

Please pull
Cheers

Jerome

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.20-1

for you to fetch changes up to 2fe1ef40b58c2256f4682594f48bfbd584501ec5:

  clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro (2026-01-06 09:52:21 +0100)

----------------------------------------------------------------
Amlogic clock updates for v6.20

* Add support for t7 clock controllers
* Add video clocks on s4
* HDMI PLL post divider fixes on gx/g12 SoCs

----------------------------------------------------------------
Chuan Liu (3):
      dt-bindings: clock: add video clock indices for Amlogic S4 SoC
      clk: amlogic: add video-related clocks for S4 SoC
      clk: amlogic: remove potentially unsafe flags from S4 video clocks

Jian Hu (5):
      dt-bindings: clock: add Amlogic T7 PLL clock controller
      dt-bindings: clock: add Amlogic T7 SCMI clock controller
      dt-bindings: clock: add Amlogic T7 peripherals clock controller
      clk: meson: t7: add support for the T7 SoC PLL clock
      clk: meson: t7: add t7 clock peripherals controller driver

Martin Blumenstingl (3):
      clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
      clk: meson: g12a: Limit the HDMI PLL OD to /4
      clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

 .../clock/amlogic,t7-peripherals-clkc.yaml         |  116 ++
 .../bindings/clock/amlogic,t7-pll-clkc.yaml        |  114 ++
 drivers/clk/meson/Kconfig                          |   28 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/g12a.c                           |   17 +-
 drivers/clk/meson/gxbb.c                           |   23 +-
 drivers/clk/meson/s4-peripherals.c                 |  206 +++-
 drivers/clk/meson/t7-peripherals.c                 | 1271 ++++++++++++++++++++
 drivers/clk/meson/t7-pll.c                         | 1074 +++++++++++++++++
 .../clock/amlogic,s4-peripherals-clkc.h            |   11 +
 .../clock/amlogic,t7-peripherals-clkc.h            |  228 ++++
 include/dt-bindings/clock/amlogic,t7-pll-clkc.h    |   56 +
 include/dt-bindings/clock/amlogic,t7-scmi.h        |   47 +
 13 files changed, 3180 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/t7-peripherals.c
 create mode 100644 drivers/clk/meson/t7-pll.c
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
