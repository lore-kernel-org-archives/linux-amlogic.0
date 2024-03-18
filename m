Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA92FC54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 07:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U52TRBHdbkHxbkbjtiq/450aV2Oe07KtvBsHFhrJw+0=; b=uthCseJeMu5K4V
	oVBvNzxxYU/ITXcc6fsHE0ZPCnv4M/Vse9ICTnTMMt+fa1OwmJFWBGhlJ7iTPriFljvYHZyqhMrxX
	FtLny2y/DPdGMFUNKTTbPADCGK6essWlMwbYGdLy+L50hpXxz8LYJlYGFk3pfAPaO/wo8E2ivXwYu
	5cZPHnEO/8IB+L4yQ8s5faBANs+gGICCgskgNEzHvqVIeHSF0lwVkUH0LhgD2hgFPSUSnYFx2ywnB
	kVoEIyKg7bLbC5UgXWZ5ZbLJ9PyJbI3tBV4mkD0LdavIZ2X/R+y6IaVcYfslvTkYBRQGof88Wy27w
	SqmIbJt0z5dii40eJgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7PL-00000007bR4-3oo6;
	Mon, 18 Mar 2024 07:27:44 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm7PH-00000007bQ5-16OT;
	Mon, 18 Mar 2024 07:27:41 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 51C11100003;
	Mon, 18 Mar 2024 10:27:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 51C11100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710746851;
	bh=6eBBMkMfZ38/VKvG5K/FQSiHY3xSbVnH219JcM7xg+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=VnGw2EO2nPizTbHONIIGLX+5hzjAt0tn586YH2n+Nhjyhclw+v5sfCXXWLvEo7/6y
	 bd7RztKrqxLrZBw8CXY7FvdpzSlm9desv11YzbjzOS0KgMPCfL6f5J7lol/3zBQsVg
	 3FdNsw1eHzOXUOH8P2/eqVz95tneJYyiygr5588ZrluwFkgV7TX0aLL39RhD1/cV3M
	 hhhRl+onDEkQL7iEWHG/Mi7W1cqNFCeDg10qCyYLiYiis1rLwaUlt4RVGRAbvxw3aO
	 EUcR2aghhldiuGJqtEl+/bF2hdTYPZLd4Fx7WVU91rwjgVIkxvFkr6swtw+VfYjwS+
	 E9oPwXGgWH5Gw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 18 Mar 2024 10:27:31 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Mar
 2024 10:27:30 +0300
Date: Mon, 18 Mar 2024 10:27:30 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Rob Herring <robh@kernel.org>
CC: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<kernel@salutedevices.com>
Subject: Re: [PATCH 22/25] ASoC: dt-bindings: meson: introduce link-name
 optional property
Message-ID: <20240318072730.3u4qbwxijreyduwi@CAB-WSD-L081021>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-23-jan.dakinevich@salutedevices.com>
 <20240317194534.GA2093375-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240317194534.GA2093375-robh@kernel.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183875 [Feb 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/29 19:21:00 #23899999
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_002740_025394_47631E0B 
X-CRM114-Status: GOOD (  15.66  )
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

Hello Rob,

On Sun, Mar 17, 2024 at 01:45:34PM -0600, Rob Herring wrote:
> On Fri, Mar 15, 2024 at 02:21:58AM +0300, Jan Dakinevich wrote:
> > From: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > 
> > The 'link-name' property is an optional DT property that allows for the
> > customization of the name associated with the DAI link and PCM stream.
> > This functionality mirrors the approach commonly utilized in Qualcomm
> > audio cards, providing flexibility in DAI naming conventions for
> > improved system integration and userspace experience.
> > 
> > It allows userspace program to easy determine PCM stream purpose, e.g.:
> >     ~ # cat /proc/asound/pcm
> >     00-00: speaker (*) :  : playback 1
> >     00-01: mics (*) :  : capture 1
> >     00-02: loopback (*) :  : capture 1
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> 
> This needs your S-o-b as well.

I will send this change in the separate patch series, as Neil suggested
in the cover letter reply.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
