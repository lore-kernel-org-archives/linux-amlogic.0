Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D876CC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 10:26:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A508E20674
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 10:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BgJmUI+G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKS5CiYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A508E20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gT4FWhjAupG44sK7BbQTrhDoIHQrZ/3o2wq5WxlPVHA=; b=BgJmUI+GQn3C00pW5ouXrwIa0
	JCxFomXMAvwAFRgSWABcrK8hp90kGjbrAWJAsfKp7pzY3q7Wzpby9FgR0pQHEc47DsqK6mOE9+NF5
	MYRaKtFP0KQrWjyx09VT9PExXgOd9C6H/BXSHF/VftAMTbzLiw+YjOGK2cgkTRaqcbLtiPonnq8BT
	kDcxAkZz5iqH8XyOKULnxFvHudrYAz/GOcD7CzkPjouCNkx3uJPytvFN/A3zVTTc0PUmKzqpmoEPG
	KjX9mYpw9KHTpMPEz8e3EDZg/YXNEaSK1j3I45yVYAQsSs2/r5G+t7qUyd7ToGIqM2RRjPAWjuvxP
	t6ikgT93A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7yod-0004Cj-PH; Tue, 18 Aug 2020 10:26:03 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7yoZ-0004AY-Qm; Tue, 18 Aug 2020 10:26:00 +0000
Received: by mail-io1-xd42.google.com with SMTP id h4so20637574ioe.5;
 Tue, 18 Aug 2020 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgNQdUHzF8dSuVSaU+C3ewro8dSYma23rzEUG9sMehY=;
 b=ZKS5CiYj3e/UXioFJ2eFJIzS3Dx5xjqimMKDtCCw+1PDnt2BV3C9wJdCqe94j3LVwk
 15WJ58m96jgfqFrCt+LHMHR74MT9GWQFQemwFrMRcXL0T1PHhfPzTemp/myoV1e/HuhC
 R1oIaYolr7xgePy+4AxlVxhyZXpuK9xMZ4z0emEeeJle2R8AgjVEOi0TiOZcZg7lKlRD
 ftVBsZkM0LAsCtyG54ph0D0Bv/mSI91rHzWhmT4PWuJe7wmo8n7siTgWF+nlFOEYTzez
 gvdfN9aePEGoSalN4DKMxNteFUPvU737joysw1KliSkO1xv3bgQYe+adAh2L6Ilegp2l
 l5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgNQdUHzF8dSuVSaU+C3ewro8dSYma23rzEUG9sMehY=;
 b=Q90kQKbxCdYHhYNzQ5WlST2025ZmddXP8BXR7sWBn2flwKK1W6wX33JAHYkMeKhORR
 j8k7GMYQeCA9aZFarX9mowPsh2MeckHeEVlAJYe59E430HW896vUrIsYuliPgSXQs3vm
 0Dkjb5a2AZnvxJbzHFCTqintK/fYBrwCP+wisHYDu1lA8weuvYtwijd4rg7HFHo789dO
 tSdiwf/qD6/XOu8On9xZTeBduiOxDVTrI2C1TcYPqNme8cU5muxTan27V2nAj7cukzD4
 izRe4ED9L6ECzBdCHWuspiNT2QI0IfdW1JTeNLx84Ig7vhpSUay5ezKKA4F5PYgF+nMw
 Fgbg==
X-Gm-Message-State: AOAM532SEbv2KYuAUbzIAWYooEqgNC+jWUOiJTeiZdOUvHUZ6pUJ7KYv
 JYaIcU0poMU/rK0AYqwdyXwz+PXZCU3mZSJahDI=
X-Google-Smtp-Source: ABdhPJzFOI9vNd7LzlXMLwcLhLc4bR4pD2Jeyh89ELFMK3se42heDlZ+wgkiyOxtRjkIGSjmvYRMMkHvstxLBk0TCTo=
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr15944348ioh.173.1597746354429; 
 Tue, 18 Aug 2020 03:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
 <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
 <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
 <1j1rk4flh6.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1rk4flh6.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 18 Aug 2020 15:55:44 +0530
Message-ID: <CANAwSgQwbAuHUnG1JwBQUxWJbn+MYwfhPSv=SH1g6+LLPKmsEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_062559_887006_2D5F74E8 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin, Jerome,

Thanks for your review comments.

On Tue, 18 Aug 2020 at 13:13, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> >> > >
> >> > > +&i2c3 {
> >> > > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> >> > > +       pinctrl-1 = <&tdm_c_din3_a_pins>;
> >
> > Note: without setting this *pinctrl-1* configuration RTC wake up
> > feature works as expected.
>
> As pointed out by Martin, the pinctrl-1 here makes no sense for RTC on
> i2c. If the rtc is on an I2C of AO bank, the pinctrl-0 is likely to be
> wrong as well.

Ok are you suggesting *I2C_AO_S0_SCL* and *I2C_AO_S0_SDA* pins.

+&i2c_AO {
+       status = "okay";
+       pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
+       pinctrl-names = "default";
+
+       rtc@51 {
+               compatible = "nxp,pcf8563";
+               reg = <0x51>;
+               #clock-cells = <0>;
+       };
+};

But I get the following output with this configuration.

[root@archl-on2e ~]# dmesg | grep rtc
[    5.284632] rtc-pcf8563 0-0051: registered as rtc0
[    5.300148] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock

I also tried to move the my rtc nodes under i2c_AO, but I got the same result.

[root@archl-on2e ~]# dmesg | grep rtc
[    5.447423] rtc-pcf8563 0-0051: registered as rtc0
[    5.457465] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock

But as per the schematic RTC configured using GPIOA.BIT14 (SDA) and
GPIOA.BIT15 (SCL)
And with this configuration with i2c3 node RTC is getting configured correctly.

[root@archl-on2e ~]#  dmesg | grep rtc
[    5.240760] rtc-pcf8563 0-0051: registered as rtc0
[    5.243225] rtc-pcf8563 0-0051: setting system clock to
2020-08-18T10:23:04 UTC (1597746184)

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
