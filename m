Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A5ACD1296
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 18:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7L6pOpqdWBP51zGA0zWKn8puqa0vyuxBs1Dpb1c/6q0=; b=IYJZNTWFNiYDAR
	3XZ/ETJWDgCP696jCz2yz837U19ViJNMwEQgpcqHyP42nLNOv0YaSfIGmwAnLhOtQmeCcD/kL+vFq
	/7Ptf91zU+EwVgLr/PfkWgGtFWEbddM5BJJbvKryr4LOYRBCkKGdocJggqALOX5q3NBXnGKyQAaD/
	g62VKyrD5BnoubuTViilRd6JWk0Kge/1LrHCJYCyr3peMz6HhC/9wFJUAQ49WvA0d9GoiTxaAxOiX
	LIdh8ImL7zfEnKq4GjG/JHVpzUElw156JBCFx8JDe3MOThxF4vHkf/J/JW0bjLLOcqwFI/AQdAyjc
	fhAGgs20B6yVu7dCIpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtu22-0000000GXjK-46HE;
	Mon, 08 Apr 2024 18:47:50 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtu20-0000000GXha-08rw;
	Mon, 08 Apr 2024 18:47:49 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 1D9B9120023;
	Mon,  8 Apr 2024 21:47:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 1D9B9120023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712602065;
	bh=j6Pvh7ii/4E5kEvtzQo/0jLzLa8anfIJuWpWiYdLJ2A=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=B9mKlpvxUeWHck4G567ll5BTEaUMz9pFZsXNelEirg4PyMG5uJkEnYdaAanvUf+nV
	 6WCMxzEokm79CE0YIEUtmbJDUgxzKp7/UIbJe3N3cHLfmcuy0mdPKg9ppVaoRWqhlw
	 YlTyZK3577X4WOYhxk+PvYotKVjVWO1evfV+bXLujyw5A+S8lgx7WEb9z348XmoiCA
	 ydbSOZMkJaVcLo4PobcA6AkFWSFXY+dHn2lbdFiyLaj63etnIYVUO0ZGee3df+7eKV
	 q72udjpDPVnHAaNm1Aqh3zBYMu5h4+jFrpufz0+ljAhYgqTTU9HMPQsl27gyp5X4os
	 F5vG7OLtHgj+w==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  8 Apr 2024 21:47:44 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Apr
 2024 21:47:44 +0300
Date: Mon, 8 Apr 2024 21:47:44 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Mark Brown <broonie@kernel.org>
CC: Jerome Brunet <jbrunet@baylibre.com>, <neil.armstrong@linaro.org>,
	<lgirdwood@gmail.com>, <conor+dt@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Message-ID: <20240408184744.nfktcppdqewurmgg@CAB-WSD-L081021>
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
 <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
 <20240408184041.3jcav5tabxiblpn4@CAB-WSD-L081021>
 <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51b39153-d1a4-4e7f-9b30-8c77fc4ee46f@sirena.org.uk>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184624 [Apr 08 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 15 0.3.15 adb41f89e2951eb37b279104a7abb8e79494a5e7, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/08 15:55:00 #24711186
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_114748_435111_42945CA2 
X-CRM114-Status: GOOD (  32.42  )
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

On Mon, Apr 08, 2024 at 07:45:00PM +0100, Mark Brown wrote:
> On Mon, Apr 08, 2024 at 09:40:41PM +0300, Dmitry Rokosov wrote:
> > On Mon, Apr 08, 2024 at 08:15:54PM +0200, Jerome Brunet wrote:
> 
> > > Userspace pcm, otherwise known as DPCM frontend, are merely that:
> > > frontends. What they do is entirely defined by the routing defined by
> > > the userspace (amixer and friends)
> 
> > > So naming the interface in DT (the FW describing the HW) after what the
> > > the userspace SW could possibly set later on is wrong.
> 
> > > Bottom line: I have mixed feeling about this change. It could allow all
> > > sort of bad names to be set.
> 
> > > The only way it could make sense HW wise is if the only allowed names
> > > where (fr|to)ddr_[abcd], which could help maps the interface and the
> > > kcontrol.
> 
> > The link-name is an optional parameter. Yes, you are right, it can be
> > routed in a way that it no longer functions as a speaker in most cases.
> > However, if you plan to use your board's dt for common purposes, you
> > should not change the common names for DAI links. But if you know that
> > you have a static setup for speakers, microphones, loopback, or other
> > references (you 100% know it, because you are HW developer of this
> > board), why not help the user understand the PCM device assignment in
> > the easiest way?
> 
> I would expect that the place to fix names based on the userspace
> configuration is in whatever userspace is using to define it's
> configurations, like a UCM config.
> 

Honestly, I have tried to find a way to rename the PCM device name or
mark it in some way (such as using a metainformation tag or any other
method), but unfortunately, my search has been unsuccessful.

> > Ultimately, it is the responsibility of the DT board developer to define
> > specific DAIs and name them based on their own knowledge about HW and
> > understanding of the board's usage purposes.
> 
> DT seems like the wrong abstraction layer here.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
