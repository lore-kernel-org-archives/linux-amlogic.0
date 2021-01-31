Return-Path: <SRS0=NBQ5=HC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D31DC433E6
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A508A64E25
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A508A64E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zaw+BO/O7HiBQ4p5dL/ARleNCSHNUtSOxkpo3zrsr4=; b=Zm54/dUJ+zJKchIdxJDKuxyOUp
	7UlYRbenrez625INc0EoMNWN+6mTrY3yNWXNiOu/3Ge4ZFkv/NNPy5SIgx1jaI9A4YTAQ9HLKyxGB
	wCvHUDZDV67jknjaCrrE14uAU8ZXBacQIR43dyEhIfWZz+sjElwqNP8zS6C94jwerxii8HHvlb5Su
	jJaJIiBd8NJ/8nuvbmlY2zW3XItkLxUydJ1ussBudTaFes/MksJLGvOLUL6JRU1xhy/3hgYXXB1ca
	vxSIVu0sj1jPLRBf2fOEsRKtiIYmiREZAeBtJU8vTGWBsdQtjthNQ8FtEJ3tu/LCdCeKRABgqqjLW
	DpsmER3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l65ga-0006Ad-1l; Sun, 31 Jan 2021 05:54:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l65gV-00069N-Af; Sun, 31 Jan 2021 05:54:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id 7so13044299wrz.0;
 Sat, 30 Jan 2021 21:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YXzz4lbNjjkYopaBrkrflVc5oiqbwCaZksxB3VFG3no=;
 b=RQGdie3S0gicwLeqDKFGNwawZh4uHkbr6wBwexO1xV5Yf3j7vlzSnOJtklpHzbyu53
 RNjzgzvAvaxINYNeTmr9EB36ymSSpdJHQlnMTttS1Bc3YUOnLdMIl4a9EoABxhQDz2Aj
 yk6BH2FkAKS6qyYfcQ1rmvDUCiUyHalRU5h+zChck/te1G2zbI9z77ctdMcF5SBMuiLq
 vgI8dnVSL7M6j15PoBmdvKkRp7uLiXQusbzH7Gd+ZQFCBby5iGZTJiA0FnMLDPiswOu9
 bHUNinxPks60NE7juX+UiGnguvp1SoPMSBOJdOkao7BSIuYmqj8LUJu23MG0RyfnXpBm
 glkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YXzz4lbNjjkYopaBrkrflVc5oiqbwCaZksxB3VFG3no=;
 b=N9PZy+8g1PP00fYIq1CxyEMlESQ29mglAYgmV3QJ2D11hUQ8dPEL0EAe2wl4/M+dAc
 Lq9S7tjM1gCF3gqjdP3lJLQILB6OUHci9BXnPhiUykZgkuhLzYWrTX1CcpKIekohbrpH
 bxZSNnnxPuwtX1UE96EjVy8mr4u3iUVoIkYhvEDyEkIxRcMdXH/7o4jBo1ySakMy5CVm
 OIKVMwa/hrrKX+HB4eI4vk9lPl31ZuUTl6BHtDI0ZrfAsFNzL7sIulnkMi2COg/oCTlT
 V/gLbBFe9Fr0cHAnbXpgK+w/dUia3x25pm1tY8bjLr96AyRw0r8ViZYjXxiJz5mNCEX0
 IEfg==
X-Gm-Message-State: AOAM533k0ABKYmg7M1XjaV6kbCfeRizeTeCci0nHfECQ2Jv8llFC+/yU
 7hPWRvf1aYLEEGyzuoQ7tBM=
X-Google-Smtp-Source: ABdhPJyhvMCNemBekoiGJPrlxhrYzRg6T7AJws/jC+dLxH5Dm1qgLWZk/hOInQf0vLM+/TvgxFVH3A==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr11814784wro.423.1612072443607; 
 Sat, 30 Jan 2021 21:54:03 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c9sm20056589wrw.76.2021.01.30.21.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:54:02 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: meson: add support for ODROID-HC4
Date: Sun, 31 Jan 2021 05:53:53 +0000
Message-Id: <20210131055358.21293-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_005407_403422_C5357C90 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series fixes minor sort-order issues in the Amlogic bindings yaml and
dtb Makefile, then converts the existing ODROID-C2 dts into dtsi so we can
support its new sister product the ODROID-HC4.

I've also given the devices different audio card names. This is partly
cosmetic, but also because HC4 is HDMI-only while C4 can be used with
other i2c audio devices via an expansion connector so users may want to
use different alsa configs.

Patches to support the spifc chip are still being upstreamed [0] so this
will be addressed in a follow up. A WIP patch for the dts change can be
found in my amlogic-5.11.y dev branch [1].

For reference, here's dmesg from LibreELEC on 5.11-rc5 [2].

Changes since v1:
- fix ODRIOD typo in patch 3
- fix SPI-NOT size in patch 5
- add Neil's Acks/Reviews

[0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20201220224314.2659-1-andreas@rammhold.de/
[1] https://github.com/chewitt/linux/commits/amlogic-5.11.y
[2] http://ix.io/2NCi

Christian Hewitt (5):
  dt-bindings: arm: amlogic: sort SM1 bindings
  arm64: dts: meson: sort Amlogic dtb Makefile
  arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi
  dt-bindings: arm: amlogic: add ODROID-HC4 bindings
  arm64: dts: meson: add initial device-tree for ODROID-HC4

 .../devicetree/bindings/arm/amlogic.yaml      |   5 +-
 arch/arm64/boot/dts/amlogic/Makefile          |   3 +-
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 427 +----------------
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts |  96 ++++
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    | 441 ++++++++++++++++++
 5 files changed, 543 insertions(+), 429 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
