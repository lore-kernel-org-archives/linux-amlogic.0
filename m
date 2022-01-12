Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7801DC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kfzduffrOOdb8fbaf8DjN+7Cw/Tq9+ZM3B6q8RebzLU=; b=jwBQ0lTMU+tT9JcNOr0XHmk7e9
	ds/CJG1fc2/zJ13+vudXDHClOMGOQo0uaqKQ7HeEkagY4F0Z5NcTetlpLoeD+v0EsWCb7TrCl/u3X
	a4n2FpTFSL5YR6uwLX4SUI06EAJ480iG5xObbKmr2TNwr0EVPfqBNVGqF172/jMHXMxK+YEgD5/LR
	PuZcrFDEnCGmkkDuNh5To7zvSDcsxRa4XU1r9lzR+wwMhQOGKdRc0Ir7M5WJeUZtvr4Bk7bj5b4uB
	3AetmDMR9G1qSOumybRz4Ed5Y/xVWzA02qtJKT6WkhcbYzikvvI3M7AiENs0TFi/j1xKWDdotrRnx
	IYNynlzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ehe-002iY0-Qy; Wed, 12 Jan 2022 14:34:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ehR-002iWL-Sx
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 14:34:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id o3so4572175wrh.10
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Oses1sdZzE6O13eZIF71UBM7yla+9G9HCF+w1MELCw=;
 b=rHveY+eHYf20gxvUtQ3ZbD3CRtY15j0Co6y8Vy+0c82fL/vy8jcgRA5hII1ND4X+Uz
 1rnGQcnsq1z34PHma2EBXnaZNCWT5dbKKlltxjXGYSHPyC8zFzACLNcLLNI3xe0G4fOE
 JJm/Zi/+ftK2F2IxiUMFQz4MTSsWaqQiWx/hi4yg3qkZHZkcgrWZRTgE7iXnARR6o9my
 riLlOyHfFt8W1PPI3FdgTOEA23dUp4BYXMuwQ8gafuHMH+OndD8f6AlXR7luEfJnlvWJ
 IPS25MvXra3T3v9iKn8WHiuAyphnAolV4TkxLsf3P7Mkfapp/HjE3iihSlWrI+wwQarL
 bZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4Oses1sdZzE6O13eZIF71UBM7yla+9G9HCF+w1MELCw=;
 b=vTb2MqHADSQ9DpKQAqr96VxB5hBiuxKz+xsheCPDFDyOzUl0zd2rRVU/PazkFoWP9n
 OMbxbX84RnYxNYgNUNBSmQKlsnmYe0GezGarV2DrcfDdtX2Q8pkXYFtBn6FTSNNthhcY
 CODjRs5IHIfYErt8JB5eq1yT5g3i/iebFdC45kkcP+pdDjFIa3N+/4cQjG7uphBV6Jfl
 NMVGJFA/5WiXC/ciGxw8/J2RBz8T5YMkTSRXZFVyhoe9rhbNiNPw6BVsIhad2CDDegtw
 MW+P8hw/rKt/QObaumsx7pw7tKxfb7QUktRtwp+5Ik7tvqQzs53uX/mXIl33KK7+mWIr
 jkLg==
X-Gm-Message-State: AOAM532F12GGHYp+V/tsZp4tSG7YknVnHZJmNbKJzDo1DPxQBcr231nI
 xvnNImDUf2jmszWdwtW5yPKDrA==
X-Google-Smtp-Source: ABdhPJxWIVwvziu7Ekc2HxcKrwLQqn3VV31vWE/7hhVte4oUM7OMRJThUxWG2nlEq9FxgOs0h4P0Kw==
X-Received: by 2002:a5d:584f:: with SMTP id i15mr12405wrf.361.1641998043787;
 Wed, 12 Jan 2022 06:34:03 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id g12sm68038wrd.71.2022.01.12.06.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 06:34:03 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12-common: add uart_ao_b pins
 muxing
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220103154616.308376-4-gary.bisson@boundarydevices.com>
 <fe58c139-f127-d102-a6a6-b8c2151aac20@baylibre.com> <Yd7RG80hhjZilGs7@p1g2>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <10696e08-80ca-7dcf-9766-60d0a2475c6e@baylibre.com>
Date: Wed, 12 Jan 2022 15:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yd7RG80hhjZilGs7@p1g2>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_063406_020107_23807A8C 
X-CRM114-Status: GOOD (  20.93  )
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

On 12/01/2022 14:01, Gary Bisson wrote:
> Hi,
> 
> On Wed, Jan 12, 2022 at 09:33:42AM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 03/01/2022 16:46, Gary Bisson wrote:
>>> - RX/TX signals can be mapped on 2 different pairs of pins so supporting
>>>   both options
>>> - RTS/CTS signals however only have 1 option available
>>>
>>> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>>> ---
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Cc: Jerome Brunet <jbrunet@baylibre.com>
>>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 27 +++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>>> index af1357c48bee..3a7773ffbd08 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>>> @@ -1952,6 +1952,33 @@ mux {
>>>  						};
>>>  					};
>>>  
>>> +					uart_ao_b_1_pins: uart-ao-b-1 {
>>> +						mux {
>>> +							groups = "uart_ao_b_tx_2",
>>> +								 "uart_ao_b_rx_3";
>>> +							function = "uart_ao_b";
>>> +							bias-disable;
>>> +						};
>>> +					};
>>> +
>>> +					uart_ao_b_2_pins: uart-ao-b-2 {
>>> +						mux {
>>> +							groups = "uart_ao_b_tx_8",
>>> +								 "uart_ao_b_rx_9";
>>> +							function = "uart_ao_b";
>>> +							bias-disable;
>>> +						};
>>> +					};
>>
>> I'm not fan of these nodes namings.
>>
>> Perhaps :
>> - uart-ao-b-2-3
>> - uart-ao-b-8-9
>>
>> so the actual pins numbers used are more clear ?
> 
> Sure, I wasn't convinced by that naming either. I although thought
> about:
> - uart-ao-b
> - uart-ao-b-alt

Not sure about these because it means one is the default and the second
is an alternate one, and I'm not sure about that. If it's the case, then
this naming is ok.

> 
> Let me know which one you prefer and I'll respin the patch.
> Also let me know if I should re-send the entire series or just this
> patch.

I'm lazy, so the entire patchset please :-)

Thanks,
Neil

> 
> Regards,
> Gary
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
