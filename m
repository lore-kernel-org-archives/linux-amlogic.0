Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E0EC3DA6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bULvvMMokthKKB6d3i7tqN4IriIDnANLRzpZeVns6dk=; b=thea46I6vH5bk2
	5hGcU/rzN6vjT6FhRGwtQYtNUJcHFHKcBJPDHU1dcWvlEHEzeXLEHJiJvknJU7LtRK3ApNu1fnERr
	V+wPP894T8x3v6xKSeVkFtDYqrTJWnWXnbsFIUzx/iLdrYjRad/XnnT/zMJdvf5iqtthm+1fLY0a4
	d4J4LMoxPUtOSUS/Mr+4nrNjzXO9JlHppGyI/wBhnvTNW9YObGI6eaI5ANkg1thJnWFdDJZsefd8p
	Nr/h24ISsSLg/L+gUdE5zrO1hgl/aGaEui3xeIe3A+a6eR/7d0P0dEeg0IOGF5xf9+2JWvye+MHC6
	eKOk82agpfC0lRl5MGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNto-0000000Gd2w-3Om4;
	Thu, 18 Jul 2024 09:58:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtl-0000000Gd1Z-0Ya5
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-367b8a60b60so375757f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296683; x=1721901483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apqr4MjpXZ1D4CbWyTpnUc+azdCUdbdHdOC61/0sTcA=;
        b=HDv1g+gVodvDsDyB/LkdTH6b6W2lkOzdiyJnjRVnc0tgD648DqYLLd2EjXmIsa1io/
         JjaCrPBTb6dpO5GoYYM7EEvMwsvOeadjhxfQjRijLEnr3obTNK6X22zX8qZ563vm4f0q
         7GEKqGzZAo/uD6o0cSgjhu2htvaMsVenQ3o1Jap3ltDevZw525rLFGufv7XI12GZe14+
         c3LaQLrPnJ/voo+OyNJF3muR+Iek5AnWqxfohjZgEvYt546j81jM1O/aOCy1n/Jp4rXw
         mXMEz+wmhTV74Sf5LGd18LbNKngqx7qWM8mZtpBugZb2o1fBX0eeGO4bGmgPl2GBwv4+
         z7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296683; x=1721901483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apqr4MjpXZ1D4CbWyTpnUc+azdCUdbdHdOC61/0sTcA=;
        b=bsl8tp9klKeiZK1aUfQ5ReWQOk0dlQwk+FxO6iBojnwg+kKN3wLLKWwE1N0EaBt/Dm
         UDtc+G0ZigHaQJIymX2BxXeGXu8d/81MRiHXahWMgzvAlskeMuCOlKvn1Ycg+Dnn+l0i
         3vMLjvJlz+F29s0MIpap1gJAmGCPmsJfOoQm3zSs5lKgMBg1+n1Tdga3V8D43rZaa+bO
         9wCLxs73kLn/Dr/oh9/Oio5am80tPgDFgOfou6LHhqwqzT7gh1KDJPVivwpLQnCTbXA0
         b/Lzbx9F1hcKH+qRuIEogb/W2uIIzBhOmRJ2phAby8uz0Q0KMRbbIed/V6t7/jb7HvU0
         Nt3A==
X-Forwarded-Encrypted: i=1; AJvYcCXYzuXBPiJmP3ar0H/17gQJNPB3wvQsNNeVxhd+nnoRrWnWiGt7UmIPpfaoQPiDXL2Az4CZv70oVblGXDWPi+eT7VOriNWB+4gYoWRzbNbZ4G4=
X-Gm-Message-State: AOJu0YxY61Tgl47om8gZR0+12gwq6WUhKMFB0KzlQ2jNpp3t/LDeWIdk
	zKc/pQrar6I78oHUcr1RFaxKLHK903J6WID2cTTxBejJc/1DCyGb0UKokXnJSDk=
X-Google-Smtp-Source: AGHT+IHPLDzIfgK/BifnQdo6doJOM8/tpFYJfvzun4tqGe+2vBGATojTwO9cCkzNqJXzETloX+A32Q==
X-Received: by 2002:a5d:59a2:0:b0:367:9073:3496 with SMTP id ffacd0b85a97d-3683160e527mr3553248f8f.29.1721296683409;
        Thu, 18 Jul 2024 02:58:03 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 0/9] reset: amlogic: move audio reset drivers out of CCF
Date: Thu, 18 Jul 2024 11:57:44 +0200
Message-ID: <20240718095755.3511992-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025805_194750_CBF5874D 
X-CRM114-Status: GOOD (  15.63  )
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
the  g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

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
 drivers/reset/amlogic/reset-meson-core.c      | 140 ++++++++++++++++
 drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
 drivers/reset/amlogic/reset-meson.h           |  28 ++++
 drivers/reset/reset-meson.c                   | 153 ------------------
 include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
 11 files changed, 455 insertions(+), 169 deletions(-)
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
