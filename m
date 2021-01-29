Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB02C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75AD864DFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75AD864DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IR84egiOYpF7Ywg5pHU0mlmFZ0Xev/8uACXs+GbR18w=; b=FgUmmb/39ZZ+1xAFVib7Rz9Z+G
	8KvEj1X68Cm/+aPcxS36tTdVu0U6dgS1tcSia2QzXDJ/Q1O7MK+of0VOPTvinqLMbvKkpUq6PxM+K
	ONslYWGlmnReNAhaaBYY8WsCIcz/JoDT/5LazAxbCOVhosUAQSwm41Os62Yzi4MV7XDCWa0mQvTfX
	3Wpia9bs+nhaNc/N5+KxDaw6pXJ7r9QrMs4xpmm/LcqNZ56xp4kr8Hcu9tCamHPxWT6x9t6dPeopi
	yCT3zbdowMiMSv0eZriTldN9Dv07G1ip3KDnzr9FKJEupCohOuAU7bQXN/5cxilh9o3RhrB56mlgI
	4zX8VmJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5NdJ-0005fC-Ei; Fri, 29 Jan 2021 06:51:53 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NdC-0005cT-1G; Fri, 29 Jan 2021 06:51:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id 6so7728227wri.3;
 Thu, 28 Jan 2021 22:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/LBcU80K6cUJRkfMZX4P42tI8HDwdViTAGmLyJsVozY=;
 b=LIg1qOAd1DbXlN2H3kuO0mmCBSqiZ67+kff6yZiAK+Thlv7cpxxt+Y4w5riibMERUL
 ZZrcH5ntjPXlSiWEnr3XeZMR5fIrwprJlei1OANh/bTWk/ApoEuc7BTcmtzUCZzFc+9+
 z+Q+KMTjuCWSdtkRptS7VpOav1bYynFIZLBixK3x/0lrk4gEFzfjmA+1TmiUrxPfGily
 bqo7DzSAxIyifaj05CyuuiZ18oCchevFp32jthtYbtF06IjGo4CLpoYW4HCWt/edaVxw
 bR8jRGJohxgHyKtDxGzAXken+lWd3H2UgF/rYL8lIlFkHs1YZRCU/gyfeDI923qh2dPp
 CiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/LBcU80K6cUJRkfMZX4P42tI8HDwdViTAGmLyJsVozY=;
 b=FTqOm+b+Lcdykfs3vEc2/95U2qqBHrWwWcNrI6QUULMIFgockmujiaJL1QsWQwF8km
 YKtGbISjRPAG8KNsCqXHHvGmG+yDO/G9TXw+Jywl+VTyNn8UQl3Q5hsGRJ7Z7aI8hbkw
 LkeDakfxh98UEFAPUEuq/VGKBNEwgLT4cFCWPwKVhe6gDxpM9Pk+8F8rFA0oZ47KiX2o
 sN5Q5z7cLPVqqe23u/EFxsnlhjPH+GAIu2yjvm2xZ97t6UmZ4YSwNkYKTDadVkvalXyy
 U9CXGnYtEKo1iUMZzfPG0bUO4WBP8uiSuoiqGV9CZYJblHRmUiSgSsWtGmdRAkBWpz+h
 gGSQ==
X-Gm-Message-State: AOAM533ZWSn82olHn173LRBzFsjUJuJhIBca1f0MJyxK+LCfPbnBe3a2
 yHaSwhghkR7IEjOlRdZy/YY=
X-Google-Smtp-Source: ABdhPJzQPQhHtxZspEQvTWw43z80nenAty8qZY0wOnoGwEdtkh52kqTk357K9cdhep6o8BQK/y4wzQ==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr2546333wrp.110.1611903102351; 
 Thu, 28 Jan 2021 22:51:42 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b7sm11501236wrs.50.2021.01.28.22.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 22:51:41 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] arm64: dts: meson: add support for ODROID-HC4
Date: Fri, 29 Jan 2021 06:51:32 +0000
Message-Id: <20210129065137.5473-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_015146_133166_CEB63897 
X-CRM114-Status: GOOD (  14.98  )
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
