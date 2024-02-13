Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE59C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glq5hbKvkyBC9TacAIl9xJIpohfuvENThNyyzf+hwxQ=; b=HYPNaAKU+Nq6Ac
	ZlEI1LkOCtnX/BHEF+4Awf+TGC4zZ85AEWYpUe+9mIBxRjIBL4iSkUk7E3bHm9D8Y1TOJwrcXZ1R+
	M0fnBQK1zeO99fp6qS2T54uho9EwQ4kcQooBCYXNeVq5fwVk1yRalpQx34bODuU9Npg/3CaH+BE84
	A/SKFa++Drvh38w0ITEcJP+SKF85EfWFhVukxOjM6sADzwt6XiKyzeiWkPyWJu/4ZyWVrTwJ+2yXF
	At63KDpsTZaXe4TKB5qqOspCJdOLT/L2KkxIVEEOTHadup/VGNmO9se3UKZVSkRR62T0C9bNDwozs
	m/CWnooQoITsveAsi/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZthX-00000009UqW-10HQ;
	Tue, 13 Feb 2024 14:23:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZthI-00000009Uml-17Wt
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:23:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-411c93e6bfaso3491415e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707834222; x=1708439022; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnXhTRguW0xSNMCPfA6GHBCpy42I8rpo6smtBUVp2zQ=;
        b=xrPAyeBiyIk99Gi5dMFPngiIOdO/wIMEz2mKr81s9YerVNvq/r0oTpdOKU3/YKq8er
         ASicg6AsdTKT51Q55Cq0jzbzrNzyir6NTrc2QO/hZHAd2VDM3JQd1DcO+2ovbMwIO6KW
         dyzqqvomq0b31HpFfzrCMU9WDQxAywPh1wDF8da1TbE7hkWEr3ljKG5CSHi6+rqkM4SA
         /1fTA15cYk8i/FTabW9ZmaT+b+Mc683zl2TMMc2gs+HgcEV8ViTqPECce7Ih7j++VxKS
         kF5mn2+o9kib15yjUWyfFWEPVJ+iwJY1GwyY9klrJLlkaew3Vyve3AEZGosGzK8aDNv1
         Z9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834222; x=1708439022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnXhTRguW0xSNMCPfA6GHBCpy42I8rpo6smtBUVp2zQ=;
        b=mvqT4TiPuxKzReEWdJEWQ/l+zWiHQoIPHEFYFj5FMqhC01wjp3si8ZzpUaJaRSa/Ad
         B73a6ULxGT7zX2+HLbYdVA2na/R/c7hI0c4mKUBsanHszzJsU0fz4vPHAXMy7TujtBoe
         NG9C36W/2wF6o2gNFt0YtPyiHmNlDRLBrcMGkFHqlxtlNqZilHC+ADgGHdYIhdffeJSY
         SAkhr8FMIGEtvPz83Ulm+deoS3VSWUM7ogx7jLXm+Vc5oAqlmLF4+loiW4HFUqKXWaB+
         6hWLumzfWpVh3vEWQ+dryeMBuxuCUJb+Om7fuv7sTfyQhh51jVwGn1QVcRDXDaM9NzLv
         DiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj0dBUiGc5QkKkwjbYVVcUSDj5d2ztYQ5ztcZ2KC58OdBTCQTxpXr7d6Urk5RdmhE6iofI2Ye+wzyNgfBwMrOCsjAqJ7QukOa5pPdidPcLjp0=
X-Gm-Message-State: AOJu0Yx/SzWcuXqseN+JzsAx+WZPl6jOtYp6wy5/zhi/2JAkwjvRl+u7
	rAYo1uqtui5EfKjlc0Hs2b+MUzwuivoR9q9zFNU2fwUd4s0iqpfy84w4vU2Q0Ok=
X-Google-Smtp-Source: AGHT+IGFslU5KlnrtZu/fqJXPDWeMTECYGF+yTuj85YQbGTVhSvMJUrXD+70cMLMKulhwZNFAeaMrw==
X-Received: by 2002:a05:600c:3542:b0:40e:c2b8:ad3c with SMTP id i2-20020a05600c354200b0040ec2b8ad3cmr7722652wmq.32.1707834222338;
        Tue, 13 Feb 2024 06:23:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDGBPZFgCUjaKAy9RwOzSWbzNrd7r5slXvUZsSNmGugRcR2/FSYEpuXAAD1RIcYbaYqzWXN2T2MTJiI+luyGALSFycOz/Dx+ZJDQJANvvHwTrwX/jf7bR8DZDP9IIIj3WoFKXs6bJy3scXC5No8SdjIX9s5E72jYfb2dIF0IcDoCQiRCSGQnIRurl48+bJimdmQgZ2hPGDTZ5H0duckYLjxFvbuIouC0AxaEyNT9A/3ZJqggcq55uAIU3lC7Z89CHz8TOa+QXqlcavJ9XnQOHa6EmrP+VVBKUlF0o2cFb1YKJY0eIth5/iLTVbrhGuyfUoEKhMLLcqi+798aCdYHhwEB+Knh8COIUFo7y0in+31OKD9HGJz4zZ7Hr64xyl
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id v1-20020a05600c214100b00410395dc7d1sm11809391wml.7.2024.02.13.06.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:23:42 -0800 (PST)
Message-ID: <ea2d11e2-3d6f-4dac-aa96-b18b174af00c@linaro.org>
Date: Tue, 13 Feb 2024 15:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: add fbx8am board
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <7ff2d053-7645-4016-99b1-646242463547@freebox.fr>
 <76638bd7-f290-4729-8d15-98e1bccfbb40@linaro.org>
 <b6a02f8b-8782-48bd-8916-36bbd996d4c3@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b6a02f8b-8782-48bd-8916-36bbd996d4c3@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_062345_230844_7DF8F558 
X-CRM114-Status: GOOD (  10.13  )
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

On 13/02/2024 11:49, Marc Gonzalez wrote:
> On 13/02/2024 09:42, Krzysztof Kozlowski wrote:
> 
>> On 12/02/2024 18:51, Marc Gonzalez wrote:
>>
>>> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
>>> and the SEI510 board design.
>>
>> ...
>>
>>> +	ao_5v: regulator-ao_5v {
>>
>> No underscores in node names.
>>
>> Didn't you get such comment before?
> 
> For the record, this submission is, mostly, a copy of meson-g12a-sei510.dts
> 
> Thus, I did not consider diverging from meson-g12a-sei510.dts
> 
> $ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | wc -l

I'll fix meson stuff.

> 6
> 
> $ git grep -i ' [_a-z0-9-]*_[_a-z0-9-]* {' arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      ao_5v: regulator-ao_5v {
> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      dc_in: regulator-dc_in {
> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      emmc_1v8: regulator-emmc_1v8 {
> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      vddao_3v3: regulator-vddao_3v3 {
> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      vddao_3v3_t: regultor-vddao_3v3_t {
> arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts:      vddio_ao1v8: regulator-vddio_ao1v8 {
> 
> 
> IIUC, you're saying it is preferable to fix the node names in new trees,
> even if it means diverging? (Using dashes instead of underscores?)


IMHO, yes.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
