Return-Path: <SRS0=/aBW=CD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93446C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 14:30:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A1A2072D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 14:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j/DQey1T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IJQWeCoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A1A2072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tVaFCeRgHxzS12s+Nyz1YGgLaYpPLqep5u//qaGO6g0=; b=j/DQey1TDQtNSMryOqXdNLqcn
	9YnkMJKhHS1+XAP9w7ytwoklRDn3l4+54UkRq8l+JeNQcvOeTIJqi9Qw6bwZ/v7uCq0hngnW08ulm
	TYWAIchhNBnfsJwZgpeeU4XOtKJxcAXhzp71fi61VYW6+7nvBDQJfUyXGbvoHIQ0aUFHf+mW+rfS8
	6VmDQg+Z6Av58RAlu0WXeEs6Sh/EXif68FrPFfAM3KjMQfwGCInQIyruR7ydAa1vUwPomHgF6Bj9D
	BpAQSQ//VLmkhSmh580jWXt32Z5N+ytVHkVdd+6SLn1YupQlYYbHyx55MJpfpyOVxh4+v8LKUWQl6
	sIxlMUC0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAZxz-0007Db-RY; Tue, 25 Aug 2020 14:30:27 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAZxu-0007BT-PN
 for linux-amlogic@lists.infradead.org; Tue, 25 Aug 2020 14:30:24 +0000
Received: by mail-ej1-x644.google.com with SMTP id b17so8544680ejq.8
 for <linux-amlogic@lists.infradead.org>; Tue, 25 Aug 2020 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ZdXw+gzbskoX8H1mxygEd0s91nu0t19+/xojv0RSuX8=;
 b=IJQWeCoGzir8E9IhX9rAY/Bc6IeARVKlNiU9ZkBU0/0yibpLv4cjbyr96f1p0vhhHh
 Rv7YarCPFmu2TeTR2ztbxdtMw8cqE189SzCNEgyhVIdrsBhW3XO13PWgF+epl737p59v
 P80XdyjTHuP+/KyDzSK+FbAp3N84s3eIFk+NGFW/JaHGd6QDrbZBkMAbsTXCBKQqFlet
 Uw86hWEVV2y4TBWuSly7w6JPCQaSfpJHOluyE9rbWFSlJrlmFj6c5lIkbDnSJted85K9
 t8tIg4cHG3LxFSGbo3Urg+hhpSpWLg044N4qh9AWIRSMHHiZVmPdGAExEJmFmWl7KjJd
 g6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ZdXw+gzbskoX8H1mxygEd0s91nu0t19+/xojv0RSuX8=;
 b=EkmJrzEOt24w9sr6qyG3gaS5v95vPMBkXNZuL/y1RZ1udBu3REvAewVwA054UPkJAm
 4rwwk0HLHl05i6OGEoJGVGs28UG1a6D0bdqzVUpfTC4RXu7nhixmOpG+VblS79rVS1ye
 H+ucERAehavCpi9189ptsX9sMRjMMMKmTy8ftmvRvlcwExhCyrbD1kFKRY45pMfjWq8j
 ElAbEMpxAdz5ay2epCmWYeNl9UXyd7jSysy/q/Em58G6Rg7tHFDO87NmcDAvjZK2qOYC
 Gnsdov7BwImRfzoPPs+zVufIOrB4vOrd4h4JnmQeQa+alUPXC4Qyjuji7SqrhVDB2gzF
 v+Tg==
X-Gm-Message-State: AOAM5331qSJns17OtvIqshkCYCcr3CW5EPIDL84raNtsCHywCP503zsv
 mO9H4VYMjfrVDCOXTN7UfzHlGiYiMZeShA==
X-Google-Smtp-Source: ABdhPJyv9q0WZs4EBQ9N2uAlkPmF7aGcdCaZUOfdv1FKhsKBZ811vlnQ9VKtvqi1WNIv1Io/39b50w==
X-Received: by 2002:a17:906:80d3:: with SMTP id
 a19mr11461547ejx.217.1598365821066; 
 Tue, 25 Aug 2020 07:30:21 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id e14sm13266895edl.86.2020.08.25.07.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:30:20 -0700 (PDT)
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com> <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
In-reply-to: <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
Date: Tue, 25 Aug 2020 16:30:19 +0200
Message-ID: <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_103022_865155_15EE5620 
X-CRM114-Status: GOOD (  23.07  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 25 Aug 2020 at 11:01, Anand Moon <linux.amoon@gmail.com> wrote:

> Hi Jerome
>
> On Mon, 24 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> > On 24/08/2020 15:41, Anand Moon wrote:
>> >> hi All,
>> >>
>> >> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>> >>>
>> >>> Hi Kevin,
>> >>>
>> >>> Thanks for your review comments.
>> >>>
>> >>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
>> >>>>
>> >>>> Anand Moon <linux.amoon@gmail.com> writes:
>> >>>>
>> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
>> >>>>> support the RTC wakealarm feature for suspend and resume.
>> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
>> >>>>> timer device to prevent it being assigned to /dev/rtc0
>> >>>>> which disto userspace tools assume is a clock device.
>> >>>>>
>> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
>> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> >>>>> ---
>> >>>>> Changes V3
>> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
>> >>>>
>> >>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
>> >>>> wakeup the system?  If so, this should be included as part of this
>> >>>> patch.
>> >>>>
>> >>>> It probably still works because the bootloader configures this GPIO as
>> >>>> input, but the kernel should not rely on the booloader for that, so
>> >>>> please include as part of this patch.
>> >>>>
>> >>>
>> >>> Ok I will figure out the correct pinctrl need for this settings.
>> >>> looking into the Odroid N2 schematics.
>> >>>
>> >>
>> >> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
>> >
>> >
>> > Simply add:
>> >
>> > interrupt-parent = <&gpio_intc>;
>> > interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>> >
>> > to reflect the interrupt connection.
>
> I have tried this setting, but it is not working.
>
> [alarm@archl-on2e ~]$ dmesg| grep rtc
> [    5.378002] meson-vrtc ff8000a8.rtc: registered as rtc1
> [    5.942307] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-110
> addr=0e, data=03
> [    5.942316] rtc-pcf8563 0-0051: pcf8563_probe: write error
> [    5.945983] rtc-pcf8563: probe of 0-0051 failed with error -5
>

-110 is timeout ... either you i2c bus is broken and you device is not
at 0x51. In both case, it has nothing to do with the interrupt configuration

>
>> >
>> > No need to setup pinctrl here since the GPIO input is always connected
>> > to the gpio irq generator whatever pinctrl mode is set.
>>
>> It is actually better to setup pinctrl. Yes the irq controller can work
>> whatever the pin setup but if an output function is active it can mess with
>> what the irq controller gets.
>>
>> Think about applying/removing bias if necessary too.
>>
>
> Ok, I am trying to add a new pinctrl configuration for
> TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
> But it's still not working at my end.

Either you are quite confused when it comes to pinctrl or I am.
TSIN and TDM have nothing to do with an i2c RTC.

>
> -Anand


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
