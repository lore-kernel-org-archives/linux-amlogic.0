Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8841EC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QcMkc19XJ5MxmsrttdDFb9E5B2dTYyIxxS6WfUIB7HQ=; b=KdNsGPMMNrfsV0
	jmOf5GpixTKGCsfjhUvYKq4BXvcJQEfS5dL2nvgHCvkAAyGqVxR4fXhA/IX4LpzZvDLHJxDjGog4B
	C6t4CKn0twVDiCvCKfZQc3kvfMD0mDL4j/CEbwEQ12uIgAWJakEluzntQCeEXYfJtbsCHU8IqxwM3
	T302WHXYROjkAY9O0rv4If7XTl+bLcAFfMDBn/9vBy3nxuHKeuLfIwc8yuEBNdDmIBjURKHRoPQ6B
	c2PpcwRExOYe/CoYV4P6N62xJPo4k/UWNPqhU+Is1htpwvCgl7gbadmBR9m7Jw6SpNKJltdgHBBR/
	uwTNt+xl4Sv7TsX3FlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xrd-000000002oZ-0C2A;
	Fri, 03 May 2024 18:42:33 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xrY-000000002ml-1FgA;
	Fri, 03 May 2024 18:42:30 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C70B3120002;
	Fri,  3 May 2024 21:42:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C70B3120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714761742;
	bh=9Z5eFlWXbAJBTHJC3tQ6YnOuDNtTKSSh4w04Pc+er9s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=DOvt3rmvyGMhAYPBAyyGp6AgE7/vb6Ij8xaP4FrJBwSqatI/r5bOwQ7uWrWVMmmxe
	 J04eJdZis9P3a4qlg4ym5Z1p9mpmVSmySRWD2MKaFYNpQyaFEFgH+IdeJa+/wgRczk
	 6nq6dIz2EjVXbp1jMx+eX4y5bJFZYK03iehel75EYkFQExfbaV11tdKOZvxcYx1d2j
	 rJ1wayes7Vbr/x+ma8ul7/lrRocJvNMAWPBp8DvZY8foYW2DonxLn9kEDW2xZ6Sw1i
	 m2+JwjG/9Xx6n7+ITPdpFxdQJNEFlTomeE05l/KaB7OjC+2Qm3WdFOjQreJb9KymsP
	 svlVUnad/R9AQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri,  3 May 2024 21:42:22 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 3 May
 2024 21:42:22 +0300
Date: Fri, 3 May 2024 21:42:22 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>
CC: <jbrunet@baylibre.com>, <mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: amlogic: a1: introduce thermal setup
Message-ID: <20240503184222.cqka6nmjxhezfhtg@CAB-WSD-L081021>
References: <20240328192645.20914-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328192645.20914-1-ddrokosov@salutedevices.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185053 [May 03 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/05/03 14:55:00
X-KSMG-LinksScanning: Clean, bases: 2024/05/03 14:55:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/03 16:56:00 #25080849
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_114229_048062_9A97DBF0 
X-CRM114-Status: GOOD (  15.13  )
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

Hello Neil,

A1 Thermal Sensor was applied to linux-pm for v6.10-rc1:

https://lore.kernel.org/all/89a02410-87c8-47c6-aa50-04dad5b4e585@linaro.org/

Could you please advise if it's enough to proceed with this series? Or
do I need to do something more?

On Thu, Mar 28, 2024 at 10:26:34PM +0300, Dmitry Rokosov wrote:
> This patch series introduces thermal sensor declaration to the Meson A1
> common dtsi file. It also sets up thermal zones for the AD402 reference
> board. It depends on the series with A1 thermal support at [1].
> 
> Changes v2 since v1 at [2]:
>     - provide Neil RvB for cooling-cells dts patch
>     - purge unnecessary 'amlogic,a1-thermal' fallback
> 
> Links:
> [1] - https://lore.kernel.org/all/20240328191322.17551-1-ddrokosov@salutedevices.com/
> [2] - https://lore.kernel.org/all/20240328134459.18446-1-ddrokosov@salutedevices.com/
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> 
> Dmitry Rokosov (3):
>   arm64: dts: amlogic: a1: add cooling-cells for DVFS feature
>   arm64: dts: amlogic: a1: introduce cpu temperature sensor
>   arm64: dts: amlogic: ad402: setup thermal-zones
> 
>  .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 45 +++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 13 ++++++
>  2 files changed, 58 insertions(+)

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
