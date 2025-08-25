Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D094CCA0EFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h0u2N3AQPCNNFFc9BtyzlzoFyKzj/IOyXolIP/nhfA0=; b=ClE2JUvH8WiBTq
	GnxI3z8FJOqcJKqURep40wFYOfzWCyVHUXdm384poDbrL6qWEE8m78ygKWG2rBExFJUHeevj6PGWd
	yt6QMzWn1cw5UPge+0WhlvvovCrZUTnYxwdYt692RzVPwgFTcB+4eZroVHnFPO69cTeQAqKB6XlJs
	9olp+thVgsID8p9Fp/7dPFh6UGMGeuE/dk3lhltia5H6fuUNlI+RuQ68c+jfCghNEEiYBdU27MUAp
	KJyhzKQB2+q/qnKbR6zMjKOE22/F3SJKinZfYzBSl0acU3xkLpyFLue1l2houxTHIjVG7kutJHV1o
	zIT2M0RAOtoC/7fsOxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9M-00000008WAH-1Dkn;
	Mon, 25 Aug 2025 15:30:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYA7-00000008FfR-383t
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45b55ed86b9so13760085e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132026; x=1756736826; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Lg1z3zn/UH4r0LtOjxUmVsZgN3Hor8KuWD/ZELRBh0=;
        b=JC0pF3e19bW2X0IHqk2cSkfWUrHlXStT0TbZUbpVWVBOkcKaAhMNBFy/SOAFA0mF6K
         7sqNRuK3yaTjjgL4KXJrPhlVd4p8TOX2PXeDCkL0e3SIq5yVoJ9zMDDzLivCN+wFBNPG
         GBuuSO5u1Yl7eKXHY9EHhXDdL6awaR1W/eCHm6Oo1J9kdQ8yk86w0XvwNu7iss8nPHIT
         DJFsaxyQsUKVJmGurS9mWGmxWhRwBGJgdHOHnmJ+mH7sl6nDRI+pZ2H28pGBiI5xXf8u
         m0Mxq+EQo+NWcmP5OUivRnwD4/bIOxmLezruXcIkKUOzgqp8jNrbc5YIVnDCR+dx4NJG
         2pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132026; x=1756736826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Lg1z3zn/UH4r0LtOjxUmVsZgN3Hor8KuWD/ZELRBh0=;
        b=eWUxjDgh14mc9+6+kvhTgNskgXo2tGAnQqY76pKUedWfrOOf8YYIF7LH3h15QYJqwJ
         5One8x3wSBNLoxBJy1nPwm9EYAQpf1L3XAwaGMlgXEtQhFNEqvc8Lyq7G6QObWZsEksT
         B2Yi8k5r1P0FBoBoTbP/TLniAnDTx6K4LyWMnMqxCJec1WYU+Cv17PgHG9+oxYyosVmn
         r1D1H6XuCZfDDFJGL21e6aofR946M+CiP5bIEuAFfsH6oVL9qJtmaGz2mkAK6SadN/fA
         69nYS2PzAP+gx3HBS8E1h1gJUnsV7xCbdUhIAxQ88IAZVXaIqy7AYpSzcS6G0p0dRR1x
         MSfg==
X-Gm-Message-State: AOJu0Yy/6laS9Gj7eRiLbis9I+wM1IYFGfA93xqY1RN7hC38F1vBfPeF
	g02USc2BgrDRJH2D/5fvC8/3stSXoq22Srj5G6VfMdX321GKVhRCqMEZb8jE7y8X6NU=
X-Gm-Gg: ASbGncs0iFqbh2uA9BNx+BuzElOs21oEpxZMIOSFcfBW9HOFXo8wQFT1PJBHERGKqLB
	qu5jZYU9Gaj2m8n38IZ2R6lNzZBnKJhmXx6eNVStetHCwcEh9w7yTfR9UHl1iYerpQx9VI2FhTn
	7FvXM0XgyKZ16roX0XnlaW8NHuMtomkmSq0GPClPC1EhUIWqYe1l4iEpIY0fnQf7bwH3RR/1Awm
	1SwE43QU4nJdCE1scF4ph3z3UibT5bOAUvhiRQ3k9PvB0jAhAD5sofTUmYfocm2x4ostGvRn67Y
	bI4/iysjZteifgCWsYQJ2+bttkmykCVpGQUKjZ0G37Rljy+KclA+lQ6PgLHhTpCXGHcFOiHqmfd
	wHV5Z4ouiiTZny8KjZqMiyUKcuD9ZxGI6BH/n
X-Google-Smtp-Source: AGHT+IGIm5HhkMTlZpIc0I/Aq/oUEmfvFMlFEP9hvRASgNmV8E2415cUxZAc6AkOB9k80NT/htY1CA==
X-Received: by 2002:a05:6000:2891:b0:3b7:6d94:a032 with SMTP id ffacd0b85a97d-3c5da73f498mr8433827f8f.3.1756132026099;
        Mon, 25 Aug 2025 07:27:06 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 00/12] clk: amlogic: clock controllers clean-up and
 factorisation
Date: Mon, 25 Aug 2025 16:26:25 +0200
Message-Id: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJFyrGgC/22NwQ6CMBBEf4Xs2ZruWjF48j8Mh1IX2QgtaZVIC
 P9u4exhDm+SebNA4iic4FosEHmSJMFnoEMBrrP+yUoemYE0GSRENXAKXrn+lcPWf0ZFRhl0DWN
 FpsQK8nSM3Mp3197rzJ2kd4jz/jLh1m7Cs75o+i+cUGnFWJ5cZbF1hLfGzr00kY8uDFCv6/oD+
 S/mI7sAAAA=
X-Change-ID: 20241211-meson-clk-cleanup-24-41cbe1924619
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vxjTLfTS0NUMwpDSn+HN798wL4RTF+UPuBLyZzIgJGQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKt5oWOLMmGYVXWzR3WIlcusXMT3KwLXhoY2
 cVnl8ZqDrmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxyrQAKCRDm/A8cN/La
 hQRfD/92fDnjytwS3w66LZUOZp6IeRquIYzWA9QPc4ipZVKAOww1Wc5099xHqaEJiUCkRvD6d3r
 5jU/DFZWZxYcgfDCZt1efmzbxd6d+U9GWX7EJDE9vpEaZ2Zoc0QBDVyp/YyxWqEn8EZ4sVwNp+K
 5qZgAd2bOdvDfbtG/8IXAeLFwd0PSuj8WT1z4BVvOgW8bOKxx2YvCSzcXQPVJEY+LQQpso9tMI1
 xiOh4AEGmpoMWCWid1iwlAgc40Q9OvN3cIGBri5N336/113HJ+mlTqsOK3XKcPhjIG0Abjk7QI2
 2YGrpbbRjMp8QgR+P1MI9JzWgX6CJ3aL4TG4yyjMCfCqGNebGhyBlBte5DpqDLfIVYqN/5cQUSn
 flssKpdR8AahvURmLwSSkPcA6URbiJsi72JitUplD205OPVc8a5UZBVd35b+v6uZvnbrSCtQ5Gf
 P5SFTUNeUYPFodTF9fmqGt2vlN0XgqnZDl76f7aHtz8JrTmCy3ApHdHShDKVrFqOQ6X2U11JTNy
 57TzyJcIj1XwLev+vIpTBMgkTSMrmRILViGJ9zE7KhzrHalOc7jFtCBjtSBSwMIXVKMPe9tqEp9
 61PpYQJr2u2zFMV25I5e1OQhXIZuA1hSYPWVXLWbvkzTSBH7NCRl2BXlfCeMXnqvk7ZCsNYCLzq
 NCtHyu9uVGriZGw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072707_801539_9ABBA758 
X-CRM114-Status: GOOD (  17.22  )
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

The work on this patchset started with the submission of the Amlogic t7
peripheral clock controller [1]. This controller is fairly similar to
existing controllers. Once again, it redefined the peripheral clock macro,
the probe function and composite clock helpers, even if it is almost the
same as in other controllers. This code duplication trend has been going on
for too long and now is the time to properly address the problem.

There is clearly 3 parts in this patchset. These had been sent together for v1
to show why what the ugly first part is useful. I was initially planning to
split that for v2 but, given the minor changes since v1, I did not bother.

While all controllers are doing more or less the same things, tiny and
often pointless differences have emerged between the controllers. This
makes it harder to exploit SoC commonalities. The changes to realign things
up have been applied and squashed. Now it is possible to focus on
the (slightly more) interesting stuff.

First is the factorisation of the probe functions so those stop being
copy/pasted in each clock controller drivers.

Then the clean-up and factorisation for the PCLK macros, again to stop
copy/paste but also remove the silent use CLK_IGNORE_UNUSED.

Finally the introduction of macros for composite clock definitions. The
same duplication pattern as the for the PCLKs started to appear on s4, c3
and t7 composite clocks. Done properly, this could also help reduce the
verbosity of the older controllers.

With this, the c3-peripherals controller may be used as an example of what
future similar controllers should look like.

After this, there is still some house keeping to be done in the amlogic
clock drivers:
- Moving remaining reset drivers to the reset subsystem
- Proper decoupling of clk-regmap from the clock controllers
- Reduce verbosity of older controllers with the composite macros, where it
  makes sense.

[1]: https://lore.kernel.org/linux-clk/20250108094025.2664201-6-jian.hu@amlogic.com/

Changes in v2:
- Dropped applied changes
- Put regmap config on stack in patch 2
- Link to v1: https://lore.kernel.org/r/20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (12):
      clk: amlogic: drop meson-clkcee
      clk: amlogic: add probe helper for mmio based controllers
      clk: amlogic: use probe helper in mmio based controllers
      clk: amlogic: aoclk: use clkc-utils syscon probe
      clk: amlogic: move PCLK definition to clkc-utils
      clk: amlogic: drop CLK_SET_RATE_PARENT from peripheral clocks
      clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
      clk: amlogic: introduce a common pclk definition
      clk: amlogic: use the common pclk definition
      clk: amlogic: add composite clock helpers
      clk: amlogic: align s4 and c3 pwm clock descriptions
      clk: amlogic: c3-peripherals: use helper for basic composite clocks

 drivers/clk/meson/Kconfig            |   13 +-
 drivers/clk/meson/Makefile           |    1 -
 drivers/clk/meson/a1-peripherals.c   |  177 ++---
 drivers/clk/meson/a1-pll.c           |   52 +-
 drivers/clk/meson/axg-aoclk.c        |   45 +-
 drivers/clk/meson/axg.c              |  118 +--
 drivers/clk/meson/c3-peripherals.c   | 1338 ++++------------------------------
 drivers/clk/meson/c3-pll.c           |   49 +-
 drivers/clk/meson/clk-regmap.h       |   20 -
 drivers/clk/meson/g12a-aoclk.c       |   73 +-
 drivers/clk/meson/g12a.c             |  206 +++---
 drivers/clk/meson/gxbb-aoclk.c       |   43 +-
 drivers/clk/meson/gxbb.c             |  204 +++---
 drivers/clk/meson/meson-aoclk.c      |   32 +-
 drivers/clk/meson/meson-aoclk.h      |    2 +-
 drivers/clk/meson/meson-clkc-utils.c |   86 ++-
 drivers/clk/meson/meson-clkc-utils.h |   89 +++
 drivers/clk/meson/meson-eeclk.c      |   60 --
 drivers/clk/meson/meson-eeclk.h      |   24 -
 drivers/clk/meson/meson8-ddr.c       |   57 +-
 drivers/clk/meson/meson8b.c          |  190 ++---
 drivers/clk/meson/s4-peripherals.c   |  678 +++--------------
 drivers/clk/meson/s4-pll.c           |   60 +-
 23 files changed, 1034 insertions(+), 2583 deletions(-)
---
base-commit: 4c4e17f2701316e0cac16e19366056f464feded5
change-id: 20241211-meson-clk-cleanup-24-41cbe1924619

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
