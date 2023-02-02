Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE5CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXZbpBnE2NmS3u4sZlyTsJA8ktUDoSnHQKMnm8Pggwo=; b=3uSylncEXdisLa
	2O95iXyNQGxSui1gOkE1jqH54mg7oAwcoU9rEUMZYqq/Toqsue8fVAFNYeeTlK1YKlhtcl35XyjQT
	M4HVZ+6p/ur7XT7MTX2SiKECwVSJOlu0xVsv+Q+KYe8Juh3XnRAxvPefV9LWZmUWdpYtcnBZuIGfd
	JkRpGs9tpmrH3wa9lESmdAUPGRlvnNP+/OkBEtCC3y+Gh6OGu0xi8fxSipIpR8sya1PJdp9oS8O/9
	HV2qLvMSFF6Tx3rB+bNscmaY+RI3ZPmHuNs0MkLvj9FRbysy96ofvOaxAdrl4vxj7lEmdQK4DP+XW
	VicfQlJitbwWAY07elIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNaRG-00G7vl-2r; Thu, 02 Feb 2023 14:19:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNaRC-00G7ux-Ra; Thu, 02 Feb 2023 14:19:44 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 1F1215FD02;
	Thu,  2 Feb 2023 17:19:40 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1675347580;
	bh=38mW2MG6AD/VgdIfDWi13KtnVGKK3tE+NF61HxE3xIU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=K6T8wv/aPOjMRcvDwTGNk7/CMaOoKbty7sqlnSNHk9BevAHUUMlQM8hOrWAdyOLtG
	 tFgj5q7NLiaGjmm0Lji1rXo5OUMVvd51W06myxIY/1rJp+jN7weeeiSSYGOSDPGErz
	 BcyPf3nEabm2t0NPkPRapXBfYl0LbyKw8BGvelLVCMbyV6nnbSM8TlLcst1i9k6tm8
	 eZKhFaSNLYP6NgmBTt66bchhJdO9eZg+s8RS+jFg/hILQEuRChT5+Vz1S26nAgy57o
	 JKS1LEIqIxIVI+APbqmZBh0vkmVx8rX+Ca2Ar/BnO28XGgozJRRwAx5HH1xYcXiUfs
	 sCotoka1Nh3/g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  2 Feb 2023 17:19:39 +0300 (MSK)
From: Alexey Romanov <AVRomanov@sberdevices.ru>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "martin.blumenstingl@googlemail.com"
	<martin.blumenstingl@googlemail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Thread-Topic: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Thread-Index: AQHZNxDMFNGdYZWqIECM18Y2pLjN2K67gk+A
Date: Thu, 2 Feb 2023 14:19:39 +0000
Message-ID: <20230202141931.s75et3ttrypes7m4@cab-wsm-0029881>
References: <20230202141520.40003-1-avromanov@sberdevices.ru>
In-Reply-To: <20230202141520.40003-1-avromanov@sberdevices.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.12]
Content-ID: <4469070D0C9B964F9BA2130E92985FE5@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/02 10:55:00 #20831577
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_061943_111463_11EB01C8 
X-CRM114-Status: GOOD (  12.33  )
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

Sorry, this patch has the wrong subject (I am tolking about1/2), 
there is no second patch.

On Thu, Feb 02, 2023 at 05:15:20PM +0300, Alexey Romanov wrote:
> Add gpio interrupt controller node.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 6268c323a810..a04ddf0f4cd3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -158,6 +158,16 @@ clkc_pll: pll-clock-controller@7c80 {
>  					 <&clkc_periphs CLKID_XTAL_HIFIPLL>;
>  				clock-names = "xtal_fixpll", "xtal_hifipll";
>  			};
> +
> +			gpio_intc: interrupt-controller@0440 {
> +				compatible = "amlogic,meson-a1-gpio-intc",
> +					     "amlogic,meson-gpio-intc";
> +				reg = <0x0 0x0440 0x0 0x14>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				amlogic,channel-interrupts =
> +					<49 50 51 52 53 54 55 56>;
> +			};
>  		};
>  
>  		gic: interrupt-controller@ff901000 {
> -- 
> 2.38.1
> 

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
