Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E7DC64EC4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzHv6YAu2bM6YvnjoKe75CQ41FLaDXUxUfOp9fbMjJA=; b=dMbVT00F0CyhzQ
	zfK/x3JCLS7o4ACX6Wx0+BXauQTE2mpQx1ONSSy3u0kkLZr4pwuiwnKaQ9Z4qAPXB6yn3EV6S/uV0
	SmKslaslOyjQzlu13t+bd2GG5JNT5iZKV0alHJZCutaeaI1PlqVuO7jeHkwHHalnVjigPMyot6QJu
	ngqIwa10aPdx+pbdZUtEqaiX/RVipD4xytuEHiqefpUiCcFq/wDa0Job+Jpv/NnO2M9STjS92rFCL
	nNoIjQVhREXaBKtduPOhoCZ3FFri6L03tYPALpQZqhnpEV0ZJWppsbLUkOOrtWT/V7mBYSH38u7V4
	BfF5joRVIWuxhSBlZH+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHGp-00Erfu-87; Mon, 06 Mar 2023 20:17:19 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHCc-00EpVt-JJ; Mon, 06 Mar 2023 20:13:01 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 7A1975FD0A;
	Mon,  6 Mar 2023 23:12:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678133575;
	bh=7YzJ4n0LkJWTv0y1sIUu/5QnS+qJKq/YOM7rUrZOA3w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=C151YZQdAz0Bz88TQsdKRRQ0Bf6gR1nZebxKGqwlCIMWMryZvEOVrlcAyu/0kWtsQ
	 KWVpxd1sSKOhnwz/IaeHXJXrUcSd5+QZppEzlnJwX0LZBd9fMtrutXtjkgFfVERjNt
	 WzFe0t5sQi2qzyRbpTYKNTPFiuB0eOGqv5tFrSGXzofGmLGpTGUm69+131FsJ+5iIS
	 kefGqyvq33eeK4KbSlGSFX26UVjFxpJEOsrVvWT19vVdjiZt5wO6RCF70Vl4I6UXDQ
	 r444maPrAip2nDeqAzyk1lXJb3Tcz16Ra5BOAOIWZSwhs/q63JXqqXYFK8r0Ax1vs4
	 5UsF+GcdIcCug==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  6 Mar 2023 23:12:55 +0300 (MSK)
Date: Mon, 6 Mar 2023 23:12:54 +0300
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
Subject: Re: [PATCH v9 1/5] clk: meson: add support for A1 PLL clock ops
Message-ID: <20230306201254.tgyfztzqukzzeaqi@CAB-WSD-L081021>
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-2-ddrokosov@sberdevices.ru>
 <1jy1oab06v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jy1oab06v.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/06 16:19:00 #20919562
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_121258_863871_13DDDBE6 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Mar 06, 2023 at 12:09:35PM +0100, Jerome Brunet wrote:
> 
> On Wed 01 Mar 2023 at 21:37, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > From: Jian Hu <jian.hu@amlogic.com>
> >
> > Modern meson PLL IPs are a little bit different from early known PLLs.
> > The main difference is located in the init/enable/disable sequences; the
> > rate logic is the same.
> 
> For the record, I find very odd that PLLs used to have an 'rst' bit in
> CTRL0:29 (see g12 for example), this bit goes un-documented in the a1
> datasheet, and following SoCs like s4 still have a rst bit, still in
> CTRL0:29
> 
> I would not be surpized if the rst is actually still there in the a1.
> It is just my guess ...
> 

We don't know it for sure. Datasheet doesn't have any information about
CTRL0:29 bit, CTRL0:28 (enable) bit is last one I see.
Vendor Amlogic driver doesn't have it in the init sequence as well.
BTW, vendor driver doesn't use clk_pll common logic, it achieves PLL
power-on goals using init_regs sequence.

> > Compared with the previous SoCs, self-adaption current module
> > is newly added for A1, and there is no reset parameter except the
> > fixed pll. In A1 PLL, the PLL enable sequence is different, using
> > the new power-on sequence to enable the PLL.
> 
> Please split this patch:
> #1 make the rst optional (if you must)
> #2 add the self current adapt param.
> 
> Apart from this, it looks good
> 

Thank you, I'll split it in the next version!

[...]
-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
