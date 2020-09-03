Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD3FC433E9
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 10:50:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8C5206A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 10:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z0WtDEvI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="aL+sHYDo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B8C5206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OBnLMNc0lyU/jwPyvy1AoJYT3K71d5sBzxIkebRIIbI=; b=z0WtDEvIFFoOdGVnFCbq9dPvp
	2yPpcXJpJalUCBs83y9/GS5hWZxR/V8mwy/LqhDDPBBhn3H6a/uyS6Dydng5baSxXEezAZ5n3/bOD
	TnkB82NmDO6kOWRPnMNBy3WrFZXAQmvBEB6KUg5nqnHWMHhitisCmdjLDtzt+LuGDfEyYjhGnuHXL
	MHGMTonZnBrVrKrMs/DPNWsOocLetboff8jXH1ePx22bnWskbJY59+vZCxQBJMaYXiJfL0A7GQ/3L
	ODdUiMWKgHabnnPXZ+2wmx39KfUs3u2a2ZE8XjOp21cBooWNKE9gQOjhU1ovmcgxKw6Hl4GcUJaxK
	0qnqaeALQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDmos-0006PQ-Dv; Thu, 03 Sep 2020 10:50:18 +0000
Received: from crapouillou.net ([89.234.176.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDmop-0006O3-DK; Thu, 03 Sep 2020 10:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1599130208; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YXg3aqgmFb8tKfR4TEoiu32nZCgBWfcl5v4Q44mU658=;
 b=aL+sHYDogDi8odA19gwRz4rweOeF1jr+yCLbpS1gEROe3fA7E/jfDC5BeFmJAUnF5eryIC
 IdxX7nQpGG7VkZGyAzxbp9xwe0eFQFIBK58dVNueyRCjIxt/lOYFswheujnU2UtA4nuHiz
 Erg60GWs/LhPy2ysrTXzXyDxGTvSHyo=
Date: Thu, 03 Sep 2020 12:49:52 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] mmc: jz4740: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <4RW2GQ.J2DD55HCZMCH2@crapouillou.net>
In-Reply-To: <20200902193658.20539-5-krzk@kernel.org>
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-5-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_065015_750394_622C93FD 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

Le mer. 2 sept. 2020 =E0 21:36, Krzysztof Kozlowski <krzk@kernel.org> a =

=E9crit :
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> =

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mmc/host/jz4740_mmc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/mmc/host/jz4740_mmc.c =

> b/drivers/mmc/host/jz4740_mmc.c
> index 81d71010b474..0c5b52b53303 100644
> --- a/drivers/mmc/host/jz4740_mmc.c
> +++ b/drivers/mmc/host/jz4740_mmc.c
> @@ -991,9 +991,8 @@ static int jz4740_mmc_probe(struct =

> platform_device* pdev)
> =

>  	ret =3D mmc_of_parse(mmc);
>  	if (ret) {
> -		if (ret !=3D -EPROBE_DEFER)
> -			dev_err(&pdev->dev,
> -				"could not parse device properties: %d\n", ret);
> +		dev_err_probe(&pdev->dev, ret,
> +			      "could not parse device properties\n");

I think you can put that on one line.

With that said:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

>  		goto err_free_host;
>  	}
> =

> --
> 2.17.1
> =




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
