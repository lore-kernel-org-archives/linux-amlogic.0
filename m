Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7420AC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/jbdQssSO2vcM+D5zTjLJS/VWaCOYUdzutv2bDKagy4=; b=k1sK9i64mjdGXf
	para4aAks/Du6OgODdihBHzf/7jny/1m49OtZiTBy+Hund2RekOtV+MQF/KyPv4L7uchhwpuczuaw
	5UkPFvzUSm0QeBcBIuh2En2TvSLU/BGM4+BL0ktFoIvhUtC3sv0EUv9YqIV6Bh8mp548fWfoxDKfz
	0ME7QsuyaN9+Wx7jWbakrxZ8Qf6ne/wUypQWlZaZ1fGC/cGgthGBCm8qYG9CuFO63YvH7xVeKdkuA
	F1B9YVldOXbbBUMo/3EUXOwdnYoN0M7RiPJO380RzqD58RJYFaPBKDME1yifx9SqGu3v1p6bx4fwC
	xQDARdi/kGhuHPECSfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QNb-009Tsg-1v; Mon, 03 Jan 2022 16:40:15 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QNO-009TnK-8u; Mon, 03 Jan 2022 16:40:03 +0000
Received: by mail-ed1-x533.google.com with SMTP id y22so138078234edq.2;
 Mon, 03 Jan 2022 08:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eht7o1AHSMEA/BlQ8ldVCsOJ6QACXyHtWePKYMSt5rw=;
 b=AgMDCKqcOg6gqaboXtVg9pN428AaIhXz5ih18VNdvAndj4VdDmLq90HvIiBmcEnn1D
 I0GutjpNPYLXO34MYkGzQfUgbB3zobWI05yYpEx/2SX1YToXoJrNLhIhh3dD138lWGL9
 yA2TwkkrZxZyHW/zmpqcqTG6liEDCoXIyleIaE947Mx9q4YIK1C+CSZ5K2+yo1A5itWV
 2qwb3cBpQho8AZiHsh4eX/NPKAPOchBAwS7a5IQjYGkuMzm0NjRxcJ5KG/DTekBs6k2X
 AiSF6NNVfqG0pstHcCmRFXRVWxYbMwQg21r2bFy7HImRVCZGbtx4103C/Je4ZrsIfExj
 wb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Eht7o1AHSMEA/BlQ8ldVCsOJ6QACXyHtWePKYMSt5rw=;
 b=ESfTtW4LW0hUCA91PcD1fxLv93CzaiLJIWrSeHB5FrDyCk3mCa74CjxGrGG0FKMhZQ
 dTsWw4CGyAbsV8OsjgTEqgT1ZL0zL4ZoPhe7WfXcSO35KPIMAozU0nWXDDny8UuK/xh3
 gSv8PgxXI+3sj1MWcirGclGl6BxN0t4tbVYxWWfooWxv2+P3gxQOfbBmZ8k0B5ArjTUP
 pIyirx06qeCSafwvnjm61XN5xdkPOlv7v0NhKBb8hSXoImUp41ep6a0ikFyFOeSV/iU3
 HL4qRti/5E6mLSv2HQ252vZLYAW+0psNCJ/tFkB3RSvlnMPrg8GRqMq39vHsGomJNzE1
 2gAg==
X-Gm-Message-State: AOAM532lloY+CPLK+E3KXVz3DE7+haOBt2whACD4rV0mAGLjDEcs1Y8n
 xizOfU5LlT3j8CIwXAuVuOyxIQVlBRZY5fpE
X-Google-Smtp-Source: ABdhPJwKhLJV8eDOclSmpRU2ulnpLvZ4PUBfU/hVi3ZVeuTzJfFYs3bSzXBNG0RG1djQ0TgcVF+xBg==
X-Received: by 2002:a05:6402:154:: with SMTP id
 s20mr45971514edu.148.1641228000718; 
 Mon, 03 Jan 2022 08:40:00 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id oz20sm10724068ejc.60.2022.01.03.08.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 08:40:00 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v2 0/9] arm64: dts: meson: add support for aac2xx devices
Date: Mon,  3 Jan 2022 16:39:47 +0000
Message-Id: <20220103163956.6581-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_084002_345360_780837B2 
X-CRM114-Status: GOOD (  15.40  )
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

This series adds support for several popular Amlogic S905X3 (SM1) Android
Set-Top Box devices. Like most Android box devices, they ship in variants
with multiple RAM, eMMC, WiFi and BT configurations. RAM and eMMC are not
something we need to consider to get a working boot, but we do need to get
the correct connectivity spec. Broadly speaking we see boxes with Higher
and Lower spec connectivity; High spec is Gigabit Ethernet and Faster dual
antennna WiFi, and Lower spec is Megabit Ethernet and a single antenna. In
some low-end boxes BT is omitted.

As initial distro setup is frequently performed over SSH or an HDMI GUI
app it is important for users to pick a device-tree with the correct
Ethernet PHY spec else connectivity is impossible. To aid this we append
a -gbit suffix to X96-AIR and A95XF3-AIR models using an external Gigabit
PHY, while 10/00 models with internal PHY have no suffix.

NB: At the current time the Realtek 8822CS and MT7668 WiFi/BT modules we
have seen on 'AIR' devices are not supported in the kernel so these are
deliberately omitted. The H96-Max uses a conventional Broadcom module
so has more complete support. For now the boxes have simple HDMI audio
support; wiring up the Headphone socket will be done at a later date.

Changes since RFC(v1) series:
- Add Robs binding acks on patches 4/7/8 (patches 2/5 still need acks)
- Rename and rework patches around -gbit (as requested by Neil)
- Correct 'manufacturer' typo on patch 8
- Rebase against v5.18/dt64 branch

Christian Hewitt (9):
  arm64: dts: meson: add common SM1 ac2xx dtsi
  dt-bindings: arm: amlogic: add X96-AIR bindings
  arm64: dts: meson: add initial device-trees for X96-AIR
  dt-bindings: vendor-prefixes: add cyx prefix
  dt-bindings: arm: amlogic: add A95XF3-AIR bindings
  arm64: dts: meson: add initial device-trees for A95XF3-AIR
  dt-bindings: vendor-prefixes: add haochuangyi prefix
  dt-bindings: arm: amlogic: add H96-Max bindings
  arm64: dts: meson: add initial device-tree for H96-Max

 .../devicetree/bindings/arm/amlogic.yaml      |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm64/boot/dts/amlogic/Makefile          |   5 +
 .../dts/amlogic/meson-sm1-a95xf3-air-gbit.dts | 129 ++++++++
 .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts | 108 +++++++
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 300 ++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 145 +++++++++
 .../dts/amlogic/meson-sm1-x96-air-gbit.dts    | 133 ++++++++
 .../boot/dts/amlogic/meson-sm1-x96-air.dts    | 112 +++++++
 9 files changed, 941 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
