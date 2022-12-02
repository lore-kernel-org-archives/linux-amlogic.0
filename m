Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A541CC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJTVcFSMGYxwPPWqw9dcknmvxZEBQA/FRPbJClfcPlQ=; b=P1K2VxnEDe1n7u
	Xb+DaOwxxWsdUnjnZXrwwpt9R0iG3xtFYgT1Aqkyy0x0YChfpOiWGLxpoqNinPi36cvp3435MrjI9
	GgkMELIm3MEWy5fsboqx8LCpbBIjJuhDDZfQQtgNwH5qOn7AqjUL07Cxmk4v2Y4QTK+ZmRC4saohQ
	s/tIyY4tVuzFCVvBnCR5hb7QQcLlXECckjZwsb69xkocJ7/SeXdwbfiSn13h5jidpzCOVmNkPdo7n
	cwFVvVDOI6RvJMJBD5JlNUlKQ22Xbtsbzsnk0+Njh4twsXfe0PmfRt7Plo7kNar+5YMu7UM/1Skzr
	8AM2x4lMsOUrFdiG96Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14gt-00G8uY-DB; Fri, 02 Dec 2022 11:58:51 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14gp-00G8ri-TQ; Fri, 02 Dec 2022 11:58:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A69705FD0B;
	Fri,  2 Dec 2022 14:58:42 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1669982322;
	bh=1bW2bgaIvS3N//TCaKftg3kWnKGtCH+WclvdEKjJFm0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=q81I/LfbxDUUYskEWIv+fkXYjVhZBLXv4Z2dAd18zJwOKiKNMkz/eN6gLSbZyGin+
	 rxMiv727OFFLFLoomXzSyYybLq8AsBv4IvrnUEX4taji7W1ZBPLov7YHwgkyRjnsT5
	 lGoRlMuKWMe64IMfaP1+MIN0y0gkNTfD4e6a0Wft+RQE7/7R7LwecBkTTHoOHefKfC
	 nkSP2U6lTciSBIDpwLGX61TGIJkLRHBkr2bmFINflYpn7QVxiD2qe2+yAa3rnnAPCK
	 fiUg6oTgz8kc6oSsh+tUiyENSOnHhmn80NE+XKY6f8f8g3CsKCzvEMwcSMf1fiuJEY
	 ZIrMvnqdrDOOg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Dec 2022 14:58:42 +0300 (MSK)
Date: Fri, 2 Dec 2022 14:58:41 +0300
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
Subject: Re: [PATCH v8 06/11] clk: meson: introduce a1-clkc common driver for
 all A1 clock controllers
Message-ID: <20221202115841.xg3e56st7mk6lmbz@CAB-WSD-L081021>
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-7-ddrokosov@sberdevices.ru>
 <1jy1rq6nje.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jy1rq6nje.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/12/02 07:44:00 #20636821
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035848_502406_6EC8DE43 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Dec 02, 2022 at 12:36:50PM +0100, Jerome Brunet wrote:
> 
> On Fri 02 Dec 2022 at 01:56, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
> 
> > Generally, A1 SoC has four clock controllers on the board: PLL,
> > Peripherals, CPU, and Audio. The audio clock controller is different
> > from others, but the rest are very similar from a functional and regmap
> > point of view. So a it's good idea to generalize some routines for all
> > of them. Exactly, meson-a1-clkc driver contains the common probe() flow.
> >
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> 
> I think you should leave this out for the initial submission. It makes
> harder to review.
> 
> In some case, these factorizations actually the maitenance harder.
> 
> There is also the s4 that is coming up. It looks similar to the A1 as
> well.
> 
> Let's wait for both them to land, see how it goes and then we'll decide
> if a factorization is appropriate.
> 

Jerome,

Sorry, let me double check a little bit that I get your point correctly.

Do you mean due to s4 development in parallel it's easier to have own
probe sequence for each driver in the first stage (until A1 and S4 clock
controllers not merged to upstream) and after think about some
"generalization", right?

...

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
