Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59637C46467
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I07dG9QvsYoccPYLMWjOMIXmqBrdCGHOXoNlld71Cdc=; b=IJUAP1SM8lyltPOVnSxnE44suw
	RXesS2JlwA33r1HuBmw/aD2l9wK0rcwGw88FOuXogm8RDaBDT/wD/XQ2Q3OYjEhYl2Gs34xTNCLQX
	fAzzAItgZyC0EvXq6WX7ZTNeM0Fv3cfkoI8eBX94DS/bwUTc5n240OzdeK8BN5j4iigpMzhUfc9SU
	B0n/OgHJ43B8KOcilsF1QBYF1qOZqzcdf6qKwVLWfBOADSNlWXxe4iFNLkxV1XveceJNW7k2y/yag
	n4ZxBWdh5uEEbel+q1Tnk4siql33UWH5MqETSo8Ne4hIMMGbV/ZwJpPtpbDcrxoZvKjcDv3rLWghv
	bcZ3P/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHVx-00A7IK-4S; Mon, 02 Jan 2023 09:53:54 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHSs-00A533-5f
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 09:50:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id bn26so6413801wrb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 01:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SVGCJCOgwVXnepdI5F+GDeNjGWyoSNAibXazSusOve8=;
        b=cYCiEFOkxtQuNftnx+aWiSeGSQB/C3Ynf97/eIUNkHpG/2odU6qH8xEQANpUOAG2OK
         jYtYwhCm9x+6Ge/nYwoWr3zn9VK/V3w3e9XOnRrOQGJmM0dgnw/fYQQuW+1uXQeKiEhI
         97Wa6Wg3IDA7O2KnsP27Qgw4rSFmCFIW+9J49Z6yxlegpKo3yIRGCZXwFVwALWh1R6Tt
         mbjrLbJgGcK0bj5PJgmclefqM/OkgmywOU+8RkegMgLfk84QVg/MO14fg2cJu4Z0B72B
         PuV3FG0mWixq3ZHxP8XYCsX5G3aHy33vzZOsKYuu83YVeabXT9dXRsuplMZMAA/Hm8Wu
         p0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVGCJCOgwVXnepdI5F+GDeNjGWyoSNAibXazSusOve8=;
        b=71pHPxiYYIdoMsv5jtJfbflsR4Kp8krHGWbJIOMloWTooX/Jbl+lXAtg7H6qH8srTO
         UlafriTb5LjlXFRkihf2CVB/ET/z7UXeUZd8wPK2iLyNXbOQ3yJdFuUJ4uZWHtDNBAl8
         Zy602r8ujOJ1/KU40NXW2SbUK79wK9SYHlBUOFbvsgvobvRggRgrxfJI2M75pDM55LI1
         1t8E3kddJ2GWuBdBhu3TVXiDjVTYktG8H7ZTte1wwBVyTDCeLqrMn3GteVKFdLNlTNxq
         HmIARX3OKJxDrbyzt9IsqWrt8CY98zMCGFFXYnsda/XpYC05LB2LpyJSacKmN3eNYIDE
         /E4w==
X-Gm-Message-State: AFqh2krl9WZ3yoMMDGSmFJEdRnLUmYjhfJtd661dTqmPNv7mmyuzed/H
	eZQgCRgszemtl7y64Ft3oGee9Q==
X-Google-Smtp-Source: AMrXdXv0V7TARizcOXFUXhSwtsqBzc81OLl7ef/oEJkEnnyyloWkkCEcKnkVEXr16yGJgW5U+igz5A==
X-Received: by 2002:adf:e6d1:0:b0:27c:dcf5:ad52 with SMTP id y17-20020adfe6d1000000b0027cdcf5ad52mr19361604wrm.11.1672653040289;
        Mon, 02 Jan 2023 01:50:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4f32:f70:35be:acf9? ([2a01:e0a:982:cbb0:4f32:f70:35be:acf9])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb51000000b0027cb20605e3sm20358728wrs.105.2023.01.02.01.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 01:50:39 -0800 (PST)
Message-ID: <b7dba825-3e39-fbf1-a73f-7e80a0d1bb5c@linaro.org>
Date: Mon, 2 Jan 2023 10:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [BISECTED] arm64: dts: meson-sm1-odroid-hc4: USB not working
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Olivier Mercier <nemunaire@nemunai.re>
Cc: Kevin Hilman <khilman@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <Y6okoXpwF/LZewhv@nemunai.re>
 <CAFBinCBaLLxO0ox9LJKS+LaQs4eqmtH_6Sbcv70rTLZz3b2qZg@mail.gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCBaLLxO0ox9LJKS+LaQs4eqmtH_6Sbcv70rTLZz3b2qZg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_015042_349202_D3F23C41 
X-CRM114-Status: GOOD (  28.89  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/12/2022 11:43, Martin Blumenstingl wrote:
> Hi Pierre-Olivier, Hi Neil,
> 
> On Mon, Dec 26, 2022 at 11:48 PM Pierre-Olivier Mercier
> <nemunaire@nemunai.re> wrote:
>>
>> Hi,
>>
>> On my Odroid-HC4, the USB 2.0 port (the only one available) was not
>> working. While it seems I was not the only one in that case[1], after
>> some experiments, I found that by reverting the following commit:
>>
>> 703e84d6615a4 arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
> Thank you for bisecting the commit!
> 
>> it solves the issue: USB is working on latest stable (6.1.1) with this
>> only patch reverted, while it doesn't with vanilla dtb (with same
>> config otherwise).
> [...]
>> I didn't read the specs, but I also tried to inverse the patch (disable
>> usb2_phy1 intead of usb2_phy0) and it didn't work neither. Apparently
>> usb2_phy0 and usb2_phy1 are both required for some reason...
> After reading this mail yesterday I could not make much sense of it.
> Now, while re-reading it I remembered the time when I worked on GXL
> USB support and wrote the following comment: [0]
>    All USB2 PHYs (which are internally "connected" to the dwc3 roothub)
>    need to be powered on, otherwise USB devices cannot be
>    enumerated (even if just one PHY is disabled and if the device is
>    plugged into another, enabled port)
> 
> This is probably also the reason why I left all USB PHYs enabled by
> default in meson-{gxl,gxm}.dtsi (and so did we in
> meson-g12-common.dtsi). Instead we're disabling the &usb node by
> default (and enabling it for boards that have USB ports).
> For readers not familiar with the default enabled/disabled: typically
> we disable the nodes for IP blocks in the .dtsi and then each
> board.dts enables them on demand.
> 
> Neil, what do you think about this?
> Should Pierre-Olivier send a formal revert (with the problem being
> described as part of the git commit message, such as in [1])?

It's true I haven't tested with only a single USB2 phy enabled, but
since the USB design is a derivative from GXL both USB2 PHYs should be
powered on for USB to work.

Pierre-Olivier, can you send a proper revert patch so I can apply it
to fixes and send it asap ?

Thanks for the report !

Neil

> 
> 
> PS: Neil has probably taken some days off, so please give him more
> than usual time to reply.
> 
> 
> Best regards,
> Martin
> 
> 
> [0] https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=47722220660cfb935e27e62d385959ecc296cddb


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
