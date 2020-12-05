Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776AAC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 18:00:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B399B23159
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 18:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B399B23159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sq3rT2wbEor4Sw7GGzgOSMXJoCbAXcL61HZvEEm8MX8=; b=QtLWvfv67n0nu6rSbLzHP3IPpx
	C5tjTjMGgbAKZFu9EzbmQ7BfGaNj5G6qF+kQlJOcvfVeIRbLhYh5pHkEMceRxwg/cyxWpfg0z8+30
	V10e4PHuwLfV9YuQVd0KUCBIBqiU8qZITdpz3OIZBFtc0btY1MMUKJc3U0EFM0AXR4e3418KcD3wh
	krKCb6oNOtaSB3tRJjnsbPpfLXWElAJ5p0d/FvilPLmg5L8FmBzMl8KlWCE4cbJY7Euz9X4WJPIA/
	Nwow/dT5BfhmkcQNsawR2knnwaUamUV5WFBaXGp3odBk36+02VnHE2JAFNsgKTPCkqi6EZAN19XGp
	PWRTvQcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klbr5-0007dW-Rj; Sat, 05 Dec 2020 18:00:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klbr3-0007dC-Nu
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 18:00:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id g14so8470591wrm.13
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 10:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=user-agent:from:to:cc:subject:message-id:date:mime-version;
 bh=PTXa6B/B0BNrbQJqk8SVfud/vMOBiyjb/emTUMto2ik=;
 b=MPFfiBDQZxoubDp47KqhOPCsl0Uu0ERfIVCSN+PkGlf6uNfh324TLdfASYbZ/It3aY
 UGAJtAI4+tkA8tViVrBNROjOxFZfeqB5FS34WHxbNS2r4Q1cDhVJu9rlzVPirDNZV/i8
 60ARDDAW1ryo12WD+Xf+Im1RY5mIUczX72oXtDgjnBnAR2ov2Bnpvi7Ur9kayjpajUSi
 z9l0YMrx3FQjr4OgCjaM/+TOodE80LNdzwt6SFqvUZDIAFnnxqVmsLF2XKswJa3QNmJj
 kBykULaoWQcVioGIEXpTTc2n0Y8OjZU07jnfO4dtDPjOQQm+Ain57GxVWPlBoGC9stbg
 P22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:message-id:date
 :mime-version;
 bh=PTXa6B/B0BNrbQJqk8SVfud/vMOBiyjb/emTUMto2ik=;
 b=J7hUZI64YsZTjoASvtICc0nxFQo8dTgIUxCnadCKdMGRSMTLNEYuk9TsxtpcAFVnen
 uhb7ivh9BrHGNek6vLt11V0v+y6jPz+NLG9tVcNh30Gh74NY2LoBJD4485xDVt0BTX0/
 keudYc9bUD9x34oMpMMFw7ol+fOO8ps4irPVpiolN3kDUo/pD60HnvwOQ8nY5ta4TLBd
 olX+7+seTpbDTBZnwhB+7XuWWTqMwDwGD0WwDcQ9SOlmcwYwxRgMexFW0DGHb3i+QCHK
 CW77emWFlPzn3tcEok+22CyeiPI1KMhqWgvzn7D1rpqwAgQC0K+3zvbSNv5laFrTWFYg
 3vaQ==
X-Gm-Message-State: AOAM532L8WhMTBcemB46fnpGxlfXzWWFngqEcrfE5Ii422k3BvwcNQTZ
 hofN6urtPzNnVE3Piml4bn7qLw==
X-Google-Smtp-Source: ABdhPJxDuNhmmBblFW6fyO7wkhOXA8WUFQ0W09dGX+p5ryihjGiJrwlmb4k0cJJijfX1nHIWVMrHRQ==
X-Received: by 2002:a5d:4892:: with SMTP id g18mr11067256wrq.365.1607191219674; 
 Sat, 05 Dec 2020 10:00:19 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id h3sm21635wmm.4.2020.12.05.10.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 10:00:18 -0800 (PST)
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [GIT PULL RESEND] clk: meson: amlogic updates for v5.11 
Message-ID: <1j360kp1zh.fsf@starbuckisacylon.baylibre.com>
Date: Sat, 05 Dec 2020 19:00:18 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_130021_798629_99691E84 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

Here are the updates for amlogic clocks for v5.11. This is based on your
clk-hw branch, instead of the usual rc1, since it depends on clk_hw
stuff you've already applied.

Hopefully I got it right this time ...

Please Pull.
Thx.

Cheers
Jerome

The following changes since commit e6fb7aee486c7fbd4d94f4894feaa6f0424c1740:

  clk: meson: g12: use devm variant to register notifiers (2020-11-14 12:58:31 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.11-1

for you to fetch changes up to 88b9ae600138baff18c7f4c4870622584acc6111:

  clk: meson: g12a: add MIPI DSI Host Pixel Clock (2020-11-26 15:25:20 +0100)

----------------------------------------------------------------
Amlogic clock changes for v5.11

* Add MIPI DSI clocks for axg and g12
* Make it possible to build controllers as modules
* Fix Video PLL clock dependency

----------------------------------------------------------------
Jerome Brunet (2):
      Merge branch 'v5.11/headers' into integ
      Merge branch 'v5.11/headers' into v5.11/drivers

Kevin Hilman (2):
      clk: meson: Kconfig: fix dependency for G12A
      clk: meson: enable building as modules

Neil Armstrong (6):
      dt-bindings: clk: axg-clkc: add Video Clocks
      dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
      clk: meson: axg: add Video Clocks
      clk: meson: axg: add MIPI DSI Host clock
      dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
      clk: meson: g12a: add MIPI DSI Host Pixel Clock

 drivers/clk/meson/Kconfig             |   7 +-
 drivers/clk/meson/axg-aoclk.c         |   5 +-
 drivers/clk/meson/axg.c               | 824 +++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg.h               |  23 +-
 drivers/clk/meson/g12a-aoclk.c        |   5 +-
 drivers/clk/meson/g12a.c              |  79 +++-
 drivers/clk/meson/g12a.h              |   3 +-
 drivers/clk/meson/gxbb-aoclk.c        |   5 +-
 drivers/clk/meson/gxbb.c              |   5 +-
 drivers/clk/meson/meson-aoclk.c       |   4 +
 drivers/clk/meson/meson-eeclk.c       |   3 +
 include/dt-bindings/clock/axg-clkc.h  |  25 ++
 include/dt-bindings/clock/g12a-clkc.h |   2 +
 13 files changed, 979 insertions(+), 11 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
