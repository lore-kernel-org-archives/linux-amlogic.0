Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A9CC4829E
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24rDnBRDbb84SKB7kOXm63aOs/ku+GTfO29aG2QH8Kw=; b=NDYoXRveMkdsZh
	GYv91Rgp/yBdtvwwO70cpQr4m1jR+i5f9AR8xE13SyU1qHspBYJU8epPHrWOG6BXWwvpoHfawEUxW
	NSdjGNCGEhXfLMX6usrRVAMrr4Ly5M9uyUxp/f4MS21JIz7d5jo1G74JfAUW/WfBouU+tqB/i4uo5
	mZKvuzjBBwG/3YrSrlKqR6oT++9Q/yiDOV5OiUSnf7aHV/jyVN+sBLaxyi1byZKWXk2pygKoMDs3V
	V1dA0iU3NhUB3fVvbcUBVK705haxJyl1gNMgHf9j9+gavWq3dkRoX3TbU1u3B3JYDwaNnrUjBzZA3
	lEbQyXCglDmgkxiYdnlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZH9-0000000FsHV-1rEM;
	Thu, 15 Feb 2024 10:47:31 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZH6-0000000FsF7-2kWR;
	Thu, 15 Feb 2024 10:47:30 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6B7EF120005;
	Thu, 15 Feb 2024 13:47:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6B7EF120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707994045;
	bh=ZMXILtHC08+ORAOMdLV08SaTMzWfQR2g0BN83OzVl4o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=PTvYSRzcm7SkQ4jmbt1M7PmtlwMEnEvbr3WZmXhSFIcOFzc9cdquy/XKZkT5huX2u
	 0AZXiOZOKzSsxdfYtEuxuMPmtsjkk3ZKiGom90RpxVZeu/6MD5eTQAZRtIKOnftDcy
	 CWhPun885cAV33ZVNJurwC4znQqBfkk2r6qgmUb8Wm0rPu0rKlUsWPdbEt5nxSgw5q
	 7j/JRhaqbHTm7ud9Mm3ggCE3NGiRTWXBuzEI4w8JjHjb/mr5JpWCjhQKVglj+v7Dw2
	 yzWuiweq/lABslXYAN+1gr9/1wuUj6qvaOqTbgrjZujD6K2+w4cHGFx2eDqHZAOz//
	 cNma5geBk27bQ==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 15 Feb 2024 13:47:25 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 15 Feb 2024 13:47:24 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::6d41:e8f1:b95e:ba1%7]) with mapi id
 15.02.1118.040; Thu, 15 Feb 2024 13:47:24 +0300
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
Thread-Index: AQHaXbqRFptCyAwKyUyy1Cn5x5FmZLEHrLEAgANeQYA=
Date: Thu, 15 Feb 2024 10:47:24 +0000
Message-ID: <20240215104719.njq6ie2niisntcnv@cab-wsm-0029881.sigma.sbrf.ru>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <ZcsYaPIUrBSg8iXu@Red>
In-Reply-To: <ZcsYaPIUrBSg8iXu@Red>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <02AD52C50B92B74A88D1647594C86269@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183458 [Feb 15 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;cab-wsm-0029881.sigma.sbrf.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/15 04:37:00 #23614209
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024729_050401_2D1E975F 
X-CRM114-Status: GOOD (  13.50  )
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

On Tue, Feb 13, 2024 at 08:21:12AM +0100, Corentin Labbe wrote:
> Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a 'ecrit :
> > Hello!
> > 
> > This patchset expand the funcionality of the Amlogic
> > crypto driver by adding support for more SoC families:
> > AXG, G12A, G12B, SM1, A1, S4.
> > 
> > Also specify and enable crypto node in device tree
> > for reference Amlogic devices.
> > 
> > Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> > custom tests [1] and tcrypt module.
> > 
> > ---
> > 
> 
> added patchs up to  "drivers: crypto: meson: process more than MAXDESCS descriptors"

Including this patch or not?

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
