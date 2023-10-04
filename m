Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F1E7B5E1
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNqnDfbuKXYuXlQ/nJS8jgObe2R8Ly+bTN32U/+wSXI=; b=dO+Y00rBpXdZRj
	jumNTm8ydqv3ixu46btDcDAbAdQEiPO7AxQk42CCJkizcH2SwkQv15pYwz7LCfX0d2xujSqqMpLMq
	XMp7XDPDOEjWO7dP0CX6dHgv+YSNh3xlU/CghMt+M6TlssTmIAOLzpUpda86+BoecvlzQ0oRfVt1a
	qzpg9byJf7NC8RalvzXh9yU3vtjyf4WpugcBgWKZsNvmWE324xkxPcXJM93JF9l8dvKAGvK6rl/CG
	XUaHSJei5HyKuYkD83QEWjNuiDQ/wgEWAZ0XML4XDsKKEtSYWhfib1IIMsJXnkVEEFZSzXb3ry6K0
	4iT7MHSjg4wWFk/knbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyeh-00H9pn-1Y;
	Wed, 04 Oct 2023 09:58:59 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyed-00H9p1-21
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Oct 2023 09:58:58 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50336768615so2269437e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Oct 2023 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696413534; x=1697018334; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=2zQurfJPbiuUjWnuhOpNrLMV2pgMXd/ebBa042cwmYc=;
        b=q7SFSd5rvSJu+eOdh1uXwB9Yjo8v8HAOPusiyQ6rXNuihStTHK9j/Kfh+1mSZTrkME
         ruKK4QZ/UqJwCdn/mWNgYcuGoUEc+vYHl0g9mYDYpPe8F1TDDgLiwDXtzLf3GxTId5y9
         UkppmXjIScj2far1rJGqOi51sKC+iV8u3+ukBQSQUuQ5L+p+Uoh21A9/zktDS2aQL9Br
         GpZwcphoqa/HQsNcRbecALf6mmCLfFVL+tcHLWJZPd+fssHisnsPhvvbr4L9HwE+yP0R
         6iMzJdjrAAS2/lP49OshCc/7bwMBqGCZ7LApu1BgAXDbw06l9B0eBaP8XRR4Y3WxfgmH
         bCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696413534; x=1697018334;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zQurfJPbiuUjWnuhOpNrLMV2pgMXd/ebBa042cwmYc=;
        b=ZJTROMj2Xb0lhf5BSjVXi08g3Rt7jtnd9VHR3GSKCIUa/dNA9fSdOErwQGKCVEI/MV
         qIFCn55YgegJDZiW8HSR5TkLe/Dc2sjCmouQCZcZg/8iV/blgcARjLyKyNRtTjt6VN/9
         Mfp9zC4QrhGJzKlhMMz6YRuelben12+PU/BR2uAjKtMUAlfDnetaVsOrvaiqxrPKtbBD
         ipFtLqzgoLG/QEUJkRfronQRZbn58lHpAp+61mVkyKxMzrHMS++fHuR0Al91gkYV9FUY
         Xw1lYJcinwMsROD3cuiDUWVsy7jYP4RVXBrWKU00htp7J3LmCkLXXetOzOi+PvGhl/Zt
         yqXQ==
X-Gm-Message-State: AOJu0YwA0NaHnmESK9Brh4ml+SSNg1PNrLq4zjYlA9UjAWeIbTv1Z+sQ
	pXuyeK+9AkKFoe7OXE92wZQ4IQ==
X-Google-Smtp-Source: AGHT+IEVyhw3oWGM3Jb/CM0G2T6xFOUfrj2mUvQvjyxBjBNYvCMW2izu2JSFSPd2ut8kSsupybhWPg==
X-Received: by 2002:a05:6512:1052:b0:503:fee:5849 with SMTP id c18-20020a056512105200b005030fee5849mr1827173lfb.53.1696413533806;
        Wed, 04 Oct 2023 02:58:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d9fc:647c:aca8:fc21])
        by smtp.gmail.com with ESMTPSA id x2-20020a1c7c02000000b003fe23b10fdfsm1086938wmc.36.2023.10.04.02.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 02:58:53 -0700 (PDT)
References: <20231002141020.2403652-1-jbrunet@baylibre.com>
 <20231002141020.2403652-3-jbrunet@baylibre.com>
 <2248b34e-d755-4142-986c-0ead80796e13@linaro.org>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add libretech cottonwood support
Date: Wed, 04 Oct 2023 11:49:00 +0200
In-reply-to: <2248b34e-d755-4142-986c-0ead80796e13@linaro.org>
Message-ID: <1jleciyahv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_025855_862379_1F59A4C1 
X-CRM114-Status: GOOD (  17.61  )
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


On Wed 04 Oct 2023 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 02/10/2023 16:10, Jerome Brunet wrote:
>> Add support for the Libretech cottonwood board family.
>> These 2 boards are based on the same PCB, with an RPi B form factor.
>> The "Alta" board uses an a311d while the "Solitude" variant uses an
>> s905d3.
>> Co-developed-by: Da Xue <da.xue@libretech.co>
>> Signed-off-by: Da Xue <da.xue@libretech.co>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/Makefile          |   2 +
>>   .../amlogic/meson-g12b-a311d-libretech-cc.dts | 133 ++++
>>   .../amlogic/meson-libretech-cottonwood.dtsi   | 610 ++++++++++++++++++
>>   .../amlogic/meson-sm1-s905d3-libretech-cc.dts |  89 +++
>>   4 files changed, 834 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-s905d3-libretech-cc.dts
>> 
>
> <snip>
>
>> +
>> +	leds-pwm {
>> +		compatible = "pwm-leds";
>> +
>> +		led-green {
>> +			color = <LED_COLOR_ID_GREEN>;
>> +			function = LED_FUNCTION_STATUS;
>> +			linux,default-trigger = "default-on";
>> +			panic-indicator;
>> +			max-brightness = <255>;
>> +			pwms = <&pwm_cd 1 1250 0>;
>> +			active-low;
>> +		};
>> +
>> +		led-blue {
>> +			color = <LED_COLOR_ID_BLUE>;
>> +			function = LED_FUNCTION_ACTIVITY;
>> +			linux,default-trigger = "activity";
>
> "activity" isn't documented, perhaps heartbeat instead ?
>

The trigger does exist though. The other way is to extend the DT doc.
I don't really care one way or the other

I'll defer to Da on this one

>> +			max-brightness = <255>;
>> +			pwms = <&pwm_ab 1 1250 0>;
>> +			active-low;
>> +		};
>
> leds subnodes should be named as led(-[0-9a-f]+)
>
> see Documentation/devicetree/bindings/leds/leds-pwm.yaml

That I do care. The schematics refer to the leds by name. There is no
number assigned, much less hex. Making one up makes no sense.

User should be able to quickly (and easily) link  what they see in the
schematics with DT.

So I'd prefer to submit a change for the regex rather than changing this

>
>> +	};
>> +
>> +	leds-gpio {
>> +		compatible = "gpio-leds";
>> +
>> +		led-orange {
>> +			color = <LED_COLOR_ID_AMBER>;
>> +			function = LED_FUNCTION_STANDBY;
>> +			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
>> +		};
>
> Ditto, but you can simply use "led" since it's the only one.
>
> See Documentation/devicetree/bindings/leds/leds-gpio.yaml
>
> Neil
>
>
> <snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
