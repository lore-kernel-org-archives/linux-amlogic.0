Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F198CC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:42:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC3121D79
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 11:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC3121D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UVaL4XJufu124F1o+vM2ggSlXhBy6bASlwqMtICRfCo=; b=2lsqmfgEpzXWsyho10AfLV5L/
	JZLhTGwkv+a8uaWKoEnOey0whwPJIusR6IhRN4n/zhrUQ8rTlYZJrIsScriGLJDBszq2Mhie4tWDm
	gB1EL33yq3wQPL+L/RhEdQmQu6K7c0iHgsF7o5cFNs3FEzphiQn0eDFKD/a4EDXxDub1pRrTa3BFW
	QxetewerlBCpXagPm6GURj1+JP71DQaGlXef2p6RV781u0fJ1243H62szQiFedYdf4JdNf2ZFD676
	Bmn1FUaGAOh6nWMaLqXAcOfAWgt1dA6Uwr5Fuz24Et/KRbLguA/Of3Nj5UL0wIHa7brb7lK5p6cqF
	OSf+Nbxkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwOFj-0003hI-8r; Mon, 04 Jan 2021 11:42:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwOFe-0003ZC-8k
 for linux-amlogic@lists.infradead.org; Mon, 04 Jan 2021 11:42:19 +0000
Received: by mail-ed1-x52d.google.com with SMTP id h16so26975103edt.7
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Jan 2021 03:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=kUUHeak7By77zEE1nbDrZjZ6iDrz8DI2SEFaci/HNo8=;
 b=RU8r3tfIPDFn08B0mFOH3NcvWgiJIiwTZxDxiLZajdWdHmiw34jZv37C8KTZfE4ntn
 j6zuN49YJEomqTJJSq4gDNHVt5ZfZSJiySgMHQOWFyrm53BYdBGqgi/wKVY7G7DAuKBh
 itD2GT7XF2OikvaKIJQh2vacbMktfRPCRGfItlrfQ5LIrrBZPBkIidEZ82pT/78816KT
 Ww2dkEt/BpHvSXPMtC3TqWkeYasets083NQAErW7reAFme5T7imT9yHd9cXJd2+vbjkJ
 FEricqrtLRAP3klYRTB/KxDvPw8ePyt76gEwVUDmY42S6te1EpMJ25mHbqaSCQ7lz6X3
 e89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=kUUHeak7By77zEE1nbDrZjZ6iDrz8DI2SEFaci/HNo8=;
 b=YqpMDpyduiETRJ/Jx0SqT9OPZyD9QLKipU5Oww3R5ZaoMNtRQ9biUdTH5cIG1gmpdp
 XFDP25cpi7uD55efVNPP7QECMuzEn/rJ492FeNqr1er3dBSPrFj7M5rLswgF5SkD5D2t
 FRGpuhntprTw+87QjXmTVmLeYuezPZrG152B8TD+YB9YIP799uJI1mwUAJO4wiMJznlj
 33wmSe/3gyPIU6DgYWGb6hZkLayvug4nxArY5qWeAyfjtBL4JjHuNF46XiCeO6ePyeLP
 5rPg+9PB2KionOz0xH+kkzKDykGebcuUTJdzkNNS/sfe2WLwlsUzXs3KJ8gEe8ntv+g4
 KUkA==
X-Gm-Message-State: AOAM5326A4MeqtT2UowZNNUpmf9YWHagiHSItzqho4RieR6bX96p7VA0
 h57INhEf86LKDclrhA6kHCuwSA==
X-Google-Smtp-Source: ABdhPJyRwi+RW45/1B4cm4abK49cRjl9sbdLy0nc6xW8Uyqy6G/zun/bQgydWWnxMervmGfomwRPjA==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr71619321edj.293.1609760536776; 
 Mon, 04 Jan 2021 03:42:16 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id c25sm23332482ejx.39.2021.01.04.03.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 03:42:16 -0800 (PST)
References: <20200309210157.29860-1-repk@triplefau.lt>
 <1jd09k4ot7.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Remi Pommarel <repk@triplefau.lt>, Neil Armstrong
 <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 0/2] clk: meson: axg: Remove MIPI enable clock gate
In-reply-to: <1jd09k4ot7.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1j5z4dx71k.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 04 Jan 2021 12:42:15 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_064218_352568_E1A4EBF4 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 10 Mar 2020 at 09:05, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 09 Mar 2020 at 22:01, Remi Pommarel <repk@triplefau.lt> wrote:
>
>> As discussed here [0], HHI_MIPI_CNTL0 is part of the MIPI/PCIe analog
>> PHY region and is not related to clock one. Since MIPI/PCIe PHY driver
>> has been added with [1], this region can be removed from the clock
>> driver.
>>
>> Please not that this serie depends on [1] to be merged first.
>>
>> [0] https://lkml.org/lkml/2019/12/16/119
>> [1] https://lkml.org/lkml/2020/1/23/945
>
> Series look good. Will apply after v5.7-rc1
>

Finally applied ... sorry for the delay

>>
>> Remi Pommarel (2):
>>   clk: meson: axg: Remove MIPI enable clock gate
>>   clk: meson-axg: remove CLKID_MIPI_ENABLE
>>
>>  drivers/clk/meson/axg.c              | 3 ---
>>  drivers/clk/meson/axg.h              | 1 -
>>  include/dt-bindings/clock/axg-clkc.h | 1 -
>>  3 files changed, 5 deletions(-)
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
