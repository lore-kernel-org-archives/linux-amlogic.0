Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1982C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4475B64EE0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 02:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4475B64EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDsrrLGzaf4mMu8P9i8K6u29rRNJVCN7wDSWURoWIWk=; b=XNbwFXiEESvlJRNANw0xn+7Q3n
	J85CFRcsDNcSQgULHm0wEN0avrP+3wnIg1V1yKBksHez2tcYuJxBzzI80mDqxToOtveuNANzCuO1Z
	Do0Y0kai6tLH9R3b4jXRten4Fdp2cO+NjfYai2uL01PEkjhRloblm3ZvFVRqd2gHe5iijQIr9oNRY
	psKB5fanraT08EFW5p3qa/DrUhWK+PnoDM6OlcWn7Pr1JaKRiD6jJmf3nb9UQkl/qpM6w8R6rILcQ
	5mVmZmUon0psu4NFgyhSNcDEJuSwdUD4qXEKeIYz6cRqHS3N38vfRMo6hOtBc75BIn+yNx0EYdzZr
	QQWQmQhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6l9C-0004KA-SL; Tue, 02 Feb 2021 02:10:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6l98-0004JH-W6; Tue, 02 Feb 2021 02:10:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o5so998210wmq.2;
 Mon, 01 Feb 2021 18:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=f6cfnJUj3ixleZugMsurt3GK+ClAIDiuD3TFRsp/gNU=;
 b=Q9OC1V7F6GU8kJh9uHNzuxKQqYMM1FZeo+XTauphZ+SKM7lhrU7J9Bd4oY7DUbK2hV
 qpt9ok+hSk+WQANPFlZ4p4NERncSIT3IxqHTc45Eb6eFNMI1qKhuaOrD9c0AbeDG1xWo
 LX93WAeEKBH4NPQhyl93p9dS6GPqXQJjVMvOLL4YSGUCvuR6WwXOqlbhJPQfwshLAV5I
 ZYBbaR9rPmrlYqNHjhLaYkhUrVzRugJBOzqkz1RTYg9zBG4isZYT9+VL4LZYO4IX8zK5
 Dvy2lsH1yXg9DiXKrxRE2/vMwHLGHHd06Yzcs1r8bRdmUihDy421KB+/BxmXSKZXpl9+
 qtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=f6cfnJUj3ixleZugMsurt3GK+ClAIDiuD3TFRsp/gNU=;
 b=DKn3HhLEkNZqVSzeMcmKBISfemyS11YT0pgtxnAc1YPpu/cprAPqYbhyvTVFjMa33D
 vEFg/v4DfX+y+KlEhQuIXh5NVuNIX6Cf64GWXVVWYtk8QnHISkm9pHTAIMkrqdkO4z2A
 YuA7eYxcFDRrHeH9+UtHSGmi+i/qUgc/BVOu/cBizlRJkCtAF+3GTHX4+DIgec+3gEbT
 yEo8Ppj/8HkadIdtbG58eR63k3zPuSF4Rg7A5dhV24rL5y7EHfHjxHrxYSj8cygcDKEb
 HzJVES4PNinY0nfbv2QK5MMgekdHuKBfETPK85qemicgCX3Cc/bxaEP1fOVGxOifXDYD
 9eCw==
X-Gm-Message-State: AOAM532W9ATGjMwzb0iHvxJkHJXLWy7hvHTvHph1e6h04jGxUAgb82a0
 fhWHRWpMNB9gFlmlybJpSyk=
X-Google-Smtp-Source: ABdhPJz4VUGoRhko+s6ShlvQwvw4Gmm/ELgj+i1+EG9swV576yp4d79mLLd+eAuI2kulUScKk9uwUQ==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr1350553wmc.35.1612231825785; 
 Mon, 01 Feb 2021 18:10:25 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u14sm990570wmq.45.2021.02.01.18.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 18:10:25 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] arm64: dts: meson: add support for ODROID-HC4
Date: Tue,  2 Feb 2021 02:10:16 +0000
Message-Id: <20210202021021.11068-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_211027_381633_C2C44B26 
X-CRM114-Status: GOOD (  17.01  )
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
dtb Makefile, then converts the existing ODROID-C4 dts into dtsi so we can
support its new sister product the ODROID-HC4.

I've also given the devices different audio card names. This is partly
cosmetic, but also because HC4 is HDMI-only while C4 can be used with
other i2c audio devices via an expansion connector so users may want to
use different alsa configs.

Patches to support the spifc chip are still being upstreamed [0] so this
will be addressed in a follow up. A WIP patch for the dts change can be
found in my amlogic-5.11.y dev branch [1].

For reference, here's dmesg from LibreELEC on 5.11-rc5 [2].

Changes since v2:
- rebase on khilman v5.12/dt64 branch

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
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    | 442 ++++++++++++++++++
 5 files changed, 544 insertions(+), 429 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
