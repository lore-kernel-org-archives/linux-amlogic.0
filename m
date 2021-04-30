Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02417C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:17:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E5D660FD9
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E5D660FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cHfDk4qLYWA29Xj1dzNErsZUGasKmN8PDI7HiP8J894=; b=a7XnK3l6tNpPQhKMwVW4LEZlj
	5Mk9BcHlecPVhwmYzSZG/DHDdDF1va+YoE/PX7IAGFQRZI02OjzR8SCcBriXXIXUlGkUqgP06D1Xu
	GIMgeFYrxGhCrIvPi/6fPoFjvQI2Ny+PLxZUS6wUyMs4rnwaJq7Jfe0HrtpZzvpdo9dz3b21n9VB6
	EovJTZmTDHBHoGrHGLqqQSKdB/m44q8jjDBDdCGR9KUCHmMHIq1h9ICXWCxjYW9rIwFEXKdeT0eVX
	3GX3NSbcoBUBlpslkSbphN65rR7Jp+k1fMhFS8v5zq9MR+m/fVOqVBJLq2Qe4xmXW1jtXCHa9c/hj
	v8sB5GbAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcOKk-007UE7-D2; Fri, 30 Apr 2021 08:17:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOKX-007UDQ-Pn
 for linux-amlogic@desiato.infradead.org; Fri, 30 Apr 2021 08:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=kTfqtxl7Dvfhd1Z0f4lYwKHZLG/TReZfomqC8/c4JTw=; b=fHQcO1jm3CUbEUWKpkL3GmMDm5
 5OIrs2AbMLAbCHr5mVnYVReAOPsU7RUeHuzFS8Lch8XVuV7AFxRfmd4oUujqVZtdOKpOgsxzDq1I8
 t4HlFPaH8S2uJHLg9Rhs1o/qShIARkQ/VThqug9mXTr0LEhb9QtXbyw6kugwXk28zvbTfdjzON5E7
 yuxPBqyIHSlRXtDelCk0tj+BvRwmEMGzu9SNJ4OCT9oFpf3OJM+DFDlYMeqRXm5I3kBJkX7qwoL6v
 DcA14GWBa6sbCHRfpI3DkP1wx7NBOEiDoMkPShs9br7XZxO7tOkpQKFoZiPUWUhLpdZH6BxF/qm4V
 Sjsn7EGQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOKU-001EgH-9r
 for linux-amlogic@lists.infradead.org; Fri, 30 Apr 2021 08:16:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so1206149wmq.4
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Apr 2021 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kTfqtxl7Dvfhd1Z0f4lYwKHZLG/TReZfomqC8/c4JTw=;
 b=vwCPR0krsg2zjfEDSkgSrUxntOxtAUmL2VhNRDGfV5M7tFF2RuWzg2OGqP/MQaZ3i0
 8q1d+BTlpk+c/sx+wc6FZjef+S473QznEBaXzoR0csM1UZZT21a7vcE3sNJErz91q9ta
 yFldHktFnNWvnygXb4Bwb5LUrC48xXy554YiEL8Bwrs/Cygl+4YcuCUDRN9EA5SY+Gw1
 PDipIzqGekvqniaoXrvRI2ufqNecEBQMjzPqJq2+Lu8WIQVWiijsxMySDUpK32PgMm6q
 Y2AFK7o+QnwgKtZAQZPGoySBd9ik4uV1Bux5m3DGuRboldKBJ5Zq21gFzT4/GunKaxrd
 6GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kTfqtxl7Dvfhd1Z0f4lYwKHZLG/TReZfomqC8/c4JTw=;
 b=XUcZz1HjpSuDpnGRUvR4P0arRKHWiD8b61cx8pRTAuLWKIbcQmdHGn7PY7yQQ6Jk7U
 ei6pvzFQrbVTY6LjS7804+j9UQ03NswnPEMqpmijmXRcguc0THNjlgVP8wpR1l5SXzQp
 P9Nk7xF5vjQzVbgltUjqp4Rsl4i5I5dzUQyGco/+JR0aBHyCZt8rJebMbDDiy0/0V/K5
 vl/jadHk4h/CxrisUhvftcBw8nAPZSB3IrjTSIcc1EpBgMyFVzscC9VLcNOeIuTmAjqC
 5DM/YuqctsM+5rqJq45ZyHiWMZ2JESi1Jf2n9ve/JHn+sjkMOzRWQ/PlBtx+q5OHSnyz
 Tu2g==
X-Gm-Message-State: AOAM533bID+zktGaZmfyFPmJXLrJF+qm4/LdTUGFRVNaaKeruV//V6Tc
 XINV7aWiyWwxgWxyh95XUyNXOg==
X-Google-Smtp-Source: ABdhPJzqwyf/ue4KIFNecA/G9xSrqxU0lMhIIhkNb/siKozSBtuH+osOfqWUTsqAUXChkVnBDhwWfA==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr14991668wmq.145.1619770610092; 
 Fri, 30 Apr 2021 01:16:50 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4a89:8c32:4adc:fc67?
 ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id v18sm1568316wro.18.2021.04.30.01.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 01:16:49 -0700 (PDT)
Subject: Re: [PATCH 3/3] arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
 <20210429170404.3616111-4-narmstrong@baylibre.com>
 <CAFBinCDQeTU0ss=oNmjX78MPyNZmmCt-haojNNcQqkjJUmJYKQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <cafdf662-6f15-8e16-7752-5740f28b6682@baylibre.com>
Date: Fri, 30 Apr 2021 10:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDQeTU0ss=oNmjX78MPyNZmmCt-haojNNcQqkjJUmJYKQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_011654_388642_3C3B2B43 
X-CRM114-Status: GOOD (  36.18  )
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

Hi Martin,

On 29/04/2021 23:30, Martin Blumenstingl wrote:
> Hi Neil,
> 
> thanks for adding support for the BPI-M5!
> I had this on my TODO-list for a long time but didn't have enough time
> so far. so it's great to see this patch now :-)
Same, so it's nearly done now !

> 
> On Thu, Apr 29, 2021 at 7:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +       adc_keys {
>> +               compatible = "adc-keys";
>> +               io-channels = <&saradc 2>;
>> +               io-channel-names = "buttons";
>> +               keyup-threshold-microvolt = <1800000>;
>> +
>> +               button-onoff {
> maybe just "key" (as you used below for SW1)?

Fixed

> 
>> +                       label = "SW3";
>> +                       linux,code = <BTN_3>;
>> +                       press-threshold-microvolt = <1700000>;
>> +               };
>> +       };
> 
>> +       /* TOFIX: handle CVBS_DET on SARADC channel 0 */
> it's great to see that after many years at least some boards finally
> can detect whether the CVBS connector is plugged it

Yes, it's also available on Odroid-N2(+), so now no excuse for not supporting it !

> 
>> +       memory@0 {
>> +               device_type = "memory";
>> +               reg = <0x0 0x0 0x0 0x40000000>;
>> +       };
> note to self: u-boot will update this from 1GiB to 4GiB
> 
>> +       flash_1v8: regulator-flash_1v8 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "FLASH_1V8";
> BPI-M5-SCH-V10-Release.pdf schematics are calling this EMMC_1V8. I
> suggest to use that name so it's easier to compare this with the
> schematics in the future

Done

> 
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <1800000>;
>> +               vin-supply = <&vddao_3v3>;
>> +               regulator-always-on;
>> +       };
>> +
>> +       dc_in: regulator-dc_in {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "5V";
> maybe use "DC_IN" here as well so the node-name matches what we see in
> userspace/kernel logs?

Done

> 
>> +       vddcpu: regulator-vddcpu {
>> +               /*
>> +                * SY8120B1ABC DC/DC Regulator.
>> +                */
>> +               compatible = "pwm-regulator";
>> +
>> +               regulator-name = "VDDCPU";
>> +               regulator-min-microvolt = <721000>;
>> +               regulator-max-microvolt = <1022000>;
> the vendor .dts has:
>   regulator-min-microvolt = <690000>;
>   regulator-max-microvolt = <1050000>;
> which also matches meson-sm1-sei610.dts (which uses the same regulator IC)

Done, thanks

> 
> [...]
>> +&ethmac {
>> +       pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
>> +       pinctrl-names = "default";
>> +       status = "okay";
>> +       phy-mode = "rgmii";
>> +       phy-handle = <&external_phy>;
>> +       amlogic,tx-delay-ns = <2>;
> I haven't checked their u-boot code but some of the newer Amlogic BSPs
> seem to let the PHY add the TX delay (which is also what the netdev
> maintainers recommend)
> that can be achieved by setting:
>   phy-mode = "rgmii-txid";
> and deleting the "amlogic,tx-delay-ns" property

Done, but what about when we use mainline U-boot here ?

> 
>> +&gpio {
>> +       gpio-line-names =
>> +               /* GPIOZ */
>> +               "", "", "", "", "", "", "", "",
> GPIOZ_0 to GPIOZ_15:
> - ETH_MDIO
> - ETH_MDC
> - ETH_RXCLK
> - ETH_RX_DV
> - ETH_RXD0
> - ETH_RXD1
> - ETH_RXD2
> - ETH_RXD3
> - ETH_TXCLK
> - ETH_TXEN
> - ETH_TXD0
> - ETH_TXD1
> - ETH_TXD2
> - ETH_TXD3
> - ETH_INTR
> - ETH_NRST
> 
>> +               /* GPIOH */
>> +               "", "", "", "", "",
> GPIOH_0 to GPIOH_4:
> - HDMI_SDA
> - HDMI_SCL
> - HDMI_HPD
> - HDMI_CEC
> - VL-RST_N
> 
>> +               "CON1-P36", /* GPIOH_5 */
> GPIOH_6 to GPIOH_8:
> - VL-PWREN
> - WiFi_3V3_1V8
> - TFLASH_VDD_EN
> 
>> +               /* BOOT */
>> +               "", "", "", "", "", "", "", "",
>> +               "", "", "", "", "", "", "", "",
> BOOT_0 to BOOT_13:
> - eMMC_D0
> - eMMC_D1
> - eMMC_D2
> - eMMC_D3
> - eMMC_D4
> - eMMC_D5
> - eMMC_D6
> - eMMC_D7
> - eMMC_CLK
> - (BOOT_9 is unused)
> - eMMC_CMD
> - (BOOT_11 is unused)
> - eMMC_RST#
> - eMMC_DS
> 
>> +               /* GPIOC */
>> +               "", "", "", "", "", "", "", "",
> GPIOC_0 to GPIOC_7:
> - SD_D0_B
> - SD_D1_B
> - SD_D2_B
> - SD_D3_B
> - SD_CLK_B
> - SD_CMD_B
> - CARD_EN_DET
> - (GPIOC_7 is unused)
> 
> 
>> +&gpio_ao {
>> +       gpio-line-names =
>> +               /* GPIOAO */
>> +               "DEBUG TX", /* GPIOAO_0 */
>> +               "DEBUG RX", /* GPIOAO_1 */
>> +               "SYS_LED2", /* GPIOAO_2 */
>> +               "UPDATE_KEY", /* GPIOAO_3 */
>> +               "CON1-P40", /* GPIOAO_4 */
>> +               "",
> GPIOAO_5 is IR_IN
> 
>> +               "TF_3V3N_1V8_EN", /* GPIOAO_6 */
>> +               "CON1-P35", /* GPIOAO_7 */
>> +               "CON1-P12", /* GPIOAO_8 */
>> +               "CON1-P37", /* GPIOAO_9 */
>> +               "CON1-P38", /* GPIOAO_10 */
>> +               "SYS_LED", /* GPIOAO_11 */
>> +               /* GPIOE */
>> +               "", "", "";
> GPIOE_0 to GPIOOE_2:
> - VDDEE_PWM
> - VDDCPU_PWM
> - TF_PWR_EN

I was to lazy to do that, so thanks !

> 
>> +&usb2_phy0 {
>> +       phy-supply = <&dc_in>;
>> +};
>> +
>> +&usb2_phy1 {
>> +       /* Enable the hub which is connected to this port */
>> +       phy-supply = <&vl_pwr_en>;
>> +};
> I think technically we'd need to use AVDD18_USB here (that said, I
> chose the same approach as you are using here before..)
> USB bus devices (AFAIK) still need to be detected before any
> device-tree properties can be applied and there's (again AFAIK) still
> no pwrseq concept.
> so I guess for now this is the way to go as there's enough comments
> about it in your patch

yeah we'll see if there is proper pwrseq method to fix that (and the hub reset)

Thanks for the review,

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
