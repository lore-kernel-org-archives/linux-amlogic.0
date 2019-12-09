Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDE9C43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D752206D5
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 22:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P5f2l7Ho";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FkEM7j7v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D752206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EafnGtC2CZn8n+QLDGZe9xpxIJlJ2nvy3I97Ha9+MoA=; b=P5f2l7HoALAvtn
	xWtIlhwMYm8bT82CpwCk1MKXRzWg1cKzUwmoHfqNYIocpEHjdIg4Ayn1+39Yf/5KPEUSSobY1K6cM
	0dz/rc75cRQYNGflxqitSbtOE/mRhzrxWiURoqnphqxz02+1s8MUTfdfPgRJPmxlAZBaUCMKCFSoX
	W9F1GUEVpTZ1n3QpGPhueF5QhVAkwAG5MGzSgjlM6jszxO+xxbMCC3liMNjGBsovh/pqkoSyrUd1M
	/de+wH7FfM756Xp9EiU9vHgRuOz/ytaFx0ocAWLcNbOsSVEjXtUivggdfysyWFIYY0CGV6xCi43gD
	t7wOX4ifSXriY4OGBKqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieRHu-0007GV-2Y; Mon, 09 Dec 2019 22:13:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieRHr-0007Fr-4J
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 22:13:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id 2so7916394pfg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 14:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=yo0DBQP6olVYld+QqR40EIZ5CI+nDeXH2q0W73K+blw=;
 b=FkEM7j7vlMlRR5kkXg7Lw6n3otl6GTo1gNNix7MzWjYhwNXDX5VIbIhRkHtDakXNMN
 VOy6fpqHbaD7XOe2pxchZyHnaK7VMGuxaS6VJMBnFFR1RknopH1ZwExvX+hxzmiuSvHa
 lRUpxSAd1n+Djf8VFnHvJKnNjuXIK1iKbP/MGsDO38YcM+ziX1JAOA7l0ykkiuqxjpR/
 ii+k9csh4TQ6HIDkIbpzeTenjOu4sS2D1CYLNUqgQB3qBC3fs8OpHxbCqeUZGEk2z+wa
 rdwR0E9eubjgdtpInyV9ZuSIPtEEnuNuDIFGulim0khaqEzuAz7M608sVgkrAGJ7Re40
 z3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yo0DBQP6olVYld+QqR40EIZ5CI+nDeXH2q0W73K+blw=;
 b=LEOCEp3eoiNxgvtDATjJP9dKbVFe+/9XNG6XIFn8MQWvkSjVUjk8rs7tabbQs41QE+
 lQ34klOmTRoz3UUPUnw9o/RKbJsVRS0VZnmyYQeHj/vhIQaqCJmnz6q9NpJmW4GKQZia
 G5YOS60pUQUaWIJAqYu5lFVJ/jH+huZE9YWutga0GA/6SIReXoXSih1Yaq/lDG0Bfk2D
 7t0X0yCg15J2OITUS2+aYpTIgSqESXZfiltN3Up7d4rKExYtJKwrp1EFgBW3JoBMuS7X
 2yfbSMxiWg70y4v2yYPOpcpCBC01jBpdHO4F35iDGcWXkvdS1toR0IOK03BIDDHKNy/x
 gvsw==
X-Gm-Message-State: APjAAAVuElRD1ieq13eSgj7Mp0tQV44gXmY2voQagkU5gANvL0yrjUc/
 aOm7KIKCfKFIOJY6lip7KgrWUA==
X-Google-Smtp-Source: APXvYqznSmUwaFhrmZSWkKFtOvv3dESgDaEoltHBEfbR1FsrJQp0ICXI9xzzy4t1Ej6BfYNGIOHqmg==
X-Received: by 2002:a63:d901:: with SMTP id r1mr21047882pgg.328.1575929630414; 
 Mon, 09 Dec 2019 14:13:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j3sm477409pfi.8.2019.12.09.14.13.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 14:13:49 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: meson: a1: add pinctrl controller
 support
In-Reply-To: <5fb2a7f9-bd5b-2ac2-0158-cae1ca743bf9@baylibre.com>
References: <1573819429-6937-1-git-send-email-qianggui.song@amlogic.com>
 <1573819429-6937-4-git-send-email-qianggui.song@amlogic.com>
 <5fb2a7f9-bd5b-2ac2-0158-cae1ca743bf9@baylibre.com>
Date: Mon, 09 Dec 2019 14:13:49 -0800
Message-ID: <7hblshrvtu.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_141351_172589_CB6F42A9 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Hanjie Lin <hanjie.lin@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 15/11/2019 13:03, Qianggui Song wrote:
>> add peripheral pinctrl controller to a1 SoC
>> 
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index 7210ad049d1d..0965259af869 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -5,6 +5,7 @@
>>  
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/gpio/meson-a1-gpio.h>
>>  
>>  / {
>>  	compatible = "amlogic,a1";
>> @@ -74,6 +75,23 @@
>>  			#size-cells = <2>;
>>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x1000000>;
>>  
>> +			periphs_pinctrl: pinctrl@0400 {
>> +				compatible = "amlogic,meson-a1-periphs-pinctrl";
>> +				#address-cells = <2>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +
>> +				gpio: bank@0400 {
>> +					reg = <0x0 0x0400 0x0 0x003c>,
>> +					      <0x0 0x0480 0x0 0x0118>;
>> +					reg-names = "mux", "gpio";
>> +					gpio-controller;
>> +					#gpio-cells = <2>;
>> +					gpio-ranges = <&periphs_pinctrl 0 0 62>;
>> +				};
>> +
>> +			};
>> +
>>  			uart_AO: serial@1c00 {
>>  				compatible = "amlogic,meson-gx-uart",
>>  					     "amlogic,meson-ao-uart";
>> 
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.6 with Neil's tag.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
