Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2BBEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfHhLu8ocLLeQl7LWZBSQK36hmWnh7P/j6sQMA9XO6U=; b=HjKsROX6DC5npg
	SSl3V4zMU3xiViIkaJinZXiilaW5IzudIJ9q/a2yBzfxXpLzymsLlsQvO1nx5hYVpr7HBgEZUrMwI
	jUqIKZqpHnmmYBlwnKDQC5kCNT7NSDI533SeNdi5DkWoPjN938HKmuX6fUPxsHjv8bOKESn65jwBV
	RXzxs3gYSmDUazaFfsLDNqMmkf1xzp+F4F29OUKwODeweJBFZmmIf1xqLfjmCNZGAyEuywc50Rpwm
	+69V03WQU64mrJQtcenlEehybYllX6yGmgMfOVEtUxS6Wl9FbVQpRG35HFLEuHfsF5Krg2stXpwYE
	BtvwkGy3XOhqmu5ygDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQsb-00AnjR-2h;
	Thu, 20 Jul 2023 10:27:29 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQsX-00Anab-1T;
	Thu, 20 Jul 2023 10:27:27 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 52067120077;
	Thu, 20 Jul 2023 13:27:13 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 52067120077
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689848833;
	bh=k1AxALUOUAa6dGA6SXUccWu1sfcnyFNB59uw2qoEQLo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=fLGEqU8omiYKy0q7fpxdwxOhy8foodW/nUolQKNwZqIV+V7r7siAvRDKKaBspWk9Y
	 SWRWL6Biz3NK0O5j+G9AJJ3PFUKyTcKYvtes8znuAetkL/fWXWzAXwA5hpmM15C67m
	 D53/rGKc/1+y4AYCEmEc/LgfN7T7gNhmduy4cPNwqOb2SjIxpD5e2sK4R7dewPFSzG
	 myBUNk+3FVQ5SoYoO4hMDTZpFsqeGklPdgWer2yYqvsttrJSZPBTGLYuF1MyCKoUUM
	 eukiwI7r1+SHgeHK3Iv32N9XSjekjLLcwMQ6OnekWp+SwNtIBWL79VYvQlicJ1hToF
	 hSJsc1y7xg9tg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 20 Jul 2023 13:27:13 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 13:27:12 +0300
Date: Thu, 20 Jul 2023 13:27:12 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Huqiang Qin <huqiang.qin@amlogic.com>
CC: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: Add gpio_intc node and pinctrl node for
 Amlogic C3 SoCs
Message-ID: <20230720102712.qrepf7nhj7wk474s@CAB-WSD-L081021>
References: <20230720052054.3909902-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720052054.3909902-1-huqiang.qin@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178744 [Jul 20 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 524 524 9753033d6953787301affc41bead8ed49c47b39d, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lists.infradead.org:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/20 09:21:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/20 08:06:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/20 06:46:00 #21646672
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_032725_861828_C801F7CF 
X-CRM114-Status: GOOD (  18.74  )
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

Hello Huqiang!

Thank you for the patchset!

On Thu, Jul 20, 2023 at 01:20:54PM +0800, Huqiang Qin wrote:
> Add gpio interrupt controller device and pinctrl device.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 25 +++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 60ad4f3eef9d..4ad9c042f85c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -82,6 +82,31 @@ uart_b: serial@7a000 {
>  				clock-names = "xtal", "pclk", "baud";
>  			};
>  
> +			gpio_intc: interrupt-controller@4080 {
> +				compatible = "amlogic,meson-gpio-intc",
> +					     "amlogic,c3-gpio-intc";
> +				reg = <0x0 0x4080 0x0 0x0020>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				amlogic,channel-interrupts =
> +					<10 11 12 13 14 15 16 17 18 19 20 21>;
> +			};
> +
> +			periphs_pinctrl: pinctrl@4000 {

Please sort dts nodes by reg offset in the one bus declaration.

> +				compatible = "amlogic,c3-periphs-pinctrl";
> +				#address-cells = <2>;
> +				#size-cells = <2>;
> +				ranges;
> +
> +				gpio: bank@4000 {
> +					reg = <0x0 0x4000 0x0 0x004c>,
> +					      <0x0 0x4100 0x0 0x01de>;
> +					reg-names = "mux", "gpio";
> +					gpio-controller;
> +					#gpio-cells = <2>;
> +					gpio-ranges = <&periphs_pinctrl 0 0 55>;
> +				};
> +			};
>  		};
>  	};
>  };
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
