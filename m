Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7A0C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3eoZllaz42A/Y9+7z3ieGWYrBl3nLfdWyCICL+Srng=; b=LiASm6eNHcEWnv
	+VJKeNhR3hzZcrKAN9UmYS3+7zI7WvOCZVqoPN1TNIVu7H+VU/GokCKoHCt/52Bgdmiqb4cFW2AaZ
	mhy4jfnr8f1AR4JiRnv1QT2Sbd+GXKLpV2a8T+HgRd6v3lqFBNQTyMqkbgeUmx45Vt1dDY3D+MMWH
	mV2FF2UW1KGNCt3p9a+3Dr2IhUJKrU3I2GBMfTR7DSo9eyDxaFGVDbMyHb7mh58/mY9ZXynQSdPHN
	doEh0LD5JvwFLrJaQYtLDiPpxxwfULNUlbdInEb4z0jDRyvP0c1H/V6Z/tws1q/+2Q8nBuqj0SNW8
	SHv6ZoKycGbL9+8FsGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuEc-00000009d8W-0vGq;
	Tue, 13 Feb 2024 14:58:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuEY-00000009d5o-0Mdm
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:58:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40efcb37373so35495995e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707836284; x=1708441084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUAbcsBTGnXuZrFl0zL+fom+b/QnzF91JdS1snsJMaU=;
        b=eY4sqkcjE4uNSWP96AW7X8ljxHOF2ZotH1+uJ2l/gU1WEtruM+xbEIfs2i29j3DOMe
         xeCNdn7pR4JLXVWfuypgxNFCPwbV+QWThXpoyA7HFW5KJniSK1JGHsGWvpbm8GROpbBf
         WNPJp2KycFAPIgQqUbl4+liRy4WTx5p0z2JpoXMCCd3a6HI22W5ianMp8XRULtMoTEYr
         J66E8MlqW+RJ6E4I0vlORItXZKaivrmT5lx58STVR3aDXP2DIYPx9rlkxS2I2HsR5IGd
         /ChcQZ/vPiFokYKEaC1ynREfFGhIWTM0qGqn/LviMPpLelIQfx26zDa+pDon7bBxqwpj
         FNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836284; x=1708441084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUAbcsBTGnXuZrFl0zL+fom+b/QnzF91JdS1snsJMaU=;
        b=cV8GVQGB+JAEg0L1YTVy8OMvzbU0V4lK1GcwWN7BKVGfrjl9B1Q5KJ0JEp05SxYVql
         Jo6StDqacmpAtC+IVrwE4fwiIfqVOwD41WFQmguOF2hvBD5dN1YbqZzoLoXz7nY+wNtZ
         GYwxRJiexS4WFvqBlxJgeQMUvPpOoc2+DAcpuVqvV3XToSj6EgnCyPGsiiA6QdWH3/wv
         nHSux+d0y4JjObO1wNHpabPQr9RfmwWxS+O8BQzHwt8oGi/P+oY2c3HLWVmPMlwRKo9V
         oidl6FG+bZMzX6HxvWSoMshI1EY/bsjE955hws/Sdt2moOMdaSKhIM0ztl1D3onxykBQ
         GHgQ==
X-Gm-Message-State: AOJu0Yzu9dfbBhcx2XD/IeJk90/4DymIIwNYtiB3U4DbiMHtQcW6NADD
	xxEU90VkX15WvakTJKdh7HW/GmfseCRFLJW/WZHAmzLKz2jlCMW2/YEOvjURzDw=
X-Google-Smtp-Source: AGHT+IGqfRF0yh6VsToHHlqtzgQWSF70JzdGHamH70Hi33pe3KApe0JmU4lCyALR1YdPeCC4MuCzvQ==
X-Received: by 2002:a05:600c:3552:b0:40f:d422:930d with SMTP id i18-20020a05600c355200b0040fd422930dmr8263822wmq.33.1707836284268;
        Tue, 13 Feb 2024 06:58:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHCRGy++srjBDjMNAaQ800GvAvokm72yRTgdzlb6dzhi5HX7HLv05tgMClb8mblTILP3L7bFauUSHuphWdFjoky0Nsz6Lx+uyrSpzo7/4uv2XLprX5CpVBdmP7yZUjsVFete3Q1Yk78VP3+OHIFXt3ALbvspr2UPSYHv7tGUiAuztAvV74jjR32TOZjjVChusmt3SHfrku4jWOQJCCol9V1aY4XMLcjNfk1hCPuxQ434vIGhqfRT8F+B4u0pgTpQP7983WUUegcq9IzoL36+X3DvjL6IaolUvpKEyjM0wiizLuJa6pmOCabDqyNbn7cbPLSYm2dJgflaElFC6OoTB1NniaTdNgvJAmryH42klZCwW1Zga9mUes
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c458b00b00410504b582csm12072435wmo.11.2024.02.13.06.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:58:03 -0800 (PST)
Message-ID: <c7a88346-8221-4098-8112-a5e2c3eb5e98@freebox.fr>
Date: Tue, 13 Feb 2024 15:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <5ac4741d-766d-4b6d-95ac-669474d05e6a@freebox.fr>
 <20240213135115.GA1090963-robh@kernel.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240213135115.GA1090963-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_065806_188826_8B31EADB 
X-CRM114-Status: GOOD (  14.20  )
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

On 13/02/2024 14:51, Rob Herring wrote:

> On Mon, Feb 12, 2024 at 06:53:01PM +0100, Marc Gonzalez wrote:
>
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Add support for two variants of the fbx8am board.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  arch/arm64/boot/dts/amlogic/Makefile                       |  7 +++++++
>>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>>  3 files changed, 67 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index e9baa2cf02273..2fd7c7a18126f 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -81,3 +81,10 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>> +
>> +# Overlays
>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtbo
>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtbo
>> +
>> +# Enable support for DT overlays
>> +DTC_FLAGS_meson-g12a-fbx8am += -@
> 
> Overlays need to be applied to something in the kernel at build time.
> Applying is done the same way as composing object files for modules.

Hello Rob,

I don't quite understand your remark.
I copied what other platforms do:

$ git grep DTC_FLAGS_ arch/arm64/boot/dts/
arch/arm64/boot/dts/amlogic/Makefile:DTC_FLAGS_meson-g12a-fbx8am += -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra210-p2371-2180 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra210-p3450-0000 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra186-p2771-0000 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra186-p3509-0000+p3636-0001 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra194-p2972-0000 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra194-p3509-0000+p3668-0000 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra194-p3509-0000+p3668-0001 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3737-0000+p3701-0000 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3740-0002+p3701-0008 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3768-0000+p3767-0000 := -@
arch/arm64/boot/dts/nvidia/Makefile:DTC_FLAGS_tegra234-p3768-0000+p3767-0005 := -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am625-beagleplay += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am625-sk += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am62-lp-sk += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am62a7-sk += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am642-tqma64xxl-mbax4xxl += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-am6548-iot2050-advanced-m2 += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-j721e-common-proc-board += -@
arch/arm64/boot/dts/ti/Makefile:DTC_FLAGS_k3-j721s2-common-proc-board += -@


Are you saying that is NOT the way it should be done?

Regards



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
