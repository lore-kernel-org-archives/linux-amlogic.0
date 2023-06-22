Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417D8EB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7zdP7YzICuQlO8vCnyFSgqHW74242oYUI0NlXR4kD4=; b=xvOq3Nk12DJTGE
	5Ry/QPnRev7FqHxX6PzRYta7ZMxebUUeqKOA22qs9PIaLwwK2ZRRrOO900O5VWp9TWCHwwxSdmamY
	cl57LohiskSCYhGOUUnZUuJ2LzwzrSmuarILoMnf+fvfmpHnUdtJ4bYvwP1JPwbyofEXb/4tCqlsJ
	2Netw4eo8E0Xd6tldjvf90mXSEN0Mu0bgKY5GNmS+7VPwiPeW4IFy6xNlOmyKX+fUmf8XrR6Vp5+r
	agI4XkXHtm6YJsPSLQyF+U6UrUvfU07kzzncafS7zTe321UlI/E2XNH20zFWs+HDKDhOcsln+i47f
	JFhfMTY4v6mk9EzNOaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPXG-001Vha-1V;
	Thu, 22 Jun 2023 19:00:02 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPXA-001VeS-1g;
	Thu, 22 Jun 2023 19:00:00 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 16BC55FD1D;
	Thu, 22 Jun 2023 21:59:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687460391;
	bh=mWWI0ZO0ptZ6K1WHLjWbKHpoK8xPQxDS9eQM4yizQ5Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=MBpIpQgPlr8UapK8ML0TnxKTp0m1H12OHuGCLIGO7ZnyBDjxCN3+2ro6GfPNp6T/9
	 hPaqLFwxkO8XqsVubZvqmkrzV3ncUpSrW49yEYYg4Mz4D0y2NLiUropv17bz3IcXey
	 l+A5DmhkrozXvrpNFsaz2XRjOmFKk+/jqAkHsI4T6JK9T3HtKWU0bFRx56uK9yzkyq
	 X8a83cU6ZznGtye5QaPdwAMrWNReabDhfi9PRjzyvdztGA+ZC2eWPmwKYRzq9hzzvh
	 qcQTMc2Nv1wfNQsPOmyY0fVUeGaU8yNvPlYT5CHiMhwqfXbKZHoMzq7vaACsTkxPZc
	 E/h2NLTgsjhJw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 22 Jun 2023 21:59:50 +0300 (MSK)
Date: Thu, 22 Jun 2023 21:59:49 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
Message-ID: <20230622185949.lctlydjcthya33ga@CAB-WSD-L081021>
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/22 14:26:00 #21556046
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_115957_078213_4A0990E4 
X-CRM114-Status: GOOD (  15.89  )
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

Dear Jiapeng,

Thank you for catching this bug! Appreciate it!

On Wed, Jun 14, 2023 at 04:48:08PM +0800, Jiapeng Chong wrote:
> No functional modification involved.
> 
> ./drivers/clk/meson/clk-pll.c:373:2-3: Unneeded semicolon.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5533
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 56ec2210f1ad..8fef90bf962f 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -370,7 +370,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		usleep_range(10, 20);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
>  		usleep_range(40, 50);
> -	};
> +	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
>  		meson_parm_write(clk->map, &pll->l_detect, 1);

Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

> -- 
> 2.20.1.7.g153144c
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
