Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE58BC43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 18:16:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3E42207FF
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 18:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/ypH5Vw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FwUBWi9X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3E42207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwwAbNQrQU+nuCWsgEJ14hp4+ZBhjJ7n9fyLQLCEZT8=; b=V/ypH5Vwu+wSaq
	BnuZWKkoJbjFsyGOK6YSDRM9J4IWkMiy1FqWuvvWkwvJ7vL2a1YgGV0WwG0+wwGgjQNjMeGVx+nKc
	eh3BtvNo/tk5xF0NAMMTgX3xG9P13mXlneEFtDT6CI1Gx+GMZTT5R/gRHlJVYom3JEhROY6QjCZGE
	Lvq2AnOrofItRdWOGewZVWCmE9eLmczk/zZZaZbjVCkNup+fN/XEdFQfzR57N6v0QR8ghLvdFw8Dq
	AQKDaI/aHJJxo64vdIbCqbNA1isWD568Oc8Y7TEukUV1yLS2LNF5JBiCC6L9LLb463i9vBC+2iiSH
	ANEtVoLSUUjadGc4NW0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iek35-0002VQ-1z; Tue, 10 Dec 2019 18:15:51 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iek32-0002Uc-Io
 for linux-amlogic@lists.infradead.org; Tue, 10 Dec 2019 18:15:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id l24so9273185pgk.2
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Dec 2019 10:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=kfLit8LCSQ20powxSKYWCP8N8M+8XWObHNOV3Cp5ZFE=;
 b=FwUBWi9X6lnjaJWijeU8P6xQR2Yp703scW9SLcH8NgPLyKR/nUa8y4eOqMcVaRTSk4
 tcvmrhzkqYkS8gpG+GVfApk07EkDCKXveshyGFCdzPWWOsUOOu5tV3DS3LXnxD3QRB+m
 bZrv45p67LNVj/kJTeKbtMT3wdS3ewyDaRbSiw+weCRaMrSD2ttdqr1VKNOnHk0ewkTL
 NsDbcRNLkRIk8bPKhl3CylU/tCFIocywzPTKj/ZlQBT0Tl6XHmo6DECLYUYfUHKvAkai
 u1igvJdm9ZujDZNoRpz0k6oiOYkjyr/mxpOEQr/iw0EFosNHKmcKqsLwNrwSMw0hWN6M
 hIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=kfLit8LCSQ20powxSKYWCP8N8M+8XWObHNOV3Cp5ZFE=;
 b=f1rVGfQZJgyaa4h8xQgSL5wVl3sj4ol/bCtW4/+yekwsSIeuf5hVqlWJ8AT49wTEHi
 bPnA0KoLCZ1TEI0b+Fbmm4JZrM2UvDVlIcLmSlPOPTol9TUQMPur2kpVTa6Gqhi3vagj
 ZQ+H2YXgIf4eFDYF54OFFdO8gvRcaKI8WSIn9cKyYrAVVRWyHv4H8qn87DR71M4LuEGF
 GuupcF1Vk9eTC0+E9XB5uAbPJaF8SbCjaA0Mh4tNiwlnxQdkgbXiZsqosZFK3ogCuCis
 4xA9Q9lHBtygqFaYzrgb+0XRKH3ya6rATO9AKgF7zzsjI7+z9AEhwM2Ece5XEgEdQ2tj
 Johg==
X-Gm-Message-State: APjAAAVYKBjmy8x0sqbAsyDcIUN9bcAcwaRMTO2E4s1HR2VHU58kZHxA
 ADFgsA25JrmPEIFKik1AYCLgBg==
X-Google-Smtp-Source: APXvYqwpRGFP81NCx9NWPduL64oaXvGdMHqxm0bX+hBAxyEfO2ttMxw7y0Q9JTow9L1V6Lb4JcuPPw==
X-Received: by 2002:aa7:9197:: with SMTP id x23mr37703857pfa.163.1576001747315; 
 Tue, 10 Dec 2019 10:15:47 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 17sm4363066pfv.142.2019.12.10.10.15.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Dec 2019 10:15:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-a1: add I2C nodes
In-Reply-To: <e90e00e1-c868-ce09-6f79-deb62da72b43@amlogic.com>
References: <20191202111253.94872-1-jian.hu@amlogic.com>
 <7hsgltqfdx.fsf@baylibre.com>
 <e90e00e1-c868-ce09-6f79-deb62da72b43@amlogic.com>
Date: Tue, 10 Dec 2019 10:15:45 -0800
Message-ID: <7hblsgqc6m.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_101548_625124_A7A018BC 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jian Hu <jian.hu@amlogic.com> writes:

> Hi Kevin
>
> Thanks for your review
>
> On 2019/12/10 6:54, Kevin Hilman wrote:
>> Hi Jian,
>> 
>> Jian Hu <jian.hu@amlogic.com> writes:
>> 
>>> There are four I2C controllers in A1 series,
>>> Share the same comptible with AXG.The I2C nodes
>>> depend on pinmux and clock controller.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 149 ++++++++++++++++++++++
>>>   1 file changed, 149 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>>> index eab2ecd36aa8..d0a73d953f5e 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>>> @@ -16,6 +16,13 @@
>>>   	#address-cells = <2>;
>>>   	#size-cells = <2>;
>>>   
>>> +	aliases {
>>> +		i2c0 = &i2c0;
>>> +		i2c1 = &i2c1;
>>> +		i2c2 = &i2c2;
>>> +		i2c3 = &i2c3;
>>> +	};
>>> +
>>>   	cpus {
>>>   		#address-cells = <2>;
>>>   		#size-cells = <0>;
>>> @@ -117,6 +124,46 @@
>>>   				};
>>>   			};
>>>   
>>> +			i2c0: i2c@1400 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x1400 0x0 0x24>;
>> 
>> The AXG DT files use 0x20 for the length.  You are using 0x24.  I don't
>> see any additional registers added to the driver, so this doesn't look right.
> In fact, For G12 series and A1, the length should be 0x24. A new 
> register is added, And it is for IRQ handler timeout. If the 
> transmission is exceeding a limited time, it will abort the 
> transmission.Now the function is not used, There is completion to deal 
> the timeout in the driver. I will set the length 0x20 becouse of the new 
> register is not used.

Yes, we can extend it to 0x24 when support for the new register is
added, because that will mean adding a new compatible string also.

>> 
>>> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c1: i2c@5c00 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x5c00 0x0 0x24>;
>>> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c2: i2c@6800 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x6800 0x0 0x24>;
>>> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>> +			i2c3: i2c@6c00 {
>>> +				compatible = "amlogic,meson-axg-i2c";
>>> +				reg = <0x0 0x6c00 0x0 0x24>;
>>> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
>>> +				status = "disabled";
>>> +			};
>>> +
>>>   			uart_AO: serial@1c00 {
>>>   				compatible = "amlogic,meson-gx-uart",
>>>   					     "amlogic,meson-ao-uart";
>>> @@ -171,3 +218,105 @@
>>>   		#clock-cells = <0>;
>>>   	};
>>>   };
>>> +
>>> +&periphs_pinctrl {
>>> +	i2c0_f11_pins:i2c0-f11 {
>>> +		mux {
>>> +			groups = "i2c0_sck_f11",
>>> +				"i2c0_sda_f12";
>>> +			function = "i2c0";
>>> +			bias-pull-up;
>>> +			drive-strength-microamp = <3000>;
>> 
>> Can you also add some comment to the changelog about the need for
>> drive-strength compared to AXG.
>
> OK, Drive strength function is added for GPIO pins from G12 series.
> So does A1 series.

Yes, that's what I assumed.  Please add that to the changelog as one of
the new features in A1 compared to AXG.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
