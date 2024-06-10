Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D0EC27C5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhL75qyuW0P0JwsBzb4dSExG7m39fisAbI2/Ffnne+I=; b=wITy3avt65Zczb
	MnrHtlwrEPOhf3OppeYNeNaElO/ylhjTZvZU4bc+snEpK6fskXLJAvUuCKBm9aiZrrQm5IezuG6+R
	9POXkbWoTpoklOUllWhhQHIw+nENHCow/eeDrgzFKkRdZvbMiYAnsmPlswPK4P+M4eoeKe/9yRRG5
	PGSS6K+Y88BUsV5mg0v81yqGv7a9wBAyFFJgY3UezW9zNDydT4auqFOiwzbzZrZEF0CujQ+nK7JT3
	HrwftzCHAQxYQQCAzQKOGl5Ov0WQGUK4dZi7Y/4lDmK1Kkx/E2QyITn9WVolLFmqX7pGPFayqyytk
	GbbR9fa8ObfcbKCCcYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbzR-00000004adb-390J;
	Mon, 10 Jun 2024 10:11:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbzO-00000004acc-35zC
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 10:11:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-421cd1e5f93so4943955e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718014257; x=1718619057; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0TNoSBUeFW5avGknbPcWPlD4Jgcp9UNaKcJpQf4Aho=;
        b=SWyhnODL+8LystPXDXyGO6HSMM4oCxWt1pUgIxczbqegNyZOcnqPdSNjDkbrgZuSCu
         hqKqDF9QTU2IJZSfeezdAFcypIUUC3ukzbTpfwdhpNiJ4hRkQ5jNqohtCZfdM3UYPUcf
         UtJYC+1JLJjE5Qx9n31go/z3McY8W1yyiYkbwiBAFNZCeUvzn8qv5wErmEUGYM3/hYvq
         M7RZZfqK/dPPe+JxvSOG7ctGIycHYAHWxo9xPIjtdAgFnyjNHY3S1n0KgbaLifsrBO5v
         7ropENZhf9qFNIMH19RwLb9T/mvXa1hJqvanZRXEJ6+bmnY/X5JRGViDcO3MnG2eltOQ
         GtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718014257; x=1718619057;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0TNoSBUeFW5avGknbPcWPlD4Jgcp9UNaKcJpQf4Aho=;
        b=N29YO/F39y0hnaFoZ+YnGccqB/8DFnMSJ8hN7Z9r6n4QpgfuCduzUjLWKpYsXgTn4c
         UAxmpzG+FWHpnRtludxBd2c8ZFRuctQNlCjNekyFIA/6vhXnDeVuynU/MVyfNvVQlkMQ
         34+Q0hEGrWQvGtfOs+XmzSGZkC/VjRJ9Ez5cpxb5kVE0eWST7ByXFBvl/rRMPWibnyBe
         VYrieB6Y35KHHS1sal4BYK4j9JH3aOZENgynjUIhCsgQeFyyYlRv+8GWKz/loDE3H7c0
         ChFxSwO2MLKyZf9Aqa2UJfWX6HuNBt8oOrWJ2gH6eblq5Zb2kG3EZLllFM6XSz9Le+Xm
         efMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVjUuWlgfFZ+StDEh8q5tFeQvej2wM0Z37d0SILjTDiVXdXgvs0o03n9Hqbj8qWmrKptAHk9n+lEsg4+HwsewuRTPgkiYjYgbnGBUtlIgfcD0=
X-Gm-Message-State: AOJu0YwqKvvoVSY9b4R8504tr/n+47uU7Zhi5YFfNCCOQaJvbMaltmdZ
	bt0WQEtJi8fFgcMxGiMuKGyp2+DyoFFbG4+NsBx2I5+8MF6sxG8WZSxbp3RGR2s=
X-Google-Smtp-Source: AGHT+IEFqoldHAoJVVZTLvQOuYPmYg/HOq/+LtIbLhEkV/XKorR5ubj6rEmGhJ0i5CLz0niduiRRvw==
X-Received: by 2002:adf:fc8b:0:b0:347:3037:188d with SMTP id ffacd0b85a97d-35efed5351fmr7533025f8f.34.1718014256882;
        Mon, 10 Jun 2024 03:10:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1aa8d4f3sm5283383f8f.99.2024.06.10.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:10:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH 8/9] clk: meson: add auxiliary reset helper driver
In-Reply-To: <68518f93af68cbc0153c8bd765dc885f.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 29 May 2024 18:01:47 -0700")
References: <20240516150842.705844-1-jbrunet@baylibre.com>
	<20240516150842.705844-9-jbrunet@baylibre.com>
	<68518f93af68cbc0153c8bd765dc885f.sboyd@kernel.org>
Date: Mon, 10 Jun 2024 12:10:55 +0200
Message-ID: <1jikyhp0pc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_031058_808784_C5C5B368 
X-CRM114-Status: GOOD (  24.03  )
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

On Wed 29 May 2024 at 18:01, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-05-16 08:08:38)
>> Add an helper module to register auxiliary reset drivers from
>> Amlogic clock controller.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/clk/meson/Kconfig             |  5 ++
>>  drivers/clk/meson/Makefile            |  1 +
>>  drivers/clk/meson/meson-clk-rst-aux.c | 84 +++++++++++++++++++++++++++
>>  drivers/clk/meson/meson-clk-rst-aux.h | 14 +++++
>>  4 files changed, 104 insertions(+)
>>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
>>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
>> 
>> diff --git a/drivers/clk/meson/meson-clk-rst-aux.h b/drivers/clk/meson/meson-clk-rst-aux.h
>> new file mode 100644
>> index 000000000000..386a55a36cd9
>> --- /dev/null
>> +++ b/drivers/clk/meson/meson-clk-rst-aux.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2024 BayLibre, SAS.
>> + * Author: Jerome Brunet <jbrunet@baylibre.com>
>> + */
>> +
>> +#ifndef __MESON_CLK_RST_AUX_H
>> +#define __MESON_CLK_RST_AUX_H
>> +
>> +int devm_meson_clk_rst_aux_register(struct device *dev,
>> +                                   struct regmap *map,
>> +                                   const char *adev_name);
>
> I'd prefer we move the device creation and registration logic to
> drivers/reset as well. See commit 098c290a490d ("clock, reset:
> microchip: move all mpfs reset code to the reset subsystem") for some
> inspiration.

Ok but if it lives in reset I don't really get the purpose served by the
auxiliary devices in that case. Why not export a function that directly
calls reset_controller_register() in that case ? 

I thought the point was to properly decouple both sides.

I don't have strong opinion about it, TBH. It is just how it made sense
to me. If you are sure about this, I don't mind changing

>
> One thing I haven't really thought about too much is if they're two
> different modules. One for clk and one for reset. If the device
> registration API is a symbol the clk module depends on then maybe that
> is better because it means both modules are loaded, avoiding a
> round-trip through modprobe. It also makes sure that the drivers are
> either both builtin or both modular.

I have checked with the current implementation, if the reset driver is
missing, the clock part does not fail. Registering the aux device
succeeds in clock but the device never comes up (duh). So it does
not crash, the consumers of the aux reset device will just defer.

Said differently, the '#if IS_ENABLED(CONFIG_RESET_CONTROLLER)' in
clk-mpfs.c was not necessary ... it was removed in the changed you
linked anyway.

(Sorry Stephen, you got it twice ... missed the Reply-all the first time
around)

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
