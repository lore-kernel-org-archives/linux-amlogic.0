Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D1BC4743C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 07:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45AC61209
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 07:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A45AC61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fad1UZSeeV92vHDvv2LpMeDA1XS6lVMmcNa8KKDB6As=; b=E8wfx1DF1TmJJarsTA7NRDQE5D
	2l28zmu0jzlLGU+bN1kWCke4fcmUISl7MD292Yz4MyM2WPLA+36Jjuv11LuWYqKF7TL0UcEZbyK2R
	aFDAZJKkEEZj2LxG6AwGLvQfhJAlfquWgkjkW6rz39tGy/pFIt4T6rJIWc5m6QEeBIa3+ssf6WaCf
	asQNGk3Php60/tJ+tni+P1JIaFJG3AmpWt5eXUQaQWGr5K3SrqPdPwyCWH3MymZ0rmSEfhr9d7i3V
	AvOm3KU2SdWDNhxFhaiUPZ9044KkFAJscS0zTUeUqrr6S6QAifxHAV7efcntogY34h4cTJBHAEYfr
	P1CVVsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9KS-001tjl-1j; Mon, 07 Jun 2021 07:05:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9J4-001tEy-1h
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 07:04:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so11880823wmk.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jun 2021 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=IXQ0rHuIq8Sp6ZPSHkZylxeYQH0sxVpoEqp3jeaqYmE=;
 b=CusfUE99qmUxcpVDkjaGEVIrFMA4hxU1A186jcqV+McU6E+Nau4xkvIptLglW8Q7fx
 mvNUugrdAmpkGz27Vpjk+wrZ9DqTJSf5o/I31z0NO/9FG2oWcH0DRYYeoKBvO9mqMDvH
 aXWzNmhUaK43gb8N4fK2tvYHYNmFj2mTs4i0UpTuqCFTMJfLeUz7pGPFm1qYokleH5QI
 p/aKxMcG8RQusn0Fpo2RffkWJE4xDF8CJxCkJpXu4+QpfVvW+QB0C2sCj/BVJU8dZ7Zh
 f9LJijY+4Qq7zQxq52HYYFSac2GZgD4IONIZCtGlmYKdrcbbqNHWKtSA5yvv5pFbrnqJ
 NBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=IXQ0rHuIq8Sp6ZPSHkZylxeYQH0sxVpoEqp3jeaqYmE=;
 b=a9IlgjKPVVaaGbNkyBAWwC6FFUtDvCwn8G+0Gx3r0VGRGJ1TwARoVsQCvyP1n9Gnho
 sZnfSJdDNJh2dozTU6OC8WMoYJyXgyjLPPI8qNDTcl+3l6780exbtqbSM2VlLwuo2e4W
 YGzSM0WGZ+2vt8Vrg9MsxT1XmYT0FaHkdVWg1/dL8vhWUa73GlnEYhiW8f3vADvgX7py
 BuKIh7VkzR0ConoG557vb/fCCN+ZZmIUeR/DGddsk4E87kRka1oZXPEU8ouXDYtGrpzE
 kwpP35Obd7184FtxxXmm5F5F/Pmu8pyP3NPJJChmqYL9ONQ1Cu1taIp0ll9u3BNT/I/9
 SGGQ==
X-Gm-Message-State: AOAM532QiBJn2uoEjJ+jyY03hHY3iFNLwRcuJkDbYjN6McMcyMu7ImSi
 TJtdICHZuYP5DNdDP62Hj4tugA==
X-Google-Smtp-Source: ABdhPJyZOO/5rHk78956yRcE3dQpHyZg1qpWa64vJWaG0F4aawYYlClHtW4UBWk8JDkkqJx41AlDeA==
X-Received: by 2002:a05:600c:20d:: with SMTP id
 13mr15430122wmi.174.1623049454701; 
 Mon, 07 Jun 2021 00:04:14 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id l9sm13019639wme.21.2021.06.07.00.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 00:04:14 -0700 (PDT)
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
 <CAFBinCDn_0TeyLG9b9uB+4-4PdeNXgja11wf2CGcQ99tUNjkyQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, sboyd@kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
In-reply-to: <CAFBinCDn_0TeyLG9b9uB+4-4PdeNXgja11wf2CGcQ99tUNjkyQ@mail.gmail.com>
Message-ID: <1jr1heqhoy.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 07 Jun 2021 09:04:13 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_000418_169179_FEC6FF9C 
X-CRM114-Status: GOOD (  19.49  )
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


On Fri 04 Jun 2021 at 19:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome, Hi Stephen,
>
> On Mon, May 24, 2021 at 12:37 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
>> fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
>> up to approx. 3GHz.
>> This however causes a problem, because these rates require BIT(31) to
>> be usable. Unfortunately this is not the case with clk_ops.round_rate
>> on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
>>
>> clk_ops.determine_rate does not suffer from this limitation. It uses
>> an int to signal any errors and can then take all availble 32 bits for
>> the clock rate.
>>
>> Changes since v1 from [0]:
>> - reworked the first patch so the the existing
>>   divider_{ro_}round_rate_parent implementations are using the new
>>   divider_{ro_}determine_rate implementations to avoid code duplication
>>   (thanks Jerome for the suggestion)
>> - added a patch to switch the default clk_divider_{ro_}ops to use
>>   .determine_rate instead of .round_rate as suggested by Jerome
>>   (thanks)
>> - dropped a patch for the Meson PLL ops as these are independent from
>>   the divider patches and Jerome has applied that one directly (thanks)
>> - added Jerome's Reviewed-by to the meson clk-regmap patch (thanks!)
>> - dropped the RFC prefix
> please let me know what you think about this v2
> I am asking because clk-divider is widely used, so I'd appreciate if
> this gets some time in linux-next (so for example Kernel CI can test
> this and report issues if there are any).
>

Looks good to me
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
