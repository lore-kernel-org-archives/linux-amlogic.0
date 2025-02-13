Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA8FC021A0
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Feb 2025 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1WZcVY9WzAsW63cy5i2K+s/WkCKCSl8UxLc96glbY0=; b=iyn7IU1Y3Oclpu
	P/GaB62yGADR7rLrDXEPuBhJSo8f4SMFKK2DLtQqRzei8g9mnELrO/bGwWKoAVU2mZuSLLjX/8Ck5
	Ui12sC652FOFontr2XlqzxTJeE7Lq2LwuWFXt+KL0nbucbAlYPy+x5bM8JU98SQ75WexAqRm73We9
	FBvJculXchaeimFCB7VKTv9bgDvIcy1aMjMEfKve3HL/Pc84CbGWSNGCZo+yaSggAHSr3hXEWw8tw
	U75At3QA906ibXvBRcSq45b6VDgW0IoK8N0ScFAqyjT1Bovr4PPtmtMF6UnClnSd2I09MSgiLbicT
	myDDTgO531pH+B9ObGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibL4-0000000BZyW-3kFg;
	Thu, 13 Feb 2025 15:41:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZNs-0000000BAoI-2vaR
	for linux-amlogic@bombadil.infradead.org;
	Thu, 13 Feb 2025 13:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=; b=hhZn+aeSJ4pSVQlHcuqULpeAsT
	kjHlQxelE1s0sl0y7WCDtPzoAA0RCX9H8hJ2f3jH8hj7HzQDeniiC2cW/8vgK+CrtkL9o1OQsQ4Bo
	14p3Py3zq86OSAC8jomvZMbh6irbhBJl/pUbDb8C+rpSE2kVW/8W1Mbp33AD7zS9D/iKxKs+KwqOC
	NFCLWgKgrlvzq8xqPj21dw2aQsziOudeoXkP8hF8MXw0Wbx2eb2cu2GK9MbhP7ABPMWMokZXnSaX/
	y96jH/sKT3Fdf1FZLZYH9QQAAXC1VMnx3TvHHQ1/lFjGfjIFlmPFVhDjUlBCave2x8bEf1zG/YjqW
	zOuMAyUQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZNp-000000010Oo-1u3g
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Feb 2025 13:36:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4395f81db4dso5337205e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Feb 2025 05:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739453759; x=1740058559; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=pCJ4iEXS5joeF2Or9EqZRJ6vS57XWxqme9Zwgau6MR85+SzNlAYBtghDGJXjs9qIam
         N6hGBvaLmcVr7BHw+H0ADIHk0H7he+2RYkKPU00uwdjXwGY0NAXDR1xYnvA7gQurKE84
         vqZAAMyBFKxB0XJ2umhzes3ExgqM8tR0yh8TCGGzju4P7YP0ARu566z1FEUVvSf8SCwb
         GlwP32OaL92hUS1klQfSQ/cm3Vg1YFEKvGzJK4JL4qffrXGHMXNGVe6sQE0eSBcrDpXU
         lczSzGCTEyjMNznpCkCAxg1tdyDzlXmTaApMHpQc7FYC5na0jRgIU8K/sZsev7e87x2o
         snhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739453759; x=1740058559;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lyrHtSipeKghn9xCx+8COWh0BWty29N6DnBPAUwOek=;
        b=kgo/sfOq3U8RmflCGNgjwIQF5S9yS5URmeouhxDVa8jIZjsWrq7vTR3Qw/2ecrdkLC
         tieCu41dLo4YpseTTns8yKI2btixGlnpfIvv2v98NtO7ipgdysxikU3pW0hFrUaiJCwk
         JMOtybIZ669Qn0XY/zua30qbY3dWh8ZQesm0ZZew0pdcy6EN4T28vhH4AhS1Ck5YIshj
         uw0rCy+DYKalMH3OrJKczQhDltAanb0JiGbff0pg3Rq9SF8E8mpCRqjG3um1xiSAfvei
         m8Gnp1+q181iDi7UPCTkLiipUYfiEy75kc3tVxzgkuR3zxbA4oBeQasNi9tb5SE3Kuha
         +tiw==
X-Forwarded-Encrypted: i=1; AJvYcCVW/qVIjS2bwAmB6ccQQywD3cHHwFqRISBJ+EPMQ4VGki1UfM4hVK9U4Zeiwpk78AYcfK5MT1O6KpyC/gHC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz42mtPDFMK6/EIu+Kqqkn3yVu7Q0xhedSjDjuCz/76vkK88sYL
	1n7IerizlcdQMMw3zVGefyX4b5BkLRjLGzNCbe/h2mNEeqi+hTA/F8cq1pdEiVk=
X-Gm-Gg: ASbGnctj1bSJ2C3g3wVLYuofQdhuDmgZvRcbDY+AM1aD9L1lKSYJlMDlcaBc8wVUlaM
	/oeoPx27WxKNwxt2ttOQ8UFY2AFX7ujgmsTAF+irTKqoezqTAUrcPnd0sfKXhge0bTqoNNEwOCY
	kC6PX6VGqmZODLp2mI683RdVlguSrUC4Rh0zszmFjWWBJYELoCbZa+ilVlbOEJXG3X3Xn350cbd
	xOaLDQKEytqtDF1sqGMOrmSx8fKKI25rb9HYeWK0ver7JqXWEhPe59+Ij2PHQeq4xJ9ha/5FlRG
	nFjQreDI7V+llw==
X-Google-Smtp-Source: AGHT+IFlyyROQN/jp5N25OPHAwGGncnJ/FLwqH6qkR/P/8dmal2Zk5G/l0wZieziiMnBJNT5H1Y22g==
X-Received: by 2002:a05:600c:a0c:b0:434:f1bd:1e40 with SMTP id 5b1f17b1804b1-43960e81b92mr29235125e9.6.1739453758160;
        Thu, 13 Feb 2025 05:35:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b617:2c1:fc8c:2705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a056151sm49618825e9.16.2025.02.13.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:35:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Dave Ertman"
 <david.m.ertman@intel.com>,  "Ira Weiny" <ira.weiny@intel.com>,  "Rafael J
 . Wysocki" <rafael@kernel.org>,  "Stephen Boyd" <sboyd@kernel.org>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Daire McNamara"
 <daire.mcnamara@microchip.com>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "Doug Anderson" <dianders@chromium.org>,  "Andrzej Hajda"
 <andrzej.hajda@intel.com>,  "Neil Armstrong" <neil.armstrong@linaro.org>,
  "Robert Foss" <rfoss@kernel.org>,  "laurent.pinchart"
 <Laurent.pinchart@ideasonboard.com>,  "Jonas Karlman" <jonas@kwiboo.se>,
  "Jernej Skrabec" <jernej.skrabec@gmail.com>,  "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "Dave
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,  "Hans de
 Goede" <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>,  "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>,  "Gregory Clement"
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  "Michael Turquette" <mturquette@baylibre.com>,  "Abel Vesa"
 <abelvesa@kernel.org>,  "Peng Fan" <peng.fan@nxp.com>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Kevin Hilman" <khilman@baylibre.com>,  "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset
 driver - take 2
In-Reply-To: <73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 13 Feb 2025 13:26:12 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
	<73c1ab6b-fd5e-47e3-8815-8f74758535f1@app.fastmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 13 Feb 2025 14:35:56 +0100
Message-ID: <1j1pw20xxf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_133601_655291_CB6C73FC 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu 13 Feb 2025 at 13:26, "Arnd Bergmann" <arnd@arndb.de> wrote:

> On Tue, Feb 11, 2025, at 18:28, Jerome Brunet wrote:
>>
>>  I also think this is more readeable and maintainable than a bunch of
>>  'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
>>  also would have several pitfall, such as picking the value of the first config
>>  set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
>>  with menuconfig.
>
> I still think you should just drop the 'imply' line, all it does it
> force reviewers to double-check that you didn't make a mistake
> here, so it's a waste of time.

Arnd, you've made you preference clear and this note has been added
specifically for this reason, and transparency. 

I've exposed a technical reason for my choice. Going with the 'default'
approach makes things more difficult in the long run for those
maintaining this platform, me included.

The trouble of having to coordinate changes in 2 different subsystems to
have an appropriate configuration and the pitfalls of using 'default'
outweigh the extra review trouble of using 'imply' ... especially when
the pitfall mentioned in documentation is explicitly addressed in the
description.

If there something wrong with 'imply' existing and being used, maybe the
Documentation should be updated to reflect this, or the support be
removed entirely.

ATM, it exists and it makes things a lot easier for me to support and
maintain this device.

This all started with a maintainer request to move some resets away
from clock. More requests have been added along the way, making things
more generic. I'm more than happy to have contributed my effort and
time on this and I don't think anybody's time has been wasted so far.

>
>     Arnd

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
