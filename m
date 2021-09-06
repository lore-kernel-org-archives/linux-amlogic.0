Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FEFC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 09:29:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5AC860F3A
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 09:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5AC860F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMIHeZ6CHVaVmZFoztQW4ZvMpYHa3LXoSFh9Xx90pxo=; b=kkNttgcZO2aHmP
	2Eti57wYyTzzXDTFZnUljxx9XuhqA8jV05nSHMxz7lxMPu5MXMKcSBLvLA32yJJ4Bv01JTumKhR46
	nbEcnkEkVmN6parQfuYK4tHpHRyxeCuqb5GPWN72F0MVJWO/oa05jS9im8d/ociNBHYKEaRrI0b24
	uF5B/uX0xDyjvDyWhC/hy5CvrM6xL9yzQICdQcoHUrz7k/bXkIR8KGaLxE4efxWQRVPhjzcvnwlG1
	y81h8hD/f50iAn5cU75/XGQHxnaERAj/90GeDKBI6a52ptJwplBKY1utsI64hhJfDCxHQ4CYCtjBV
	ELbqjWPpMhJ0V6CBwWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNAwb-000NQr-Fs; Mon, 06 Sep 2021 09:29:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNAwP-000NP5-1p
 for linux-amlogic@lists.infradead.org; Mon, 06 Sep 2021 09:29:26 +0000
Received: by mail-wr1-x435.google.com with SMTP id i6so8856407wrv.2
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Sep 2021 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=8KT0j+y9UG1wLFF91Q2u6K4u89sA/BztK5NzKugntq0=;
 b=abp0ZDooP8qdOaE0H2VpHN+8agL15+qD+lGe740VhTVr0SPyZFJDQaClLFPdAh8kGC
 HI+lQVQ//DS18S7lJEKlJM0nz+Kz4BeEtH8G0HEaFDzTSK/6z6iL2mPhtpAlGrhUz9PL
 66nNV6gpfuEiSxH/Y57WfEk7zChENOcyXCegiQ8qm96mdEcgm8uECBq294qL1WeWq+u1
 MssEnDpvCT/41L5O/Oj/+VN/O8e3j6xjerCzZWI9+7uwNocGDI68I/P4V+nKcTJxfCcU
 enA0h0NAUZUYl1wIxXeUFW2rdlJBRokIGgrg7XDOmnJ8yupBBM+Oeu21In0cZKZtXw3J
 xzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=8KT0j+y9UG1wLFF91Q2u6K4u89sA/BztK5NzKugntq0=;
 b=gV1CLenCRPjBNrb6IXW/x0CLbB0wgRRmT9xXtUt7plPY/KAqjDg4g+/Q4GyyQbuMDd
 4hSGeJ2MM1SKIceVxdxKiY/p9hwPWUgpg4jUIk/cQ/zu3j4oG/fZkW/DBU6Dmiim+SCI
 7sR5kQcNbjc72NxGADrLwJIU5cXLYlCOQAzT8L2CtezjVnrWRJasggnCpNv9a0epufnq
 ce5B9MI4+n114aDiOMMXugzs0DNBhLj+1ObmWSQncrSpZEkHPgU9MHDBjt8jurlDkGLL
 2KEJ5zp8ZAY0oNyAVJHlOFlNDMMiQhwkTG/DdTpWRfdg7usQs3j9v3hMnWm2zT0K5jap
 ZzCw==
X-Gm-Message-State: AOAM531IdF8CZ5q0ekYtcf6MLbdG/nv21DFzSAC1FnM4VTqNVYhjxiDj
 BRG79E3MLhOfeRAx3O5QdyCghg==
X-Google-Smtp-Source: ABdhPJyzyMfo+pKTccCBX8HscKDDuZ9cToCN1jiykGwunJAxaOvWcTWgcPa44E359+PcvzgypSHzzg==
X-Received: by 2002:a05:6000:34a:: with SMTP id
 e10mr12436965wre.421.1630920563248; 
 Mon, 06 Sep 2021 02:29:23 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r129sm6646901wmr.7.2021.09.06.02.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:29:22 -0700 (PDT)
References: <20210811050941.398360-1-art@khadas.com>
 <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, christianshewitt@gmail.com, art@khadas.com,
 nick@khadas.com, gouwa@khadas.com, Artem Lapkin <email2tema@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Mon, 06 Sep 2021 11:25:32 +0200
In-reply-to: <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
Message-ID: <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_022925_126690_C8DBA7E0 
X-CRM114-Status: GOOD (  16.98  )
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


On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 11/08/2021 07:09, Artem Lapkin wrote:
>> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
>> 
>> Signed-off-by: Artem Lapkin <art@khadas.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> index 3d8b1f4f2..1efdbb61e 100644
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
>> +			compatible = "amlogic,g12a-spdifout",
>> +			"amlogic,axg-spdifout";
>> +			reg = <0x0 0x480 0x0 0x50>;
>> +			#sound-dai-cells = <0>;
>> +			sound-name-prefix = "SPDIFOUT";
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
>> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
>>  			status = "disabled";
>>  		};
>>  
>> +		spdifout_b: audio-controller@680 {
>> +			compatible = "amlogic,g12a-spdifout",
>> +			"amlogic,axg-spdifout";
>> +			reg = <0x0 0x680 0x0 0x50>;
>> +			#sound-dai-cells = <0>;
>> +			sound-name-prefix = "SPDIFOUT_B";
>> +			clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>> +			<&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>> +			clock-names = "pclk", "mclk";
>> +			resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>> +			status = "disabled";
>> +		};
>> +
>>  		toacodec: audio-controller@740 {
>>  			compatible = "amlogic,sm1-toacodec",
>>  				     "amlogic,g12a-toacodec";
>> 
>
> Jerome could you quickly review this ?
>

Just this, without the related card change is not usefull as it won't be
part of the card.

It would be nice to indicate how it was tested ?

AFAIK:
- spdifout b can only be routed to hdmi and dw-hdmi driver does not
  support that yet
- the VIM3 does not have connectors for the spdif (in or out). If it
  requires some extension card, it should be noted somewhere, at least


> Thanks,
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
