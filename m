Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A41CA0FFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OCuzrP51TR+2mHMSlnnegLmItGjHppVEIf6FhSaIZ8A=; b=4fbFzZwwblhe+0
	4pzes8Oys86ag3nr3GBOhJK/7ornOJaki8Ffncez5XH1Cvw6eAdOC7BJKb2LYBYrq3oezRqSX6MHa
	81j35tiyNUtaw7aFn/+BAnsgyNpQgPDitud5XqXzzR2AQjdfHusSAutw0qRdqf4dmgutstS4SsaK+
	jrD9fsgv53YlyGPQ8I9/nVwmhQ17KCTLgxxsppWdYExafCJItmHQWQ/hm2ngM/0wgR2H9kGPxFTYm
	JP+za90JAVJOM4+ExHSE3BFFPeR2qrTG5liH+nZPnTqx4RaUwY2Bd3QsXiDEJBywSv7YasNKqQuH7
	4EnC8Af+oUUG13lgkg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk2jh-00000006dPw-3k9L;
	Fri, 30 Aug 2024 14:36:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk2je-00000006dOW-1Lg0
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Aug 2024 14:36:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37182eee02dso1195473f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Aug 2024 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725028580; x=1725633380; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UuSosbrnBUtyi4cgpddHW8blUXO18CxsgMRD2yInBj8=;
        b=0U88sApibRG1emQSrWbsSftOo+j00dmWZq5f2B83WGEgqmZ7BJKEAQl7VVbgwNGr95
         z/ET9DXYnRwbb3UoyAkUrvUCwxRFBt4fGx8xHAsscBN72BE80ShNCoWAFx6yD3kfhXHe
         dnkm59E6ODLvs4LkPRSj5zDjnGJQ6VXnCmeJNzi3INvqHa1KCG1K+h0v76GEzRF3RCXs
         yzSu7U1TX9UyoAV8JN7pmb/mODSEBPY5qeZ3e1QbegAcr83Cu9bbyiYC9AI51GUNeE3c
         DKIwqGBiDx4FdMy3NxOuxJ34NOTal7ycGT5u8rTOF7HtpmMz5FQ8cIh6EZ/TDDnhI5Zq
         KdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725028580; x=1725633380;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuSosbrnBUtyi4cgpddHW8blUXO18CxsgMRD2yInBj8=;
        b=Ky76oj2xMqxsZYIxRBemXWYvi1LbuGf9Bn7NTx11N8nqBmanWkcaKnT14elIpQ1uJx
         h64NvfSsu03Kp+USdn4hiIzA8h+LWfWalaVceGU2L0V7lr+nTYeEpRsm8f5OETNG8yn4
         lWZer3luwpfLGG2apESPDmJsReL5L+H/dkgVFx+jvMuN0Nc2uEB/b0i7bgfCHhR7aHiR
         JMGMGJ3S3nAXCZ+qmNxmhs4boogvNMfeQEOJPGCuFH+vfqw6k1HgCbD23+xBkcmQtmIn
         oUz5Qh3w3B5fWeCN/BiG3Eoh9GAB1UC0zrjARINJkwniMbN3zxB1k085aC/V2CJqd68n
         MjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVAVrN2lhwQWm2RZxTqTB5OKr++EyYJw2/V6Q2CHEqi5pdQBYVl8u7QKk6G9/ktFGDrdnSMFtBwl68l/to@lists.infradead.org
X-Gm-Message-State: AOJu0YxDZmeLqON8NyFOKQ37zLYW8N/b5Y709F55/3a4Ex+0eGXddggy
	qMzc3yXy1m0Mt5twi7MuTxrP25ZGf6MoLx57xSw4iVJovsrSMm9F03PV6a6GMKjEg+yU3xi7Vbu
	h
X-Google-Smtp-Source: AGHT+IGOY3gmUUaHWjnzPpOy6rYtfWsTIjelTWHpNqSgaEg8pikha9CveNRGLuxLyj8JxoMGmo1L+g==
X-Received: by 2002:a5d:5d86:0:b0:374:adf1:9232 with SMTP id ffacd0b85a97d-374adf1936dmr1170510f8f.19.1725028579627;
        Fri, 30 Aug 2024 07:36:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd15:900f:f8f5:46f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efafb30sm4177445f8f.94.2024.08.30.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:36:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.12 
Date: Fri, 30 Aug 2024 16:36:18 +0200
Message-ID: <1jjzfyrsbh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_073622_474566_E8C4C7E3 
X-CRM114-Status: UNSURE (   8.67  )
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


Hi Stephen,

Here is the Amlogic clock update for v6.12.
Nothing out of the ordinary: adding some clocks and bit of clean-up.
The only notable change might be the use symbol namespace for exported
symbols specific to Amlogic clocks. Those won't pollute the global
namespace anymore and will not be accessible to other modules that have
reason to use them.

Please pull.
Cheers

Jerome

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.12-1

for you to fetch changes up to adac147c6a32e2919cb04555387e12e738991a19:

  clk: meson: introduce symbol namespace for amlogic clocks (2024-07-29 16:47:33 +0200)

----------------------------------------------------------------
Amlogic clock changes for v6.12

* Constify some structs clean-up
* Add SM1 eARC clocks
* Introduce a symbol namespace for Amlogic clock specific symbols

----------------------------------------------------------------
Javier Carrasco (6):
      clk: meson: a1: peripherals: Constify struct regmap_config
      clk: meson: a1: pll: Constify struct regmap_config
      clk: meson: c3: peripherals: Constify struct regmap_config
      clk: meson: c3: pll: Constify struct regmap_config
      clk: meson: s4: peripherals: Constify struct regmap_config
      clk: meson: s4: pll: Constify struct regmap_config

Jerome Brunet (6):
      Merge tag 'v6.11-rc1' into clk-meson-next
      dt-bindings: clock: axg-audio: add earcrx clock ids
      Merge branch 'v6.12/bindings' into clk-meson-next
      clk: meson: axg-audio: setup regmap max_register based on the SoC
      clk: meson: axg-audio: add sm1 earcrx clocks
      clk: meson: introduce symbol namespace for amlogic clocks

 drivers/clk/meson/a1-peripherals.c         |  3 ++-
 drivers/clk/meson/a1-pll.c                 |  3 ++-
 drivers/clk/meson/axg-aoclk.c              |  1 +
 drivers/clk/meson/axg-audio.c              | 39 ++++++++++++++++++++++++++++--
 drivers/clk/meson/axg-audio.h              |  2 ++
 drivers/clk/meson/axg.c                    |  1 +
 drivers/clk/meson/c3-peripherals.c         |  3 ++-
 drivers/clk/meson/c3-pll.c                 |  3 ++-
 drivers/clk/meson/clk-cpu-dyndiv.c         |  3 ++-
 drivers/clk/meson/clk-dualdiv.c            |  5 ++--
 drivers/clk/meson/clk-mpll.c               |  5 ++--
 drivers/clk/meson/clk-phase.c              |  8 +++---
 drivers/clk/meson/clk-pll.c                |  7 +++---
 drivers/clk/meson/clk-regmap.c             | 13 +++++-----
 drivers/clk/meson/g12a-aoclk.c             |  1 +
 drivers/clk/meson/g12a.c                   |  1 +
 drivers/clk/meson/gxbb-aoclk.c             |  1 +
 drivers/clk/meson/gxbb.c                   |  1 +
 drivers/clk/meson/meson-aoclk.c            |  3 ++-
 drivers/clk/meson/meson-clkc-utils.c       |  3 ++-
 drivers/clk/meson/meson-eeclk.c            |  3 ++-
 drivers/clk/meson/s4-peripherals.c         |  3 ++-
 drivers/clk/meson/s4-pll.c                 |  3 ++-
 drivers/clk/meson/sclk-div.c               |  3 ++-
 drivers/clk/meson/vclk.c                   |  5 ++--
 drivers/clk/meson/vid-pll-div.c            |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h |  7 ++++++
 27 files changed, 100 insertions(+), 33 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
