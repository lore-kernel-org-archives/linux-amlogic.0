Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF13C001DC
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=op6wahxCOR5c3Wn08Dbl60eKHqsDVyLseaegImGeRDQ=; b=0KATohEVt0lIZ0/ecwvprqpqHF
	BkMP/Rav2q1ME6NJFu/VZPjTSH1M8oqa7kEUvSxW9jmoWyEMpobzuFhq3GEe/uhhk/pxVdozvbxPB
	3PCDwoTfkPECzpPQnnHa7h/MZGtkc4z4FeK1oCkC5wbde1657jXx/tj9Gkz3LE6H0qbSbxbuAkVye
	F13H/OnAxODCRind1onYOFlqrcq4vM9J2a5agl+wj+eHjz/PxVLxiMleNrmLrp+lFK8EN8lifs6XV
	3DlhzNULKliW72bldZ7rBVD9qaZ8e3ZkeI/upxh2C/f5z7MhTWOqgheJOYNf2E/w20yQasCvy4s0H
	4mIFUODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP5k-00ElSY-2E;
	Mon, 31 Jul 2023 09:21:28 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP5c-00ElPz-2t
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:21:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3110ab7110aso4491127f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690795279; x=1691400079;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xDLdel2Rhe994E8t59q5EvpZyXbsA6v8U1EBH//Jf5c=;
        b=pbT4tIkmhIxq47nniPh5aZTwDD69epwzhf1XUckiDQowVbTuSfSbBvW3qLnjjy1ROK
         gvsZCwxfXdvZ3jxZHoDJLPsDFvwG3jQ1DURoM7dKwASIrHQHoFCV4SjMwON7qL55B8U5
         xfAivgd0q/LxIhbZCycHq2xJvA14z3QOSdNeupHn0zfD+ch1ECbfKIwdHa9bBSuXJ1ba
         tt4sIpusTR4wk6dq84Awp+x/wIzKIScO+fDEBi7YMXHDFgQKlHBXGVYBYqIQKtL7t5ij
         jxFBpYd8UZAhtAGDtsxfbBGIXSeomf0UzY+zWDckX+kkE3jtjW2k6j0URGTu0BGu1REX
         Byvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795279; x=1691400079;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDLdel2Rhe994E8t59q5EvpZyXbsA6v8U1EBH//Jf5c=;
        b=UzL6LtF3wtWKZZLl/qRIlK7gDhouHi6yMc4z2bW2yyphhlQoE8ql1xJsOCjwXB7YGW
         hJT6F7VM8f4GONNNbKygJwtkT4l8clfWFvbE5AwKl+RyPX6jhvnaB5nfoKdAl389KqgJ
         hCbggcKeeylLFkJP4G4M1F/aOAc9UhP4M8r5cjvRLxfvLCxIW/4jhguKnFQyYOr7qZcf
         xAtublGucwibw/m6zzweXgh34YEwd074sExrxO8PNxODoJnWT6RhRwXaHTm9K4Aci1dU
         gZgUt6+KvmZBBMppx+JxUJ4TRs/mdq+FjAlFQHr7AxxAAm4ESo3NNXWk191gH1Yy2EgR
         gyHg==
X-Gm-Message-State: ABy/qLacPjl2y6Z7WZKZ5w1nlGwtPHEe2s1Wgpd6S03Fg77ZH0umMFLh
	swQkG4nQI/yII88aGVvU2l4JvrOSksQn3U/gtmFBbMHv
X-Google-Smtp-Source: APBJJlHsHDdvsIJ2bUTb4wdaCXnh4rHnl50RqfKbzz7Urb20yM0+LICum4NymicbKaVsEd8soQLuyQ==
X-Received: by 2002:adf:dcc8:0:b0:30e:3caa:971b with SMTP id x8-20020adfdcc8000000b0030e3caa971bmr7529797wrm.51.1690795279502;
        Mon, 31 Jul 2023 02:21:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id g18-20020a5d6992000000b0031134bcdacdsm12437930wru.42.2023.07.31.02.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 02:21:19 -0700 (PDT)
Message-ID: <a867c31c-df94-5c6c-211c-e35138333922@linaro.org>
Date: Mon, 31 Jul 2023 11:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: drop redundant
 status=okay
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230731090442.100856-1-krzysztof.kozlowski@linaro.org>
 <273bd185-4aa5-510f-0f1d-1a4cab2d4a2d@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <273bd185-4aa5-510f-0f1d-1a4cab2d4a2d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_022120_942759_DA03BBC2 
X-CRM114-Status: GOOD (  11.28  )
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

On 31/07/2023 11:19, Krzysztof Kozlowski wrote:
> On 31/07/2023 11:04, Krzysztof Kozlowski wrote:
>> status=okay is by default.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
> 
> I found few more...

You're faster than me, I planned to get rid of them this week!

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
