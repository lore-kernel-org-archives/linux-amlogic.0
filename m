Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD94C27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 11:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jKXNh6Zi24Tv579o0k3mpEWCcNCADZFXzILt4vKddI=; b=P8val+znFYTSbR
	heQo2a9K0xxLZ+yRItswA9Gi9U2u25cVjg7HsZLccymKaFPRLimTucK98Kpo3Kskp4EGxwq66MqaI
	4lVd9SyYAtenjieO2lX5gSG8RbgHAS0VqegxqAGByX4MhaAzyvVZzXte3mpnmmQnFXFabsvHTyRc5
	scMj3bOUorG32QErn0TjOxJsuT87beWAuUjUjpgI5HGQ/t59T1RPozfy106HRlZr5VihI0jMFdh/0
	SaKImbrSjp0SxMi90S6UHVoLW1dkxbnbjMm62mI55wyqLJeLgrtNC+4kj8YIowWixfqKbBm73jKZn
	J7x6fCARWk2Ad+bKzjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGd5M-00000004nSG-0TB6;
	Mon, 10 Jun 2024 11:21:12 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGd5I-00000004nRa-1Byf;
	Mon, 10 Jun 2024 11:21:10 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8DF58100007;
	Mon, 10 Jun 2024 14:21:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8DF58100007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718018463;
	bh=J9OcXtt9zW++X9LHgNZAVJ9fsD37dpJAiH3O1eiJc8Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=OQsKo/rTTXlJq948j48RiBhMmMFyqiO7vMdSx1KZnz6CGgRjqhe+DDluZ1Hkrd7tU
	 50WXIYjBR9RaDMoncSIM+wTSssCZ1ShhxymLXk/jVxaS1CPKPNR8yRsvWVosSy6Clz
	 25ETc2zXMlVZ4DFXk7tulcNQYI1TUJn4rNSBKyjYAv6WrWAlzWfKv071awY7pAcOYM
	 g+NBTk5u6MhsNiDY2Y2sYzYIz3FOks7s8k8GifezEHl9Tf8OapFHZ+/XEtiogCYsd8
	 dky4cOJCLj12z1dlVZWieWD4Hk0B7PHLJ7y2bffPPqKYoOZ1OD70BB7NGVB8MwxKsI
	 Zaz49o2bPgnxw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Jun 2024 14:21:03 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 10 Jun
 2024 14:21:03 +0300
Date: Mon, 10 Jun 2024 14:21:02 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 0/7] clk: meson: introduce Amlogic A1 SoC Family CPU
 clock controller driver
Message-ID: <20240610112102.o6s4ii25jirsegbj@CAB-WSD-L081021>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
 <1jed95p0kq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jed95p0kq.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185831 [Jun 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/10 07:14:00 #25537945
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_042108_684010_5CC6B2B8 
X-CRM114-Status: GOOD (  14.99  )
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

On Mon, Jun 10, 2024 at 12:13:41PM +0200, Jerome Brunet wrote:
> On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
> 
> > The CPU clock controller plays a general role in the Amlogic A1 SoC
> > family by generating CPU clocks. As an APB slave module, it offers the
> > capability to inherit the CPU clock from two sources: the internal fixed
> > clock known as 'cpu fixed clock' and the external input provided by the
> > A1 PLL clock controller, referred to as 'syspll'.
> >
> > It is important for the driver to handle the cpu_clk rate switching
> > effectively by transitioning to the CPU fixed clock to avoid any
> > potential execution freezes.
> >
> 
> Please group your changes, fixes then bindings then driver.

Sure, thank you for the suggestion! 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
