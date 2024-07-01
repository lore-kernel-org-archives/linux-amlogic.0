Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F992C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 09:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR4bf64eL6gRYc0QSyPGBx6mldYdb71qphjUiWxHIno=; b=MNFLaaZ+A1GFK9
	Mf+sHfmHnmDTyjAGjXPQaR6XZyxAr61gteOE0URB1/IOXlx7x+tuP2oVvrItKfuFUW83N+B2EW1Km
	zq+DD331BNDeDt5MNt8Nje8yRGfD7e+k64PB4X13J7hv7yuJEnrHnFXUpSNdf92jkiSsBl2SIiiiY
	EUbDLpew+pOL6BvZZOvpxseZDC4X0dzG4aN9IW99mDfepuVgn6xg7BnBCAcgNjtmQYHw+IsyIF30E
	9XJY7au7g7cwB9fUjH7pEtL90pumq2RAaOV60hoQ5J/XnvrwtuO/qO2aFcpgV8xQ+Rq/ZMPG3Gu0W
	AvxdGbXE0/x9gjjFQC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCuz-00000002MwW-1SiI;
	Mon, 01 Jul 2024 09:01:49 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCuv-00000002Muw-2S3L
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jul 2024 09:01:47 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso3878804e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2024 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719824502; x=1720429302; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4V4a67sH+Sj9j9mjJSBdp3EdWT5AmAZ/sIsVO2U5Gw=;
        b=CPQvhOl8UBcB3nM8wn9IUjmUN6qehtOj8AdGZfDUs+nP+id/T6ePB6rq25XD2jpdWT
         fINyBnDOyUVTd6DaAumRNv+0hlw3TJpqe1TnzqGFxap0YIaukltaSWy37xuPc+16lxnB
         eWKpHgYVIIBjw69xPF+oNDPKzj3QTWjSuwSKBivDeTrx2HBLnAzSqSKtcMT5q6ccVnx9
         //o0GRbhYx1oh//+48jdVhNuAurzAW1n5o69RHsehM3BuV9nw+a8011Xauj2OlcqMv9c
         n9qev03dFo85OAS9JxHkZUAW/SUbDKvlgIDmcCqvZhl39V5KB7p8d7cPxqvyYwG1027r
         7Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824502; x=1720429302;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4V4a67sH+Sj9j9mjJSBdp3EdWT5AmAZ/sIsVO2U5Gw=;
        b=LA9+316gV0yvp5JM1+8wXf1aRwkdMUW890w1Vc4rCnMEYqMDrObFxqG3ILYBt0kXXb
         QZ3sjlzYKfCkRjLGKSTloo7RJQLN33079ilmo0Pxn0w9CtVqeHNsDIwosE6sI5CVyc9Q
         WNGMaKxw4QxOGXLmIRYoxF5TrQ1A8Fg6+j7DiE44Qr9GyYwiiI8Y6b1n4cXZNJcJVPUK
         /QK5iDJLtBDe2T0xaWLSF/V4kJBkDTybFx9QEoxmCd7nE/WWhTMem1p1zCgBSt0YfrDZ
         GPaifMYQf0gTxAMnanQNgkFUe7Gyz5kbvhyIWJGZOH5+ok4ckGP9g347MxZrZ+WXqbzt
         3B0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPI9jY9DdC+qHIml/4AyK+eFRdUDZCjmEy2fXxlliXQ8lu9R9EcuR69kS7tHT9A31rBhgMdALw47TmoVB+zaYZnVGa7yKNNai1adFZb0RmT+M=
X-Gm-Message-State: AOJu0Yzze6auJdOR6jn7CX9doX2jXVZHErCBQ41iTagOJlgU/e/w17WD
	NEtVr+F8fmH32vXoLJkVtes2Y3c8TZ8mriG6ZhtkrXCRpuKiwec5r1yoqhme+fE=
X-Google-Smtp-Source: AGHT+IGQbQF+l6JIu2qBU2qs5wcIrc1fNbnpDVITtS7Qre3SZ8PBndtUb5N/ZdI9xkP9Dwj5YuGUlw==
X-Received: by 2002:a05:6512:3c99:b0:52c:cccf:85e1 with SMTP id 2adb3069b0e04-52e8273cfc0mr3906453e87.65.1719824502302;
        Mon, 01 Jul 2024 02:01:42 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2d2:df21:c0a8:45a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55cccsm144287685e9.16.2024.07.01.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 02:01:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Kevin Hilman <khilman@baylibre.com>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-iio@vger.kernel.org,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
In-Reply-To: <5da26c0e-75a7-4d5a-9eca-f88ecf369996@linaro.org> (Neil
	Armstrong's message of "Mon, 1 Jul 2024 09:41:01 +0200")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
	<1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
	<c092ec67-e384-411d-8885-665597547523@linaro.org>
	<1jv81xgmfc.fsf@starbuckisacylon.baylibre.com>
	<5da26c0e-75a7-4d5a-9eca-f88ecf369996@linaro.org>
Date: Mon, 01 Jul 2024 11:01:41 +0200
Message-ID: <1jjzi5a3ka.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_020145_846433_8ED77107 
X-CRM114-Status: GOOD (  35.50  )
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

On Mon 01 Jul 2024 at 09:41, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 25/06/2024 15:51, Jerome Brunet wrote:
>> On Tue 25 Jun 2024 at 15:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> 
>>> On 25/06/2024 11:53, Jerome Brunet wrote:
>>>> On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> [+cc people from linux-msm]
>>>>>
>>>>> On 24/06/2024 19:31, Jerome Brunet wrote:
>>>>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>>>>> system clocks.
>>>>>> This drivers aims to replace the one found in
>>>>>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>>>>>> * Access to the measurements through the IIO API:
>>>>>>      Easier re-use of the results in userspace and other drivers
>>>>>> * Controllable scale with raw measurements
>>>>>> * Higher precision with processed measurements
>>>>>> Jerome Brunet (2):
>>>>>>      dt-bindings: iio: frequency: add clock measure support
>>>>>>      iio: frequency: add amlogic clock measure support
>>>>>>     .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>>>>>     drivers/iio/frequency/Kconfig                 |  15 +
>>>>>>     drivers/iio/frequency/Makefile                |   1 +
>>>>>>     drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>>>>>     4 files changed, 868 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>>>>>     create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>>>>>>
>>>>>
>>>>> While I really appreciate the effort, and the code looks cool, the clkmsr is really
>>>>> a debug tool, and I'm not sure IIO is the right place for such debug tool ?
>>>> The reason why I went through the trouble of doing an IIO port is
>>>> because I need that for other purposes than debug. I need to to be able
>>>> to check a frequency from another driver. I don't see a reason to invent
>>>> another API when IIO provide a perfectly good one.
>>>> The HW does measurements. IIO seems like the best place for it.
>>>> For the record, I need this for a eARC support.
>>>> eARC has a PLL that locks on incoming stream. eARC registers show wether
>>>> the PLL is locked or not, but not at which rate. That information is
>>>> needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
>>>> is a life saver in that case.
>>>
>>> This is a very interesting use-case, and quite weird nothing is provided
>>> on the eARC side.
>> Indeed.
>> 
>>>
>>> So yes it's definitely a valid use-case, but:
>>> - we should keep the debugfs interface, perhaps move it in the iio driver ?
>> I considered this initially but it would add a lot of boiler plate
>> code to provide over debugfs exactly what iio already provides over
>> sysfs. As you pointed out, the previous driver only provided debug
>> information, the debugfs interface it provided is hardly a
>> critical/stable one.
>
> I still don't see why it could add so much boilerplate, all the tables and
> calculation fonction would be shared, only the debugfs clk_msr_show() and
> clk_msr_summary_show() would be kept, all the rest would be common.
>
> I insist, please keep the debugfs interface for debug purposes. You don't
> want to mess with IIO when you bring up new platforms with bare minimum
> kernels.

I don't think that is going to change anything. It's not like IIO brings
any complexity or will be compiled out.

But since you insist, I'll add it in the next version as a separate patch.

>
>> 
>>> - we should keep a single compatible, so simply update the current bindings with iio cells
>> Using a new compatible allows to split the memory region, making the
>> interface between DT and driver a lot easier to implement seemlessly
>> between old and new SoCs. Eventually it may allow to implement the duty
>> part too.
>
> It's a problem for new platforms, you can introduce the split only for the
> new ones, the impact on code won't high enough to justify new bindings.
>

What you are requesting will introduce two drivers providing the same
compatible, unless you plan on removing the old one in a coordinated
way.

That's an unncessary churn. The old driver could stay there for a
while and platform slowly migrate. What you are requesting forcefully
migrates every consumer, assuming the old driver is compiled out.

This is an opportunity to more correctly describe the interface.
It does not break any DT rules, that is enough of a justification IMO.

> Neil
>
>> 
>>> - for s4 & c3, it's ok to either add a second reg entry in the bindings
>> Doing that for s4 and c3 only would still make a mess of offset handling
>> the region because duty prepend the region on old SoC. The goal is to
>> have an interface that seemlessly support both old and new SoCs.
>> 
>>>
>>> Neil
>>>
>>>> Everything that was available through the old driver still is, with more
>>>> precision and more control.
>>>>
>>>>>
>>>>> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
>>>>> they chose to keep it in userspace until we find an appropriate way to expose
>>>>> this from the kernel the right way.
>>>>>
>>>>> If it enabled us to monitor a frequency input for a product use-case, IIO would be
>>>>> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
>>>>> it's not the best way to expose those clocks.
>>>>>
>>>>> Neil
>>>>
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
