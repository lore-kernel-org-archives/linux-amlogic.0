Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9A0C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wp9y99zfTPrpTM4u5Y4B5Lep4VuyWcwAvkEyQhL8Z3g=; b=xqheG0m8QTeikM
	/hr6cUC+n80npv/AytGZFaPOwl+eBVIQvl0CniPDRqDDudNflLYt6hZjUqFzbuQ9kWMOJLKncHunW
	2TJK2x61VKO4UxDWNp8aAeWTiXLFs1AhijymS8fnxNoVe5jtY/Rw9WPh7Bfx9nil9+ZdKc0GPkiJZ
	mE6BldOlIgn4J5nPC0rRXJJswFiGFoyDVLxwaEBT8ju6XuDZabpsqg526V5gSG+qNLaJaQpO500Mg
	OocwZMFGuO2p7Qd8rGBr+0gfmnMUpXQBtg88qyn3YzG8Kol/wyhGyHZ0OLhvmZW8/4TkWmuluvS/4
	c2sNdvXVOkR38ncrr4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TMQ-000qan-LD; Wed, 12 Jan 2022 02:27:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TM8-000qOv-VQ; Wed, 12 Jan 2022 02:27:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id a18so3926173edj.7;
 Tue, 11 Jan 2022 18:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rbtzR3WiRHG8ekOj52mljErX2OG2pvaLPM1gvyJX52k=;
 b=CJF6ONFWOYv/zH1kM5T444rE2ksvFiXVTcRZqRVP6VgL5swvdwNcpOl4HJ652A3KAT
 JcEGdgyOyz8JdXTe9e6sA3ipBqDcgOz4UkXiegSjnBpvY5/rLHcsHssCElJVWCiP28r5
 HNfgxyWr/Fc+CSrD8OJt4/uVqvTn1AgSTGHyp7GieFlf6IKlmhM1BlAXjYmr34seqFJb
 zxBkK7JzFw7aMUAWqCkXlr1YCxF4cOZDhR6M/WlU1V2++ss04pVFLlgkoEsEFJfuW9vI
 yrVgpNv0iiEIxxaWdvm8GNsJo7F5kFSEGuOuL+ylYKq6IzL/yi7CuHVsOfW2tgUp/3aB
 fogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rbtzR3WiRHG8ekOj52mljErX2OG2pvaLPM1gvyJX52k=;
 b=5GSwkGYfOLzlA+BK6r1PQ49iPli94rN29kOeUka7ntgnQMqeXZIJofgu1UyDt85dps
 pYpgbifw0DtwmFDTHk5BZIoLt/vxTzDAYzjuR6hWbEdvVQOj4Ak7uyXpEuJH29AennMs
 b0/Yt/O9QRr1FXD1fpe3vkQOSVfqxosOi/E6NvxDOaXqYZmZe8oBlLSnerV98tR4G3ba
 7I5uXA2cEVgm/5droh7d8b4kIwAEuvypXxFrNGhLvQGzT/t5AvZ7ANpN7l9BtESmAYna
 YkwMz0RCKGffjQWBEH2WcpbAOSeme+f4R0AD6kke5YpC2gALL4wIf5bMw1CTqKAkEi4+
 xPog==
X-Gm-Message-State: AOAM532BOV5MXqV1o2NtjthbOpGGCMFQCtc1tJKabzgqL7y+ENmO5ACK
 KB/vApsYz8NH0vP4YnE1tJQ=
X-Google-Smtp-Source: ABdhPJzi33yUQF/RXGa49SWv5GOhZhApFEWg/UD9i7/dT4xSvX89Ep+P+0yauxP+fqYH7wZ/FT/MYw==
X-Received: by 2002:a17:906:140e:: with SMTP id
 p14mr5748656ejc.440.1641954438461; 
 Tue, 11 Jan 2022 18:27:18 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:18 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 0/9] arm64: dts: meson: add support for ac2xx devices
Date: Wed, 12 Jan 2022 02:27:04 +0000
Message-Id: <20220112022713.25962-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182721_049606_66A2F4AC 
X-CRM114-Status: GOOD (  16.52  )
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

Changes since v2 series:
- Add Robs binding acks (patches 2/5)
- Add Martin/Piotir's Tested-By's (patches 1/3)
- Reorder Tested-By on patch 9
- Correct 'distinguished' typo in patch 5
- Correct typo in series name/subject

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
