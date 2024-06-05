Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBD3C25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrTFC6/I30Nfutg4BdgjsZDHy986Pi7UIQvZ1vVjslY=; b=BR8i0k+KkRS7ld
	O2PIT6JhnIiSbKg7ezD5TdRN6hMHSgLUH6uu7L3UomIWxbDl5Srk8FZoG7uzhRwisUEzg545+W/+o
	RHPnoydojEymYTTTkhQjU+GhSyaTFzEBZSFdh7dy6Fx0s+FJxAQyg8UKI3q076sS6oNn/kQ9XdH/r
	90Ez1KXTRzzWbIJlgE+oZYnDU5iUOqB5IaV/tKTsGx4lrxjhI6e/QFCoY8TUdzpG8noWYIRUyZNVh
	DR8KM4HesKGrazLnMYhODgod7b6fT3ypqp0vkc7Czgc1/vTxlv4LYgo28UwxkyaemTUl3DZid9YlJ
	IlM8+RmH8fq1WSLsuEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmJa-00000005HkW-273T;
	Wed, 05 Jun 2024 08:48:14 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEmJV-00000005HhA-3WO8;
	Wed, 05 Jun 2024 08:48:12 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 90E1C12000E;
	Wed,  5 Jun 2024 11:48:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 90E1C12000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1717577283;
	bh=qhnCf7tWXo/37Lgb8g/EWxYO4igTg0awCL+nXcJWkbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=vKFf8t/qhkeNbGpgQme6pfmQPHTH5qqHhpQYKCtVaiNJuHq+OYvTGS6unXaPEK2PJ
	 fy7oC7iqQn4uRHeRyWktMrso80diQ0OGkOb9UKDkhGblyk1forBlgzwS2uGvPXWB0r
	 VQ0kNrpc0nr6Vzhtouf3G6+WpHOohVM7czHiGi7Z+s9dBYudL0kfYZ4Rg/3qs0aMcy
	 PF5zMhjMX+sCkdmruG+54y3kXKZRlKKrgqsM4FPEO59OOcdvYGt8kU8foyu4gimKDI
	 xqdZnP7COn9Cw0vVEBt0m1Yh5W+/J4hklU0FEAL+oMbHftEtM2uktGxqz0wt2hJJDi
	 4Akr0fs3zlwVg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jun 2024 11:48:03 +0300 (MSK)
Received: from [172.28.225.88] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 5 Jun 2024 11:48:02 +0300
Message-ID: <faebf74c-cfeb-48c5-8db3-0f51ed6bd9eb@salutedevices.com>
Date: Wed, 5 Jun 2024 11:48:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH v7 2/2] arm64: dts: amlogic: Add
 Amlogic S4 PWM
To: <kelvin.zhang@amlogic.com>
CC: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Kevin Hilman
	<khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Conor
 Dooley <conor+dt@kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Junyi Zhao
	<junyi.zhao@amlogic.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20240605-s4-pwm-v7-0-e822b271d7b0@amlogic.com>
 <20240605-s4-pwm-v7-2-e822b271d7b0@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240605-s4-pwm-v7-2-e822b271d7b0@amlogic.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185732 [Jun 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/05 04:05:00 #25448641
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_014810_686003_9D105D78 
X-CRM114-Status: GOOD (  12.86  )
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

Reviewed-by: George Stark <gnstark@salutedevices.com>

On 6/5/24 05:44, Kelvin Zhang via B4 Relay wrote:
> From: Junyi Zhao <junyi.zhao@amlogic.com>
> 
> Add device nodes for PWM_AB, PWM_CD, PWM_EF, PWM_GH and PWM_IJ
> along with GPIO PIN configs of each channel.
> 
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 199 ++++++++++++++++++++++++++++++
>   1 file changed, 199 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 10896f9df682..b686eacb9662 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -312,6 +312,160 @@ mux {
>   					};
>   				};
>   
> +				pwm_a_pins1: pwm-a-pins1 {
> +					mux {
> +						groups = "pwm_a_d";
> +						function = "pwm_a";
> +					};
> +				};
> +
> +				pwm_a_pins2: pwm-a-pins2 {
...


-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
