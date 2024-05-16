Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F67C25B77
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D6N1gSw9h2JTFy4tI5C80MgekGC02EyUgzxikSlcANc=; b=jcOhRz9Dzm5WfD
	ukZ830d/dgOovq/ZeZCofGBi7Ymg/QZLk2XCX9Z3cPxb9DObxZ1iei7y1QOcAU4IKkk8uH0SULEZ6
	qtD7YF6UmnRFBBwlBhNiS/oLl9TcRlMUG3jBZChnRIBOlJI4jB3ZGuyZWdCYCeS2rXgxhvYvXbldT
	NkdZfVy2jsZZtrLyfXdqnqysRtAEvRikQREj78KwofXNNgUrxezqdozOYygstXSH0pdZTxCEhktTg
	aLm41sCG5Z6dlH4cSxP82RRfGMKG/xLnQ7rY5giH60Oag/jWZmrWFk0Y/izw3PFIvQy0s2qC7e6LG
	Ghl02xXSgqA3FrOjYMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj1-00000005Fop-2kqE;
	Thu, 16 May 2024 15:08:55 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ciw-00000005Fju-1LhA
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:08:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2db17e8767cso12510381fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872128; x=1716476928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioxEy7SZPKbhBowmAqXOs3HJ/6GyUDvxxnPo9F3uNU=;
        b=iSCvGPnX4EzoPOrLSgJyqiBaD3TlDO3Kda0frPSinTQSmSe2X+KUBI7nFojthQwXAc
         XQEvyOMY5Q/vInxYVbPy3fbLVSH+u5mG8hVLXYsEYOox+6p/DSqMZZYjo7hRWH2T87Gi
         097lqSjJdHI36rOGMDMN+/IJfQ6QSiGcvQN8DvpBA7J3kvoKeoNRE4M/kj8cJCyj8kuN
         6qBAyv6I6khauvoAdtZzLj5c9/SFVYPayIH5XclnS9Ve6i/vQ7OtyUgyVzVKjGh9aabr
         lMNA6IbLsudOiNX5typsjXuuLNyvTNRRMFkOtoyAdRmhEn9GItVRh0ZLb61daQwrwyEo
         Ph4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872128; x=1716476928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ioxEy7SZPKbhBowmAqXOs3HJ/6GyUDvxxnPo9F3uNU=;
        b=lKDpZCD17msUeMhAyHMpZ7vn+DP1sIAvSBtdCeaV8J2nnV6bOm/2L74R2VzhZMMHv6
         6q/jmH9MeVXx5s2xrBO62snBetlpNDqJrKZjsrATy2pROpMILh8Uzz5PcQPOr0b15HM4
         uVeZNBPXh8CuHSR6rqNtfmAWZZuI+a1z7J44BPZzkjAiy8TTvM6VxyOKf32YeosKmmKx
         kvo8LAF1MYLqlUMMiRAaeLKg2goVc92twlr0zmkXdFLTyuE3MX2miC+7p1tpqbSq7p+o
         PKeN29O8DW+Xne9iVd11xVhFrmNlr+086+Zz75AHwNPjgN5fXeUEiBPdpCdKon9BHC6Y
         5KkA==
X-Forwarded-Encrypted: i=1; AJvYcCUZJMTqLQqIHK6R4Tq6WhtjSFadvlfbo6FCPCYzVVW8oTNMtaAgHdwiyt2ZZNYpUe668FDE1Aqke0XF3+BIj8yGkGdaxYXn7GhcbxmUqU0xK2w=
X-Gm-Message-State: AOJu0YzTwkXktcI/5TBv4S1103v3Yl1+aJ5N8rEDnDgDNw9bxKBHerO0
	yXQTaKUdg6ta7F8vBTF+SSPgLkjEJDF0WqlyMYtxWtS6pTGYX1sPGcoIdgzKVK4=
X-Google-Smtp-Source: AGHT+IGKctbnPBmcJ2QPLjHUp6edy8mIEVUT9pkFFtdxGM+N329/NRHhlQe7LdHxvECgOEtFtlKB4A==
X-Received: by 2002:a2e:4a11:0:b0:2e5:8720:50d2 with SMTP id 38308e7fff4ca-2e5891d3b9dmr83515781fa.0.1715872127572;
        Thu, 16 May 2024 08:08:47 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 0/9] reset: amlogic: move reset drivers out of CCF
Date: Thu, 16 May 2024 17:08:30 +0200
Message-ID: <20240516150842.705844-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080850_504055_9ECF9029 
X-CRM114-Status: GOOD (  11.61  )
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

This RFC follows the discussion about having reset driver in the clock tree
[1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2 trees
and could use the same driver code.

This RFC moves the reset driver of audio clock controller of the g12 and
sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org

Jerome Brunet (9):
  reset: amlogic: convert driver to regmap
  reset: amlogic: add driver parameters
  reset: amlogic: split the device and platform probe
  reset: amlogic: use reset number instead of register count
  reset: amlogic: add reset status support
  reset: amlogic: add toggle reset support
  reset: amlogic: add auxiliary reset driver support
  clk: meson: add auxiliary reset helper driver
  clk: amlogic: axg-audio: use the auxiliary reset driver

 drivers/clk/meson/Kconfig                     |   6 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/axg-audio.c                 | 108 +--------
 drivers/clk/meson/meson-clk-rst-aux.c         |  84 +++++++
 drivers/clk/meson/meson-clk-rst-aux.h         |  14 ++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-meson.c                   | 210 ++++++++++++++----
 include/soc/amlogic/meson8b-auxiliary-reset.h |  17 ++
 8 files changed, 293 insertions(+), 148 deletions(-)
 create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
 create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
 create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
