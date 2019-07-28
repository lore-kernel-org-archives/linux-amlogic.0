Return-Path: <SRS0=7Z6j=VZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC64FC7618F
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Jul 2019 19:42:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5BE720578
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Jul 2019 19:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ut7hvLt3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kBrMw64w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5BE720578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kL543FkMz+S3vjqffkHDXvNsi37ErSSmW4CBGMPtMUI=; b=ut7hvLt3k3D1Vc
	SYTEHNn/ZPd/6NUxTjuaJZ3OsupaHArcLbhitgnv6E1a23sb+5bQYRH/enunq0zb9GR0QzG5zwaKN
	5musXkCcb0ODW0Lf0+d5nICStn9GAlhdIRI1sZFpOSLAr2DxsDuqC73i0yUvhckx2qAbMblq9bAeA
	iIcvcR2gqE2W80CfYZqguVDvyLVkrHGU/ckZUeKxEohX9Ue4rLxZr5hRrTxZEYDRAWcyMMbmvWVmx
	exT0pTZHZM9Y8ZhozsQ5YhqBNT3SKKlF5nauFdmycCDadSSQw9vhZinfbN9b/0vJtrKHcX/Jd3QQS
	6TSFmFxTLJmzGN7OEE3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrp3j-00079y-Q7; Sun, 28 Jul 2019 19:42:19 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrp3g-00079A-IH
 for linux-amlogic@lists.infradead.org; Sun, 28 Jul 2019 19:42:18 +0000
Received: by mail-wm1-x344.google.com with SMTP id p74so51948230wme.4
 for <linux-amlogic@lists.infradead.org>; Sun, 28 Jul 2019 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cZDsP6Vjh3qAchq5bA/Y9mmlq5ggucZoGBTvUsBqZwY=;
 b=kBrMw64w8gKf1todfhDdsIKKZmXKC6CCIhiFXHRQnj8umEefttWPZlBNP8Zo5WYV+s
 JU3IcM1QagwKNUKJIWn7RjXL/rZBHj2Fd3AjEW67vicePxs8sbnKzjgFOJYfkU7oNEdR
 cjsuNjxPfeHfTV/FknaxlGZZEPWo/ivyeuoCJ12E8U0Durrq7T5LKDaIHT1Xhiz8jiKc
 s6LeT1DX7/gLob/k/Dxio+0kUTvxqCv5RsdZQZtFQz51kMqT5tFNXJS9ZvSE7liLDAfZ
 rCZ1568QBESuMV1b/QktAYD3Jv6miQYVwvhH30OaP86iiW8oGr7Dp4W+QMIMRLLV7KGm
 mKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cZDsP6Vjh3qAchq5bA/Y9mmlq5ggucZoGBTvUsBqZwY=;
 b=OoX0+3vMmP7dwTJfBBdMCQxn7XT9flf3A63LYaiONV3cJZqK6Wphsi0Vn77jXDrXbO
 OH8ty3rcelLV86T/knykL9f86PLFEMCzJ/YpULh0uE1yM1AKGUgt4lHHvP+Hb8mP0AeV
 Gn4P9CeC/xon0acCHtG0pNSRg86brchzpVZk9R6idKe96/fGg4DOlrj/ZuTrr7NRaAKF
 EbBoIJy89/WemD85HlHjYjcgJiqtVmRelmGZBtypEZKgwB8Ny+clgwECKLiKiIUcRE0N
 DGtBT5CwyAmy4meG8hxA0s4jjwNOWkuDNpTb0eYqMuFNfqLCruHYXZWV+17jj8Yuttem
 aCmw==
X-Gm-Message-State: APjAAAVAovoEO4jZdqEY0HIckeQrIm3ZM8pvRER9uaQ3umLrPiPIcmGK
 P5Ll+0I/Mp9IiY0fZmuVSuCa7w==
X-Google-Smtp-Source: APXvYqzIGsx/VwsniuHVTl0QO3Oov9lrT/Mj3/pwgJwPSU5voW/QBxHEjrOMbARMEqeEAiO9dnkabg==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr45595665wmh.76.1564342934763; 
 Sun, 28 Jul 2019 12:42:14 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id o24sm65369199wmh.2.2019.07.28.12.42.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Jul 2019 12:42:14 -0700 (PDT)
Date: Sun, 28 Jul 2019 21:42:11 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, baylibre-upstreaming@groups.io
Subject: Re: [PATCH 0/4] crypto: add amlogic crypto offloader driver
Message-ID: <20190728194211.GA29444@Red>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
 <20190728184803.GA14920@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728184803.GA14920@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_124216_670036_0CC16869 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jul 28, 2019 at 11:48:03AM -0700, Eric Biggers wrote:
> Hi Corentin,
> 
> On Thu, Jul 25, 2019 at 07:42:52PM +0000, Corentin Labbe wrote:
> > Hello
> > 
> > This serie adds support for the crypto offloader present on amlogic GXL
> > SoCs.
> > 
> > Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc
> > 
> > Regards
> > 
> 
> Does this new driver pass all the crypto self-tests?
> Including with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y?
> 

Yes it pass all extra self-tests.
I forgot to write it in the cover letter.

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
