Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24475C61DDC
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kipLqyKFiJo6D2lryAUnOPCCr4YYrHCnDhLZoUqndIc=; b=c6rvQ6Qj06gTxK
	9mqTjD4oeiWYC+uKBuc9EnzzbuSsZW3s/nuBPEQD0bBdvudIQL621295dbBfWGuSG0WDiboL3EvMA
	sbNuCh/Jfhj63J3J3GfaqvbBRwyYTQ9CdiYyaZTcKKkzL1H6vVGZ1fCNombSmV5dTR0T2aoYAiyWK
	bVek5dlG0syfc4Z8iUVnBIEynjvyIH3wvs7XebE29wfkUJAa08xotADDg5ogtxdE/E73lGg8ZIFzj
	Gm3hOETBIPElnQd872wlzTMFs3G8hxqwUxVsCPKFZ0nPv1rBbfIOlByvFXDHDYhdYqzlkhoDWubP1
	QiYNHGG3IvwRA8Bs2RTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfS-00000006thA-2EiG;
	Sat, 29 Aug 2026 09:48:06 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0FfO-00000006tdm-21z1
	for linux-amlogic@lists.infradead.org;
	Sat, 29 Aug 2026 09:48:04 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so19838275e9.1
        for <linux-amlogic@lists.infradead.org>; Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996880; x=1788601680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rJ0DhyCHllIMH7L1DGiwV3mp7tCq7ghlGuKeBd4/eQ=;
        b=GdmVxLo3K1krZ1z0wtsrf+IBo+k/zeEV8jT9sXswz6n0fUkjKyhElWB0hvfIKerscz
         3nHTulOZIJ+viK2Px8jdBeXzecdagstjOfZbKOgpi4GzqmVAavlnm1D4uq5RLTAHd783
         asPpk13pPJczhHxvV8oUdB96sJ6Rn598RpYQ/IoO8XgUljCW0zEYL7LidgDbtJ736T7n
         xDGJlKY+B0iQO+SKbtnqLu8jPX6p+brK3lOV7CBhJ0sLLcW0bNKITKF6HQC7X4+9nY+T
         l3+NcYsK0AVdpF1Qczza1qeHmPJxFA2dI4790XTZqGTX9+V2KARmr9hiMG7aDMOh6eVl
         PWFg==
X-Forwarded-Encrypted: i=1; AHgh+Rpjsv5vJKkZNoumxCUUZZN6arBNHi50kNKYqsxMcJlOtksDbVl1/gnRkpEhgK1B55oS/MP7Xj/iJNKsMpBQ@lists.infradead.org
X-Gm-Message-State: AFuF++nYp2xqCyk5SQ8EVHdiqdIXKN3hzC53noRnHtfSZT6k7x2skbmt
	pGruE0YN3+Uyq8cj2hxh3BjM21u390Aqxc2yUjCOGsIMZbhzTfwkI997
X-Gm-Gg: AR+sD1207Ay8U32hReESJJIlb7gAEV6T/RGTuZ/4nwvujfG6RU4QXeuHIO9QdeSZIFZ
	lyUNtwv473iy7eBM3eJoKGEiTdHBurgRaLXaZC1Qh0tLZaXFMiG/9D54/E3Vk2c2MDQEA9Wf3sT
	vudFX1aWjW2d8hHfDANGGd1pkeuFWvsLOI0tbeIcXw6qPx7zWML5yAI8AWXPMFRQDGPn4SyFML6
	bVRHklGpCiT4tfABxzjy9q/7sbkpN2QkYy2Lbk4hCe5bcNM/SG7XHCsL+DdLXmgQYvBooM9mIgP
	UveWmqmavfWNDXWa2eBCv7HNBj1xZ/s6Q0EdB7vnQ+YIYUCBGVpxyFRewvdLl0/6OrGcQvxsgIv
	PVdq3x0p+NJK68sTp/va1+mzibisRti2JVQq3QrS7kHmEir0+bJIB2aagQEytOdNyumyVqaJwEJ
	tli2+omU/noR0zc3KV4IycSIEazGN0jly7nkvQXE3AlM5PUfj/X2Dm/KrNslyRrBrqOJkT88n3N
	SqtnPmmh5NSfNqz1AVn+77MeEqu6PXjmqlHng==
X-Received: by 2002:a05:600c:1d1d:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49b91c3ddbcmr152418085e9.10.1787996879686;
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:47:59 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] arm64: amlogic: t7: describe the VIM4 supplies and keep the fabric clocks running
Date: Sat, 29 Aug 2026 10:47:54 +0100
Message-ID: <20260829094758.23248-1-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_024802_534202_8988BAD6 
X-CRM114-Status: GOOD (  11.47  )
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

The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
the board hangs at random, loses storage and corrupts memory, and the
failures move around from boot to boot.

Six of the SoC's PWM outputs drive the board's voltage regulators: the
always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
of them were described, so Linux saw the outputs as unused and switched
them off about a second into boot. The regulators then drifted away from
the levels the bootloader had set, which is where the corruption and the
random hangs came from. 
Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
critical.

Separately, four clocks feed the bus that carries data between the
peripherals and memory. Nothing claims those either, and switching them
off leaves any device that starts a transfer afterwards stuck. The SD
card comes up about two seconds into boot, so it was the visible victim.

Two of the patches are pin group fixes. The description named groups that
do not exist in the pinctrl driver, so anything referencing them refused
to probe. That is what the supplies patch needs in order to work, and it
had a second effect worth mentioning: the failing probe left one device
unbound, which kept the clock controller's sync_state() deferred forever
and quietly stopped every peripheral clock from ever being switched off.
The board looked healthy for entirely the wrong reason.

Tested on a VIM4 booting from SD with no clk_ignore_unused: 74 clocks are
still switched off, but the card enumerates and the root filesystem mounts
and memtest runs clean over 512 MiB.

Thread about these issues in Vim4:

https://lore.kernel.org/linux-clk/3930906f-783b-4d72-9260-ba25cc8081cb@linux.com/

Lucas Tanure (4):
  clk: meson: t7: keep the memory fabric clocks running
  arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
  arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
  arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |  44 ++++++-
 drivers/clk/meson/t7-peripherals.c            |  13 ++-
 3 files changed, 156 insertions(+), 11 deletions(-)

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
