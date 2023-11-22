Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C829C61D99
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVan6Ry0EXnZNOVuTonegd4eTYDdx5xQXebRyp0HFLc=; b=ywLxjmEK1jcaVa
	TDIIvBWUJvRPQZszdQ/YgfL3dH7E84nvEK2yVeEiK0Yo4V5QSHTFIwpk6O3OHtH8n5yD8+YZ3kT8W
	R1NMlEpQVew/LsH0oL1a0zCj/2jiDhry5eVJdhWQY7YFaQ5GSckbVNGG3Su8+FBBRfpCVzaQQlT+x
	B6jAsoXnT4jdtKQirbGkaoB6kwIZ3ANzj+iCp9mt7bRfMVLG/q9DLqOJCRv4hYdMN0tQ1cunZweTS
	O3FtsdVOvn4XQONfQQSAJ1i3+SuXCHdyPgaE6PTuvQYn6jdbDSKR3RCRcY+eYUjvhVjkQg7BVzSCW
	NEnNXv/SJqyPvD/mr5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5oo1-002CEp-1D;
	Wed, 22 Nov 2023 15:06:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ony-002CAL-2C
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Nov 2023 15:06:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-332d2b6a84cso510964f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Nov 2023 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700665573; x=1701270373; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=qkwTVD62ajzdf7dlWnCdytqfMcFWREUSAZ60OZZcydw=;
        b=EY6D+HCnM3daMoO/AA4nNbI6CG7/l1VkM249MBdcFYwvUeGjG9x0fuc21TzITHmpdn
         X3N0a6FfYUayQgSqgwDXjPX1c/1DrJXE+LYdf5xR4vSZa5iq76F5aOKr+8nERTVRZPFT
         Lwr22nxYMuforU8X0hPOFAhpiBhXRAHFzfTCk2wCrjrzI6VBIP1wZ+eJB/TlnNJA+sp4
         zlKlkLFVm+OGjnIScdWnxxooL1ljZeBKj1L/5lAHlDyj27XBGecJCxd5u80mJWFCAd+o
         j5TpbkzkmeMkDkMKndKzgkiP137Z2kwTbVegVHzDApVtTU7aJASWYgc0fqv3shfOCxDo
         UC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700665573; x=1701270373;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkwTVD62ajzdf7dlWnCdytqfMcFWREUSAZ60OZZcydw=;
        b=hb6AC3Lj9EOoUEf/YWF5DmNHOKsFRVRJddPdLWMMS4+6bpai3M2wi44UJGSKBc9ej6
         H36YxkNLuedeWEs2SJw0ewtfeTyNdY8xV/XNM2J9Fb7qWUtvXF66AsVmSdTo7ZWyYE9J
         8xfAX/O0JHzV9sedFtplX712DhZT7exYjKw5ig9HxfHxEgXJeFae75yzDPB0BcmFw4kz
         sMNKSTgLhGdbBlI97IR1uF8xr3XXNkSLgH0qglFHCH401ocEBQnR7t6Rzoc4dG/4P+Hl
         s1PtW6vwR9IoDxVlUCO1fE+tbZxfBbHuQahJsCyFiErHdDdxe+Bub2c93JSW5OnG0alm
         5NtA==
X-Gm-Message-State: AOJu0Yy8CFxkZ+TgzBFt6yvOmkJcF6+eiYUih3a64QQVj5ROI1a69Vbu
	61biWHIOtt7XjQ6ucJiSrM8ukQ==
X-Google-Smtp-Source: AGHT+IH/8OTT5ueCIR2HxhS3WkKn80oKnhghSf0EXTQrMwFPELramnW4TqYdKKPh+xMmzND5JVWEQw==
X-Received: by 2002:adf:cc82:0:b0:331:6976:c8c7 with SMTP id p2-20020adfcc82000000b003316976c8c7mr1778855wrj.38.1700665573282;
        Wed, 22 Nov 2023 07:06:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d0a1:9a3c:4f4b:fa20])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d4f8c000000b0032da87e32e2sm17459759wru.4.2023.11.22.07.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:06:12 -0800 (PST)
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
 <20231117125919.1696980-6-jbrunet@baylibre.com>
 <f04d8ad1-4411-4334-8d22-0aa757bf227c@linaro.org>
User-agent: mu4e 1.10.7; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Thierry Reding
 <thierry.reding@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v2 5/6] arm: dts: amlogic: migrate pwms to new meson8 v2
 binding
Date: Wed, 22 Nov 2023 15:52:56 +0100
In-reply-to: <f04d8ad1-4411-4334-8d22-0aa757bf227c@linaro.org>
Message-ID: <1jsf4xeskb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_070618_720121_FCDCBB07 
X-CRM114-Status: GOOD (  14.25  )
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


On Wed 22 Nov 2023 at 09:39, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 17/11/2023 13:59, Jerome Brunet wrote:
>> Update Amlogic based SoC PWMs to meson8-pwm-v2 compatible
>
> Why? Your commit msg must explain this. You break users of this DTS on
> older kernels and also this makes it impossible to apply via different
> branches in the same cycle. All this needs explanation and proper
> justification. Your message tells here nothing, because "what" is quite
> obvious.
>

I provided all the explanation possible through the different commits of
this series. I can re-state here if it helps

>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  arch/arm/boot/dts/amlogic/meson.dtsi           |  4 ++--
>>  arch/arm/boot/dts/amlogic/meson8.dtsi          | 16 +++++++++++++---
>>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts    |  2 --
>>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts      |  2 --
>>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
>>  arch/arm/boot/dts/amlogic/meson8b.dtsi         | 16 +++++++++++++---
>>  6 files changed, 28 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
>> index 8e3860d5d916..80cc004ad5fe 100644
>> --- a/arch/arm/boot/dts/amlogic/meson.dtsi
>> +++ b/arch/arm/boot/dts/amlogic/meson.dtsi
>> @@ -83,14 +83,14 @@ i2c_A: i2c@8500 {
>>  			};
>>  
>>  			pwm_ab: pwm@8550 {
>> -				compatible = "amlogic,meson-pwm";
>> +				compatible = "amlogic,meson8-pwm-v2";
>
> That's breaking users of this DTS (old kernel, out of tree, other
> projects) for no real reasons without explanation.

"amlogic,meson-pwm" will continue to match, meaning of bindings is unchanged

How do you propose to fix badly designed bindings then ?

if we cant even introduce a new compatible to fix things up. It is supposed to
stay and broken till the end of time ?

>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
