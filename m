Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8779AC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cacQUAuYQfrVZLAo5+NlSv+t7f9xG9Zkua4xHsvwsDc=; b=xGxliSEhD4+0RE
	Wp0/Eb+sd9a10mr5vobJbKVutCxYYc5ieo9IqExGADgthxI4pw7pFq3AqIfw86rgp5Q+0AWPOal/7
	GYGPcqf8xTHMLHD5lAlgul+JDWhPoSsfwWFvu6vj+PEcIDWXJQ5cuMsoUsVszA2Rw+kFL9rtgXBXj
	0QfXMXGjGWhS+9mST7AGK08KUUs3v8fhEd69HZPURqXxqKmfkwp8T0SWvncLV05/LN8YFaZrWoUGx
	dYjHsBP407A7AuEP7wyRZRa6S3LetUu2jn5c1ggAERR6rJChTOMlezki3+jACbfVBZZE8YrJPwlIK
	X+tNnJdFq67mYrUfWrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14GB-00G0mk-Uf; Fri, 02 Dec 2022 11:31:15 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14G7-00G0kE-Py; Fri, 02 Dec 2022 11:31:13 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id E9A9E5FD0C;
	Fri,  2 Dec 2022 14:31:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669980669;
	bh=gUwn4rgw/3aJmLAswDc3LzNzhfrHmZOgM875DBVbpAc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=XGyZdqRXwz2PxRkJNwfZSoNCSfGDhus0I1vEL7cbMnV8+FsGo+A3SvzQe9cnc7SzW
	 1hLaBgaL2BcBlepqocMiYJw584LlYyPuEl4yolnIldOEFA1uQPYbrIgrZvs4nQM9FA
	 yKjGAWOA47MRsNulb+a/MpT/dVHB+nSHfVl+Z/MEYLZWvsjpr2TIwypLyPH1hrReF8
	 +Y9qolJbnWOaWg34cLllhhcYMObceltpeueE0JmI8YAqm8z3oP4e6zNidNgw7zFJny
	 UetZFTW+5iAVlDR0+udXcKFN0OVMPmd3XnazM9U9yCJ1uNPXOKx6mvSmESSt7in96I
	 KGEUel/ByZAfw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 14:31:08 +0300 (MSK)
Date: Fri, 2 Dec 2022 14:31:08 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jian.hu@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v8 02/11] clk: meson: a1: add support for Amlogic A1 PLL
 clock driver
Message-ID: <20221202113108.netb53ajd4ayqnfy@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-3-ddrokosov@sberdevices.ru>
 <1j7cza8368.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1j7cza8368.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_033112_063805_83E13325 
X-CRM114-Status: GOOD (  16.42  )
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

On Fri, Dec 02, 2022 at 12:16:12PM +0100, Jerome Brunet wrote:
> >  drivers/clk/meson/Kconfig  |   9 +
> >  drivers/clk/meson/Makefile |   1 +
> >  drivers/clk/meson/a1-pll.c | 360 +++++++++++++++++++++++++++++++++++++
> >  drivers/clk/meson/a1-pll.h |  56 ++++++
> >  4 files changed, 426 insertions(+)
> >  create mode 100644 drivers/clk/meson/a1-pll.c
> >  create mode 100644 drivers/clk/meson/a1-pll.h
> >
> > diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> > index fc002c155bc3..ab34662b24f0 100644
> > --- a/drivers/clk/meson/Kconfig
> > +++ b/drivers/clk/meson/Kconfig
> > @@ -99,6 +99,15 @@ config COMMON_CLK_AXG_AUDIO
> >  	  Support for the audio clock controller on AmLogic A113D devices,
> >  	  aka axg, Say Y if you want audio subsystem to work.
> >  
> > +config COMMON_CLK_A1_PLL
> > +	bool
> 
> Could you add a tristate with some text please ?
> 

Yep... I did it in my fixup patches :-) Looks like it's better to review
the next version with already squashed patches.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
