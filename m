Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EED1C54E41
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Feb 2024 13:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4bvikeiqDJasvvdC6BXVE59irrIR+7Vhi4eA5AswFw=; b=AqcXD0/htKkc1W
	g8SecchzboEc1yFpen0j2JJf+WsYyFhdDEDpYB3WQ0DYIzIqAEeZxcFSI0NombiCaau6KbMIUK0zZ
	hvLRAJplBGL0llnbVrfLhJFfmbDOseXrzK5NEdhC8C8MQDRPsDIXbUxVGume7As4oj7d0yU3ZmyfK
	otS9D5ofpdQeHz/14GpUQ1umOLVrrxVEazhvBpmMdfG8sB6DzK4ENnAKRHmLbBPVveNQgDg3MJE6a
	Z0Er54OkYNjSEyB5zle3UIFwSjpiO/ScVMT2Tr2cIALU5ePLYw48X0NygIpkxdM+FLSwVxKaXE5X7
	Ifw4UeC2wfspaP+ql8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfg6H-0000000DayT-3VwI;
	Thu, 29 Feb 2024 13:05:25 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfg6D-0000000DaxW-0pHo;
	Thu, 29 Feb 2024 13:05:23 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 43A361200E1;
	Thu, 29 Feb 2024 16:05:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 43A361200E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1709211915;
	bh=umX0LQkKpv8OA4NwzbRwcDsOZahJ/+JAK3alNhNh6mY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=Z0ZSWkflb/3WTeTWGLCVaFAvggT1+HLi6gWtWUbklDrHudg9ZgRq6Bj9yneR5TOIx
	 YQvXnqsNchedAAQnKPIwYYs2lhTqrqNWDlgGZ9ZWSdO8B/Tc0J0bj2/YN1/H8uk6H/
	 4wbjRYAq2nHaQOuCj05/yhgq+BsiXoTxg5cz4CbDrPw7sLLvt/RK3eb3PF29E1Tcqa
	 ilTjzHjWDJXQTehH22Rwh0afOnufZOvNOfos6RXOfmG+8N6t0Aq6oyUV+X+slLLqUz
	 y3v3nDhYbT68rLt4sG91YEeJNuymzq630EmLd92UV0vpaZgLWpvpDYmumivivRg8vU
	 HpW02/xEMY6SA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 29 Feb 2024 16:05:14 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 29 Feb 2024 16:05:14 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1%7]) with mapi id
 15.02.1118.040; Thu, 29 Feb 2024 16:05:14 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Thread-Topic: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
Thread-Index: AQHaXbqRFptCyAwKyUyy1Cn5x5FmZLEHrLEAgANeQYCABgkagIAOlJgAgABwfQCAAG4bgA==
Date: Thu, 29 Feb 2024 13:05:14 +0000
Message-ID: <20240229025337.ftbvoaafmu5zvyha@cab-wsm-0029881>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <ZcsYaPIUrBSg8iXu@Red>
 <20240215104719.njq6ie2niisntcnv@cab-wsm-0029881.sigma.sbrf.ru>
 <ZdL713ae1swwTU_B@Red> <20240228133656.24bic6djmjvkill7@cab-wsm-0029881>
 <Zd-VVGXHoH2ikbmV@Red>
In-Reply-To: <Zd-VVGXHoH2ikbmV@Red>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.92]
Content-ID: <5ABEBF99DA6D414FA14316970D4C439A@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183854 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;gist.github.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/29 11:23:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/29 11:23:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 08:31:00 #23888373
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_050521_946427_0DC239E9 
X-CRM114-Status: GOOD (  26.44  )
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

Hello!

On Wed, Feb 28, 2024 at 09:19:32PM +0100, Corentin Labbe wrote:
> Le Wed, Feb 28, 2024 at 01:37:02PM +0000, Alexey Romanov a 'ecrit :
> > Hello,
> > 
> > On Mon, Feb 19, 2024 at 07:57:27AM +0100, Corentin Labbe wrote:
> > > Le Thu, Feb 15, 2024 at 10:47:24AM +0000, Alexey Romanov a 'ecrit :
> > > > On Tue, Feb 13, 2024 at 08:21:12AM +0100, Corentin Labbe wrote:
> > > > > Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a 'ecrit :
> > > > > > Hello!
> > > > > > 
> > > > > > This patchset expand the funcionality of the Amlogic
> > > > > > crypto driver by adding support for more SoC families:
> > > > > > AXG, G12A, G12B, SM1, A1, S4.
> > > > > > 
> > > > > > Also specify and enable crypto node in device tree
> > > > > > for reference Amlogic devices.
> > > > > > 
> > > > > > Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> > > > > > custom tests [1] and tcrypt module.
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > 
> > > > > added patchs up to  "drivers: crypto: meson: process more than MAXDESCS descriptors"
> > > > 
> > > > Including this patch or not?
> > > 
> > > The crash start with "drivers: crypto: meson: move algs definition and cipher API to cipher.c"
> > 
> > Unfortunately I was unable to reproduce this. I use Khadas Vim1 board
> > and my custom tests (https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7).
> > Tried both build as module and built-in.
> > 
> > Can you, please, give more information? Maybe your test cases?
> 
> My test case is simple, simply load the driver.
> 
> The problem is that you moved the algs[i].mc = mc after the register of algs (in drivers: crypto: meson: move algs definition and cipher API to cipher.c)
> Test could happen as soon the register is done and so mc is deferenced.

Yeah, you are right. Will fix it. Thank you.

> 
> Since you didnt hit the case, I suspect you didnt test the driver as module.

No, I test the driver as module.
I think the problem is that on my system no one uses this crypto backend
outside of my tests module, unlike your system.

> 
> Regards

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
