Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592DDC7EE29
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jun 2023 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9dvwOWieC/RrGOndNL+9W1Qd5Kpopn5BbNnRgsBbWg=; b=q0Olb9MaiIkruF
	ES3pdEOq/iNybj9IPV+sO33Dp0DK8dPrqmJ+Id0Hk8vNgKOZ8zhnNrgC7JqU9rMSfXDio+5L+6SHe
	aE1AgbUjmIq3BYPg0UWqpfQ/ocuj0SBftg05kUx474AtEB+Gr9NVXRGlo6+i5GQ6xoIwdpvo0CnUV
	KAMA3O8eUQQQqNbnmtSAIxRiYX91JYg0TQ5Hy3gzKS5IxDJs9qUUozrZZTE3Qcnnz6+7bdA2OPhyx
	XVQEajg6+XRP3KDauTC12j/mord1ypZytRjtLJfZdDLfatMT1xi5YGZAxn4SzXMALlOmKQLkMiWhI
	aNhB7Nme8OzhfjX15EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Mlx-00AdNA-1d;
	Thu, 08 Jun 2023 21:02:21 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Mlr-00AdLF-34;
	Thu, 08 Jun 2023 21:02:19 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 760265FD86;
	Fri,  9 Jun 2023 00:02:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686258127;
	bh=vrZ3H0ukAoi+VYXR7MBptafkDYF/rLST6i3lyJzo2AI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=IibROKZuitdC5NsKSmnXmx77ZgjUr0lEgo+syJpM7jlszcAazwwiCsNFLC25+tOIX
	 r5IcZ2fjhnurB78RF/hbzob7Od6RPjQ6H44tztKGyOIA0Pduvs9sXdfJ7WOHpvYglm
	 EvMhQUswG8wa7PR8A10u+H56zu1YYC9rYKCKBaH7MWPNaaYz26QzeAr6Sqvg9og93I
	 8WT24Kkl05DgNj6kxAyy2intOaS/LExZzriDl6xi/EnuTpq/tOGM6vNX2A1XqckvI8
	 FtggNcvAC+TTgEvPpO9Za9IvGWHeotYqDgr90vWA1XhJYtDFzsp5wGsAWtlAz87ci5
	 cHxH3JWpLooWA==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  9 Jun 2023 00:02:06 +0300 (MSK)
Date: Fri, 9 Jun 2023 00:02:05 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Yu Tu <yu.tu@amlogic.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Kevin
 Hilman" <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	<kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>
Subject: Re: [PATCH V9 3/4] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Message-ID: <20230608210205.hsmmhwngrbfydawp@CAB-WSD-L081021>
References: <20230517070215.28463-1-yu.tu@amlogic.com>
 <20230517070215.28463-4-yu.tu@amlogic.com>
 <1j5y804q7u.fsf@starbuckisacylon.baylibre.com>
 <73acf297-3f60-1ce1-2f05-af048aa37199@amlogic.com>
 <1jttvi9vnq.fsf@starbuckisacylon.baylibre.com>
 <20230608113244.jvf7w4flwjy5soud@CAB-WSD-L081021>
 <1jh6ri9kwb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jh6ri9kwb.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/08 15:54:00 #21461059
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_140216_530211_5F6DCEA6 
X-CRM114-Status: GOOD (  13.95  )
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

On Thu, Jun 08, 2023 at 02:46:54PM +0200, Jerome Brunet wrote:
> 
> On Thu 08 Jun 2023 at 14:32, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> >> 
> >> Neil is currently dealing with the dt-bindings, please
> >> * Adjust your patchset accordingly
> >> * Wait for his v2 to land, you'll need it.
> >> 
> >
> > I saw Neil patch series with merging 'private' and 'public' clock
> > bindings parts. Should I send the same patchset for a1 clocks after v6.5
> > landed?
> >
> 
> I think Neil's patchset is already dealing with the a1.
> 
> We'll see if it can be part of this cycle PR. I don't want to rush
> anything and rc6 is coming this monday. It may have to wait for the next cycle.

Alright, I understand. Please let me know if and when you need
assistance, as I am ready to help.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
