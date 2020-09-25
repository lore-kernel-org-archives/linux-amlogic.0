Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658EFC4727F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:16:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 146B92083B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S96pb8MH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OclhwWH5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 146B92083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bhrnt/n5nNVb8BOkEm+aq4ODsDiCXUfw71bgb12sn38=; b=S96pb8MH+c39380SpHO6oi8eR
	CrcuYtZZxQXQr6e/ibKQdmCccr4dLhuWLyWF+qbsdPbuXWgR77j1l7wd1OTnwIVnWlWOJZcpr6iwN
	ecK3Bgd7ZdYxmMv+1A+e8BW/VPOdFVyfTl1wlfs9f0syVCy+yW+aKQ9DOZtUOIrcaZOEvnoOnXmWk
	s7SECJfZb/E72Te6DFiZcBSg6oTDGdCYmNGjJBOI5a1N56d9I6dbg0Gkfmq7ZzVNGY9VqHLHI0eZK
	fA7KXTenPCrsAh2n7QXtVjNjnV3A2NNPuuFFoIGRcf2neT2AMjzkpC/LC3nKbLjr4dVnN7yxE4Drf
	s+/crI4cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLw0j-0001Bd-4Y; Fri, 25 Sep 2020 22:16:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLw0h-0001Ap-AB; Fri, 25 Sep 2020 22:16:12 +0000
Received: by mail-ej1-x62f.google.com with SMTP id e23so712055eja.3;
 Fri, 25 Sep 2020 15:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pgdQ9MvcwqAc91trF3Zcub7T+CXx77/gN0+10x+Lv1g=;
 b=OclhwWH51SZRc87euLQ6jlV9LxW/ZQfRi5bXqRHHgsv3WKSphDbRJNlLRjLaFGiEW/
 u9uEulZeNvHULzZlXkYpcE9QXHtwSVOpyUb5tZ1nl5voIrEyt+W8CXwQrlGbcQwnPvXT
 3tyE6D9Ty1Gk2yuF0FBK8vYdBVa1CySV7jJxtNhXqK927Ji+aXaV4pd0+NcANy8HFbSf
 m/T2QiOb0LyGJvZQUAU2ATIqfLJ/9O6mf60wy9GXENWC4MfxF6aEBi9OKhIebGcUEODu
 jRw0xbWaxPN3OJ8jeNl/FQF0gtS3ZaXvT5HkM4cNht8mGacBV78PZlpjV2FtevuihrW7
 ziwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgdQ9MvcwqAc91trF3Zcub7T+CXx77/gN0+10x+Lv1g=;
 b=PkWRO7djrSKwZpjD5up3hJtgbIiKy1oA8UuNDyLccYITqB2LmqGO6xcHM7kYikCL/9
 nZbVvY5/LtScRBDqvpJOqq9owMmtGcw/Ff5V6T86+fgchjtXb4ELYNc0LeD9+2gE98L1
 szTb9HKZDgcm07oDzM72mMVGynX8Jp7/tT6qbPrQcU6pUAWcMGmyAPw+cjlrZ9FRhdo7
 053YEpH267BsNmErOCiFi9Lzk5evQ0DeY5g6URY9aeijhrHP9jW3o7XO7BaPJSgUBj1v
 xNWY8lth4gIcjVXMfoej7bJ/muyisLUTCWNYs9agKxgjZ9HhlC5XxOXX+37skvqBkNbH
 MLjA==
X-Gm-Message-State: AOAM531TgDM2d7SgeMBk6wTU/0xiwx1dSa3sjvue/AeQLwQh7hOdiJQA
 mszKPdGPWDqqOuLB25iXmxZtYSwpe/4ibk+gVqM=
X-Google-Smtp-Source: ABdhPJxfbM6sS5VvCDOs7sEJMA5DV14kUcWgfZpu8TXOgfmW+9jqAnP2vCfhYDZzkdV3ZNtmNtCg4qWGd+UeyfvXsRQ=
X-Received: by 2002:a17:906:3791:: with SMTP id
 n17mr4816900ejc.216.1601072170080; 
 Fri, 25 Sep 2020 15:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925220329.wdnrqeauto55vdao@skbuf>
In-Reply-To: <20200925220329.wdnrqeauto55vdao@skbuf>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Sep 2020 00:15:59 +0200
Message-ID: <CAFBinCB4woR1sZfT3tvCkHiR2eRgQfXg3jsD+KO0iMzyQRAGDQ@mail.gmail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_181611_355216_68E4292A 
X-CRM114-Status: GOOD (  13.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: f.fainelli@gmail.com, alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, kuba@kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Vladimir,

On Sat, Sep 26, 2020 at 12:03 AM Vladimir Oltean <olteanv@gmail.com> wrote:
[...]
> > Any recommendations/suggestions/ideas/hints are welcome!
> > Thank you and best regards,
> > Martin
> >
> >
> > [0] https://github.com/khadas/u-boot/blob/4752efbb90b7d048a81760c67f8c826f14baf41c/drivers/net/designware.c#L707
> > [1] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c#L466
>
> Florian attempted something like this before, for the PHY side of things:
> https://patchwork.ozlabs.org/project/netdev/patch/20191015224953.24199-3-f.fainelli@gmail.com/
thank you for this hint!

> There are quite some assumptions to be made if the code is to be made
> generic, such as the fact that the controller should not drop frames
> with bad FCS in hardware. Or if it does, the code should be aware of
> that and check that counter.
I do not need the auto-detection of the phy-mode nor any RX/TX delay
(these are fixed values)
however, from that patch-set I would need most of
phy_rgmii_probe_interface() (and all of the helpers it's using)
also I'm wondering if the "protocol" 0x0808 is recommended over ETH_P_EDSA


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
