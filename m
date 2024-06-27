Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A18C2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jun 2024 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8fEN+BXbsGrI1HfX9zGp+UMZq0pVa1gv9JaxMv5lAk=; b=Or3a2nthYgMZiN
	Ypd3y5WvbXB45wOtAPa2z+CmwlivI4O2boohhsewN9XKi4wLYi4FN0rpCnNsY21GRD4yPY/AMCJBZ
	klGjE4Wyry1kqq0ihfBa9RpaOp7n0RI9aqb9EXtvsUnREb8v1P8c5Oy7UUMZAqG9fOKXow5pRSEWW
	P4SAoSFX4t/+jKjHTBx98F8waAk+EP0jN3Rc94dCa6jRaO3e8wb3PS8EuMnN9w4zGbmJfU3k9ZZtZ
	l4Q6nZabG8/b3es0ZIpRxMP+7HIdbFTK0ruo7f7P+QrrPCP59T3LAXhMPVoBQy3PxfQmF3c90g4+b
	th1Ou0DCNLDvhGThfhrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjh9-00000009a0Y-08aF;
	Thu, 27 Jun 2024 07:37:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMjh6-00000009a03-0tMk
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Jun 2024 07:37:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-424aa70fbc4so14738105e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Jun 2024 00:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719473843; x=1720078643; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSt7hWRFsJht1ykRpUwUhslZQwMHYadx10kyHUhna8M=;
        b=BRoE23NEB9461VeVOvafVjjjgyqRS221n12chDCEYdEpXawycELLLo9EM7IdesoIHY
         je/2kjaw/DokCu8pdh+H891triN2zRflsR4oTaFKLMJO/cQb6vj8yTB8m5lx5ezwMAYs
         uFuq0hWAbZGkSG+7gdkPklqX60+hMEWaIOGJgS9fjDlHz+nLPPHat2Cp7RT90LfMS+C/
         dQ21P494g2b8DB0lyQBteSHoGJ0zme8sYjiTKbFzs8VNwNDS6Lv4D3n5lK38cic7RCKj
         m2q+1yxYgYmYwFNdn83UjxNNrujEB/9OoWCyrRuUgG41FkC7O3rlA7Xar3Z4MqXv5Xoo
         hKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719473843; x=1720078643;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSt7hWRFsJht1ykRpUwUhslZQwMHYadx10kyHUhna8M=;
        b=gFIyUQxoY+9cmnY2+e8JQnM33o/pjVIkgPkEQorH97WeDzFcq8VBMwKY9ZZ7O0OU69
         uQDKrKAuBgYlz2l3Na0QAZ3jt/IuXYz6cYjvbHt7YS0chCvh4ihUXeMSxNIjS7uEUgeY
         IqlGUo/8w4lOGTZHNyMs2qWgnCcEX4STxmQiDtUsAgetTMCCrcZYhUsJwMPE0oZEVsxe
         jHjKmFBNRouUb2LiWww3u1arEPZAeGyQejjcopTPlVKMz+GAGfrdqnbz+lP+Cu7EFUfs
         lOr4M8BIy+1hZQfgS7RtW6qt7ZNuBmJRwUlIs7vG6Tg4K7DmwpdrjatyJ2emeu7XdwEu
         tX3w==
X-Forwarded-Encrypted: i=1; AJvYcCWMQSCWW44tw+GD1Jlsi0aZ6ji4qFdTp4Kb5dADR6drQ28mSYGVQ/rtBALfQx8V+pkoCdFyIjQTwbJPFNt0tytLUO8piNGrQ0mQ8airQiGOyac=
X-Gm-Message-State: AOJu0Yzobs08/X4CD8fYyX2WB4FWy666quCTXIyi8YRxgCeb/DvPSuZW
	rLHp+pPPzNEk5yBzrtXam5MvbiLFX0rOTqHzOq0yZNCH5qVnCIC306lC7VgTwSM=
X-Google-Smtp-Source: AGHT+IFCDR3ek9WFRsnqL1Rf0E2mq3qOmsfg2MEHg+17BZ3Z6O2N+Wf9FHrf4pZsNrsp4V3hXqzOFw==
X-Received: by 2002:a05:6000:2ab:b0:366:ec2c:8647 with SMTP id ffacd0b85a97d-366ec2c86f1mr9630916f8f.46.1719473842640;
        Thu, 27 Jun 2024 00:37:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fc79:19e9:c4ba:4eb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357c0e7sm972505f8f.10.2024.06.27.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:37:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH 0/9] reset: amlogic: move reset drivers out of CCF
In-Reply-To: <f7b13cc0-6155-4b0f-9f63-c35d73c3032f@salutedevices.com> (Jan
	Dakinevich's message of "Mon, 24 Jun 2024 16:48:08 +0300")
References: <20240516150842.705844-1-jbrunet@baylibre.com>
	<f7b13cc0-6155-4b0f-9f63-c35d73c3032f@salutedevices.com>
Date: Thu, 27 Jun 2024 09:37:21 +0200
Message-ID: <1jfrsyhm4u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_003724_310661_421BE552 
X-CRM114-Status: GOOD (  15.72  )
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

On Mon 24 Jun 2024 at 16:48, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> Jerome,
>
> Do you have any updates? I'm looking forward to these changes so I can
> continue my work on a1 audio clock controller driver.

You have been CCed on the whole series.
You can see for yourself that there is still discussion going on.

>
> On 5/16/24 18:08, Jerome Brunet wrote:
>> This RFC follows the discussion about having reset driver in the clock tree
>> [1]. Ideally those should reside in the reset part of tree.
>> 
>> Also the code of the amlogic reset driver is very similar between the 2 trees
>> and could use the same driver code.
>> 
>> This RFC moves the reset driver of audio clock controller of the g12 and
>> sm1 SoC family to the reset tree, using the auxiliary bus.
>> 
>> The infrastructure put in place is meant to be generic enough so we may
>> eventually also move the reset drivers in the meson8b and aoclk clock
>> controllers.
>> 
>> [1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org
>> 
>> Jerome Brunet (9):
>>   reset: amlogic: convert driver to regmap
>>   reset: amlogic: add driver parameters
>>   reset: amlogic: split the device and platform probe
>>   reset: amlogic: use reset number instead of register count
>>   reset: amlogic: add reset status support
>>   reset: amlogic: add toggle reset support
>>   reset: amlogic: add auxiliary reset driver support
>>   clk: meson: add auxiliary reset helper driver
>>   clk: amlogic: axg-audio: use the auxiliary reset driver
>> 
>>  drivers/clk/meson/Kconfig                     |   6 +
>>  drivers/clk/meson/Makefile                    |   1 +
>>  drivers/clk/meson/axg-audio.c                 | 108 +--------
>>  drivers/clk/meson/meson-clk-rst-aux.c         |  84 +++++++
>>  drivers/clk/meson/meson-clk-rst-aux.h         |  14 ++
>>  drivers/reset/Kconfig                         |   1 +
>>  drivers/reset/reset-meson.c                   | 210 ++++++++++++++----
>>  include/soc/amlogic/meson8b-auxiliary-reset.h |  17 ++
>>  8 files changed, 293 insertions(+), 148 deletions(-)
>>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
>>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
>>  create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
