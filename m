Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2010CC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 10:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5CE20651
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 10:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a63uH/9S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="obDoflB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5CE20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iio1NScSWxoI8r2Ta/C+taJNP3CdrRVzgXWPloHzjhs=; b=a63uH/9SPaBMb/
	f+quDMDCSTKBzOxuXuYaVmk+LOph3TiYLmsGzScotmcltnKhZ+KU3zGYxKgVeLp+a6zVx/ugvi56J
	tvxdzWsrt1cY/kDmJW054jIH5gP0OLYlOgZmCIP/ocJ9UpOEKw3qLPnNinnVBc2c8chYO3Ta+XVfU
	P2gXTUgw11n1O9MHwvIS8Qvivf3QEGz7/sOVFExp4E+EtHD8ES2/LTwUubJuOxyljyyrzCdWrXS0g
	Uo97NyxBKJXkFRRgrlad43+5kZWwRxveGajgbnnGKDlZsk1jiTM3b8wdU7+TXs118oq6sdyHsJBEl
	4TPjfXmcqoarv5/dyRTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjLWd-0001xD-UJ; Tue, 15 Jan 2019 10:00:51 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjLWU-0001wn-Gq
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 10:00:50 +0000
Received: by mail-ed1-x542.google.com with SMTP id b14so2050012edt.6
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 02:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=vRX2KAWNtaUajnhYZlYwW+dL/BwPFiM5lo0RqCcBmy4=;
 b=obDoflB6Sue/vDxRGDduY4g3r4akPT/TEDArt4TqqtQg7c/q4CfTnAKUyKdfnMrJVI
 FyG+TmpVOej+H7dTimbfliCJ8anA1iZF++MeLiLrEB4uw9VRnDNfV5+0mjF3OJyJcJS1
 jiThKaMiY7VKwGYZIl5NlfVb0xloeCcgiXNkAl4m1LetTB3asVS+lVRrrmZCmXl/Bgdw
 HTgij6sB3F5DWZ0ervzTedxCNfmAYv1x8qWJy0BIGGFc2ZtSwFA6R4GTLGvPJenNbTNL
 oqa5pDoxqcLeQQKT4HL3rSBUvlJzi34vyMHLuNI2O8OxDN0sW22gwI+vIYE6yEMVbsX5
 pyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=vRX2KAWNtaUajnhYZlYwW+dL/BwPFiM5lo0RqCcBmy4=;
 b=bmCUmMvYrDu55zuucqcEBrELpnFvi+/1G8nGnfG/ZOBNcTik0L7+R6naTe2bX3gF5B
 rZUH9GtW87quIluk0n8WqN/kDEI2SM1OgdG8ID1hvN4XX3BQWVkv5/YMhR+rxTvO2jkz
 v1hQoUryk0jaHHUPQL0ok0aWaLniIOEzQA1GugktAlRjWbDBhDgr9ivHCAeifgQphVXV
 ZkeNMNdz+160mdJ7kLUVWoBWQckHD2OOP7vOEo0z2m7tfbz3MTrYBDRO3sFjrDskMi7s
 sw44Cd1G+fWXZXbyWyED6ELjVpHWVd+Rixv6WA9DctcSoAaDo5KXveaV0mWiSqHVlR4F
 fEgw==
X-Gm-Message-State: AJcUukdazdQRU93JtTA7UtOnzXNEx5Jj1Wwzzbmtss/2LjgozK5hTiwi
 ag0Ii96OIf4KPejzYgcquSEUHg==
X-Google-Smtp-Source: ALg8bN78Kpx0ZGpi7od0psVnM8LVsU1vLkHZozkJgrC8KOFlR2MpsBlLosT+ZQ9wAraFa5ChzRbqFw==
X-Received: by 2002:a50:b5a5:: with SMTP id a34mr2753460ede.52.1547546440462; 
 Tue, 15 Jan 2019 02:00:40 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:c75])
 by smtp.gmail.com with ESMTPSA id a38sm4693454edd.44.2019.01.15.02.00.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jan 2019 02:00:39 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/4] Add driver for globaltop GNSS receivers
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <CAL_JsqLvSWF60eqLsXUcP5GL0ijgfE6XwvectiM1D1Y9LPpOkA@mail.gmail.com>
Date: Tue, 15 Jan 2019 11:00:37 +0100
In-Reply-To: <CAL_JsqLvSWF60eqLsXUcP5GL0ijgfE6XwvectiM1D1Y9LPpOkA@mail.gmail.com>
 (Rob Herring's message of "Fri, 4 Jan 2019 11:51:51 -0600")
Message-ID: <86fttup7ei.fsf@baylibre.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_020043_453611_51A22170 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri 04 Jan 2019 at 11:51, Rob Herring <robh+dt@kernel.org> wrote:

> On Fri, Dec 28, 2018 at 4:51 AM Loys Ollivier <lollivier@baylibre.com> wrote:
>>
>> Hello !
>>
>> This patch series adds a new GNSS driver for the globaltop GNSS receivers.
>> These receivers transmits NMEA output sequence as soon as they have booted.
>> Power management can be done via the main supply and optional backup supply
>> as defined in the device tree.
>>
>> The driver has been tested using a GlobalTop pa6h chipset on a Libretech-cc
>> board using the expansion header. Changes made in the board device tree can
>> be found below for reference and testing.
>>
>> Loys
>>
>> Loys Ollivier (4):
>>   dt-bindings: Add vendor prefix for "GlobalTop Technology, Inc."
>>   dt-bindings: gnss: add gtop binding
>>   gnss: add gtop receiver type support
>>   gnss: add driver for globaltop receivers
>>
>>  Documentation/devicetree/bindings/gnss/gtop.txt    |  33 +++++
>>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>>  drivers/gnss/Kconfig                               |  13 ++
>>  drivers/gnss/Makefile                              |   3 +
>>  drivers/gnss/core.c                                |   1 +
>>  drivers/gnss/gtop.c                                | 152 +++++++++++++++++++++
>>  include/linux/gnss.h                               |   1 +
>>  7 files changed, 204 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt
>>  create mode 100644 drivers/gnss/gtop.c
>>
>> ---
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> index 90a56af967a7..3b3d4dcc47aa 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
>> @@ -17,6 +17,7 @@
>>
>>         aliases {
>>                 serial0 = &uart_AO;
>> +               serial1 = &uart_A;
>
> You should not need this as the UART is not used as a tty. It could be
> that the serial driver requires aliases, but that should be fixed.
> There should be some examples of fixing this in other serial drivers.
>

Thanks Rob,
Followed up on that [0]. 

[0]: https://lore.kernel.org/linux-amlogic/1547484866-3600-1-git-send-email-lollivier@baylibre.com/
>>                 ethernet0 = &ethmac;
>>         };
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
