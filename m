Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA542C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qITLtxRGFmLf7n1Sq7DQ2JN4k1VhleDWanEWt64Das=; b=xyFuO/o8nZlkyt
	z8yQ77A4RPeHrXMhvCZ0/t+VU1jj5Zi952bpQZu4BjZHBQ9MiEH+o+d9BFVSyrbldjGwWTpRn8ajU
	QLdrhe/ppZQdhzAFyCVVyQ5PSmxd1emCFGmhG9huc+x7cbVDd7iqiUsbvhgU1vTw3ZQXdOJSj1d4d
	o9YQWkMskDGMOpm09AWXjgh5LZUoCAWdI6VE8bGwdFtPKDnBVLYivbGAJa01yWlyZl6UTHcgFluUT
	RuSzGvfxAFGzRvARRTRlUErmBtzZqVVg0XN7CAAqESN21v+h6L/MHjp4rrrr5F7dcn1aedQ6sRu6U
	2PKfIHr8cmn/5xLkOlaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlyX-008XZL-MT; Wed, 25 Jan 2023 20:02:29 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKlyK-008XVP-RO; Wed, 25 Jan 2023 20:02:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id d14so14506878wrr.9;
        Wed, 25 Jan 2023 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpQiYKewfM75LgZx2CGS8jz1svX6UbmzP2z2lvxLxDE=;
        b=a5gQiL4vwHYxarBjINRBH4tzxGyOCLnWp00lqjv6prz+avlW5QmltN37SqMs6H6G76
         7yr+HvlMna6Lwt91idASeao21M+zT/erDeevNbMeBTkcCZk/RCApZNvwSsllOyaDFvf/
         Nxm1WTO9e1XXMbXeWXgit3BikzxvAkyJeGNMIdytZ4BERFOF5+2IuzI9ZLG6ts4lOUZg
         zLRA52zdgjro2Dz1nrfv2RTvvUTOTq56zBe7Rsal4WyGh6SzRlioCyFf+tMJ+EboS+Qj
         ZaKztZopavHkJgvUT6sl6s4yAhKHN+9UGyG/4+4VrsT96ArkybfgjqpyjG3KRHtyPM3q
         Cb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpQiYKewfM75LgZx2CGS8jz1svX6UbmzP2z2lvxLxDE=;
        b=j+tllp/OXBX85L9RHEHWjzEpMM4kvI8aS3+qvyXVG33U1leDzQHmHrTS9fd67pP4x6
         2AxrcprcRBeenm7HN5qr6eMJTbAOVozrFfljxteusHPEsZoAP5N9tEnH/ctM+GDhEhRg
         E18EFdVtj0D7mZoLMr5qJi354O+s/OeawT0oci0NIoFLFUiwodZKaIr2YmFsRvBe80uQ
         zjCPMJwxNRkWuPvqaOAjt1HVxPrMdZdHGLxT3eAYlf4mGOn8BIstp/us25m374FZntrK
         f/Wtl532AA356tY2CJql1UDgoBjaSVKzfQZAyXyU/wIUuovzbV3qojindzwHmXKUvyLe
         /IYA==
X-Gm-Message-State: AO0yUKWTGmmrzASnPlN1kOFM9LVW7WXSDeE7j8DxNe5im1+UAwYR9Vh3
	LlDP/Os29ONz7hTZd24mHiU=
X-Google-Smtp-Source: AK7set+VtmsiILSUq/hTnS3Nys6aOIhGVTP/Z/nn8sy5cMhxWx3fajxSdyNs1ZNSBzu8v5j7t+dtvQ==
X-Received: by 2002:a5d:5a87:0:b0:2bf:b7ca:8ae2 with SMTP id bp7-20020a5d5a87000000b002bfb7ca8ae2mr3822237wrb.15.1674676932918;
        Wed, 25 Jan 2023 12:02:12 -0800 (PST)
Received: from ?IPV6:2a01:c22:720f:5a00:b1aa:59d6:6587:3051? (dynamic-2a01-0c22-720f-5a00-b1aa-59d6-6587-3051.c22.pool.telefonica.de. [2a01:c22:720f:5a00:b1aa:59d6:6587:3051])
        by smtp.googlemail.com with ESMTPSA id h18-20020adffd52000000b002bfc24e1c55sm303748wrs.78.2023.01.25.12.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 12:02:12 -0800 (PST)
Message-ID: <0f702de6-91f8-f01f-2ea5-6b1d9ab325e2@gmail.com>
Date: Wed, 25 Jan 2023 21:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: amlogic: Fix SDIO interrupt and make it
 level-sensitive
To: Peter Suti <peter.suti@streamunlimited.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
 <CACMGZgbtX7zgy2USO5O0qY54tGW+d2cZ6qcUUbb-uOFAtfqOVw@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CACMGZgbtX7zgy2USO5O0qY54tGW+d2cZ6qcUUbb-uOFAtfqOVw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_120216_951721_CE531EFA 
X-CRM114-Status: GOOD (  18.86  )
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

On 25.01.2023 09:30, Peter Suti wrote:
> On Wed, Jan 25, 2023 at 8:00 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> SDIO specification defines that the interrupt is level-sensitive.
>> Fix the interrupt trigger type for emmc_a accordingly.
>> See comment at beginning of the file wrt which is the SDIO port.
>> mmc2 = &sd_emmc_a; /* SDIO */
>>
>> The usage of edge-triggered interrupts lead to lost interrupts under load,
>> see [0]. This was confirmed to be fixed by using level-triggered
>> interrupts.
>>
>> Note:
>> SDIO interrupt support was added in Linux just recently, however other
>> users of this dts may be affected too.
>>
>> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
>>
>> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
>> Reported-by: Peter Suti <peter.suti@streamunlimited.com>
>> Tested-by: Peter Suti <peter.suti@streamunlimited.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - rebase considering recent node name change sd -> mmc for sd_emmc_a
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
>>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> index 1a931d5c2..c09eb9f6f 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> @@ -2324,7 +2324,7 @@ uart_A: serial@24000 {
>>                 sd_emmc_a: mmc@ffe03000 {
>>                         compatible = "amlogic,meson-axg-mmc";
>>                         reg = <0x0 0xffe03000 0x0 0x800>;
>> -                       interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
>> +                       interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>>                         status = "disabled";
>>                         clocks = <&clkc CLKID_SD_EMMC_A>,
>>                                  <&clkc CLKID_SD_EMMC_A_CLK0>,
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> index a79a35e84..ae1a5a568 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
>> @@ -603,7 +603,7 @@ apb: apb@d0000000 {
>>                         sd_emmc_a: mmc@70000 {
>>                                 compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
>>                                 reg = <0x0 0x70000 0x0 0x800>;
>> -                               interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
>> +                               interrupts = <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>>                                 status = "disabled";
>>                         };
>>
>> --
>> 2.39.1
>>
> 
> Please also change arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> sd_emmc_b because it was tested on that platform.
> 
I'm not sure whether sd_emmc_b is used as SDIO port on all axg systems.
Maybe one of the maintainers can comment on it.

If systems may use sd_emmc_b differently, then overriding the interrupt
trigger type should be done in the respective board file that includes
meson-axg.dtsi.

>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
