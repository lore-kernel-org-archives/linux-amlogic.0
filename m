Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53C1CDB474
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7y1NbHCdoXNara6bSZjFAzBEXuk8afPmAg3oLgkHIPg=; b=cdxOIbFLjgcKzU
	xkwQ6uE/KL1EjPnnI0sYYjXPApiOFk1TJNsAEYnvwIVWHWZGOeLnGrUleoWxYK29NrbXGZNDgXbOX
	86qSXE9+zAjl5jhni1UaSNySFNgv4FdnNEkxU0j5W0DMCPDsrUGkJYA418LcNiramVf7sDPLrLHL8
	fxEANa3gcb5b0Hw8WSNHls6Jn4aBckro9ItcxBHvy+H0GaJJVPjCTy174m68TIpj5zEVMI09qAHyr
	9/7oIW/m0/CUkIrqFH/cG7YMEN1DKQPNysqWg74PnwASPfBIjtzE6MqJM58JmmZunXzIsHzZSyVGz
	xC0akDgN0T8/BaaQxfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKSO-0095yJ-16;
	Mon, 16 Oct 2023 10:04:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKSL-0095xh-0N
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Oct 2023 10:04:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4066241289bso44515415e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Oct 2023 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697450649; x=1698055449; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wb1oiiRjqSYXQAYJjh+FbOcPJMELpmSgM8Er487gtFY=;
        b=J+ds2g2QtLqZhzyIhimXT7xnKEkxhlxzps/ZkWL3ZoVtb8B1C4e+8bXK3fGPurB8cb
         LzHAEmpZ3Urvm768NmDpYhc+RhbHDJ3JouOAEjXe1QkTg5Sgv9WCCdUekU0XFWLY4NKp
         Wk7J0doYgfY5egM0AX1dI0hnQw3rIk1YwybP7wLxuk6RY8im1xlxLF5WpngKSYgs3nR9
         sLoWUZXgROmsYLBZKe+o7CvUmCAv2k4mc3z1EGbXSqg24gqF4/AhPvg9K09urTfhONM+
         +RZJYg0qeEyVdEVA4hSN5t5Ny2QBndtjDbXBUOGF2zI+DHx3T511kpNjKFzuVidOm8FF
         hHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697450649; x=1698055449;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wb1oiiRjqSYXQAYJjh+FbOcPJMELpmSgM8Er487gtFY=;
        b=L/GeHK63MN0ZRJTLTFZWZNVC6lllbXaS7UPXOhJPeUEjAgWmR+I83/IXALO4nkAtib
         x0qxxmc/U3epztgmia+8XFaG9tZnTYerdnYEsJi0w7F9PrnHO+1npGZ+NiWqM3cLQiln
         OZFDxf5IYqLxayxP7qUqej8a0lpj27QQX0rh1cPwfYz3yLaWvt8qCpREIYldGMd8xMyc
         FFUlBpXf4EuxXEVpgOWbVu8CJg/kUcsSPNGIXRbg0IvRMtLeS4GSOh4ARZ/6Cgnw9t7h
         E7EDcE178EBguwZd6GKZIYL7Q5AXbsjiZT0DhFzYo9boeDa3VJfoIuGyRxYOABrfXcpL
         V4sQ==
X-Gm-Message-State: AOJu0YzTbKmzjARDtPRedcwZKcpxN0QAfmrCcisxGYXJoz8eHHt3f5sE
	u1Mt+S3me0vKQO9iG3MFwu7ybg==
X-Google-Smtp-Source: AGHT+IEUR+149m3SpjfXg9XKzVTWPKRv+3L/7tEv7v0IDdtCVK6lLC95YPMVa8oezQFXyUelCuoz1Q==
X-Received: by 2002:a7b:c8c8:0:b0:401:906b:7e9d with SMTP id f8-20020a7bc8c8000000b00401906b7e9dmr28643611wml.18.1697450647959;
        Mon, 16 Oct 2023 03:04:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d161:b45d:c978:eb94])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b003fd2d3462fcsm1380039wmq.1.2023.10.16.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 03:04:07 -0700 (PDT)
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [GIT PULL]: clk: meson: amlogic clock updates for v6.7
Date: Mon, 16 Oct 2023 11:58:26 +0200
Message-ID: <1j1qdux4rt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_030413_170008_20067A31 
X-CRM114-Status: UNSURE (   8.39  )
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

Here are the Amlogic clock updates for v6.7
It is adding 2 clock controller drivers for the new s4 family SoC.

Cheers

Jerome


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.7-1

for you to fetch changes up to 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239:

  clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller (2023-09-27 11:01:03 +0200)

----------------------------------------------------------------
Amlogic clock changes for v6.7

- Add s4 main clock controller support

----------------------------------------------------------------
Yu Tu (4):
      dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
      dt-bindings: clock: document Amlogic S4 SoC peripherals clock controller
      clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
      clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller

 .../clock/amlogic,s4-peripherals-clkc.yaml         |   96 +
 .../bindings/clock/amlogic,s4-pll-clkc.yaml        |   49 +
 drivers/clk/meson/Kconfig                          |   23 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/s4-peripherals.c                 | 3813 ++++++++++++++++++++
 drivers/clk/meson/s4-peripherals.h                 |   56 +
 drivers/clk/meson/s4-pll.c                         |  867 +++++
 drivers/clk/meson/s4-pll.h                         |   38 +
 .../clock/amlogic,s4-peripherals-clkc.h            |  236 ++
 include/dt-bindings/clock/amlogic,s4-pll-clkc.h    |   43 +
 10 files changed, 5223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/s4-peripherals.c
 create mode 100644 drivers/clk/meson/s4-peripherals.h
 create mode 100644 drivers/clk/meson/s4-pll.c
 create mode 100644 drivers/clk/meson/s4-pll.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
