Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A87C3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 17:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBcDEjhqFFZWVWLsJJ0udbqsNcwkTDMmzsT7TU64e60=; b=os3UDKMwySZVOV
	gQNNgPmxLnmIV9Ll7LSuO9A0aXUVJC0aWaoDsGIaoPLudSOKaGlRn84JPWx3+adPyXi4J0QvrjRlp
	uQEar53yOIXGOv7xD764h6EU7Twxcabkd9ne9t8y9l/gAm51QK95JAj2e52HUFLS/nNXAo4EkbQeN
	nzndeHVG7rae+k3QfBSdsOPxgUJZ1KSYpTIkqa3QOCWiwDseDEmpjfhR5cciwWc8wWqbPDjZ7cZd9
	GFk53NBbU6mDU/duRO9wbzBDIBiwt+3jULw7+glrZinsoSsnlpOv8wSZJPynS5IMQZkXzjz8cMrsJ
	VB/jywCSv2YKWbD96PMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUnk-000000005Ix-0xOz;
	Thu, 18 Jul 2024 17:20:20 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUnV-000000005Fn-1PeQ
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 17:20:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3684bea9728so54705f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 10:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721323204; x=1721928004; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=raklK+nWPF9tIVCfKyWj3FXF/Vo9avQJrD5r1/ljkPw=;
        b=mYhSKo+vH44SilWO2ZDj7BIFC1dWulKoqMhst9S8cGO6GXjZRLk2s6PTj1TbC8CaYG
         iOWEjs4oOgRIxgCqWj74wxIn5vD6X8F4QMsHmP1kS4Rjk8jNe/1Ezy+LQY10uaQM2Hzc
         x1yeYYxga5Ba51L5SgnOmA5oIT3x0yD4ObgfpBOmPDP61iU33780XKu/P3M/pbuDilzg
         Ph71ERlDTVG1pWg9k8x7pWBSDfOWGou2Kn+mepif2IYtPTIsXvr7O1gkReWb4uW1K22C
         tk13CSRDX4AQNTfWexVDuDdq8l+ty6XJ3uWdWYVSDewEUQ5wKXbKCK87oLB24Nqgv+9Z
         ldFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721323204; x=1721928004;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=raklK+nWPF9tIVCfKyWj3FXF/Vo9avQJrD5r1/ljkPw=;
        b=qicyRuKKgaAtnzcD4qQZJxio27vzMg5oowFT+1CRx3gfjpo5Dtoc9YxGnq5u3jfTqQ
         /Njw/ceqxzkolG6q4mWpXDGDaq4jtRBtPh+B0V59tyoFAceschRuk7HUhA7r+CVdyWTn
         h7gXY3SGYNCQkq1lepmwi8cc2IYlIV0uobJlJD/PvpAVJYf+M6L3LyG3ksVQLDihN0OI
         /HL70u0oJ0gFKnBQMTZV5qFyftJxPee+RUg0SByW5v69ys57PIVxGpijXdIqvztTII8c
         bUZVEG12sWct3/qf7uFxfy9IXCluTwLVWso8gIPft9cBr6bP5IQS/pJ6HCttm/Bq+Egw
         2PYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfYd2XEpFXPej3GQAGC0icFpxbBIuugly0UjSCgRQIWZwHr8Y0zU0NNCc6lYnzjfi7VSPyI/iS4PIcgBxp/gA9X8TavHMeZkcDSAX22LBmf1I=
X-Gm-Message-State: AOJu0YypbtuJj0Vkwkzg3EZ+WKe+qU/MrqzYftw3rEKk+rsenwajq3aq
	SS+4CpcmWr4MfF7IbnRpXJCMop+VmhWaWTEsIlXZVScvSR0P2SOd4hYFoREOIpg=
X-Google-Smtp-Source: AGHT+IEzUxzLEWSrQkAiFSgO8moaSXv2k0IxNFRMG+EkLW38PdnuAaPPdc63gHY5BK4R017qIX/IpA==
X-Received: by 2002:a5d:4b90:0:b0:368:6f19:cbf5 with SMTP id ffacd0b85a97d-3686f19d013mr357275f8f.31.1721323203853;
        Thu, 18 Jul 2024 10:20:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bbf5:bf25:4f46:2ec8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36872855309sm155510f8f.82.2024.07.18.10.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:20:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] reset: amlogic: move audio reset drivers out of CCF
In-Reply-To: <07b4e6b9-7448-45fb-b5a0-d069addb5dc2@salutedevices.com> (Jan
	Dakinevich's message of "Thu, 18 Jul 2024 17:20:32 +0300")
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
	<07b4e6b9-7448-45fb-b5a0-d069addb5dc2@salutedevices.com>
Date: Thu, 18 Jul 2024 19:20:02 +0200
Message-ID: <1jmsmemxbx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_102005_407923_A3D452D2 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu 18 Jul 2024 at 17:20, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> In previous series there was a patch "[PATCH 8/8] clk: amlogic:
> axg-audio: use the auxiliary reset driver", but I don't see it here. Did
> you removed it, or I missed something?

It is meant for another tree and will be sent seperately

>
>
> On 7/18/24 12:57, Jerome Brunet wrote:
>> This patchset follows the discussion about having reset driver in the
>> clock tree [1]. Ideally those should reside in the reset part of tree.
>> 
>> Also the code of the amlogic reset driver is very similar between the 2
>> trees and could use the same driver code.
>> 
>> This patcheset alignes the reset drivers present in the reset and clock
>> then adds support for the reset driver of audio clock controller found in
>> the  g12 and sm1 SoC family to the reset tree, using the auxiliary bus.
>> 
>> The infrastructure put in place is meant to be generic enough so we may
>> eventually also move the reset drivers in the meson8b and aoclk clock
>> controllers.
>> 
>> Changes since v1 [3]:
>>  * Fixes formatting errors reported by Stephen.
>>  * Changed parameters type to unsigned
>>  * Fix usage of ops passed as parameters, previously ignored.
>>  * Return 0 instead of an error if reset support is absent
>>    to properly decouple from the clock and have a weak
>>    dependency
>>  * Split the platform and auxiliary modules in 2 distinct modules
>>    to fix the COMPILE_TEST error reported by ktest robot.
>> 
>> Change since RFC [2]:
>>  * Move the aux registration helper out of clock too.
>> 
>> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>> [2] https://lore.kernel.org/linux-clk/20240516150842.705844-1-jbrunet@baylibre.com
>> [3] https://lore.kernel.org/linux-clk/20240710162526.2341399-1-jbrunet@baylibre.com
>> 
>> Jerome Brunet (9):
>>   reset: amlogic: convert driver to regmap
>>   reset: amlogic: use generic data matching function
>>   reset: amlogic: make parameters unsigned
>>   reset: amlogic: add driver parameters
>>   reset: amlogic: use reset number instead of register count
>>   reset: amlogic: add reset status support
>>   reset: amlogic: move drivers to a dedicated directory
>>   reset: amlogic: split the device core and platform probe
>>   reset: amlogic: add auxiliary reset driver support
>> 
>>  drivers/reset/Kconfig                         |  15 +-
>>  drivers/reset/Makefile                        |   3 +-
>>  drivers/reset/amlogic/Kconfig                 |  27 ++++
>>  drivers/reset/amlogic/Makefile                |   4 +
>>  .../{ => amlogic}/reset-meson-audio-arb.c     |   0
>>  drivers/reset/amlogic/reset-meson-aux.c       | 136 ++++++++++++++++
>>  drivers/reset/amlogic/reset-meson-core.c      | 140 ++++++++++++++++
>>  drivers/reset/amlogic/reset-meson-pltf.c      |  95 +++++++++++
>>  drivers/reset/amlogic/reset-meson.h           |  28 ++++
>>  drivers/reset/reset-meson.c                   | 153 ------------------
>>  include/soc/amlogic/meson-auxiliary-reset.h   |  23 +++
>>  11 files changed, 455 insertions(+), 169 deletions(-)
>>  create mode 100644 drivers/reset/amlogic/Kconfig
>>  create mode 100644 drivers/reset/amlogic/Makefile
>>  rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
>>  create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
>>  create mode 100644 drivers/reset/amlogic/reset-meson-core.c
>>  create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
>>  create mode 100644 drivers/reset/amlogic/reset-meson.h
>>  delete mode 100644 drivers/reset/reset-meson.c
>>  create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
