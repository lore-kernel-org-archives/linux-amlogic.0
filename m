Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD75C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 21:47:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B648205C9
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 21:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q/M8Dyrr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EFHEE4np"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B648205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwArU0TjD1P2lYeuvhLurDdmY4jKMJ5Cm5mY7REdXZY=; b=Q/M8DyrrDv0wRx
	AshBHNCXXHU+UDP6OsT9UEkNGIobx7ln8FTJU0Pxxibg0q7DiyZNNZXCXGmO+V3mJQF7fPykIisRI
	v4Nzbt38YnILvc7hsJcZqG4/HaqC/Us4YWh4dmQ9M1T3NDvXQveW4xXN3aw42w/I+hOj3FfZKBb+x
	GGu/GX+VeAhEPsLG5Q5vyyr2eDCqzfD4MrET2ap8hLysGh8H/RGpwGERG7Fgscpp1vddKYwVLhuHC
	O1b6t/7ivpIYpxFo8XLSI9ilWzhN4rOB8oLdLZN8BtVPcsmah81MAv5921nxg7FCwaTyhFwRLcTrB
	t59b5gsKewckV1/D0d6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ienLf-0001uo-V3; Tue, 10 Dec 2019 21:47:15 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ienLc-0001u0-E8
 for linux-amlogic@lists.infradead.org; Tue, 10 Dec 2019 21:47:14 +0000
Received: by mail-pl1-x643.google.com with SMTP id k20so380396pll.13
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2019 13:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=iqFEfJ5VTHI7kv90uHb92Xkx2XtyoVgSFCJnm1RQLQU=;
 b=EFHEE4npHM3CozjgfjX1aweI4Bpjv9tMkX7xoMDlYeDvYISZA1sB3lk/hc1BhVkwtP
 dIuPZnj/E+ceF7h3Lg/s6mSR+sX02nUmEwnoilqX5KdbLwi4R8FOG1pyrZwWvIxQul4l
 yDXbRQB8pTU8Q6o4BhW36BY/0LNhm55Qyx66I1fZVehSiVDY4Dy1hEe75GmrPHauDAn3
 CYyTr50CFdq/4RtMbtJitPUhC98IGnL0uiQ87KciKaY12CPMslMMGAOlsmfy8DFhva2W
 Z5IaHcTcHflle6A/9NHtMDvq0Kxrofj54cjqMwbMsl2tqxES0SWNEBT+iqIYuS5mhuYB
 BTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=iqFEfJ5VTHI7kv90uHb92Xkx2XtyoVgSFCJnm1RQLQU=;
 b=sr2eHkZbz6T6XLS0kaIqxpjWda8kV8pcbxzy3XFJQHULRa8gFr5uk4miSDH8tfo6eH
 fxkr7fftzx6Z/JUjEMxk8io6Zhl/IkVAQSUM4NDEBTLpNGIR5Q7AjmRI0IeByHqeCXuV
 CTn8E1caR6zrCZPZGo+0UhKK1wd8VS/983NABxwPelJaybxFs5tt4uQfl5bwQMWmSaA9
 PCdeaIsGgZ1BV3sL8VismMTxMdScTYmWXBCmTmfCmWjQpJhMgDBJ+QmtnHvd+ETUHHDo
 Pu/V7HtXPkL6/mks6LLieDJlMuLn12D9+2GRw4rKS5oCMTBectvQUDYJdqbZvOPqiWRt
 tL1Q==
X-Gm-Message-State: APjAAAUBrPQjLT3NMPR2RRxNowHyVTUZsjSSXmB/VxotD8xcDmjzsww/
 jiJH0vTJrUIb4RFjlaxUIL5PAw==
X-Google-Smtp-Source: APXvYqyWouSgn/WCq+jtqr4txQVR8xZ2GAJa0L6IdvZrZdsbAFw3Sl3H8rvTIGgfc48jOCynsAqafw==
X-Received: by 2002:a17:90a:86c7:: with SMTP id
 y7mr7936504pjv.102.1576014431457; 
 Tue, 10 Dec 2019 13:47:11 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z1sm4338pfk.61.2019.12.10.13.47.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 13:47:10 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
In-Reply-To: <CAFBinCBfgxXhPKpBLdoq9AimrpaneYFgzgJoDyC-2xhbHmihpA@mail.gmail.com>
References: <20191101143126.2549-1-linux.amoon@gmail.com>
 <7hfthtrvvv.fsf@baylibre.com>
 <c89791de-0a46-3ce2-b3e2-3640c364cd0f@baylibre.com>
 <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
 <7hfthsqcap.fsf@baylibre.com>
 <CAFBinCBfgxXhPKpBLdoq9AimrpaneYFgzgJoDyC-2xhbHmihpA@mail.gmail.com>
Date: Tue, 10 Dec 2019 13:47:09 -0800
Message-ID: <7hpngvontu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_134712_531759_4268BA23 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Tue, Dec 10, 2019 at 7:13 PM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Anand Moon <linux.amoon@gmail.com> writes:
>>
>> > Hi Neil / Kevin,
>> >
>> > On Tue, 10 Dec 2019 at 14:13, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> >>
>> >> On 09/12/2019 23:12, Kevin Hilman wrote:
>> >> > Anand Moon <linux.amoon@gmail.com> writes:
>> >> >
>> >> >> Some how this patch got lost, so resend this again.
>> >> >>
>> >> >> [0] https://patchwork.kernel.org/patch/11136545/
>> >> >>
>> >> >> This patch enable DVFS on GXBB Odroid C2.
>> >> >>
>> >> >> DVFS has been tested by running the arm64 cpuburn
>> >> >> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
>> >> >> PM-QA testing
>> >> >> [2] https://git.linaro.org/power/pm-qa.git [cpufreq testcase]
>> >> >>
>> >> >> Tested on latest U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM
>> >> >
>> >> > Have you tested with the Harkernel u-boot?
>> >> >
>> >> > Last I remember, enabling CPUfreq will cause system hangs with the
>> >> > Hardkernel u-boot because of improperly enabled frequencies, so I'm not
>> >> > terribly inclined to merge this patch.
>> >
>> > HK u-boot have many issue with loading the kernel, with load address
>> > *it's really hard to build the kernel for HK u-boot*,
>> > to get the configuration correctly.
>> >
>> > Well I have tested with mainline u-boot with latest ATF .
>> > I would prefer mainline u-boot for all the Amlogic SBC, since
>> > they sync with latest driver changes.
>>
>> Yes, we would all prefer mainline u-boot, but the mainline kernel needs
>> to support the vendor u-boot that is shipping with the boards.  So
>> until Hardkernel (and other vendors) switch to mainline u-boot we do not
>> want to have upstream kernel defaults that will not boot with the vendor
>> u-boot.
>>
>> We can always support these features, but they just cannot be enabled
>> by default.
> (I don't have an Odroid-C2 but I'm curious)
> should Anand submit a patch to mainline u-boot instead?

It would be in addition to $SUBJECT patch, not instead, I think.

> the &scpi_clocks node could be enabled at runtime by mainline u-boot

That would work, but I don't know about u-boot maintainers opinions on
this kind of thing, so let's see what Neil thinks.

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
