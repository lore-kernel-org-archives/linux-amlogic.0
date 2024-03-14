Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49B8C5475B
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2024 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4l5IX1u9eLl0SrNihrdeTlOy42VbcfXjBJJsUKjATs=; b=3nmzrDrhYLqh1p
	Z7yKOlelQjZsMQLQkMCEFCYAKecmUN9KidC2Q6oDu62+nnOmqQH0TxLrRFbrddJ0m3s8Mbp63jYSr
	xliaBWRhKUmaRPJoUM/mwCmvuZsaP0c0U0VIALrLyWwvoDjI3tMgMoOxLNe72Xvm/ycjdPH3x1NZe
	k5C8Ws3mYmcQyKnXtRDpBkSHBWVOOxPn5HkU3iD2bsim68LcQbtCzDSdujpctw3vDGQHQvjIxWXIJ
	4H1NjVbTnMbcKC86TGn5z4f1/+nENZe25dDviGI7zKY80jLQPtxy9EpNu/mK5RaV03Lw8CnOilw5u
	+YwUksVBhrPZpOFnsmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhOv-0000000DjMG-0ZBn;
	Thu, 14 Mar 2024 09:29:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhOq-0000000DjID-17CA
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Mar 2024 09:29:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-413f2f3e5b5so1729165e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2024 02:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710408557; x=1711013357; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=YVpA2JX+fzlp/qRr3hVbu2IFpulUsmSIfEJZSoktU3E=;
        b=aGTrtenEcHgYWEIWsq9eeDy0M40s9wcNJGX13rkw0y++uoMYYjUY70k47rcHWm9X7y
         PHd/WyhomYHo4vMMTYF+OfEFLuIRkYi/+k0wpDeuGt7nbI2am/OD8pczu431kqam1FW/
         vVTyi0m88M+1NvO6tiUyFCz1PSe5oGnuXAbJHiNuJ/Rdj/kmemCrTlqv1CnW2yCyKc2I
         rm6WdQ1dab86uAS71BGNctkW1rEgGjZndEyHmpBXJ8qa1KunLfj19nKSXx+sC3BmELqU
         j+kNIz5LWozIW/9rar3BtHgjtXSd6e1wnmNyER+F19aVu5F8D18y3TqIQTj7SHWJpvCQ
         Mhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710408557; x=1711013357;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVpA2JX+fzlp/qRr3hVbu2IFpulUsmSIfEJZSoktU3E=;
        b=NFCWCU8eWG0UZREFwK20jUOLkbsDE1IXGlJu4bSSUqmcHLWgarEq1MnC7rXrJKOLja
         lcBFB/F5oKMUAs1TBklG6aY+7q4lj99+9er3mlm/DqVauOlE6Wkx/Zeqzl+3MFM5hCrV
         n/0JDCmilB/IUQx9uXNmrPwnJ60ns0tXeDKXOTGsznqNWPcErYrQJSb4V6qW+gZz7b8s
         K/EGtJhof0TDeOJ3rE/+1Db68rBBZsffbVQh7HiApvaAhhdiQrgFBR3umztqxPwTbAd4
         2GEbg7UQI+89MLXgxqO7614iAczdNZb72eHiSWx7A29OUPmErBKTh2j8vgieg28rkrW2
         n5Og==
X-Forwarded-Encrypted: i=1; AJvYcCXo/Jlt39BWedHaZqY04nDGw1o2XxKu130JHjei4ab7JzuUwjPh6p1gbPSmuEyhssbcOUWfTKaLRsGAjXsLkbFp7jmX1ZAuPyWSgqqH1wK9354=
X-Gm-Message-State: AOJu0YwskVfez8Q8DeUz1cpioyvSWmRapEwYNPzdc+90cqqGOdeHtAR1
	hLoNSQjXPICphE8PlaqZYqlyFwn8t/h56ZWUE5Y6b8duBAzQ8m3ZRr78qKTbca8=
X-Google-Smtp-Source: AGHT+IFhNZ2TtpDUXtz09eVcfKUHcjWWWpUtXTeEmJ8m3au/jqm3KhAMcAZOfzORToIXAGGCUCJhrw==
X-Received: by 2002:a05:600c:4fce:b0:413:2e2b:bad2 with SMTP id o14-20020a05600c4fce00b004132e2bbad2mr929596wmq.5.1710408556468;
        Thu, 14 Mar 2024 02:29:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cd51:5f38:3a35:2e03])
        by smtp.gmail.com with ESMTPSA id r21-20020a05600c35d500b004126afe04f6sm5047088wmq.32.2024.03.14.02.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 02:29:16 -0700 (PDT)
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
 <20240312-basic_dt-v1-3-7f11df3a0896@amlogic.com>
 <1jsf0vephv.fsf@starbuckisacylon.baylibre.com>
 <9a38fd52-5eea-468d-bd7c-29a505503268@amlogic.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
 <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/4] arm64: dts: add support for A4 based Amlogic BA400
Date: Thu, 14 Mar 2024 10:26:26 +0100
In-reply-to: <9a38fd52-5eea-468d-bd7c-29a505503268@amlogic.com>
Message-ID: <1jcyrxi2l0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_022920_555997_BF7276B4 
X-CRM114-Status: GOOD (  15.92  )
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


On Thu 14 Mar 2024 at 16:08, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

>>> +
>>> +#include "amlogic-a4.dtsi"
>> Could you describe how the a4 and a5 differs from each other ?
>> The description given in the commit description is the same.
>> Beside the a53 vs a55, I'm not seeing much of a difference.
>> Admittedly, there is not much yet but I wonder if a4 and a5 should have
>> a common dtsi.
>> 
> They are mostly the same, A5 include HiFi-DSP and NPU, but A4 is not. And
> some peripheral modules are different, such as SPI and Ehernet phy.
>
> I would like to wait for the follow-on chips to come out before considering
> a merger with common dtsi file.
>

No, Please do it now. There is no reason for the community to review the
same thing twice if the SoCs are "mostly the same".

>>> +
>>> +/ {
>>> +     model = "Amlogic A113L2 ba400 Development Board";
>>> +     compatible = "amlogic,ba400","amlogic,a4";
>>> +     interrupt-parent = <&gic>;
>>> +     #address-cells = <2>;
>>> +     #size-cells = <2>;
>>> +
>>> +     aliases {
>>> +             serial0 = &uart_b;
>>> +     };
>>> +
>>> +     memory@0 {
>>> +             device_type = "memory";
>>> +             reg = <0x0 0x0 0x0 0x40000000>;
>>> +     };
>>> +
>>> +     reserved-memory {
>>> +             #address-cells = <2>;
>>> +             #size-cells = <2>;
>>> +             ranges;
>>> +
>>> +             /* 52 MiB reserved for ARM Trusted Firmware */
>> That's a lot of memory to blindly reserve.
>> Any chance we can stop doing that and have u-boot amend reserved memory
>> zone based on the actual needs of the device ?
> Yes. U-boot will change size of reserved memory base on actual usage.

Then u-boot should add (not change) the memory if necessary.
Please drop this.

>> 
>>> +             secmon_reserved:linux,secmon {
>>> +                     compatible = "shared-dma-pool";
>>> +                     no-map;
>>> +                     alignment = <0x0 0x400000>;
>>> +                     reg = <0x0 0x05000000 0x0 0x3400000>;
>>> +             };
>>> +     };
>>> +};
>>> +


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
