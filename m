Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A6BEE57DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRKvm43DlGb8hfmygBvavuJZHQvo8glUONINbv8VFeI=; b=mDC/5wUnmbWmuX
	/s79p7psqWmb2exkbDmbO+LWoLoFTDC1y8jiFZ6hV7UaFWoOlZk4xck3uhey6j3hey+gccdfoKWqc
	61dKEInIHnQdANG2ytRXIqIeVmpTh0p1waVJddOQRHdV+95kBq2jHKFQKXzbl4xOUPRi0jmLenG5M
	vQnHRYbjOZFlpqA1o3YrCIGcLWDpEs0Tr9yJZculwh4MnjUdNRvgwpeHTy1WN/iN5uLGQ8nnpudqV
	wW2JJQxj8Iw17ew1lAae4N06NZ/AvxrwgUz/SNyzGvSPM+XG9zLPsdYvw2QLHGWawwbSiC1RfQY7J
	oE2j2usGoPItXQpSVLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVKV-0000000B7V7-1RYG;
	Wed, 11 Sep 2024 21:56:51 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soVK8-0000000B7R3-3ixe;
	Wed, 11 Sep 2024 21:56:31 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8CF4910001E;
	Thu, 12 Sep 2024 00:56:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8CF4910001E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1726091782;
	bh=x1ZuLjno/PPN/Ymr/GiIARkc5oJZWRfhcU1ulFV49j8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=k9c58aIZGLL4IlOuz2o9NYucPfT6GI9nf1lCXOkvfmeEnU5wfr2F+Wvd85zKNz8FK
	 e4sTJ0DBdtSfs7rGm+dKaPShDV5kr9gEhofFg5t/04OP8Lofpb7H2kf3TfES6S6bZH
	 isX1DhhkHjJkqCP6dkUj7YvEWzECO5YxxFXGdRvHIVYcbKocOxoQ7FLBpIbWxHwXfV
	 idddSgkd8sCu4Zn1wqJpmEb27gdo6av0yBbndCRsiyIEpUpq9B5UqgVZ8qUNuZSzEh
	 BxSQ+avyCkjB0Ekp7ibbS8N4D5WZVu31w4rC6l7Qst5j8BXcgMuphynf1eBAzxTaEV
	 RhOYOzIAmkmBQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 12 Sep 2024 00:56:22 +0300 (MSK)
Message-ID: <26ab17bb-1b2e-4144-8a34-696a92328f52@salutedevices.com>
Date: Thu, 12 Sep 2024 00:56:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] amlogic SoC's power-domains fixes
To: <neil.armstrong@linaro.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <20240710223214.2348418-1-gnstark@salutedevices.com>
X-Originating-IP: [172.28.226.107]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
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
X-KSMG-AntiSpam-Info: LuaCore: 32 0.3.32 766319f57b3d5e49f2c79a76e7d7087b621090df, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/09/11 19:53:00
X-KSMG-LinksScanning: Clean, bases: 2024/09/11 21:01:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/11 19:25:00 #26555689
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_145629_296952_E94A8264 
X-CRM114-Status: GOOD (  11.86  )
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

Please take a look at this series. It's 2 months already since ack

On 7/11/24 01:32, George Stark wrote:
> Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
> The SoC provides dedicated power domain for for almost all periphery.
> 
> Changes in v2:
>    dt-bindings: spi: amlogic,a1-spifc: make power-domains required
>      - drop the patch
>    dt-bindings: thermal: amlogic,thermal: add optional power-domains
>      - drop required conditional
>      - rewrite commit message
>    dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
>      - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
>      - add RvB: Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>    arm64: dts: meson: a1: bind power domain to temperature sensor
>      - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
>    previous version [1]
> 
> [1] https://lore.kernel.org/lkml/20240708194808.1819185-3-gnstark@salutedevices.com/T/#m398c283b369108c5c557e68b7a1ada9abf3e5cba
> 
> George Stark (3):
>    dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
>    dt-bindings: thermal: amlogic,thermal: add optional power-domains
>    arm64: dts: meson: a1: bind power domain to temperature sensor
> 
>   Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml  | 3 +++
>   Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 3 +++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi                      | 1 +
>   3 files changed, 7 insertions(+)
> 
> --
> 2.25.1
> 

-- 
Best regards
George

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
