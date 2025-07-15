Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF620C83F17
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VJVbphqIHzL7ib3hWHtQ1TDdv/9A1XWp/fhiIH1qk4w=; b=3E3pcadjK8pUVY
	6uOo7G1Hyh1RE05YXMzXp8a+cm8C48gXvWlEFQgjTaK9+aqQc0sEe7DoI0sckK5X5jmF52jPmo/nU
	32NQX/3GjfzGxVycokJpr4onfU2zehPw+RwawmhZR4VSXYvbNPM2HH+n0OW7Qv/aiOZUKYC8hD56e
	m1p37QlAo1UFJHS2gl2iE6jGBitu/D19PrG9x8QN/d4JGv7UPM9bS6bAOfpVF/nj31xM06ksPi4+z
	V1bCM7pICsFqgfQThpPCss1nqeD99PgzoAo9cYL7HhPMjBzRsaR5HKX9dGHbLqhVfFUKypZyYA3V4
	ExjstUaY1EhZ5iieegHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBa-000000061cC-32qm;
	Tue, 15 Jul 2025 19:19:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiyO-00000005muM-0BIP
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Jul 2025 16:57:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so50259f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Jul 2025 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752598662; x=1753203462; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LV0FPBZomtvntf/vwUd57gNvAzJOPj4wrTCOSQLGhzc=;
        b=Ws216SoA7ppVio73WEsF/0YC59yywV6YA3YzvReI7enBf4SOm1volepMtPC7DqIEud
         gLw0GUIIrJAYCpKsN4RR+SNNcA0y/v+DINUQF8W0jtodlLsP4uWFlbc5qtNGdSAopTuN
         o1W5BgU7FqsPuZjinF/zP6xmbaqAHXZ1zp4IIW/nWmO7EQVufmq4fLwOhNHVABtmvkL8
         xgpij121Ki0oNaZIkHU32fWgcazgvdXY7JjOQZ7HcCvyvr09hXIf3G6Wr5dfTuKS9dtb
         9gMvROFgDDYEio1YPAoFu/JJpDrcNIElCY2dFw/95GzRzLBvcVVxrnbPafV9foWJN7jY
         JQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752598662; x=1753203462;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LV0FPBZomtvntf/vwUd57gNvAzJOPj4wrTCOSQLGhzc=;
        b=KO3C+mkIry/TkzI0jZmbgVhx4ZKHo80JQTDEBnDau58eLTeNH46Qn+lO/qWsbdzWRs
         d0NLYuqRyLokI0nqzhXeN+kRO6xYo9syT4uNcIzgmQm/tZ/fbIKOrx9gvfl3XUG12RDg
         QZ8EZSrWiYE0HKo3NcTCje9my//cJ+KEE3N/xXMZwEKUvFFS3EmOn1kI7KjFPzD54m0g
         qniKkpQuFZmsuMEyGfCUHV5MgFqJyRC88oc5fX+5ealHSe5qPHg7EhBuwMRCG5j0TJuX
         wriQXn2qCLZiT3bFwpwtFtSsJHj66NApzMjAtoS2j//LTPshhwAZiL6eKSPgaxabtTjG
         iQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVPX/Q6wN8ds5BEQXmDIgaQLT8ykEH/uAyPEipShyrWmwd2iOuGhkIt6z8fDL26lFaRQ2tCgYt7RQioN8b@lists.infradead.org
X-Gm-Message-State: AOJu0YwdfSFm4AmTf0bB6PRvz7x5CtIWvaOogmGQ5sLPLxCx79SYNOVb
	+oPRMWGcpAMlu+GB3HsMcd83S1TdLfFrAxAQlCo+oQXc9WNtcJF/dbrYshg7+iLre4I=
X-Gm-Gg: ASbGnctb55f3W2cv4CY0y3Hw+u5Ts7uh+Zf2oV63GOOHimy/2TjElsq9ncFJd1coKVi
	uUqiybJd1pcq4TLXndfYqzfgG/Mg2N8s3/CzTy0aQ3PdkXaJ+F0O1tofwJ0sHvaCXmGR2HpLjQS
	ZC6hPjLSf2QUorhqo7jWBaW6e3P3GCuI3xZSdhgHJJAFGlduChv3XXF78rl3Hyk1vCQvJoLK7/a
	QEikULRdfQNhIhLryq80BKz28qIlUBNg4IvFpJtHwObbgLOUGtS223oyCUYz4osEL7Vl3h3Jgtk
	8FpI9/kIlfIxhsDyRM4y3mc4Q5ZJS6EoQVTeGoZa7VsLw4KJl4ANer5C5bqowcH3s+D920lcJUK
	n1wUS7p158xCOM5CCssGqYg==
X-Google-Smtp-Source: AGHT+IFkMjpRPbL3Z3s6MGUY7Lo/byMVJ21dog02Hs6C5qzMbnkvTqM9UF9SGdXHIwk61FaOOowxSg==
X-Received: by 2002:a05:6000:2307:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3b609544322mr3520096f8f.27.1752598661792;
        Tue, 15 Jul 2025 09:57:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a80a:840b:882e:14a3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4560538da14sm109642575e9.23.2025.07.15.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:57:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.17
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Jul 2025 18:57:40 +0200
Message-ID: <1j7c09pf23.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_095744_279551_58D1150A 
X-CRM114-Status: GOOD (  14.48  )
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

Here are the Amlogic clock updates for v6.17. This one is a bit larger
than usual. It depends on the changes in your clk-hw-device branch and
is based on it.

There is the conclusion of a long standing topic around reset drivers in
clock, this time using the generic helper to create the auxiliary
device.

There is also the beginning of clean up of the amlogic controllers with
more coming in future releases.

Nothing is overly complicated in there but it makes quite a large diff
since it touches all existing controllers.

Please pull.
Cheers

Jerome

The following changes since commit ac32d031f508e46c19ab38d6ba8b53fc28df9945:

  clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests (2025-06-20 00:15:39 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.17-1

for you to fetch changes up to 8a65268500b00ecee5402ef9f80618ff73f30707:

  clk: amlogic: s4: remove unused data (2025-07-02 15:38:19 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.17

* Use the auxiliary reset controller implementation in the axg-audio,
  instead of implementing the reset controller in clock.
* Drop unnecessary clock controller headers
* Drop clock controller big regmap tables

----------------------------------------------------------------
Jerome Brunet (5):
      clk: amlogic: axg-audio: use the auxiliary reset driver
      clk: amlogic: remove unnecessary headers
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/meson/Kconfig          |   4 +-
 drivers/clk/meson/a1-peripherals.c | 194 ++----------
 drivers/clk/meson/a1-peripherals.h |  46 ---
 drivers/clk/meson/a1-pll.c         |  28 +-
 drivers/clk/meson/a1-pll.h         |  28 --
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 603 +++++--------------------------------
 drivers/clk/meson/axg-audio.h      |  70 -----
 drivers/clk/meson/axg.c            | 218 ++++++--------
 drivers/clk/meson/axg.h            | 105 -------
 drivers/clk/meson/c3-peripherals.c | 210 +------------
 drivers/clk/meson/c3-pll.c         |  32 +-
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  49 +++
 drivers/clk/meson/clk-regmap.h     |   4 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 372 +++++++----------------
 drivers/clk/meson/g12a.h           | 130 --------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 492 ++++++------------------------
 drivers/clk/meson/gxbb.h           | 115 -------
 drivers/clk/meson/meson-aoclk.c    |   5 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   4 -
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |   9 -
 drivers/clk/meson/meson8b.c        | 267 ++++------------
 drivers/clk/meson/meson8b.h        |  80 -----
 drivers/clk/meson/s4-peripherals.c | 388 +++---------------------
 drivers/clk/meson/s4-peripherals.h |  56 ----
 drivers/clk/meson/s4-pll.c         |  60 ++--
 drivers/clk/meson/s4-pll.h         |  38 ---
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 39 files changed, 639 insertions(+), 3082 deletions(-)
 delete mode 100644 drivers/clk/meson/a1-peripherals.h
 delete mode 100644 drivers/clk/meson/a1-pll.h
 delete mode 100644 drivers/clk/meson/axg-audio.h
 delete mode 100644 drivers/clk/meson/axg.h
 delete mode 100644 drivers/clk/meson/g12a.h
 delete mode 100644 drivers/clk/meson/gxbb.h
 delete mode 100644 drivers/clk/meson/meson8b.h
 delete mode 100644 drivers/clk/meson/s4-peripherals.h
 delete mode 100644 drivers/clk/meson/s4-pll.h


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
