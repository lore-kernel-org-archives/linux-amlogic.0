Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0172EC10F16
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lFr6/Uor55XCNX6KfFFm7fgWLpCLRovfe7hywAY/CY0=; b=CRuhro8KX349uz
	Ixc1azkdSOy3VvXp7pw2XaNQHr1Um7Ty+x8wLkZl9RYdN1WS3pCKHZFJpFlOSII5Pycrl5Wwh8TQb
	kebXGUjjUjU+y7Uhm3jgkHKJLTPdx59yyds+46cJMpboySwKpZvsNLbfW0zoRq80H5PYdHou32dFf
	EuqPK9cV3JZUCFnQsnVGYzf8fnRuZAwou1IyeivPx1JH92LJfRraD2D77xV56rrs4bzwRC6rrWO1A
	LqHelq/tm0F1vbMTfW1WeCjACcWaIwkonwnkuErsymlVVZlpgq+kON0DOijtVEq9rurQPiO77RT5V
	z3CQ/1M+P06BwIm40aqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tUS-0000000Gm9M-3RjZ;
	Fri, 03 May 2024 14:02:20 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tUO-0000000Gm7z-1QZQ
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 14:02:18 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2db101c11beso109722861fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714744933; x=1715349733; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqRCNlsdsLpb0Sbcbb6gN7OMlpokYzOYOtEiEYuehRo=;
        b=nE7MlhblTB2MGCEd2JywvzdYrj51g6hYKzQNzyuTq2ZcZLL2b17whhbmBLzt65q3/T
         Y1DF9gS+pfkLcWwU8yCz5B5tTR7dXApO4eyMKTjDRJR/4Quw5YySXGdTxKTJruXfjCOa
         KBqXXfCX5et5OXiQOHl4w1qVzI8kM+1+ms7Io3kY/XWUSQxx1+6mZ8Rv1mMkcLfYB8LV
         RJDB/U4PzxtY+ERq2f9sUd+u3WFZYpA8rHIZYFOYBRouxSNn716h1d82JMit2OtzQBzq
         w5ITh7jcfWdwb8hEsCdvZZPZFW/l+SYZdDfS5IjYimBMIViy5+i4ZUt1bmFZdHTSCbgC
         QrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744933; x=1715349733;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqRCNlsdsLpb0Sbcbb6gN7OMlpokYzOYOtEiEYuehRo=;
        b=ixVAM4J04bZBKd6NjduVCbNAwoTMkQdbOg93LZyroYRqn8BZFggbXxta8BMApD4jLa
         ulwwKiqgZSGwFQ+WFkDqhbxpXeaEEToV0postNXI37qgnX03t38Ttt7WF9lwTiOu+kUW
         20WRgud/Pp1SaJH49X0PefszaieEBvEvaJx9bOYHzlZzR6gRvoGlYhawVgw+z5iiuC/t
         5PAmh494ctpAROojctMzKh+Ng1SRSOYbcytRpoz2iYa20pQMoEnLDHJVRHCOUiSSRV4n
         63s4w8m8xgZ4Xt80Y1J34Gs67vTQbgVBGYdmeVg0HTxhx58pUxa8GGJQpeBObyle7zK1
         cUEA==
X-Forwarded-Encrypted: i=1; AJvYcCV4pM8p5yIFjqZnQJpbc0sef06dBBxWxWV5IQE2WWyH+OtJbnhs5ntINMJhu+hehXz5msvfCI/2zdbjz5hKydbDFYBlZ25eJ/Vt94cztbQrF2c=
X-Gm-Message-State: AOJu0YxL4pLzNJaUec4lr9IdG5vRL4uSMdd0HxUMVxaytoROod3i0qTS
	zvJGsYF7okwQ30wLWGAy3hNagyw+Yg90AwJdJB2jdTSqeiOuHy2McGzs5z2NjUg=
X-Google-Smtp-Source: AGHT+IG0VqrwvYqiGaLjQVVumDwJ8cqlqDhTmCNKVgjkIapt0H5riqjgYhUI/y0j59rcn6dCS71omg==
X-Received: by 2002:a2e:8ed0:0:b0:2e1:c97b:6f1f with SMTP id e16-20020a2e8ed0000000b002e1c97b6f1fmr1527088ljl.51.1714744932904;
        Fri, 03 May 2024 07:02:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1b85:e590:355b:9957])
        by smtp.gmail.com with ESMTPSA id b17-20020a05600c4e1100b0041be3383a2fsm9499252wmq.19.2024.05.03.07.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:02:12 -0700 (PDT)
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.10
Date: Fri, 03 May 2024 15:57:49 +0200
Message-ID: <1j8r0r3sf0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_070216_406792_804F293F 
X-CRM114-Status: UNSURE (   9.96  )
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

Here is the Amlogic clock update for v6.10.
There is one new driver for the DSI display pipeline and the rest is
just house keeping.

Please pull.
Cheers

Jerome.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.10-1

for you to fetch changes up to 11981485e27c7e5a630ee844a2eae1f1835ba807:

  clk: meson: s4: fix module autoloading (2024-05-03 14:27:32 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.10:

* s4/a1: add regmap maximum register for proper debugfs dump
* s4: add MODULE_DEVICE_TABLE() on pll and periph controllers
* pll driver: print clock name on lock error to help debug
* vclk: finish dsi clock path support
* license: fix occurence "GPL v2" as reported by checkpatch

----------------------------------------------------------------
Dmitry Rokosov (5):
      clk: meson: a1: peripherals: determine maximum register in regmap config
      clk: meson: a1: pll: determine maximum register in regmap config
      clk: meson: s4: peripherals: determine maximum register in regmap config
      clk: meson: s4: pll: determine maximum register in regmap config
      clk: meson: pll: print out pll name when unable to lock it

Krzysztof Kozlowski (1):
      clk: meson: s4: fix module autoloading

Neil Armstrong (3):
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      clk: meson: fix module license to GPL only

 drivers/clk/meson/Kconfig          |   5 ++
 drivers/clk/meson/Makefile         |   1 +
 drivers/clk/meson/a1-peripherals.c |   1 +
 drivers/clk/meson/a1-pll.c         |   1 +
 drivers/clk/meson/axg-aoclk.c      |   2 +-
 drivers/clk/meson/axg-audio.c      |   2 +-
 drivers/clk/meson/axg.c            |   2 +-
 drivers/clk/meson/clk-cpu-dyndiv.c |   2 +-
 drivers/clk/meson/clk-dualdiv.c    |   2 +-
 drivers/clk/meson/clk-mpll.c       |   2 +-
 drivers/clk/meson/clk-phase.c      |   2 +-
 drivers/clk/meson/clk-pll.c        |   6 +-
 drivers/clk/meson/clk-regmap.c     |   2 +-
 drivers/clk/meson/g12a-aoclk.c     |   2 +-
 drivers/clk/meson/g12a.c           |  78 ++++++++++++++------
 drivers/clk/meson/gxbb-aoclk.c     |   2 +-
 drivers/clk/meson/gxbb.c           |   2 +-
 drivers/clk/meson/meson-aoclk.c    |   2 +-
 drivers/clk/meson/meson-eeclk.c    |   2 +-
 drivers/clk/meson/s4-peripherals.c |   2 +
 drivers/clk/meson/s4-pll.c         |   2 +
 drivers/clk/meson/sclk-div.c       |   2 +-
 drivers/clk/meson/vclk.c           | 141 +++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h           |  51 ++++++++++++++
 drivers/clk/meson/vid-pll-div.c    |   2 +-
 25 files changed, 279 insertions(+), 39 deletions(-)
 create mode 100644 drivers/clk/meson/vclk.c
 create mode 100644 drivers/clk/meson/vclk.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
