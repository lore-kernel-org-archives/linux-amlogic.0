Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD76C52D73
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MtBgAtoZugQhmax0TBvSNMMyAdCuRHSSss5VSOygGhg=; b=L+40RUKVncHE8D
	jKLA9bBEOPYKS3qpwjIhlZuzXuKXt72SOBfyTj7xjiaGbIE0QWRNUvJGpDL9Fzb5a4HCTSy2RKDdV
	proJ7taNS9qRAMh/dUEsEeEJhuNO1xs8drQ/5UBWrtwk8dPmDtHaJy1wl1O1wQdlXZU1oRv6t58FY
	jtdiXdWyS0OutRDxggEv9x6d1tNNuWSCTkjle66PJ6rS7G9RnxIM8sZ3rGfjKFJnEYFyJhyU86B67
	d7rAmSTVUAuZRtC3jz0Va4dIn8KbVTmK7vOdyOIFUduibiigLotnL+E82fm4wQYJ3ySuS77ghwnG9
	MbIHKFrTbR0NNRgMJw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NL-00000007tL6-1rIa;
	Thu, 08 Aug 2024 10:28:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NH-00000007tIj-0lBJ
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3684407b2deso400839f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112882; x=1723717682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZND/cy3Z516ACCTnpV9ofYo6+loCngOYmYnistIhps=;
        b=JjZbcRCh9V3CDGMfDP/uF4aou6hvL4NUBsqWJSjVGgObfzJs5wLIK+kmQvzb44kry7
         B+/VUxpWvsxlB/zACNvnV1UzLNbXQYq2zQZTIoFaz0VsBFodYTUeoGAvEVafhJlajN3p
         aeA8evEfJM5vKNrJ0jT843Hc67ivSJhkIWBzJLGCIE6osPNjBjxR8xDubsashFO8MIAN
         +Vll+FWzaKMZm6JJ4HKsXgKMiFlMNe90vazJ315mZqw7YgY3ViOnGcIIbDDL/WKwsH3O
         +ZAJj51kmjCoEvLiq1Vekdm0oNPqiT3ukIVPhyi7oVkbIgcAWo+7zU30cUCKT6te8ybx
         sD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112882; x=1723717682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZND/cy3Z516ACCTnpV9ofYo6+loCngOYmYnistIhps=;
        b=bEiseT/ggwKph463va4UpEX8Q+BINZugfjjNEU5FM2HaN8GPOXKst08qyfV8H/1WwR
         kQt4wO1rH7iCQtnQ7Q6WYicv8WdmmFyVCiMHqcrmhnxk1qsdgHJ9vNb3vLUgE73gsGAr
         DDI83bw6JSjMt/nrMGw5Ts8VvWY1vOQ9IQQESMv0vVGJtHxSE6oD4N81Fa1caU3k5pYU
         z6wPL3rr3el/E1xWK5Vm37Q8HLhe5FJVi8j0qkD2j6kmEEJkGBaJwVOiuf+gIM9PzOsN
         IsQO6WE1H0ugcn/LtzkdGPWym502BHgJ6gfXqz152NbSVsNrEDQW7xrvQq+/asmxbKO2
         n4YA==
X-Forwarded-Encrypted: i=1; AJvYcCXeH7AJj772iJi8q0ZL6jB20frsHNA+MP1gOT7UwA3HKDD9rNkttjOoeU5kB4rkqUHunqYwHjx+W2Zx9DSNewXt3wzDPwTyas8tZ4zGQIiycrE=
X-Gm-Message-State: AOJu0YxV93NZkwzLinaIbYWKA1bZAB/CPRmlHxssRdXyPN9fD2HF45gr
	8HdV0s8l9Z96skaOr5WBC4s7ICySYiH0uEVN1DKeAnO6CYvH00W0jjCZcdC6y+s=
X-Google-Smtp-Source: AGHT+IFYU2RQPPg/KjZXn7ZtFuIvQu6nUFhl4ghGOJZsi+bsUJSY3bvLQMS3+wd7ad+9LDIv7FuIKA==
X-Received: by 2002:a5d:550f:0:b0:367:4383:d9b4 with SMTP id ffacd0b85a97d-36d2757674emr1085501f8f.56.1723112881342;
        Thu, 08 Aug 2024 03:28:01 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/9] reset: amlogic: move audio reset drivers out of CCF
Date: Thu,  8 Aug 2024 12:27:30 +0200
Message-ID: <20240808102742.4095904-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032803_244570_5D6619FA 
X-CRM114-Status: GOOD (  16.67  )
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

This patchset follows the discussion about having reset driver in the
clock tree [1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2
trees and could use the same driver code.

This patcheset alignes the reset drivers present in the reset and clock
then adds support for the reset driver of audio clock controller found in
the g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

This was tested on sm1 vim3l and gxl aml-s905x-cc.

Changes since v2 [4]:
 * Fix undefined read access of the reset register
 * Fix Kconfig symbol description

Changes since v1 [3]:
 * Fixes formatting errors reported by Stephen.
 * Changed parameters type to unsigned
 * Fix usage of ops passed as parameters, previously ignored.
 * Return 0 instead of an error if reset support is absent
   to properly decouple from the clock and have a weak
   dependency
 * Split the platform and auxiliary modules in 2 distinct modules
   to fix the COMPILE_TEST error reported by ktest robot.

Change since RFC [2]:
 * Move the aux registration helper out of clock too.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
[2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
[3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com
[4] https://lore.kernel.org/linux-clk/20240718095755.3511992-1-jbrunet@baylibre.com

Jerome Brunet (9):
  reset: amlogic: convert driver to regmap
  reset: amlogic: use generic data matching function
  reset: amlogic: make parameters unsigned
  reset: amlogic: add driver parameters
  reset: amlogic: use reset number instead of register count
  reset: amlogic: add reset status support
  reset: amlogic: move drivers to a dedicated directory
  reset: amlogic: split the device core and platform probe
  reset: amlogic: add auxiliary reset driver support

 drivers/reset/Kconfig                         |  15 +-
 drivers/reset/Makefile                        |   3 +-
 drivers/reset/amlogic/Kconfig                 |  27 ++++
 drivers/reset/amlogic/Makefile                |   4 +
 .../{ => amlogic}/reset-meson-audio-arb.c     |   0
 drivers/reset/amlogic/reset-meson-aux.c       | 136 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-core.c      | 139 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
 drivers/reset/amlogic/reset-meson.h           |  28 ++++
 drivers/reset/reset-meson.c                   | 153 ------------------
 include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
 11 files changed, 454 insertions(+), 169 deletions(-)
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 drivers/reset/amlogic/reset-meson-core.c
 create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h
 delete mode 100644 drivers/reset/reset-meson.c
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
