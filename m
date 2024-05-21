Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F267C25B7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 22:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1qraoZ33lQWIxTo5+CwskHO7YSt/3vjObrabdSg0gE=; b=yO9m5Lwoxlt5zR
	DYoaRZX+dWrQ4UE3BdO4nOItk7fBe8D1VQUYlS8xPesRQL72OtJg2W5kI5NZut+oQlchKOuQaF1VO
	1LK9lt4Iy5JxaTlPIUYVCxbWRklsLijQmpmx/Ig+TcckJWHk/bQLlBstiJftD/n1+zQylVH7TgPEO
	YnpCN9jsL9DOzEkeM/bd2Fk7Sufj1B1319mJ4eq2+jQpuMe99cH43Q8k3gKCN8gOQAjt0l/2fLl5c
	bhh2a3xAIVyCNjNPoNLxjNqCr0JoIqXFF6KQUv6aSK3m3ds1rMN0ebxB34U+ip0BlBnOlY1rzfEBr
	K1jBVNgpXYPl4HwWkPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9XoC-00000001EED-16EU;
	Tue, 21 May 2024 22:18:12 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Xo5-00000001ED4-0rqh;
	Tue, 21 May 2024 22:18:10 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B62CD10000F;
	Wed, 22 May 2024 01:17:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B62CD10000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1716329875;
	bh=IlVnMWoOm8OINmNC56cel4gwgIlkbosRXGc5fhbKMqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=IC/aGxvmS9k17J2eAcUiVR3k86n4j0Lq2Gb/oIGAYLYK0uPeXYfNBKv4N7xUjpw7x
	 LzZAyi6dLy5H9h3MG6dIBLBoZAHaw70sDtOYz71kRoK8J8mjIS2OpsU+65k0hWbke4
	 ENQH2NP7c2GD+TbRPQkxPNKn1BC8cMUaSckOvBVz4EYMRf/NngLLm3lHr7w6XpSAka
	 k5a6miT3WPDepPh0UsW0lvYQw5ER00KdlLDMLV/IzLX4GoJjbrAkxUjAmrHHvzMu3N
	 BvZ3ICUwH3kNnRTS8DSvq/QCfJV60LeXQMXhB1tBrUNWBocyt69PCoguuflIfUBf4S
	 3AK3f2qPeYPpw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 May 2024 01:17:55 +0300 (MSK)
Received: from [172.28.65.135] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 May 2024 01:17:55 +0300
Message-ID: <11ad766f-0fc7-4d26-aad6-a98095986b24@salutedevices.com>
Date: Wed, 22 May 2024 01:17:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH v5 2/2] arm64: dts: amlogic: Add
 Amlogic S4 PWM
To: <kelvin.zhang@amlogic.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Junyi Zhao <junyi.zhao@amlogic.com>,
	"kernel@salutedevices.com" <kernel@salutedevices.com>
References: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
 <20240521-s4-pwm-v5-2-0c91f5fa32cd@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240521-s4-pwm-v5-2-0c91f5fa32cd@amlogic.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185400 [May 21 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/21 08:41:00 #25230763
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_151806_681410_841F79A7 
X-CRM114-Status: GOOD (  14.00  )
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


Hello Kelvin, Junyi

On 5/21/24 11:31, Kelvin Zhang via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> Add device nodes for PWM_AB, PWM_CD, PWM_EF, PWM_GH and PWM_IJ
> along with GPIO PIN configs of each channel.
> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 207 ++++++++++++++++++++++++++++++
>   1 file changed, 207 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 10896f9df682..d0c170368892 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -292,6 +292,168 @@ mux {
>   					};
>   				};
>   
...
> @@ -449,6 +611,51 @@ i2c4: i2c@6e000 {
>   				status = "disabled";
>   			};
>   
> +			pwm_ab: pwm@58000 {
> +				compatible = "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x58000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_A>,
> +						<&clkc_periphs CLKID_PWM_B>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_cd: pwm@5a000 {
> +				compatible = "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5a000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_C>,
> +						<&clkc_periphs CLKID_PWM_D>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ef: pwm@5c000 {
> +				compatible = "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5c000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_E>,
> +						<&clkc_periphs CLKID_PWM_F>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_gh: pwm@5e000 {
> +				compatible = "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x5e000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_G>,
> +						<&clkc_periphs CLKID_PWM_H>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
> +			pwm_ij: pwm@60000 {
> +				compatible = "amlogic,meson-s4-pwm";
> +				reg = <0x0 0x60000 0x0 0x24>;
> +				clocks = <&clkc_periphs CLKID_PWM_I>,
> +						<&clkc_periphs CLKID_PWM_J>;
> +				#pwm-cells = <3>;
> +				status = "disabled";
> +			};
> +
>   			nand: nand-controller@8c800 {
>   				compatible = "amlogic,meson-axg-nfc";
>   				reg = <0x0 0x8c800 0x0 0x100>, <0x0 0x8c000 0x0 0x4>;
> 

Nodes on any bus, thus using unit addresses for children, shall be 
ordered by unit address in ascending order.

So the pwm_xx nodes should be placed between spicc0: spi@50000 and
i2c0: i2c@66000 nodes

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
