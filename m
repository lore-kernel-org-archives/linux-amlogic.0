Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53264C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 13:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D5B206DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 13:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swEwuziB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HHvZJWsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D5B206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+XxlHsrW2odmV5PhDlbV+Ki2TqCHxH1+o3stx2PD3M=; b=swEwuziBtq6DAE
	UmdwiH9leK2T+6AI+326r6IjREwJtM4mWJjGXwDTAr3GzzzSNqzQdKRglb9mLiUD5Y5hDkZxDFD+y
	37Qm8IAKxdnmDUc7jIjLGyO3KM4jcxU3smxmtGGsBPEUwT2gQf/LCfmINJnDZa7J1esaBr+SKnj/d
	YrrHLlGXgSFLaAA+Ig+9UOOmi5XpCbP9aWpZ0lQZ+yYw5g/aoPAiam82fm8UcDl8PVMIj3ycvFEkS
	ko6QuVthT7LoqI5rfj2zDyMqNoRJ0sETcn8V2KVgkSzehb2t5npvuGNixLnFdSDeOHtqRS4SwKIMs
	wW3o/HjET1eyERKOS+9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h98IK-000629-47; Wed, 27 Mar 2019 13:08:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h98IG-000617-Hf
 for linux-amlogic@lists.infradead.org; Wed, 27 Mar 2019 13:08:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id y197so16743268wmd.0
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Mar 2019 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o9uJEjl7eHJ6UJweIfITCGVkOb/EtrHXodgXHlNELLY=;
 b=HHvZJWslhLFIo/A0/ILiF+o3wvu9fkUp4z3y1pdcDrhbDYED9J7Sto/TLrRYxxYU1m
 tppSqBuGU5DxCYX9xeFlFpYOJ6c21tr6dOxG5y+X1UQ6KxMzO7Pf4toEaKxTIb4F0/sS
 Tm4VyO+UbcYGHMvQIP7FFta5T2AP2su0+6j4fnPPN0SGNCNRohIjkj0f18AxIjcPmr+T
 ju1abw/6IYlH5fjql1rt+50p+DoOvlgjh2vFbJTerluVxdI7exS9j6jOXB4ZGISJ8Ma0
 ccaZv88N28PTvQO2WzLnVaSICfeZTyzqMA5IH8TaPmDoRw19eCuVbpWj8j7rWJ3X6bwn
 GJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=o9uJEjl7eHJ6UJweIfITCGVkOb/EtrHXodgXHlNELLY=;
 b=kzHf/fTja0bsmPHNAld/thj95CYPrSzylbgD6Hrhh7Q5BrKMSEKyn9Zh7yrWXzk97J
 IAxpyIdqNqcz2HFah7LB3edpuvd5q/JTIGE74zGDP+fu07B51zfu+vj4IqncJB0ZemGi
 Y+FI0P65U0x/LQbN6+EmEXpPeNI9rbbespBKc8lvHH3dhLvJ1mwnIwkOCrjsyk5tclby
 My1Ir5kJvqp/0TpJnhMQGAMR4rD8xqTcJTaUqxjf2nRoUvAgVOhFlkkptLpVAKtsXz+R
 KNZIExF/nPXYwQG0MpT0NPVSnRYJiVZ6/MNMtUUIBDR+ZsH3QTghgUGYx491bUcIQINa
 Jv1A==
X-Gm-Message-State: APjAAAWOPZWlyaezQw84b6+atMbImvMhoTuj5vHFQdPwgV5VS9VhcYEk
 gOGxI0MDLiclZZWdkLkJ9RTZiA==
X-Google-Smtp-Source: APXvYqxeIwjSDQFEIsTecczKoddoqLi23842Rf6mFsNCNeQJrNwtP1PnxxbPu7K/zVJqMQnFA7kXsw==
X-Received: by 2002:a1c:eb1a:: with SMTP id j26mr17623217wmh.43.1553692112371; 
 Wed, 27 Mar 2019 06:08:32 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b10sm31103826wrt.86.2019.03.27.06.08.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Mar 2019 06:08:31 -0700 (PDT)
Subject: Re: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
To: Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org,
 devicetree@vger.kernel.org
References: <20190325173501.22863-1-narmstrong@baylibre.com>
 <20190325173501.22863-2-narmstrong@baylibre.com>
 <518678c1-2e1d-ca27-55bd-0dd10965354f@xs4all.nl>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <74e84d99-dc7e-2779-fed0-e6a9e8324ba7@baylibre.com>
Date: Wed, 27 Mar 2019 14:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <518678c1-2e1d-ca27-55bd-0dd10965354f@xs4all.nl>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_060836_581577_1356DC20 
X-CRM114-Status: GOOD (  17.27  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 27/03/2019 13:39, Hans Verkuil wrote:
> On 3/25/19 6:34 PM, Neil Armstrong wrote:
>> The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
>> the other one is AO-CEC-A described by the current bindings.
>>
>> The registers interface is very close but the internal architecture
> 
> registers -> register
> 
>> is totally different.
>>
>> The other difference is the closk source, the AO-CEC-B takes the
> 
> closk -> clock
> 
>> "oscin", the Always-On Oscillator clock, as input and embeds a
>> dual-divider clock divider to provide the precise 32768Hz base
>> clock for CEC communication.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/media/meson-ao-cec.txt    | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
>> index 8671bdb08080..d6e2f9cf0aaf 100644
>> --- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
>> +++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
>> @@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
>>  to handle communication between HDMI connected devices over the CEC bus.
>>  
>>  Required properties:
>> -  - compatible : value should be following
>> -	"amlogic,meson-gx-ao-cec"
>> +  - compatible : value should be following depending on the SoC :
>> +  	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
>> +  	"amlogic,meson-gx-ao-cec"
>> +	For G12A (AO_CEC_B module) :
>> +	"amlogic,meson-g12a-ao-cec"
> 
> The driver uses "amlogic,meson-g12a-ao-cec-b", so there is a mismatch between
> the bindings and the driver.
> 
> Please repost since it is important that the two correspond.

Indeed, thanks for spotting this, I'll fix the typos and the compatible in v2

Neil

> 
> Thanks!
> 
> 	Hans
> 
>>  
>>    - reg : Physical base address of the IP registers and length of memory
>>  	  mapped region.
>>  
>>    - interrupts : AO-CEC interrupt number to the CPU.
>>    - clocks : from common clock binding: handle to AO-CEC clock.
>> -  - clock-names : from common clock binding: must contain "core",
>> -		  corresponding to entry in the clocks property.
>> +  - clock-names : from common clock binding, must contain :
>> +		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
>> +		- "core"
>> +		For G12A (AO_CEC_B module) :
>> +		- "oscin"
>> +		corresponding to entry in the clocks property.
>>    - hdmi-phandle: phandle to the HDMI controller
>>  
>>  Example:
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
