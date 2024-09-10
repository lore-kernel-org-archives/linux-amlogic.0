Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D37EDE99A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MDUHt8nn/VKaFQgOcqbdX/CiMmjjXOgvgnGOZn6Hpwo=; b=XSpqNeHOLM4rBH
	xiviSTElX2ea1wn05rzh2cAfygKveeXRlvCL6gbh6JYcsC+8I1Q7k9VT0mQVSn4wkU6tKHYHUOHX9
	V+gey+qI53OtSzbMZ0QFtkc6DSu9HF8sdG6YNSgUOeDHPkEhLjWUD9rVGWjhgmcH7EEl+tGhLxIE8
	+Y66g74Aw9PceeEtAfj1gWmTSFwJLbKF5i/ZkmZkU/h1kULBZg74m1A78ZSm+WWiYX+Jp+XL9LMZF
	kUu7lt+mFlz9YuTdlY7v5EIw94sxLEdpGxrGI5xWOjDBk5V4Dk1ztCd9DnXXRIADqZ2O9DB8DufEU
	LWbCTvMxz13ghSYSq00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3oN-00000006LQC-2X5z;
	Tue, 10 Sep 2024 16:33:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nc-00000006LAw-3Tvy
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so49276765e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985982; x=1726590782; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1rF4WxN3Aj+tIaFqCtKKzlber4t4h2cbw8FO6Wko2I8=;
        b=gW1tQ62SZbCskZKnunW/mE2TcDZ+EwcXfg2LCXTs4UiwK1j2/0WLaV8I9GFkksuSX7
         0DlrvaVkmwGdFQ1NNCzmANlsbCEc1f5uvGnL3R4DKMEVzr+0mukxUkvyobS8fTJXXs9T
         IWx5VoPa8f9tE1rAkG06Dtusiq2bDj8CD+sbeOgyBmFyyzuOhRaHx5RAjtOO7yuaxZIQ
         49S4E1kCIDZpuAnpYvjk7SN31BG45OCxzQdg1rHLh0lUicF8DrWp99/I6q8eZwR7dmQx
         74RTZ6QESm2OzeI/5rtBz0ECwJjM81iw8hSezktahbtc6iKzWHHUjpZZtrOo92XjJ2Y9
         tzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985982; x=1726590782;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rF4WxN3Aj+tIaFqCtKKzlber4t4h2cbw8FO6Wko2I8=;
        b=JLyPzUiMkKk215v0jaI2+y955cSMWOcEljtJZJDwInYTlRz0KQEU00iAaQ39ie0bmN
         f9KhZxDtdKx3O9MHPzwpeOMSMLrtpLqbLGJDI3IqsNP4+KVaJqtw0+OU/yJucie8/Tnw
         4Exe8lOaO7TZasusdvSIKd+bO7qKm6HO6WGMc29rICRHU1qUxCmp1hI3My0oWTJGXs3a
         PwSwiQWK55qcF9x8NvaaD5MpD3e92U3Zai6+AlIf7WR763bD78AhROFRx++xi8WuuvZa
         HERPH8yNnvIXjNos542QjK3GcE6du2B9pfswYDcv+R5vp/+TIzZ+add18UK7t0VdAdxT
         cIFw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ab9XXUMCBlRswto6YDRYpn+usl38YkcUsqAnFqEtxL++JOvywjUWwES21dSEG6WoBnyrbLE8hFnAxgdf@lists.infradead.org
X-Gm-Message-State: AOJu0YyVoVSRuRwr8FO6+p2W/79BCUwXmwyTUCyGQAQJ19mndvmQ3gIk
	usdOxLduISlCIW5KP1/GlQbXp9GFuck0szsiI7YLi6GS4v8nhpFaPIcHEIq9RN4=
X-Google-Smtp-Source: AGHT+IHA4mhUQ8IpGyrkqlJwG0IpNcAqkgqpxSzPNFkQXfsP6ffvp11Br7N7eiwP2ee1qbWlfvpNAw==
X-Received: by 2002:a05:600c:1d98:b0:42c:b995:20c8 with SMTP id 5b1f17b1804b1-42cb9952455mr51372865e9.24.1725985982016;
        Tue, 10 Sep 2024 09:33:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v5 0/9] reset: amlogic: move audio reset drivers out of CCF
Date: Tue, 10 Sep 2024 18:32:42 +0200
Message-Id: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKp04GYC/3XOOw7CMBBF0a0g1wwaGwOGin2gFP4MxIjEaJxEi
 aLsHUODKChv8Y7eLDJxpCxOq1kwDTHH1JbYrVfC17a9EcRQWihUGo+4h4ZyaoFzB7YfwR6UCx6
 lC5JE2TyZrnH8eJeq9JVTA13NZL+KQSNRHbTaFHF3RA0S7o77lrqzs9MjOqaNT83bq2PuEk+fe
 4N+q/+eDBoQ0Bil/TZINO7XqpZleQHTgucD7QAAAA==
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3472; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pDGy9FTtIgMzLOt/7iSJ+WMuYgXATN9TotjMM+SoczQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS0l+uBsef6GERcGgsGTiooyNalHzzeKeU1U
 VUTeD6RExuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0tAAKCRDm/A8cN/La
 hcgQD/0ZFct4s24VVIibOhf9mve52LEKUN0GKdDsj+wh58sMXsuxU5tWPbvzigeRVfaFvrcK2ne
 UlFjKluD0T88NknnfW2Af9rO+qdDldt4lwJNJUBePQtyVJc/Qsg7iOqRfTH+SCwUNb8vpak+Dhv
 fgE4BNi4EDEYlWSvgtAFTgzTm0RAd7DFl0uFNCHXEw1/8qqGbpk096+2GLPPsuo+xKcTgL6kScz
 xbGiP+enom6O9WvkBLiYXOdxag+YWaM2/wIoYqqXKHVPlKsxmlif6MdGGHtTVr7mYnTFcfQ2fFd
 9klTTaGBl7RNq4YVHqE8vDnYPBAQ9fxBkkkSPLvyLkLI3DW/HidUEinXhjVg60MthFzEFvsal1d
 nAyE5sNxjxLgpciZCPMFxsbcxhESBplrqh/dKWu/S7S2TrkX/sYR9qJlVMwy95HIv/UoV1xfdAb
 KrwK8VV9O9Ov5neBb4JRbWwMQqbSs0gOFXn2TTBaU382dvU3tIR8iZF6zIHw36CYBMsvnfxhNsM
 0YdLjNeAolanAayxyYIGSMlTgvQwM2PoPmBxkhRWiJWV752URGJuckEqPpuV0H3RUIeSwBceinp
 OChgzUyCTK2LtBMnn1ZeRDdzPvTXcm7T4WHv14Jja4YIZf6+y7XvmC6bhIE3N09OyoTrJKE97Q/
 jHg5RqjMdDXpWlQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093304_997095_86ABB0D4 
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
the g12 and sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

This was tested on sm1 vim3l and gxl aml-s905x-cc.

Changes since v4 [6]:
 * Fix Kconfig depends and select as reported by Philipp and
   and 0-day robot.

Changes since v3 [5]:
 * Drop pltf/platform as suggested

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
[5] https://lore.kernel.org/linux-clk/20240808102742.4095904-1-jbrunet@baylibre.com
[6] https://lore.kernel.org/r/20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com

---
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

 drivers/reset/Kconfig                              |  15 +-
 drivers/reset/Makefile                             |   3 +-
 drivers/reset/amlogic/Kconfig                      |  27 ++++
 drivers/reset/amlogic/Makefile                     |   4 +
 .../reset/{ => amlogic}/reset-meson-audio-arb.c    |   0
 drivers/reset/amlogic/reset-meson-aux.c            | 136 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson-common.c         | 142 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson.c                | 105 ++++++++++++++
 drivers/reset/amlogic/reset-meson.h                |  28 ++++
 drivers/reset/reset-meson.c                        | 159 ---------------------
 include/soc/amlogic/reset-meson-aux.h              |  23 +++
 11 files changed, 467 insertions(+), 175 deletions(-)
---
base-commit: 487b1b32e317b85c2948eb4013f3e089a0433d49
change-id: 20240906-meson-rst-aux-a72bdc01bd1e

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
