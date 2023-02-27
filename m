Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7D3C64ED8
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHNPNpcm2a6mhUd/HeRqoh0Iy5QWWly7JF9yukU940w=; b=ZHWpWoBmhnzPXfnloc78aGAJtG
	m1kLajVomzonuaUzfe/GZI3KUnZFbHJ29jDUqlNvsLvJOU+dMxHHh19mcPDCcdyGCCYOPdB4/O8IN
	8XMtxB9M2UXTvO7l7SLPqPnD9PE3366Vx4xVPcZIA1s0xUiVPX+gebiyhpgE8sOErn6Iitw0ywWPG
	Qo/oDj7C8P+bIKNfLwngHpxGVu2cySWUvKjdLLMlrAGhqvVl1r9I6C0zz201SxOXyoZaihkAnnPHX
	y1d3ZA8orIR+ZNmB5bSFUyUJ96cttbHXfJupnhdruFvNVWgrWcOtNcFALtGBk7RyqXH1ONVLvX9Fi
	DNy4854A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWemH-00A3EU-Fk; Mon, 27 Feb 2023 14:46:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWemE-00A3Cb-AU
	for linux-amlogic@lists.infradead.org; Mon, 27 Feb 2023 14:46:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id bt28so6490190wrb.8
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Feb 2023 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p5uPmXHKG/K2eyX0uTKfopGR5q6ewnoODzWdHrgpksY=;
        b=xsDmR4Do5X7GXRqXrx1sWPPfkkQPSeeWpP2+i4dOxIWxcR7fP6Movgw/jx9+PTcgt7
         hZJVmOvfvsqEjjlzatHhw1inycwyCGnF5AWqhfEdY8DqC4BB+6YJ8HfIKyumuaLjA4+6
         8DWMB+gPmdduGXGL0H74VPktXjL82h5h0pmTvXBxiNrZiftH4CdztJlVo01814iYUGpJ
         ZLIXJh4m2TyOrtln5FH1941ZRWVUy077IrohbwK1dJZBaR5k9BFLu0Y4QYZXkQZm0Bh0
         XeG4HbNyRQ4pE6zIAYWUiZUqw0AU4Cm5MppLmtKFbDPVVXqXg5hGfBkZrOCekLklyq8S
         0OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5uPmXHKG/K2eyX0uTKfopGR5q6ewnoODzWdHrgpksY=;
        b=kmZa0e7RnLuUVlLalDPF+8Xm3ScvffR5dNmmFksVlppS1v08veGuHsb93OK09xrH2Y
         6K4lMmStfPdYYWQyFbYCVATx1I7J7BkMNuhHCHtlCPwImzSM7dMQUjHUOEvPCnPTJklc
         NGS6AbZZ5IMqnnQRQqJhbmy1iAtC4AC5oaQE+4vXseUaCs0q64rpJydZ6Kxa1bT1pus/
         n26Aja9RuVnwc/cWCRXoT/PLwe6eWwqwloaAq6Du0iusGvIJXLTNgfV0Py08fwY0zVfA
         H3q7X+xuYmIBrL2mLirJjjAbigsHLE8HINeYzPBUh4nqlRagg/RylTsFnaFJvx7xq3Fb
         2K3A==
X-Gm-Message-State: AO0yUKXtpjitaQAVd4oHKM72cnHfZwjrAucpxEZMtHIvXRbJwn6rMxT+
	SHvWTE6F8Imdw4sbeIICXstiNg==
X-Google-Smtp-Source: AK7set+8chJEYzHKg+uduZ4y4OCNK6TUtWWaAIZZOVMlrI6GcnZITmCye0/0qIuUiQY19BZvAuI4wg==
X-Received: by 2002:a5d:6187:0:b0:2c8:b9cb:885e with SMTP id j7-20020a5d6187000000b002c8b9cb885emr7599221wru.24.1677509212571;
        Mon, 27 Feb 2023 06:46:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:94c3:7db:6fa6:5605? ([2a01:e0a:982:cbb0:94c3:7db:6fa6:5605])
        by smtp.gmail.com with ESMTPSA id n4-20020a7bcbc4000000b003dc3f3d77e3sm8873890wmi.7.2023.02.27.06.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 06:46:52 -0800 (PST)
Message-ID: <13cf3223-d3fb-1a3e-f13a-77db3b6d144c@linaro.org>
Date: Mon, 27 Feb 2023 15:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, arm@kernel.org, soc@kernel.org
Cc: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_064654_407207_8E4C7F82 
X-CRM114-Status: GOOD (  20.67  )
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

On 27/02/2023 15:28, Dmitry Rokosov wrote:
> Hello Neil!
> 
> On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:
> 
> [...]
> 
>> I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
>> of memory, but those processors are ARMv8 and the arm64 arch code
>> has been designed for those CPUs.
>>
>> So far I didn't find a single good reason to add 32bit support for
>> ARMv8 Amlogic based SoCs, if you have a solid reason please share.
> 
> I totally agree with you, but I suppose it's fully related to 'big'
> Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
> a cost-efficient dual-core SoC which is used for small, cheap solutions
> with cheap components. Every cent is important during BoM development.
> That's why usually ODMs install small ROM and RAM capacity, and each
> megabyte is important for RAM/ROM kernel and rootfs footprints.

Do you have figures ? is 32bit ARM kernel really lighter when ARM64 one is correctly configured ?

> Why am I talking about rootfs? For such small projects a good
> choice is buildroot rootfs assembling framework. Unfortunatelly,
> buildroot doesn't support 'compat' mode when kernel and userspace have
> a different bitness. 

well this is a buildroot problem... the kernel itself is perfectly capable
of running an AArch32 userspace.

> In the internal project, we save several
> percents of ROM/RAM free space using 32-bit configuration (mostly rootfs
> ROM space, to be honest). Therefore, for such 'little' cost-efficient
> SoCs we can make an exception and support 32-bit configuration, from my
> point of view.

32bit ARM is now "legacy", I would need to have an advice from the ARM SoC
maintainers, but AFAIK new ARMv8 SoCs should stay in arm64 arch.

Arnd ? Olof ? do you have an opinion on this ?

> 
> What do you think about that?

>>
>> And as Krzysztof stated, the support is incomplete and cannot work
>> without a dts file.
> 
> Agreed, we shouldn't merge dead code. But there are several question to
> discuss there. Please check my reply to Krzysztof message.
> 
> [...]
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
