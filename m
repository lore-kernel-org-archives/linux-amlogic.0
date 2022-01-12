Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3B6C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LcwNkQlFxkDVQvaW9bAMiY6V2CMkSYtLpI4VVs21IeQ=; b=Ebr+/YUCS28J4HKdebADYbx/PR
	4AmARCjlEBYIvXgCP7hw1jW5rWXw5b2HmDdLVS1FSFHDMTGsBTGndFTHKrdmvKS1TcCIYEPvwF5a0
	mcsatiQmH/yeX7AbJNoeX4qHh78o7mImO9DR+mUteQL52UGINWly34YkQiTa7MVjhQAHS6Crl2q94
	TyGuY+2OQlPsMyVeKhdnGc6B2fYNMDWdU46WVifIlge8qfO4c7dafG9ldxBpn3Sb6bbAy3K4EtKRE
	B2dV6cJWA7DRMgML4v8IicOI0moxLUGyWcvb1QcROxvFq4LjvmyXEHrBSg2XTltjA3QxVQaeZkotx
	5SYSBfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ZSA-001ehI-6f; Wed, 12 Jan 2022 08:57:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ZS6-001eep-4v
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:57:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id e5so1063219wmq.1
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wR5khnPxhK4CBR2Wab/qs/59R6BOAEdLfga3Tx4ANzY=;
 b=W+tcii0vpg0IJsUsZyclv1hfxchyR5W0H1AjVksk6v87Fymf3imE0ZbnVgIMWQlPoD
 NCRzEjtxyZ4BQpWzoi8rTBu3uaBG2lpxoEUSWV4XBOzmXvxJtORWyY8hvBAAf+0+PpeT
 xqh+0LnyKRT8V2Sp7wJ4nY9QZdSmoaLHpc3b2VZEyai9AhkfsDDX/nN/jWBsGDTcHECe
 EmrN/ZK0k4F0Q10rb1vNQ35smwsrICW+fwPfHZAuknOsRKVGUFe0Iyr0L8EkVZ5mNHv1
 jfBzSvmAGZcBVlXEsc6wB0aM5BaoCmdV021DqggTVis9irkrwNHlulnnDBB83y94Rx1J
 b+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wR5khnPxhK4CBR2Wab/qs/59R6BOAEdLfga3Tx4ANzY=;
 b=D7ybUuek61IvOyK0JY/on3lb/zWvHKGjr3czufwMvCyPcAwmpTsrfCYFP3Qs1rO/aJ
 Rr5vvzbizTqDDIvpNXDQe9UMloDr8zV5RFHJHYEeBZkDvUs2UyPjn3g+BCv8kvb9vRNX
 7KpC69Y5wXE8WuGZprYB09N/KSLr6LFkuNPqbhl0YUfadujl/JyRLT38qU5m2neBN5sF
 V4lTFPkiFWiaoCZplUyKsjZBPrUOLEp11kATS5b52LApTXklRZo9yoVBfHO+35mWjn5b
 YL5DrUIIYnx3sGVI404IAuewPC4LGsxQ9wUDQCi+3eXAXMOioVXXJR7e5QLFthWPI79E
 EmoA==
X-Gm-Message-State: AOAM533lcA4aUvfgG72HUf2IgUuqwmrzQV2ptHjjobv0IKkhEthy4G/w
 6eRH8MbM8lRCvUm7YYx8/H+3pw==
X-Google-Smtp-Source: ABdhPJy2wuTWz1YQufaNV4KyDqVVfw+Nh1t0+hHx9utE3ws3C795N0PeSF8Kv5633viZNQpjimxbmg==
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr5641692wmk.75.1641977872694; 
 Wed, 12 Jan 2022 00:57:52 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id i3sm3837499wrn.11.2022.01.12.00.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:57:52 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
To: Jerome Brunet <jbrunet@baylibre.com>, Artem Lapkin <email2tema@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com
References: <20211215030236.340841-1-art@khadas.com>
 <1jtuekrfsf.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b4b62e3d-dc43-a56c-06c5-78e6ee7f6303@baylibre.com>
Date: Wed, 12 Jan 2022 09:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1jtuekrfsf.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_005754_304280_2FB636A6 
X-CRM114-Status: GOOD (  18.33  )
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

On 03/01/2022 16:35, Jerome Brunet wrote:
> 
> On Wed 15 Dec 2021 at 11:02, Artem Lapkin <email2tema@gmail.com> wrote:
> 
>> Add spdifin spdifout nodes for Amlogic SM1 SoCs.
>              ^ add (same in the title)
> 
>>
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> ---
>>
>> SPDIF IN and SPDIF OUT both tested and works fine for VIM3L (meson-sm1)
>> same as for VIM3 (meson-g12)
>>
>> SPDIF in and SPDIF OUT both pins available via GPIO header (SPDIF_OUT PIN
>> 13 spdif_ao_out_pins and SPDIF_IN PIN 35 - same PWM_F spdif_in_h_pins)
>>
>> https://lore.kernel.org/linux-arm-kernel/1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com/t/
>>
>> ALSA spdifin test example
>> =========================
>>
>> # arecord -fS16_LE -r48000 -c2 -Dplug:spdifin
>>
>> # cat .asoundrc
>> pcm.spdifin {
>> type iec958
>> slave {
>> pcm "hw:0,1"
>> format IEC958_SUBFRAME_LE
>> }
>> }
>>
>> DT sound card configs for testing
>> =================================
>>
>> &spdifout {
>>     pinctrl-0 = <&spdif_ao_out_pins>;
>>     pinctrl-names = "default";
>>     status = "okay";
>> };
>>
>> &spdifin {
>>     pinctrl-0 = <&spdif_in_h_pins>;
>>     pinctrl-names = "default";
>>     status = "okay";
>> };
>>
>> ...
>>     spdif_dit: audio-codec-1 {
>> 	#sound-dai-cells = <0>;
>> 	compatible = "linux,spdif-dit";
>> 	status = "okay";
>> 	sound-name-prefix = "DIT";
>>     };
>>
>>     spdif_dir: audio-codec-2 {
>> 	#sound-dai-cells = <0>;
>> 	compatible = "linux,spdif-dir";
>> 	status = "okay";
>> 	sound-name-prefix = "DIR";
>>     };
>> ...
>> 	audio-routing = ...
>> 		"TODDR_B IN 3", "SPDIFIN Capture",
>> 		"SPDIFOUT IN 0", "FRDDR_A OUT 3";
>>
>> ...
>> 	dai-link-10 {
>> 	    sound-dai = <&spdifout>;
>>
>> 	    codec-0 {
>> 		sound-dai = <&spdif_dit>;
>> 	    };
>> 	};
>>
>> 	/* spdif or toslink interface */
>> 	dai-link-11 {
>> 	    sound-dai = <&spdifin>;
>>
>> 	    codec-0 {
>> 		sound-dai = <&spdif_dir>;
>> 	    };
>> 	};
>> ...
>>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 27 ++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> index 3d8b1f4f2001..1e0adf259d61 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
>>  			status = "disabled";
>>  		};
>>  
>> +		spdifin: audio-controller@400 {
>> +			compatible = "amlogic,g12a-spdifin",
>> +			"amlogic,axg-spdifin";
>> +			reg = <0x0 0x400 0x0 0x30>;
>> +			#sound-dai-cells = <0>;
>> +			sound-name-prefix = "SPDIFIN";
>> +			interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>> +			clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>> +			<&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>> +			clock-names = "pclk", "refclk";
>> +			resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>> +			status = "disabled";
>> +		};
>> +
>> +		spdifout: audio-controller@480 {
> 
> Node should still be named spdifout_a, even if the spdifout_b is not added yet
> 
>> +			compatible = "amlogic,g12a-spdifout",
>> +			"amlogic,axg-spdifout";
>> +			reg = <0x0 0x480 0x0 0x50>;
>> +			#sound-dai-cells = <0>;
>> +			sound-name-prefix = "SPDIFOUT";
> 
> Same here
> 
>> +			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>> +			<&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>> +			clock-names = "pclk", "mclk";
>> +			resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>> +			status = "disabled";
>> +		};
>> +
>>  		tdmout_a: audio-controller@500 {
>>  			compatible = "amlogic,sm1-tdmout";
>>  			reg = <0x0 0x500 0x0 0x40>;
> 

All these fixed while applying, no need to send a new version.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
