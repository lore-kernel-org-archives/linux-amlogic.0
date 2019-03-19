Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F269C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B1620857
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBQX5Ho6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ou3ERKZX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B1620857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yInqzuLS40f49jG6muXeUaoGEdZh+cQd0O3sdQFPKdc=; b=kBQX5Ho60DJVve
	f6CK6k7qbdb9IEAI+eOkkkzfhEaYgztvIotJMAnJN89fwHrDrgIWt6sWLjQQ8J427Ytph7AYSAVKN
	d+9ZLjTCkQHS1XrnJKyQRlnCQfM/l1Z3wpnNYUsm7yMqDhedRx0jXmNOUSQWu19tKQ2U5bFAfSjt0
	Mxo7bSU54fBRwQBOSrxUikEMMOiuVWlyngLcg1QyMz5Z7k3p/tpn473CIY38PVVEjAyreZ1m6/jYq
	zSLkSWf3Iu4oEXKhMCV0nHyi/9mfDUmd+6bP7pXPADC2N5+XVp6VtIxjMgKEyefhLADrVEDu34iT8
	ikdzjE7zE26VINDIvnnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6BZ6-0002UA-BW; Tue, 19 Mar 2019 10:01:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6BYw-0002Ke-OO
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:01:40 +0000
Received: by mail-wr1-x441.google.com with SMTP id j9so6127064wrn.6
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=opIwr+LSOxebZuop6rJKZi2dDlWJbe9q7JQeFwl12vc=;
 b=ou3ERKZXc13ZIO3uMV1dAKJiph09MzUn2Iz/+74xW8AKAEf54On4+B6xfd9cW9crA+
 IPW4FRIpBusWJ+Uevhn4HeKecEAeV6h1zl4nqFIxhFaM94ZxPxczDTSe5JPa/CwwlvGV
 Ne50AC1aUhavUvQNmm2NtwdVMzjmPc+PPbL2T4YHYbBCIaQHGyhiX4P2Sh2X4RPsemPi
 CH8R2HEQdvBZ0/PaoamK+ii6s07BWMlXHzwIGgSg6zQYNkQHkKm2r213Xz4atLQaYr9N
 D7ua91avN0vkyNyCp5VKteCrh8wf77UNwC5XcZxRbtV5P6ljrpssJkTO6L+NY2rscYBd
 Zb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=opIwr+LSOxebZuop6rJKZi2dDlWJbe9q7JQeFwl12vc=;
 b=FghgEyNgodgcvpEIbzetkSqdWywWBAVlNim4wGReN4dXGIYPqTjr1qXEYsFyJQhUEp
 4bUg8Fs9E1cgndLn8AsY6wqVOVrFkR/QhZEIuNcmVj+8Oi4Mf/19QDxYJCLu9b0WUQLD
 oMSuGjhMlK58TlutS37JgTnSFYDbsiNtPsnOEsLy5Usnw3iFJNG/gEDwOKcuCrbh/C6r
 iVp22YmTk+nSaI97o0XspuVCnOYKWcepvI6H1t1oso3Ax0euOwxHGm6kG8dMsZSzOQCy
 vovKNyshLSw60NoEHC1v1/t+l0AitBx2OTvT7XianKReqkg5RnScW/jD7l5iRT6g1rXo
 y1YA==
X-Gm-Message-State: APjAAAULlKk3jM4cFtGlBxNUC+/jKOfj3QCEQGUhOCjz+v64VxJn1qdy
 8++r31EGhAG/GmWBeoLYywd76ZLoz8g=
X-Google-Smtp-Source: APXvYqwe2UkmD1q/qMxlum03VsVtWDwnc35WofKXjVdJhq+R7iQJgEUzK9bUOvpnnUG36+XwmOCxew==
X-Received: by 2002:adf:fe83:: with SMTP id l3mr15321368wrr.229.1552989697023; 
 Tue, 19 Mar 2019 03:01:37 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 b3sm17596163wrx.57.2019.03.19.03.01.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 03:01:36 -0700 (PDT)
Message-ID: <2f8d217befcc4fdec36e5a31947cccfe74ccd49f.camel@baylibre.com>
Subject: Re: [PATCH 0/3] clk: meson: add support for PCIE PLL
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 11:01:34 +0100
In-Reply-To: <20190307141455.23879-1-narmstrong@baylibre.com>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_030139_238005_96B60312 
X-CRM114-Status: GOOD (  12.88  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-03-07 at 15:14 +0100, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds a dedicated PLL to feed the USB3+PCIE
> Combo PHY. This PLL needs a very specific and strict register sequence
> in order to correcly enable it and deliver the 100MHz reference clock
> to the Analog PHY.
> 
> After lot of trials and errors, and since this PLL will ever feed 100MHz
> with a static configuration, it is simpler to setup a dedicated ops
> structure with a custom _enable() op applying the init register sequence.
> 
> The rate calculation ops are kept in order to keep the nominal read
> ops as-in, but set_rate is removed.
> 
> With this setup, the PLL can be enabled and disable safely and always have
> the recommended PLL setup to feed the USB3+PCIE Combo PHY.
> 
> Neil Armstrong (3):
>   clk: meson-pll: add reduced specific clk_ops for G12A PCIe PLL
>   dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
>   clk: meson-g12a: add PCIE PLL clocks
> 
>  drivers/clk/meson/clk-pll.c           |  26 ++++++
>  drivers/clk/meson/clk-pll.h           |   1 +
>  drivers/clk/meson/g12a.c              | 118 ++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |   5 +-
>  include/dt-bindings/clock/g12a-clkc.h |   1 +
>  5 files changed, 150 insertions(+), 1 deletion(-)

Well this PLL is indeed a nasty one ;)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
