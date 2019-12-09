Return-Path: <SRS0=O3JJ=Z7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACA8C43603
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 10:15:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C79A206D5
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Dec 2019 10:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOn68vAw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HwguWYyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C79A206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WfxxauqUEm3vmSc5lIrndUeGTzvCWhs/HS9M0pPOuLQ=; b=NOn68vAwIILfWH8A4mpV64O+H8
	rbYHCM8wcOR3UewIIe3jfgrbDHY/tL8vwbJakFT+tpZ3GgXR7ktkvLZHV5u4Q8/FaYKhP+EafvauE
	bzBBiG8aXtdvAb/cjfnpZNeJl0qkBrJDVLpZ1cqFyuv88YFxDBfAt1cZ+Wwam3Zaj4ZLdy2+BfZGS
	lYUFVzAfnbBtXhRV/ass1vTEciIJDT/XZ+BB1stCIvBw/n4F2bWxsEvUVv91BYmWzh88Ea//AsovT
	b5PIztZKsLbmERZOBwHCuRvXBPFdTxNAjq42AXU6KX1dPPoozPd/OLu5Q4qaLd0KACLsnUB17CH3i
	tQ+sZDJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieG4i-0004qI-AS; Mon, 09 Dec 2019 10:15:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieG4f-0004pC-Ia
 for linux-amlogic@lists.infradead.org; Mon, 09 Dec 2019 10:15:31 +0000
Received: by mail-wm1-x342.google.com with SMTP id s14so14257705wmh.4
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Dec 2019 02:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=TcyeAKWxbs45jp/CfRj2pE3INadVkQJZA/zsi4FujnU=;
 b=HwguWYypGOrERHEKBqG6yBbaJtfalNYU6k6DcWv9kigbL85xY7HsZi3xywYDWTsVPp
 KHf8pD/KhFroU7HAsUnm2fBOM0AvcAvKvhu6/lw/osI1eThQuEYsWRCbc0md14+6/sOq
 1joqtMyTmfJuvipkL29zWET0eVNo1c3yy2/3ljQvhH3ASCsNjbQMQSO9Kj6FmKNW/fQX
 KV+B99rwc7GY2Wwq7u46yCEDyWODY2ilmw8zJgQv6ZerL90rUqepxVETfAvJjbcQDH9r
 OtCPoqZUH8BufkBmygWVHZ81g70kFqvS/SfVSaOPjTllBJ6BHTE5wU3Iea6lugKB9Fhw
 xvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=TcyeAKWxbs45jp/CfRj2pE3INadVkQJZA/zsi4FujnU=;
 b=NVmyhSO+QDDIrG5E9bKhjSEHbuTgF312UbEqw6mpNH03tzTdtxEBolfvPBm3zmuJvs
 uzVz4jJL4wmwGJhmqxIPvvFa1S79o6rlH9nZhno8G09UsveAk/97a37xaEEcnlFd2fH3
 OGF/G0T9BIlI0+zKp8Lm6m+nIuExTyGVLyqccoweWw0Ev8WI2FCkEozxkGJBCILmHuA/
 vwuTw3amecgaE612L3Zlf4KCY6FnvHh9+TD43jI2F2oZH7+EtVXP4ruJcSBxXAyw/2ae
 2GFe+kZX6Ovg9wzXSBaMh8hB/WtyBwcEbQJavT0so3m6wl+8Nh963JCPQPxzahvStS2j
 kKug==
X-Gm-Message-State: APjAAAUF/0yHyFoOtn44ne8MQadNbBeeqvYz4QerCgP1NvA4iccFTiE8
 dqsEiZ4V0k8EVNhvKRaGiG9uvg==
X-Google-Smtp-Source: APXvYqzllFTCkE0DiwNkEV+3aqKGy90vjjwlpWPCDPLN8xnRxxdHfYXmJTNDkH4yfls7b/VxgydkCg==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr24577971wmh.21.1575886527834; 
 Mon, 09 Dec 2019 02:15:27 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s82sm13064173wms.28.2019.12.09.02.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 02:15:27 -0800 (PST)
References: <20191206100218.480348-1-jbrunet@baylibre.com>
 <20191206100218.480348-5-jbrunet@baylibre.com>
 <CAFBinCDMxf6tJt+bkfN7W5CMJrqZ+F1zTC=q8xmYtxg7gpEJxg@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson: add libretech-pc boards support
In-reply-to: <CAFBinCDMxf6tJt+bkfN7W5CMJrqZ+F1zTC=q8xmYtxg7gpEJxg@mail.gmail.com>
Date: Mon, 09 Dec 2019 11:15:26 +0100
Message-ID: <1jmuc1erep.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_021529_616970_C6FD0331 
X-CRM114-Status: GOOD (  23.38  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 08 Dec 2019 at 19:05, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> this is looking good overall - I have some questions / nit-picks below
>
> On Fri, Dec 6, 2019 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
>> +       adc_keys {
> on most boards we use "adc-keys" instead of "adc_keys"
>
> [...]
>> +               button-onoff {
>> +                       label = "On/Off";
>> +                       linux,code = <KEY_VENDOR>;
> based on the label I assumed that the code is KEY_POWER
> why is KEY_VENDOR the better choice here?
>

My bad - The button is labeled with "UPDATE" ... nothing really matches
in the KEYs ... so VENDOR it is.

I have just copy/pasted the section and forgot to update the rest

> [...]
>> +       cvbs-connector {
>> +               compatible = "composite-video-connector";
>> +               status = "disabled";
> is there CVBS on the board? if I remember correctly the VPU driver
> works fine when omitting the CVBS connector
> so if the board doesn't have it you may drop the whole node instead of
> keeping it disabled

The CVBS output could be provided on one the GPIO header.
Since it is not really standard, I prefer to keep off and leave to
option to easily turn it on if someone wants to use it.

I'll had a comment for that.

>
> [...]
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               green {
>> +                       label = "librecomputer:green:disk";
> you can use the "function" and "color" properties instead of the (now
> deprecated) "label"
>
> [...]
>> +&external_mdio {
>> +       external_phy: ethernet-phy@0 {
>> +               reg = <0>;
> it would be great to have a comment above which PHY is used on this board
>
>> +               max-speed = <1000>;
>> +               reset-assert-us = <10000>;
>> +               reset-deassert-us = <30000>;
>> +               reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
>> +               interrupt-parent = <&gpio_intc>;
> a comment like /* MAC_INTR on GPIOZ_15 */ would be great here
>> +               interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
>
> [...]
>> +&pinctrl_periphs {
>> +       /*
>> +        * Make sure the reset pin of the usb HUB is driven high to take
>> +        * it out of reset.
>> +        */
>> +       usb1_rst_pins: usb1_rst_irq {
>> +               mux {
>> +                       groups = "GPIODV_3";
>> +                       function = "gpio_periphs";
>> +                       bias-disable;
>> +                       output-high;
>> +               };
>> +       };
> on other boards (like Odroid-C2) we use a GPIO hog for this. I'm not
> sure which one is better
>

This is at least tied to the related device.

I have discussed "hog" vs "pinctrl" matter with Bartosz Golaszewski and
we could not find any reason not proceed with pinctrl when possible.

> [...]
>> +&pinctrl_periphs {
>> +       /*
>> +        * Make sure the irq pin of the TYPE C controller is not driven
>> +        * by the SoC.
> is this because the SoC default configuration pulls the IRQ line LOW,
> which then generates "phantom" IRQs?

No. It is just making sure the pin is claimed and properly configured.

Since our interrupt and gpio controller are completly de-coupled it is
not necessarily the case without it (... and yes, the same is true for the
other device using gpio irqs)

>
> [...]
>> +       fusb302@22 {
> typec-portc@22
>
> [...]
>> +               interrupt-parent = <&gpio_intc>;
>> +               interrupts = <59 IRQ_TYPE_LEVEL_LOW>;
> a comment above with the GPIO number would be great
>
>
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
