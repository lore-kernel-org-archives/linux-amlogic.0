Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683F7C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Dec 2021 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BqQafeR/Cm3ftSCa/gASoUtrTNKKGR+1BKDYgVbQ550=; b=AWLdYeGLvFauMGnmq9jvsPHfZz
	Ir0p14re6jnRxVJLGxE7X7wMuCdBuqVX0ha6ly7EIJWPkSByMg8+KZNYQkiUBErBCxuutPqXY/+N9
	3Y8XAadEH+BiFLpJjQWojar4456H3a/ozxJVa+gL8IIluILlixdB2QFMCWhVmiM8mzpfm7euuz8c/
	4Y9OawjOu31GWgbfvgWBxTtPDgQYDF2us266vedz/y3IHse9+1EpQleICRPbC+p1u3wZIP/Zt/Oav
	yt4rrSvVJ5UfhlsDs9Bb8YcjCcoKMLEs0NfKq/KPkvfk+pskuUXxLSKG/PEWLeJKpdVbGQi05TwAq
	E+ozwXYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJwN-00GBcx-P4; Thu, 09 Dec 2021 13:58:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJwB-00GBa1-EX
 for linux-amlogic@lists.infradead.org; Thu, 09 Dec 2021 13:58:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id u17so9872474wrt.3
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Dec 2021 05:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=irzv4Yj6Wo7BalHCoEamumf5BEF2FaBwNYArSGF/1dU=;
 b=wXjXxoruFqKMEKzF6THA77mts51jjQ3H5eXjP5a4IfMYWQ6MOCmf5gJy7aFyoyLTEi
 2xh/nlRDKYcn7hliU7S3L1SH6zV/+DrXKav1W7VzEl5h0xnNdFkGNDyvI5lDTM0FdhMo
 3hiL6WJEOedAslMdSQvPSlabUBKJYkAsDfFP9oyq+xL383JUSApk/y/lIKNv8c4t/d0l
 0EL4FtRHhHeMXR7qn72YGpjFLZ63hcPb+jzNx4LnrZA/ztZuJrXxfDglTdltNkUPbOu/
 pjO3h3iMobWdoySp8XWT2jVDK9x+sA7TzWdZONFckiWbFZ0yasMrCjUdWiL2CwGCN9B2
 ORjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=irzv4Yj6Wo7BalHCoEamumf5BEF2FaBwNYArSGF/1dU=;
 b=F6X8k7Vb3zgAUzuYm9g/ZBernymFzal9hLq738QhYGaatd/Sxa3etY/k6ne96y7O3x
 uS2D9xjwCok7jiQsCRUh/2rQDSGB8GshAxWQnIZZG3gm3YKx1Fh7IlS6hIM1AM7r1Sci
 bAiy0SdqhjhG6NcMgQXloQufUB+WEyQHpycwXdDRcWjGwZkcIa5MYCk9+9xBih6TnE8O
 66vZ2/Uh/zSOwVu9fOhQX3IeCIOW6fR2mbiiLfhKNqVdnszjiEnG2Mt9qLGze36nlvUZ
 GNQ5ANVpr2NWHnHAr6nhFtMZm7oa49WZ1jJFwkcsWedkE1IxXq6QsPtMhusoImtgOphk
 gM7g==
X-Gm-Message-State: AOAM532PyVJofqnmfCF9mwopWNplxkd6uR7+uYNphWPb8qQx+x/SfGMQ
 GYsfF5TTw6bQxcXpL+B+Hd7yKg==
X-Google-Smtp-Source: ABdhPJzp/kgnmsNWfTGb+BFTulG/DV8JfG2m4xfygJ3bRV4Q2IE3Lc7NOno7Jc8rpG1imfreCO1eiw==
X-Received: by 2002:adf:f80f:: with SMTP id s15mr6694260wrp.542.1639058296721; 
 Thu, 09 Dec 2021 05:58:16 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ee1f:92e9:bcbf:be87?
 ([2001:861:44c0:66c0:ee1f:92e9:bcbf:be87])
 by smtp.gmail.com with ESMTPSA id r11sm5895846wrw.5.2021.12.09.05.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 05:58:16 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
From: Neil Armstrong <narmstrong@baylibre.com>
To: "xianwei.zhao" <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20211208093347.4837-1-xianwei.zhao@amlogic.com>
 <bd981d0c-af5c-2b29-0ae3-df6bf01ea485@baylibre.com>
Organization: Baylibre
Message-ID: <357b657c-161e-9977-976f-387165aa4883@baylibre.com>
Date: Thu, 9 Dec 2021 14:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bd981d0c-af5c-2b29-0ae3-df6bf01ea485@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_055819_499532_734EB0C1 
X-CRM114-Status: GOOD (  12.61  )
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

On 09/12/2021 14:55, Neil Armstrong wrote:
> +cc linux-amlogic@lists.infradead.org linux-arm-kernel@lists.infradead.org
> 
> On 08/12/2021 10:33, xianwei.zhao wrote:
>> Add bindings for the new Amlogic S4 SoC family,
>> and the compatible for the Amlogic S4 Based AQ222 board.

What's the SoC commercial name ? s805x2 ? and the board model ? AQ222 and the family ? S4 ?

>>
>> S4 is an application processor designed for hybrid OTT/IP Set To
>> Box(STB) and high-end media box applications, with quad core Cortex-A35.
>>
>> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
>> ---
>>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> index 36081734f720..63037ebdd7bf 100644
>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>> @@ -183,6 +183,12 @@ properties:
>>                - amlogic,ad401
>>            - const: amlogic,a1
>>  
>> +      - description: Boards with the Amlogic Meson S4 AQ222 SoC

So it should be:
      - description: Boards with the Amlogic Meson S4 S805X2 SoC

>> +        items:
>> +          - enum:
>> +              - amlogic,aq222
>> +          - const: amlogic,s4
>> +
>>  additionalProperties: true
>>  
>>  ...
>>
>> base-commit: a3ebdcc8fb3d94de390e58ad3da6161826a58a87
>>
> 

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
