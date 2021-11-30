Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC1EC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 06:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EHGucDFdDbqDb8bDT1pJIJFaq//tFcvsZsu4TNWHqqQ=; b=nV2QffJIcifpea
	7a+HtnRwAbs0uO3yNVA/yETHvgkv+38WmVJ5VUg++Vkz1vrlYqrVHGjjlwc0WdOC36ZisJqSdwoR4
	AjIbsPrceShXzgvUOTPzEA5iiJKraDGXD8zu6Q6PC65EizsGDQP5CfN69bhrjNi2FQrAEjQJeJFYT
	DZ8DiJVEkJIWmvsZYtaN7Mfe+VXlUv5gHZvNL2dGoWlT+JARJTlOHU7wk6Kp4fZQKXmhTB+wOHS9E
	1MVnk54D1IFbncNEFML5cIJYGASHTtx//U6O//V/3tpa2kZ8hp6cwzRevBmEHucfAtsGK6pvrkrVJ
	VRc4eHBRn6p68KsMjqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwGs-003hzU-Q3; Tue, 30 Nov 2021 06:05:42 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwGf-003hvj-IH; Tue, 30 Nov 2021 06:05:31 +0000
Received: by mail-ed1-x534.google.com with SMTP id y13so81948503edd.13;
 Mon, 29 Nov 2021 22:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qd7ugZO8ErlAqRJmMU/RFyz5a/nU/7Ddv8QHIbivAOM=;
 b=NqxFjtJQnLAWXnShg/7USZZp60vHVyqnY0U3T8VG2YJorB3mU3VDn3R3KLsQGOMcOW
 FxUqozyB4f86NGUifah56iY6zR2EFT7nC2TV1uDYByT3CAhdwNKt4wUBpu2fFXkxKD9m
 wN/YHrU9VnajajDE75SOG/PCummG7+qlnQwTE3OzKAtFheAedY/y3nE0yHwFxjfp/geG
 88HSQ/m0Sd6zEgiHrzxC2Dlq4dRr2i4ThB9HbIzt8PBIjt3MpsahHAXHuSnMrxlodw6C
 pUFbo09e4/Ng9eGG5sSYawyZ1jVm613fStWESR38HeUSeA+FHqj7XHL8+0Gm7S/76G3J
 6Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qd7ugZO8ErlAqRJmMU/RFyz5a/nU/7Ddv8QHIbivAOM=;
 b=H3Eg7akyO3D3kgxrwA9U5UF/s3MdhpEUh6xkT7Qo9rEB4mGlptPIIJqcpFz50tkJ96
 OAemRUYIlN2DPewrH6AqPDhSw1vzMhSZz8oQT/lQj38Otu5IqsARcKn5WDc2LwIZhH3d
 +uvDSiuNVYt6F7tBU5F2FwjuvuZzaSYozRA1Ot12tiyXvEhkQ9chlsPEJBx/CnvUuLzs
 zmOPRa8bEwKubXV9NTaeq1sYyo2q0eoLXA1txYId+qDIO3+PH8109+j2DD2Gvu1muBSr
 RHZxJhRxf2p6XLHowxXhLVYZVfqd6kYiqg0567lj7LNopkyk3rgF4rv9vYK2YF/nlkDD
 55dw==
X-Gm-Message-State: AOAM532ib8qeWxzrzihcmlxI+3U1h0ND+HDKE7PaCXNX9PMUm3YBhgpy
 Hz6p6FNd0qIT5DVSUEK0P3o=
X-Google-Smtp-Source: ABdhPJx1I+m5OvA2PghqwGuZ6GERo2hNzui5wPGnWI0kAkQJx9LWc3dB6iQX+C0VSfa0UUn26W7Apw==
X-Received: by 2002:a17:907:6e16:: with SMTP id
 sd22mr61633142ejc.542.1638252327196; 
 Mon, 29 Nov 2021 22:05:27 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e1sm10542153edc.27.2021.11.29.22.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 22:05:26 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [RFC PATCH 0/9] arm64: dts: meson: add support for aac2xx devices
Date: Tue, 30 Nov 2021 06:05:14 +0000
Message-Id: <20211130060523.19161-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_220529_652417_8E6F1392 
X-CRM114-Status: GOOD (  18.41  )
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
some low-end boxes BT is ommitted.

The main reason for the RFC tag is to solicit feedback on the choice of
the -100 and -1000 suffixes which are used to distinguish between devices
with 10/100 Mbit (Internal PHY) or 10/100/1000 Gbit (External PHY) NIC
configurations; which is important to get correct else the box will have
no connectivity. I'm not a big fan of the suffixes, but earlier versions
where I used -int/-ext and -mbit/-gbit resulted in users having no idea
what the difference was. I'd like to informally establish a convention for
this naming before doing similar things with some S905X2 devices.

NB: At the current time the Realtek 8822CS and MT7668 WiFi/BT chips we
have seen on 'AIR' devices are not supported in the kernel so these are
deliberately ommitted. The H96-Max uses a conventional Broadcom module
so has more complete support. I'm also still exploring / learning about
alsa userspace configuration so for now the boxes have simple HDMI audio
support; wiring up the Headphone socket will be done at a later date.

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
 .../dts/amlogic/meson-sm1-a95xf3-air-100.dts  | 108 +++++++
 .../dts/amlogic/meson-sm1-a95xf3-air-1000.dts | 129 ++++++++
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 300 ++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 145 +++++++++
 .../dts/amlogic/meson-sm1-x96-air-100.dts     | 112 +++++++
 .../dts/amlogic/meson-sm1-x96-air-1000.dts    | 133 ++++++++
 9 files changed, 941 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-1000.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-100.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-1000.dts

-- 
2.17.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
