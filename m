Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F9CC48260
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyoBpC1pzOm1izUGT/gYx9Hbx0zrqzReIlLTrLVbrKc=; b=bVOf5iwpob/Fv5
	ID3k0J6xwvLSjFzBnEpDpsaEMpEn4jFgjPz9Lr4CUob2krryV1z4wmpXytVO0AmH9xp3qgue6OPlW
	ft8FZYCkWTE9HkWLcv1y1KRUb9ztQIAkaL/jOQ4HbUrSZIdta2LytIe8z94bhKMweUaefe7A64sjL
	SheJLmEXL+o6foTBOkpJjltunKDxmkKnl6Gq4iidH5opyQtqk0hQ3TTNzCwPZSv/lCmRcVwG2L+3x
	YFXERI6mYM45qZwRwuSs8bFHA52TI0GikRAN2e+nltQ561xecxXguIT69en4Q1H1bfidBMo5Y3C6+
	sf8Phku6GZULmLcH/bJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzYR-00000009iHf-22a5;
	Mon, 19 Feb 2024 09:03:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzYO-00000009iFl-30VN
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 09:03:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4126a159fa6so964835e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 01:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708333391; x=1708938191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dphbX/WyDO4e7TPBlwr19thHMEzqUsosZRWFYKji1tE=;
        b=EMHrGOns0/KXNbT4r1te9k+Kt5SJKwSm8ztXWf1iIJok13zQh2FUDZYfVTw2WlriwD
         nSXpNB1wTRVjbfZXnIhEtCYtHSGIrIClxWLoHSCOiEx0/Fsf2JoAv+CwXJnqhfLt4g4L
         8aq5b5BlNOCCrit6BVNwaqxXA9+xMpCZOMZk98Ohk/MKxTo7W4I5J33VqNKiTQKCGrFx
         olLE4kB14P4YlA7WAuh5Ejz02d/Bsl0ZACUHK6Gc/c2qoa8CtpxfABBpt/P75NOXTFMt
         bgpz5TUAB6YSUIlDbder6C6h3GHvyKKqXMtkEYpf5Yx938d48w+QjxrgIiFSSSIfrjec
         r5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333391; x=1708938191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dphbX/WyDO4e7TPBlwr19thHMEzqUsosZRWFYKji1tE=;
        b=p9GcseraXCv3ozW1QBAu4pTSOBPkJhrWNNeR06/oyL4a5u3ODrczuCYNdli2hfWld6
         Mb1gouhmvKqqoonFk1vodU8Yzbz4Aj9cubRIAxxKn3/5dmRcGoy38WA8Gt7zR8X0mvYV
         2UXStef4uJelmFYLLueRtWr89JqQ73D1ZrHuEsapaIISmCd7YWArx50nGr0jpMZ+SWh9
         Raq7a8SpGJX81ptSZnmN9iiivgquxGzLSPGHndFRMtUASVdstPkkT753Spw+9aqb2HSu
         RmfZjpNw+Q6bGkhY7GeoLlNRG2PC1ds4n70nRax7Idlz6+FNs3uRdg6fGGUgaC3enGe5
         uNFg==
X-Gm-Message-State: AOJu0YwMrEWES9ADMuvY6vj/2Bne2MD7InJ3pZ3XWNRuY+JM/PQZmJYy
	XoV5dlVbwHX9P4cityKtL9pw3WCNqjiQ50zwp+ex9g4qRt9Zjb9BJb4f7OTx/ZY=
X-Google-Smtp-Source: AGHT+IEKS/bCl+ubeLbfsocn7QtR7AXxJWgqkUbrPSQsNSFLn7wYIf2ELzHw6UDodru2l2Lt9Del/g==
X-Received: by 2002:a5d:590e:0:b0:33d:3f2a:63a9 with SMTP id v14-20020a5d590e000000b0033d3f2a63a9mr2170608wrd.22.1708333390802;
        Mon, 19 Feb 2024 01:03:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id x4-20020adff644000000b0033b792ed609sm9744481wrp.91.2024.02.19.01.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 01:03:10 -0800 (PST)
Message-ID: <3788091c-0f22-45bd-bf61-1b26ac177e93@linaro.org>
Date: Mon, 19 Feb 2024 10:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Herring <robh@kernel.org>
Cc: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <5ac4741d-766d-4b6d-95ac-669474d05e6a@freebox.fr>
 <20240213135115.GA1090963-robh@kernel.org>
 <c7a88346-8221-4098-8112-a5e2c3eb5e98@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c7a88346-8221-4098-8112-a5e2c3eb5e98@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_010312_796135_AF968FFB 
X-CRM114-Status: GOOD (  14.82  )
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

On 13/02/2024 15:58, Marc Gonzalez wrote:
> On 13/02/2024 14:51, Rob Herring wrote:
> 
>> On Mon, Feb 12, 2024 at 06:53:01PM +0100, Marc Gonzalez wrote:
>>
>>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>
>>> Add support for two variants of the fbx8am board.
>>>
>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>>  arch/arm64/boot/dts/amlogic/Makefile                       |  7 +++++++
>>>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>>>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>>>  3 files changed, 67 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>>> index e9baa2cf02273..2fd7c7a18126f 100644
>>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>>> @@ -81,3 +81,10 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>>>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>>> +
>>> +# Overlays
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtbo
>>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtbo
>>> +
>>> +# Enable support for DT overlays
>>> +DTC_FLAGS_meson-g12a-fbx8am += -@
>>
>> Overlays need to be applied to something in the kernel at build time.
>> Applying is done the same way as composing object files for modules.
> 
> Hello Rob,
> 
> I don't quite understand your remark.
> I copied what other platforms do:
> 
> $ git grep DTC_FLAGS_ arch/arm64/boot/dts/

You copied only parts of the solutions...

> arch/arm64/boot/dts/amlogic/Makefile:DTC_FLAGS_meson-g12a-fbx8am += -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra210-p2371-2180 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra210-p3450-0000 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra186-p2771-0000 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra186-p3509-0000+p3636-0001 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra194-p2972-0000 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra194-p3509-0000+p3668-0000 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
> arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am625-beagleplay += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am625-sk += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am62-lp-sk += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am62a7-sk += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am642-tqma64xxl-mbax4xxl += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am6548-iot2050-advanced-m2 += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-j721e-common-proc-board += -@
> arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-j721s2-common-proc-board += -@
> 
> 
> Are you saying that is NOT the way it should be done?

Yeah, you miss DTB targets, so your overlay is not applied anywhere.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
