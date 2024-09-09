Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F9FECE57A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBa3zKQOoQ3tmu68og2v2NGFSYidcgzcct1SlRdYzrw=; b=yxJDzKTXzUyp39
	pPS/3ZW1/IybTq1c9GKataQaG/xVvWy4/Uw24teI7qXAsWw0BECWpNPEErgB0it/SoAhR8hspI/AT
	ZmaWhFCpCYoMyig47evVvxFfoiPyYRxoEMAWiD8jd1B+7ArM/9xImO/33dzxDUs5idgIFYhcpT2Eg
	d+7raj2uaI5J9GwjCEHujD8aAe2Ztx/dGOzF5MXjPWIPny5Zr3hsIXh/T32PNKf31V18BE42bo8e1
	GHfYdLzb2PAFj4Y20CjV+DnLNPRqR9CGLfqdDfRfhFY2pPgwYECDgaBx4gA+b0tGSwbw8P1yynkql
	Ci1yLy+pzTA+LiU7QN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndvQ-00000001x8S-1O7P;
	Mon, 09 Sep 2024 12:55:24 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndpn-00000001vYm-43E8;
	Mon, 09 Sep 2024 12:49:38 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 28265120004;
	Mon,  9 Sep 2024 15:49:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 28265120004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1725886171;
	bh=awRRfm8rHC7gTrRPbeDo7AQhEId5BvBbvaNmDJyoOtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=HwgsT1B8gsB1Fa2ATlyDFo/sgssLM/3EC0foIMhOu5iQMtaPSTG+E+dF/2ACPv0tu
	 kNUao55Lk9YYwj6YKJQZ1lfyLHFsF1a3DEpZ0d23HeCG19xucwhWEQsSMMm7Dc+OKU
	 cE7V7c3D88/23R5UJzTxrOZHQYxAIFNalw9s4pomdLevu2+GhoB25XtRqvgo5BVhtr
	 QatqxC+6g9d0h7HhcToCn46uk8f5Nl10sh7LoQDldbyw9fWb9VxD79fUXzbPO5k1TC
	 q8sKx12Ba4izUou5VZWONyTW/dM+ykaGo+jePewtJN0NBrL/lbeJmcqJaAg2g2YlDl
	 remHYvJ5Js7oQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  9 Sep 2024 15:49:30 +0300 (MSK)
Message-ID: <fcd005d2-dba4-4980-8d0d-f55632c7a6d9@salutedevices.com>
Date: Mon, 9 Sep 2024 15:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error] [PATCH 1/2] dt-bindings: pwm: amlogic:
 Document C3 PWM
To: <kelvin.zhang@amlogic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman
	<khilman@baylibre.com>, <linux-pwm@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Rob Herring
	<robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Heiner Kallweit
	<hkallweit1@gmail.com>
References: <20240906-c3-pwm-v1-0-acaf17fad247@amlogic.com>
 <20240906-c3-pwm-v1-1-acaf17fad247@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240906-c3-pwm-v1-1-acaf17fad247@amlogic.com>
X-Originating-IP: [172.28.226.107]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187629 [Sep 09 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 32 0.3.32 766319f57b3d5e49f2c79a76e7d7087b621090df, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/09/09 07:41:00
X-KSMG-LinksScanning: Clean, bases: 2024/09/09 07:41:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/09 09:27:00 #26546224
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_054936_838624_2E5FCA7D 
X-CRM114-Status: GOOD (  11.77  )
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

Hello Kelvin, Krzysztof

There's acked yet not merged patch [1] adding amlogic,meson-a1-pwm with 
s4 as back-compatible. Should amlogic,c3-pwm be added in the enum along 
with a1?

[1] 
https://lore.kernel.org/linux-arm-kernel/dbb4be50-4793-40ab-b362-6c9a6dd87324@salutedevices.com/T/

On 9/6/24 15:46, Kelvin Zhang via B4 Relay wrote:
> From: Kelvin Zhang <kelvin.zhang@amlogic.com>
> 
> Document amlogic,c3-pwm compatible, which falls back to the meson-s4-pwm
> group.
> 
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 1d71d4f8f328..356371164acd 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -44,6 +44,10 @@ properties:
>                 - amlogic,meson-axg-pwm-v2
>                 - amlogic,meson-g12-pwm-v2
>             - const: amlogic,meson8-pwm-v2
> +      - items:
> +          - enum:
> +              - amlogic,c3-pwm
> +          - const: amlogic,meson-s4-pwm
>   
>     reg:
>       maxItems: 1
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
