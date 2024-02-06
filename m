Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D0FC48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=di0gl77kZmFpW1h6x013n6N/Sn7UtPEuEL1VG6Yaypw=; b=tp8JMw76QWcm52
	KELLNFGWhhduPg9ZXrVIlkXKxWNWzIMcxS2M9lMQDAO1zICf720oVPcrqhuvu6QHAJ1dnKFgB1WvB
	K3cCLBLB5N9sbT1AE6yVQYVBbpwJDRDFd7TievCE4vBfUaoO9Vennu3LoP8Mf7/TQxp+Qeb4tQDtC
	tScqCUga8YI2F/Wl4kyHZocqaLuE18NoElEl1Qli/OAq4wCcyF9UuLi1Cm2UMHp4ebU6bnDUE/ThL
	ll5L8OVaCXS/ncatL3O9ynCXWw00sJhvY1oBCN/Lduo8xegKr/5xq70l1OZHvZQoRiO6I6Pvni3uB
	N8D5KpqOITY/moggWcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLbB-00000007jd7-0kkw;
	Tue, 06 Feb 2024 13:34:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLb8-00000007jch-2MjF
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:34:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33adec41b55so3530031f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707226489; x=1707831289; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xj8Na3UX0vIYIzI2QS37+tJp4cgUGyuAXDDb/PDvf4A=;
        b=dnNHlj0DimfW5T4N5L/8NmKr6DuhD9ICFqU0ZHV3C9JWXHGbvvYFCgVhbCjzNmOCZS
         HhDpPeI4ddSdAjezIiTQ0EKK0mf5GXTJTueJVgit8mB44YGAlCztAHsrWHC4jQ0VZQQr
         fQNQC4fTypTHbw5qrU4oSh7wiulzk30TSccMbfYK20DecdjRCW2R+S+FG8UFpf3iKt/O
         OdiS0Tzst/f8MkWQtj+p2bdvemB4h1PMRkTrTtc6ZtvC5mB/0m0TWBjNjohKz7gM4NQs
         QvZsOh03eH/4TGlUnn4kRuImXRHovUvtjGJrYSdsiYaHdHbu5FqV8QHujbdLbSzPt5tw
         C5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226489; x=1707831289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xj8Na3UX0vIYIzI2QS37+tJp4cgUGyuAXDDb/PDvf4A=;
        b=f1qFyvk6zkPmRw5gnGX7ZeEbRlzaiK5wI/huosbxwcvgAku73jZi4UtTZrMucQ1Djc
         OwnNrQeM3Gsjd4N/DJv4UioB7kRDNkEs7+MxaQJkqXFxOOfqVMLBScrUWfHU6ZR+ledC
         bcBKQHC+LmeWmLc/9xk+efVJQGHfooATTF2D9feJtvub7UWyeEgxW+9HpQAJPIuHy/b9
         /WgUN0G8QT9vBsloMlLUVy57qDLUJ83U0BwpuqGSBKV8VE2CWk11Za4L/g/FWYzW6CkD
         uee7a+yhGr5t5uqe5Sou8rjdoVr2a5ljkGcsWxKXTMLhZwAgfIOLjv1JdI+tUspy8/Zw
         yZNQ==
X-Gm-Message-State: AOJu0Yzu8lw2+QW7pYjop8dtareKnLFlRQlZtmKC9uy1YcN2ae8Ml5iS
	PIE/D2cBkRwXIvzciFqz7zz46RDqL6tIB8NUD5OJQDlfi70W33gAT2HgJLrIct4=
X-Google-Smtp-Source: AGHT+IGmJTiTbaUR6H8z7QVwR0APkZhUrbRzhaOw5JezvYFfZDFut3ned4txJYg4L6R/mZY0xIYc0Q==
X-Received: by 2002:a5d:69cf:0:b0:33b:14fa:53ea with SMTP id s15-20020a5d69cf000000b0033b14fa53eamr1395932wrw.33.1707226488772;
        Tue, 06 Feb 2024 05:34:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVtODUIcndE3eQN3Zt7ulNm+hdx9sKiAqyVU+cT/FZFM9u2c/XZv8LkJVUz8wQFCGKxw+I5zJJ7xslPcsBW9pmwH6ZzuCR6nihmnnCZ+SvEAR5mdH/13f9Yhy3mXct+XvT+E/s5gC0H69z5FX9FfbXtpH2PwxkNckICkvr/xA5RmSqFSrm3UJmem/zmEe0oABFUVcREmMiFxKW7qbhSyJPPV2FiT8HdnGFWUXJsELl4Zybdb2PYQpVHhBvp9fQ8uhYsoPmgR32poY8zx7bk1wjjeXRLN5obHnMEsExP5P7e9PQlAvDqbqcWekXSbwrU/Y0waNAh4sqVAvV4AW9++Whb+s7izt0LrZ3a/NBcX/3EBRZVFycxHHYKreJfkqbK
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id 2-20020a5d47a2000000b0033b3cf1ff09sm2139174wrb.29.2024.02.06.05.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:34:48 -0800 (PST)
Message-ID: <2ac2da29-f49a-4e72-bbd3-dccbe42c6865@linaro.org>
Date: Tue, 6 Feb 2024 14:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
 <b69a2132-25c0-4acd-808e-d134f5034e58@linaro.org>
 <64041a5d-a321-4ffe-ba31-bcf0cad63484@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <64041a5d-a321-4ffe-ba31-bcf0cad63484@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_053450_813488_C02FF12B 
X-CRM114-Status: GOOD (  13.02  )
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

On 06/02/2024 14:31, Marc Gonzalez wrote:
> On 06/02/2024 14:22, Krzysztof Kozlowski wrote:
> 
>> On 06/02/2024 14:12, Marc Gonzalez wrote:
>>
>>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>>
>>> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
>>> and the SEI510 board design.
>>>
>>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>>> ---
>>> Request For Comments to spot obvious mistakes before formal submission
>>> NB: on IRC, narmstrong mentioned:
>>>> adding dtbos for variants seems to be the new preferred way to handle such case
>>>> the fdtoverlay utility works well for this case
>>
>> Please run scripts/checkpatch.pl and fix reported warnings. Some
>> warnings can be ignored, but the code here looks like it needs a fix.
>> Feel free to get in touch if the warning is not clear.
> 
> Hello Krzysztof,
> 
> The only checkpatch warnings are:
> 
> WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> 
> This patch is modeled after another patch for a similar board.
> 
> Which warning did you think required attention?

The first one, obviously. The second should have never been made a
warning. :/

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
