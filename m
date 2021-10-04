Return-Path: <SRS0=miVd=OY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25EAC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 13:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1513D61184
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Oct 2021 13:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1513D61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ko41L66IL06CjxkNdwblc2ZMZQcVvRbxHyvjRaSLIM=; b=F5nRESTqr5Hj8r
	FwMfyT5c38q00XJ6k1hfnGvpi1PkYnT7plumDR7UP04khnaBQBhygyhD0+4swZTPnhfAXqqJYCs4D
	6PYPKOhAeRytB1MtTpvI8wziGmkzdRjp/6t4oEFTfo6pKaLU6WfmP6R2fyjaqKfgcfKD4affRlk6z
	VNf164VipEEO/qO4aWQ0dv9VQ/4WthqL1tLtEznGZT0FNKiBscjN//uOHD00PErxsotSEAEie9cA0
	xZoRooj0inhpL8XS2jH68eOZ7KKbBXUQ0WMrKXGTqVEoNohM+uw1w+6i6en97N+Bmx7WDCkQOVhdb
	cOsUi8jpV+UYBs/tiC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXONu-006hzD-TH; Mon, 04 Oct 2021 13:52:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXONg-006hxb-UM
 for linux-amlogic@lists.infradead.org; Mon, 04 Oct 2021 13:51:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso28101wms.3
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Oct 2021 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=qlWSZWlTlJBD8rbNOy3bbMpuI9Mzs9EIqR6yqDgX4mc=;
 b=fQ0YQ5yUl3Ok1UQERK8+w2pCRnX4ikWeeBfZ9oJks0APWtLsWEqP77u+wPQgvKhoUh
 1dfU0akWDjvO0FjNfxPIU/UJ6HhFkzlDJm6cjmPC76CENJR+aOm4Bbczz7tpu81hy5Sc
 juCIIEub768ZlwPtB/mvU3KVDL3q07gTg8TqvuHgfCdsr+Z2Bg5k0dpEhgX7wWODHeb4
 Urg1gePOZrOdzJtI+Ti+spF42bLgjpQHz8t4H4QTgYls/V3hKwmeohDkS7avUfCqLpBd
 x559N9vfoB5tnuehjJf2YZMBtmsfdNRq6RNIoWv/+W57i7dNxAzh3FduLCbQIpr/r7d0
 23ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=qlWSZWlTlJBD8rbNOy3bbMpuI9Mzs9EIqR6yqDgX4mc=;
 b=2aA1v0dEFx89/Q6tZUX22B6wbEkjDoAh9xc0Mm/FTF9G5RAy0TqGdiYjcpONVOYxlY
 mPvkPc7Z++NG3NhNWgouccadsBSfmIzIZLf4PUDK8T7jIzLKdtwHSP+zj+CWk7BRj1qt
 btKz7ooEPD0Ik10yIEgcwHoxfzO5fstOcdxWi6RDHlMt6sbkJYrDmkgwybrwLTtAhJt7
 vdNgGpL0Ae5bmCJUQPOic+qIBzfTAIPZLi/tV/I3BYV6LuXqBE77DmlrfWe9I97OBHdk
 VvT48xzkmNqVNLiqraOjwQrAoLwvvjnQ8DktX7Tz2yWNhICMRWX7ZOARQSEjEqNZSh1N
 X/Rg==
X-Gm-Message-State: AOAM532EuvWAz3APmrBKlo6SMygEx6L1zJvTIsRB0VS+ERF06Ub76oVx
 xRLM13VPxhaXIwPV0LNGo2BvOQ==
X-Google-Smtp-Source: ABdhPJy4k/7iYi9Zk16aDxfEKAGLW65qVB3N2CVchTPBCB0n1u9yN9PTIsv7M+9EDDNBk+RNFRqsuw==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr18334787wmj.151.1633355506876; 
 Mon, 04 Oct 2021 06:51:46 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 5sm2529261wmj.21.2021.10.04.06.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:51:46 -0700 (PDT)
References: <20210811050941.398360-1-art@khadas.com>
 <64a6a9e1-64de-4b31-9413-cdfd981862de@baylibre.com>
 <1jlf4ayrv1.fsf@starbuckisacylon.baylibre.com>
 <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Art Nikpal <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>, Artem Lapkin
 <art@khadas.com>, Nick Xie <nick@khadas.com>, Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH] arm64: dts: meson-sm1: add spdifin spdifout nodes
Date: Mon, 04 Oct 2021 15:46:27 +0200
In-reply-to: <CAKaHn9JOtmYoJsmZed4hLYAbtdyyMkhaM1iVThs0=2SV6y5ojQ@mail.gmail.com>
Message-ID: <1jtuhwvqxa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_065149_094074_B9105DB3 
X-CRM114-Status: GOOD (  20.86  )
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


On Mon 06 Sep 2021 at 19:56, Art Nikpal <email2tema@gmail.com> wrote:

>> It would be nice to indicate how it was tested ?
>
> https://github.com/khadas/khadas-linux-kernel/blob/master/patches/linux-5.14-rc5.sound/0001-arm64-dts-meson-khadas-vim3-remake-simple-sound-for-.patch
>
> i have test it
>
> i2s  and spdif output from gpio headers - works well

You have tested spdifout_a then.

Nothing says spdifin (which was only tested on the axg series so far) or
spdifout_b would actually work if enabled at a later point.

I would prefer if things could at least be tested once before being
added DT. 

>
> On Mon, Sep 6, 2021 at 5:29 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Thu 02 Sep 2021 at 15:31, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> > Hi,
>> >
>> > On 11/08/2021 07:09, Artem Lapkin wrote:
>> >> Add spdifin spdifout spdifout_b nodes for Amlogic SM1 SoCs.
>> >>
>> >> Signed-off-by: Artem Lapkin <art@khadas.com>
>> >> ---
>> >>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 40 ++++++++++++++++++++++
>> >>  1 file changed, 40 insertions(+)
>> >>
>> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> >> index 3d8b1f4f2..1efdbb61e 100644
>> >> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> >> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
>> >> @@ -356,6 +356,33 @@ tdmin_lb: audio-controller@3c0 {
>> >>                      status = "disabled";
>> >>              };
>> >>
>> >> +            spdifin: audio-controller@400 {
>> >> +                    compatible = "amlogic,g12a-spdifin",
>> >> +                    "amlogic,axg-spdifin";
>> >> +                    reg = <0x0 0x400 0x0 0x30>;
>> >> +                    #sound-dai-cells = <0>;
>> >> +                    sound-name-prefix = "SPDIFIN";
>> >> +                    interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
>> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
>> >> +                    <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
>> >> +                    clock-names = "pclk", "refclk";
>> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFIN>;
>> >> +                    status = "disabled";
>> >> +            };
>> >> +
>> >> +            spdifout: audio-controller@480 {
>> >> +                    compatible = "amlogic,g12a-spdifout",
>> >> +                    "amlogic,axg-spdifout";
>> >> +                    reg = <0x0 0x480 0x0 0x50>;
>> >> +                    #sound-dai-cells = <0>;
>> >> +                    sound-name-prefix = "SPDIFOUT";
>> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
>> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
>> >> +                    clock-names = "pclk", "mclk";
>> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT>;
>> >> +                    status = "disabled";
>> >> +            };
>> >> +
>> >>              tdmout_a: audio-controller@500 {
>> >>                      compatible = "amlogic,sm1-tdmout";
>> >>                      reg = <0x0 0x500 0x0 0x40>;
>> >> @@ -401,6 +428,19 @@ tdmout_c: audio-controller@580 {
>> >>                      status = "disabled";
>> >>              };
>> >>
>> >> +            spdifout_b: audio-controller@680 {
>> >> +                    compatible = "amlogic,g12a-spdifout",
>> >> +                    "amlogic,axg-spdifout";
>> >> +                    reg = <0x0 0x680 0x0 0x50>;
>> >> +                    #sound-dai-cells = <0>;
>> >> +                    sound-name-prefix = "SPDIFOUT_B";
>> >> +                    clocks = <&clkc_audio AUD_CLKID_SPDIFOUT_B>,
>> >> +                    <&clkc_audio AUD_CLKID_SPDIFOUT_B_CLK>;
>> >> +                    clock-names = "pclk", "mclk";
>> >> +                    resets = <&clkc_audio AUD_RESET_SPDIFOUT_B>;
>> >> +                    status = "disabled";
>> >> +            };
>> >> +
>> >>              toacodec: audio-controller@740 {
>> >>                      compatible = "amlogic,sm1-toacodec",
>> >>                                   "amlogic,g12a-toacodec";
>> >>
>> >
>> > Jerome could you quickly review this ?
>> >
>>
>> Just this, without the related card change is not usefull as it won't be
>> part of the card.
>>
>> It would be nice to indicate how it was tested ?
>>
>> AFAIK:
>> - spdifout b can only be routed to hdmi and dw-hdmi driver does not
>>   support that yet
>> - the VIM3 does not have connectors for the spdif (in or out). If it
>>   requires some extension card, it should be noted somewhere, at least
>>
>>
>> > Thanks,
>> > Neil
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
