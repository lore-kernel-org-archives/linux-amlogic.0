Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F33BF8DFC9
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2026 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKuG+y3lvFfojPMeivl3iaLfVRyQyLQmLN183dq/x7E=; b=fvJ6zer3i8c7Ip1X9H6Ky5Semo
	qlQfb7rJ6l5tW5SkEE89avHh8rHJSjUIerKJKdX6nU4zTdRiG0P+/tX/ffNeSo/vPBTnqf3crElLr
	MjTKB50mJe6eCZLePkGgj2BXB0EEAqj5D7U85UQnwT28JwyBFqVeqGVz0NtJEdgVYeMV5997IzbeA
	JfyYTFbVBRhoF9XEXK4XHvyA3H6+I21T9Ipmwu5wYe1D8rVTmMLSIf66kkuAsENzPuz9pt4xynfIx
	TTmVXjzK2TeZR5vQF/rfMnk/GoemH31ESzktkxAjUulm49ap1Unq/GPKQeolK6ZnkFGaRF6Es2l7c
	13F0ltrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUd2-0000000370U-2seq;
	Thu, 16 Apr 2026 21:52:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDUcz-000000036zu-0A4L
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Apr 2026 21:52:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso184235e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2026 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776376318; x=1776981118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+LUylk1thqQpoxvCgNE7NdQ+r+A/V0aXCzRIjmwmKr0=;
        b=tdG/DGkH3IR9r3Nuq4Vb+gHYGZpgyRxzf7CinjOhbJ7TjXv+B+SlwPthvQsBv5Bi+t
         W9luS6Xn0CdYS8VSdO9fOSlOn+ZwIhvGHK+SrgJw66pN8fNNq7PC5XZsiZTZOZ6Ygebg
         4KyKe6591Sr+Hiz6aSWHBtUHE7fo398KpX8ox+9NmlzKbN6/59ij4ZnRhVNE48EEa3zy
         fpTM1pKXSyqvZfvDTcmWjGm3CYNsai4gscKmOW3vrbpk9oHkkCdUrxRYKAEytcUx52I9
         kzsXzMWrd99lg7g4/rRMRMFyF0UajW/QNMqU9rMD1qdVpcu2YV/Ho9zua5mU5/+HDyc3
         ZuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776376318; x=1776981118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LUylk1thqQpoxvCgNE7NdQ+r+A/V0aXCzRIjmwmKr0=;
        b=FoAWKL9giisvk0JK3jnCPtJwGJlVzIXlQfacvtXSAwYrvqUZOZKLc/EJ4bADy2xGHa
         LMrlkp9Z1NuHpNdmGg6URP/xo4gbtx92OC6+CPGmOiuVOMSVmEEvwf7txjgaXLDHCGSe
         oyW0ppZnuXeYCXWuag5sItMYGRA9Sb3uDygt0Tyj1PfJBfhMIkpWrqGtsZNguMB3QnLH
         TTC/FtgUx4faYXlL8i8vDkVDp4tmq724sMOaRQTWQfLe5oyigDC3i+KMCnUeLAF4p/MJ
         piqbn3+xgLttcqOZE/hJk++Y+F+BWes4WZCGlSXeFpg/IsdJ0zFj0gEQQF5iAlHcORQi
         KSUA==
X-Forwarded-Encrypted: i=1; AFNElJ/oYOOkLhuF7UjYzQzURp+G/aqGKhbOSkU6WBCKOXXJKvLjHo1wh/U8KPWbgsCvNWNIzJe0EsqW7N5Jrh1V@lists.infradead.org
X-Gm-Message-State: AOJu0YzWzOoONtyq71nJVHaGOdelSVgA6h4DXh4/cQyV9ib28d7lsfjO
	tIMQITZ1iEzTI8Aor4OOh/CmP8p+FgxYUGStQgaOt1R/BkFSCjMWrw4URp8w9Zswdbrl08vh9Pz
	9EZbzU9k=
X-Gm-Gg: AeBDiesUi+L9LLxerCjpDnu656X7CAXHweJBOD9rRIIJ+BEsGAjmT8OKyoyk4xMaBtF
	cRy3sRMxAH2Aisq6FNZIjqQnm/ttKogBBNg78He4b4e+8rqyz5MqccZgcKUYRx5K7sYQgbUZ57R
	Qx1qKTIPoT7+qAfiVAwqw4YrZKMfJrsmq4TO8h1W6zHJ++rYWrpHqNTI0UYnASJJLOPDMDdggAL
	wVqcgfkXFURTqGdovKx8ydY1MculcyiAjSZYfiEZDNz0vEdFnoSn5nsa3jOgZdpnEvj5vGR9Xfh
	7CPE6HszOiXn+fCO8iiEk45VZ5NZ+BnTjVPHjMR6zMzWsg2dd4ZypjxeBPX0nDdg7o52LKS93S2
	DUHLO6qLcYGcr910oOnsVoycvYDmZU/OlI/HbAZJeeCRMc6GyzoQaxnqdVJmYALbvyVCbiD4PTi
	HLwjD0cFqXJXHEGTK+qNg29bcn79n7f3dxbQN8
X-Received: by 2002:a05:6000:2282:b0:43f:dd94:3c30 with SMTP id ffacd0b85a97d-43fe3dc6156mr314719f8f.14.1776376318448;
        Thu, 16 Apr 2026 14:51:58 -0700 (PDT)
Received: from [192.168.3.100] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3564d8sm18390841f8f.10.2026.04.16.14.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:51:58 -0700 (PDT)
Message-ID: <71d2d8ab-21e2-4800-ad54-ba40ef2e136a@baylibre.com>
Date: Thu, 16 Apr 2026 23:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/11] ASoC: dt-bindings: amlogic: add schema for
 audin-formatter and audin-toddr
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-amlogic@lists.infradead.org
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
 <20260411-audin-rfc-v2-5-4c8a6ec5fcab@baylibre.com>
 <7d4ec08c-a67c-434c-a1cd-c3ef5b7e3336@kernel.org>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <7d4ec08c-a67c-434c-a1cd-c3ef5b7e3336@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_145201_371537_51D6B776 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

thanks for your review and the feedbacks.

>> +examples:
>> +  - |
>> +    audio-controller@a040 {
>> +      compatible = "amlogic,meson-gxbb-audin-decoder-i2s",
>> +                   "amlogic,meson-gx-audin-decoder-i2s";
>> +      #sound-dai-cells = <0>;
>> +      sound-name-prefix = "AUDIN I2S Decoder";
>> +      reg = <0xa040 0x4>;
> 
> One register-wide block? I have doubts this is a separate device

I understand that this might look as weird configuration, so please let 
me explain what's going on here.

In this SoC the audio part is split into 2 blocks: AIU for the audio 
output (already supported in the kernel) and AUDIN for the input (which 
is what I'm trying to add with this patch series). Unfortunately from 
the clock management point of view the two of them are not indipendent 
and interface clocks are in AIU register range. Moreover the two systems 
are not in a continguous memory range, so creating a single audio 
component that implements both is not feasible (unless we want to add 
some dirty tricks with multiple regmaps, etc).
This is where the AXG design comes into play: we use the backend DAI 
provided from AIU for both playback and capture and then we attach 
formatters (i.e. the audin-decoder-i2s we're discussing about) to 
properly format the data.
This explains why this is a relatively simple device with very few (1) 
register. To be noted that for example also similar component on the AXG 
platform (axg-tdmin.c) claims to have a larger register range, but in 
fact is almost entirely using the 1st register with only 2 occurences 
for the 2nd and 3rd. IMHO this is not that different from what I'm 
trying to achieve in this series for the GX platform.
Also looking at the implementation of "audin-decoder-i2s.c", even though 
it uses a single register, it really provides functionalities i.e. it's 
not a useless device and it can also be expanded in the future to 
support 24-bit sample format.

Then the question might be: why not merging this together with 
audin-fifo? Becuase these are 3 indipendent instances from the interface 
and each of which can receive data from the interface. Each of them has 
its own registers range (and optionally also an interrupt - which is not 
implemented due the documented limitations in the driver) so the most 
natural solution here is to implement them as 3 different devices. Of 
course then none of these should own the data formatter exclusively.

I apologize for the lengthy reply, but I tried to provide you a the full 
picture to answer your question.

Best regards,

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
