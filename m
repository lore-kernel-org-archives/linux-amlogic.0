Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99B9EE57D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+qudeE8ekT/yFYJhQ1/l+ntgXvxPyKDg8CO3BjN2LI=; b=PRUc6tvQfXdcAe
	iaHoI/cqY5pxF6HI3pHllhHd+3TA54aoLKNf6h59Qy7PNweuzTSUz/t6uTFZGlLp56SPnbZ6nEqyx
	X7ZfxqpjE+PethusKO0DWsnLX1B0sUJq5u2vHoOZJZo57s2K2qElgcmsd7kDFQUjByNhpf8DVYlZk
	uwpwSNx6Ss+WgzIlTOsaknYD+kbCBH0zAyaIU7lXvGVHZ51mFccvw3/PirBCng2qi3mJnU9Xm6zBe
	E7iRtx8UPgCLK8pLyqOVYiaegxacnGY98ZJK53XJkd/kV2moUNKNw8VVCl4HbcC6Lq//ZfMRtjeWr
	P/EFRyLNyvjPRh8eMKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVMf-0000000B7re-0Q0W;
	Wed, 11 Sep 2024 21:59:05 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVMc-0000000B7qk-01oO;
	Wed, 11 Sep 2024 21:59:03 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8046010001E;
	Thu, 12 Sep 2024 00:59:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8046010001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1726091940;
	bh=cdJ+IYoU3pvgqGac2TNQ0TifdmYXIl3dQHax/I3kpys=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=eRa/R0WtGmrs1McBKfIJV5RGaBtl3yb/YEbb4rxoup6CslBNLFr/JeXFU9O5J7+6b
	 aguNULO0XuI2sbclUVIFGWz1EVK91ismDh2llTy9AWu1qmsT+DVyUybyloxWkF9S3w
	 SriXGo6KZpRTO8isucJI72tnBe0KqtUL8MKomh0zsE2Eb6dn4deGAHc01b5ATmP5wZ
	 Z/+JKjqW+lK5ezNqAVFUr0cAQeaP5UH9757d1/h6am3rrq9nvQppdl5IMo8QgGtmGv
	 6CofW1KtWHemvTdDm8qCvTn06UFQZfq2Hl8EK+lrr/on1vhw7K3kwc1/+4Oez/lvMt
	 hxVS4IVYPoYag==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 12 Sep 2024 00:59:00 +0300 (MSK)
Message-ID: <d9dfa72d-b2d5-4772-b799-653c7b51ee87@salutedevices.com>
Date: Thu, 12 Sep 2024 00:58:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: meson: a1: add definitions for meson
 PWM
To: <neil.armstrong@linaro.org>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <20240710234116.2370655-4-gnstark@salutedevices.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240710234116.2370655-4-gnstark@salutedevices.com>
X-Originating-IP: [172.28.226.107]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187695 [Sep 12 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 32 0.3.32 766319f57b3d5e49f2c79a76e7d7087b621090df, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/11 19:25:00 #26555689
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_145902_412243_D04754F3 
X-CRM114-Status: GOOD (  15.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Neil

Please take a look at this patch. Appropriate bindings were merged recently.


On 7/11/24 02:41, George Stark wrote:
> The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF those
> can be connected to various digital I/O pins.
> 
> Each of 6 PWM is driven by individually selected clock parent and
> 8-bit divider. The PWM signal is generated using two 16-bit counters.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 215 ++++++++++++++++++++++
>   1 file changed, 215 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 85e56c021e99..0dc39fb8f59d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -307,6 +307,188 @@ mux {
>   					};
>   				};
>   
> +				pwm_a_pins1: pwm-a-pins1 {
> +					mux {
> +						groups = "pwm_a_x6";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_a_pins2: pwm-a-pins2 {
> +					mux {
> +						groups = "pwm_a_x7";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_a_pins3: pwm-a-pins3 {
> +					mux {
> +						groups = "pwm_a_f10";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_a_pins4: pwm-a-pins4 {
> +					mux {
> +						groups = "pwm_a_f6";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_a_pins5: pwm-a-pins5 {
> +					mux {
> +						groups = "pwm_a_a";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_b_pins1: pwm-b-pins1 {
> +					mux {
> +						groups = "pwm_b_x";
> +						function = "pwm_b";
> +					};
> +				};
> +
> +				pwm_b_pins2: pwm-b-pins2 {
> +					mux {
> +						groups = "pwm_b_f";
> +						function = "pwm_b";
> +					};
> +				};
> +
> +				pwm_b_pins3: pwm-b-pins3 {
> +					mux {
> +						groups = "pwm_b_a";
> +						function = "pwm_b";
> +					};
> +				};
> +
> +				pwm_c_pins1: pwm-c-pins1 {
> +					mux {
> +						groups = "pwm_c_x";
> +						function = "pwm_c";
> +					};
> +				};
> +
> +				pwm_c_pins2: pwm-c-pins2 {
> +					mux {
> +						groups = "pwm_c_f3";
> +						function = "pwm_c";
> +					};
> +				};
> +
> +				pwm_c_pins3: pwm-c-pins3 {
> +					mux {
> +						groups = "pwm_c_f8";
> +						function = "pwm_c";
> +					};
> +				};
> +
> +				pwm_c_pins4: pwm-c-pins4 {
> +					mux {
> +						groups = "pwm_c_a";
> +						function = "pwm_c";
> +					};
> +				};
> +
> +				pwm_d_pins1: pwm-d-pins1 {
> +					mux {
> +						groups = "pwm_d_x15";
> +						function = "pwm_d";
> +					};
> +				};
> +
> +				pwm_d_pins2: pwm-d-pins2 {
> +					mux {
> +						groups = "pwm_d_x13";
> +						function = "pwm_d";
> +					};
> +				};
> +
> +				pwm_d_pins3: pwm-d-pins3 {
> +					mux {
> +						groups = "pwm_d_x10";
> +						function = "pwm_d";
> +					};
> +				};
> +
> +				pwm_d_pins4: pwm-d-pins4 {
> +					mux {
> +						groups = "pwm_d_f";
> +						function = "pwm_d";
> +					};
> +				};
> +
> +				pwm_e_pins1: pwm-e-pins1 {
> +					mux {
> +						groups = "pwm_e_p";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_e_pins2: pwm-e-pins2 {
> +					mux {
> +						groups = "pwm_e_x16";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_e_pins3: pwm-e-pins3 {
> +					mux {
> +						groups = "pwm_e_x14";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_e_pins4: pwm-e-pins4 {
> +					mux {
> +						groups = "pwm_e_x2";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_e_pins5: pwm-e-pins5 {
> +					mux {
> +						groups = "pwm_e_f";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_e_pins6: pwm-e-pins6 {
> +					mux {
> +						groups = "pwm_e_a";
> +						function = "pwm_e";
> +					};
> +				};
> +
> +				pwm_f_pins1: pwm-f-pins1 {
> +					mux {
> +						groups = "pwm_f_b";
> +						function = "pwm_f";
> +					};
> +				};
> +
> +				pwm_f_pins2: pwm-f-pins2 {
> +					mux {
> +						groups = "pwm_f_x";
> +						function = "pwm_f";
> +					};
> +				};
> +
> +				pwm_f_pins3: pwm-f-pins3 {
> +					mux {
> +						groups = "pwm_f_f4";
> +						function = "pwm_f";
> +					};
> +				};
> +
> +				pwm_f_pins4: pwm-f-pins4 {
> +					mux {
> +						groups = "pwm_f_f12";
> +						function = "pwm_f";
> +					};
> +				};
> +
>   				sdio_pins: sdio {
>   					mux0 {
>   						groups = "sdcard_d0_x",
> @@ -648,6 +830,28 @@ uart_AO_B: serial@2000 {
>   				status = "disabled";
>   			};
>   
> +			pwm_ab: pwm@2400 {
> +				compatible = "amlogic,meson-a1-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x2400 0x0 0x24>;
> +				#pwm-cells = <3>;
> +				clocks = <&clkc_periphs CLKID_PWM_A>,
> +					 <&clkc_periphs CLKID_PWM_B>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +				status = "disabled";
> +			};
> +
> +			pwm_cd: pwm@2800 {
> +				compatible = "amlogic,meson-a1-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x2800 0x0 0x24>;
> +				#pwm-cells = <3>;
> +				clocks = <&clkc_periphs CLKID_PWM_C>,
> +					 <&clkc_periphs CLKID_PWM_D>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +				status = "disabled";
> +			};
> +
>   			saradc: adc@2c00 {
>   				compatible = "amlogic,meson-g12a-saradc",
>   					"amlogic,meson-saradc";
> @@ -732,6 +936,17 @@ sec_AO: ao-secure@5a20 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			pwm_ef: pwm@5400 {
> +				compatible = "amlogic,meson-a1-pwm",
> +					     "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5400 0x0 0x24>;
> +				#pwm-cells = <3>;
> +				clocks = <&clkc_periphs CLKID_PWM_E>,
> +					 <&clkc_periphs CLKID_PWM_F>;
> +				power-domains = <&pwrc PWRC_I2C_ID>;
> +				status = "disabled";
> +			};
> +
>   			clkc_pll: pll-clock-controller@7c80 {
>   				compatible = "amlogic,a1-pll-clkc";
>   				reg = <0 0x7c80 0 0x18c>;

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
