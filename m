Return-Path: <SRS0=/aBW=CD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D91C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 14:21:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CDD820665
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 14:21:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtsaXbIF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="arc7hmez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CDD820665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZJA3NdDEL8XLKUTcjqRvrONuAxuoxzM413JKzXg/F70=; b=qtsaXbIFe/ZsWTOw76XNMSOCI
	LHbmg5WcXoXG3yiiqVTzwUxO5nC3J1fQ/VjkxvDlbZjjFqjBXemO2aKL/dk81W6whXlgeiTPbrEtl
	Pj3T+lcN4f05BSbizKUyxshIsteL5vWR+WUBd4xF+ENj8gzq+2rNozY9z2CxQ9iatEiKunzuNmVUU
	5H7hjAbG1tkCZILjG4i/Kp9zP4lEE+ah95+tuG/cqxxO80RqgidU8rXVvUlygE/1k3qVO8APYs2bY
	yoUxUVGoNOIIMmY61UOURylwvuso1G/Bgr3+sIMVRcI/lJ/RiGFuPENl112fpNiu4SGXKB+frQYJg
	8f/Y2TZIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAZoy-0005NT-Jm; Tue, 25 Aug 2020 14:21:08 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAZov-0005Hx-9C
 for linux-amlogic@lists.infradead.org; Tue, 25 Aug 2020 14:21:06 +0000
Received: by mail-ej1-x643.google.com with SMTP id d11so16571352ejt.13
 for <linux-amlogic@lists.infradead.org>; Tue, 25 Aug 2020 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=j7njjj4fP/dM/qO6pJcdvxIHONmhXgz8n6uQ0RbRVTI=;
 b=arc7hmezb/7Y8q/sQ9PT8vVQ75/LRED5NX2ZLNZX50yBR0+XIIT00j1YDXv33GW1X7
 PqppM8VEOt7FabxzAp5w9kC9vdmPINmwQA3v/TTe5zlK5QjmfJD8AtKPmRxGt33HDALk
 EZS7jke1Vg4MwRSrL4/LYuOQBkr4mQesFzl17BeyHNNCp8ABLQz4s8Oue/6+FslyEqj+
 dh9X4J5quYImhhN82tnjsElb9dNh1M08gtLxG6pzkBbrsgt6v+fUveiWRXpvq00Kp3aL
 jUEP0NVFTrYfzqDNUmxIGUo+55bxIfouLxYJUITcj4iKRfKnk/SKsF9E2O3+ItjExbto
 bQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=j7njjj4fP/dM/qO6pJcdvxIHONmhXgz8n6uQ0RbRVTI=;
 b=AwnNeLgHj+ZfvSA9oPRml+8oQAP+DkfVkAjtwygljKnZq9UCvun1qX6Q+8weAP0VjW
 bXAxVqGe9y1m4tRJWShtfBKe4Bz/qMv+rydItmALzrW6hvfX/AN23Wm/6BhJPGY1NXLQ
 6Voq5M8Ra8FTPfYJGTtqReBWDkbMjuSnzsd07E+xphOw7Qox9w9WXWqLxKIjg3MER5R0
 6NMmw2/gc8UOBtB80z/AjPYg9JA0WwcLT9wj8jL90jHXUBd6+UyGDNkJcnXpVOG89GX8
 PITci1FiG3rFTzFPdszBN67//nBpTURYPHNAsXEgt1qX9iJeBpKHq3ejSU2bi/1aSb5A
 vPDQ==
X-Gm-Message-State: AOAM532bF+8jzfFG1KN+0AX4CR/iynoS6YCNKUbT5a9+xQHp6dsm1hv+
 OBpNmZBBYq1y+eo+xasaCpe44g==
X-Google-Smtp-Source: ABdhPJzGcDjR55H9A/W/+YJ8E7C/8uERKfkCaSwyfhtRVOKljjaHSw9dq3b2HYmAiXAm4C21zol5uQ==
X-Received: by 2002:a17:906:f150:: with SMTP id
 gw16mr2292056ejb.532.1598365262138; 
 Tue, 25 Aug 2020 07:21:02 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id fx15sm13847072ejb.1.2020.08.25.07.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:21:00 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
Date: Tue, 25 Aug 2020 16:20:59 +0200
Message-ID: <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_102105_457239_3355165E 
X-CRM114-Status: GOOD (  27.06  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 aouledameur@baylibre.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 25 Aug 2020 at 12:20, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
> [...]
>> In practice, I think your proposition would work since the drivers
>> sharing this USB reset line are likely to be probed/suspended/resumed at
>> the same time but ...
>> 
>> If we imagine a situation where 2 device share a reset line, 1 go in
>> suspend, the other does not - if the first device as control of the
>> reset, it could trigger it and break the 2nd device. Same goes for
>> probe/remove()
>> 
>> I agree it could be seen as unlikely but leaving such race condition
>> open looks dangerous to me.
>
> You are right, this is not good enough.
>
>> > Is this something that would be feasible for your combination of
>> > drivers? Otherwise it is be unclear to me under which condition a driver
>> > should be allowed to call the proposed reset_control_clear().
>> 
>> I was thinking of reset_control_clear() as the counter part of
>> reset_control_reset().
>
> I'm not particularly fond of reset_control_clear as a name, because it
> is very close to "clearing a reset bit" which usually would deassert a
> reset line (or the inverse).

It was merely a suggestion :) any other name you prefer is fine by me

>
>> When a reset_control_reset() has been called once, "triggered_count" is
>> incremented which signals that the ressource under the reset is
>> "in_use" and the reset should not be done again.
>
> "triggered_count" would then have to be renamed to something like
> "trigger_requested_count", or "use_count". I wonder it might be possible
> to merge this with "deassert_count" as they'd share the same semantics
> (while the count is > 0, the reset line must stay deasserted).

Sure. Could investigate this as a 2nd step ?
I'd like to bring a solution for our meson-usb use case quickly - even
with the revert suggested, we are having an ugly warning around suspend

>
>> reset_control_clear()
>> would be the way to state that the ressource is no longer used and, that
>> from the caller perspective, the reset can fired again if necessary.
>> 
>> If we take the probe / suspend / resume example:
>> * 1st device using the shared will actually trigger it (as it is now)
>> * following device just increase triggered_count
>> 
>> If all devices go to suspend (calling reset_control_clear()) then
>> triggered_count will reach zero, allowing the first device resuming to
>> trigger the reset again ... this is important since it might not be the
>> one which would have got the exclusive control
>> 
>> If any device don't go to suspend, meaning the ressource under reset
>> keep on being used, no reset will performed. With exlusive control,
>> there is a risk that the resuming device resets something already in use.
>>
>> Regarding the condition, on shared resets, call reset_control_reset()
>> should be balanced reset_control_clear() - no clear before reset.
>
> Martin, is this something that would be useful for the current users of
> the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> meson8b-usb2 with reset-meson)?

I'm not Martin but these devices are the origin of the request/suggestion.

>
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
