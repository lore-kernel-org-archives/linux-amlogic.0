Return-Path: <SRS0=e9JL=KO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD916C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 15:10:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C8ED61042
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 15:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C8ED61042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u1H4G/vzwT6G3WhReLJYwATmyTENQx2Qb2wbt1If1uA=; b=FD6UxORkudryL9M3b6Xhwj5IN
	26T2s1KU10TlZ5gi8VpeepKdBS2ZFtF2aaj8xY6iASh/YfL9ApGJu3rxm3ckpk6kxGQryswmzpToY
	OuhPLCM1Rse8r8IMfgwKNTf15aiFdFVumSqo67HVQMoJz7s6yyWHB2ntch8TKEI45LP/UsFMoR7ZD
	FB38HLE3gSpTgBt1ubK/p8FZZT8/+w3dOx1HXqhd4A1/5N/MOjvIzkU9sQreCwycWiQUBNmt8YpNe
	sxHTnBrhZ3JMqE8Q3w4tES8rMbFLaSKe0fV/sQEgah4d6as41w1r6b3G32BfErRFsbxRXTMS5b8GN
	0BTB6eXsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNqP-004LMc-HP; Wed, 19 May 2021 15:10:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNqC-004LLM-02
 for linux-amlogic@desiato.infradead.org; Wed, 19 May 2021 15:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pZTrmzjRk0JsfMU4NJ6gfhJKpkFDNAJqvtFPV6c7aqI=; b=PV9/5IjaNuHsxWe1bV60XRsIp7
 bcrW51uZoAGrr6GaD633835+XZ18xbriy8GF9drTjq9eFoNMjNXpx3BlVj0tV/Zytm4OW4yfBhp0n
 OdL+3ErPhGY00aVGp/QCcIqZYeJV3xR7A1QQ3FEXGKiiUzrxHVAImphEnyAuu2YfEG7LHlvEyDHTd
 nf3tSjRB+26vSf+ZMQI9ndv12YTkpMiA9soxZg4YDsBSz0WC1HYURkJmU5pTgaWKY4qLpiY7/cYpS
 AAarwyz9m/Gd7ocJhh7RdP1dPOTxyRuHYz+F5AQ42X6vIa8X/yBK0zWKTXVqev2JZKLk0FKEv0AIW
 47uvzHbw==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNq8-00FZrP-P3
 for linux-amlogic@lists.infradead.org; Wed, 19 May 2021 15:10:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id y14so12316547wrm.13
 for <linux-amlogic@lists.infradead.org>; Wed, 19 May 2021 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=pZTrmzjRk0JsfMU4NJ6gfhJKpkFDNAJqvtFPV6c7aqI=;
 b=sPbtHp+UyY0QZk3Slfytp2HlLx5k++0LMnr/g/kaaRlHRT625kD3YaS5w2vxJasi6s
 c3p+6gAW3YGpU3+vzRWDafgfn+rUbUgIDgtOcnFSBpO0YZbIpgx0SZXmxGi4St2tSPMF
 lQAx3VMVcZapIWxpApznRvFQnbQtdpq/ZaUrva1Z69laBzJkwxYPHxOtduY5dXgr50gp
 6JMDPnj1ltLmanag9oczTddqe6IInR7gQV4/3O5eWeVZMq2xQq4lmF1lrVqUyJeWM8hQ
 mJmDVSx1SJTZ851+BDiXZLMTQV0ipWJhnyDZwol3gULGVpnghldw/XlH/y56pLgdyola
 evCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=pZTrmzjRk0JsfMU4NJ6gfhJKpkFDNAJqvtFPV6c7aqI=;
 b=ddu8vrL8QNStkGAHndepeUJqPJRnDYQ0tkiw3j0MbK58VYWhIZ1QvcwZWr5wUUcDrt
 Mk+vGEx4G0ApoNR6uRXxhK1EYh1BGqFKYS9bHrR/RM9WhAUn35o/JG+ZDvpK1cmpuSOC
 uhFKcvRwj+g9JyREa7xwAsGQsv6iZuQSD1sNBCAzC9Kfr4AATygo7CuFfiiZ/O5jlk/F
 /4McsS19ZVsxqQZldpvDXWjNDwLrluF+Lfemk/odhbGLgfqNTNijsWInKPj3Cr9QLGLt
 D2db+o9L8MzH+I5pdAMfKF1lq4yR6J1G4iouU86StsBlPN9T0PIgxQXuKM84WgyB0YTw
 U//Q==
X-Gm-Message-State: AOAM530ncVnyYSE6dhHqiTguHlzoxAlTinhB84EN4y/N6IRST1jVMHFY
 lqPqv394hEfuP4rsAfQ5EHyZH/Ygcxf4aA==
X-Google-Smtp-Source: ABdhPJzuKJrQL7ukPErjV9xAxeYsKK2e9MVgKM+TWHESmAB3zfHQlkZ07BgfBUGY9o+FLk0Oal812Q==
X-Received: by 2002:a5d:598d:: with SMTP id n13mr15262787wri.38.1621437027253; 
 Wed, 19 May 2021 08:10:27 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id h13sm22758075wml.26.2021.05.19.08.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:10:26 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-4-martin.blumenstingl@googlemail.com>
 <1jo8d81nw3.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBREyEp0gj_-ac2OccjSruULPG1m2=L5D7GEA4HoqQqLg@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, Neil Armstrong
 <narmstrong@baylibre.com>, linux-clk@vger.kernel.org,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 3/3] clk: meson: pll: switch to determine_rate
 for the PLL ops
In-reply-to: <CAFBinCBREyEp0gj_-ac2OccjSruULPG1m2=L5D7GEA4HoqQqLg@mail.gmail.com>
Message-ID: <1j1ra2dajh.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 19 May 2021 17:10:26 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_081028_876025_D93305EA 
X-CRM114-Status: GOOD (  16.21  )
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


On Tue 18 May 2021 at 22:17, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Tue, May 18, 2021 at 9:50 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > This increases the maxmium supported frequency on 32-bit systems from
>> > 2^31 (signed long as used by clk_ops.round_rate, maximum value:
>> > approx. 2.14GHz) to 2^32 (unsigned long as used by
>> > clk_ops.determine_rate, maximum value: approx. 4.29GHz).
>> > On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
>> > capable of running at up to 2.97GHz. So switch the divider
>> > implementation in clk-regmap to clk_ops.determine_rate to support these
>> > higher frequencies on 32-bit systems.
>> >
>> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>
>> Looks good. I see no reason to keep this one as RFC.
> Great, thanks for checking!
>
>> I can take it directly if this is OK with you ?
> That would be amazing.
> Obviously no objections from my side :-)
>
>
> Best regards,
> Martin

Applied then. Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
