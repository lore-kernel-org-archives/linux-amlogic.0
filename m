Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D18FA3733
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 09:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2DF121D7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 09:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oDx3ijwo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2DF121D7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owYt4VKOtu97zpOc3TajN3sVKITmLBcPdIMEUKgUfy4=; b=oDx3ijwobjbD68
	mZ6UJpms4X2x/ALOgUMKjh847574BR1UOjvq63PaVjBDFRi9sIUZr6+ttA0U/nqZLuK2wy9ddMp9E
	HLmSJTvgg00ZUwOs5NUBiPswwxi3SNgghhOGSoatXoJJElRgLi9T7W5CEv82eUujsjdq1q4uqTiiV
	ONt03rdRcegluSZmeNnhqw6ybrZmgQnEs7X7jAADCA2s+k3Mxu8Pcn/nzJhv7GRFpXwuXSbJpMvTN
	3SkG4Vz8JBOLhug6APTf0gm20QCwDCglX9mwOWBB2WSBXIdPPlQviN/+eZYXVok5xqSVPH4EF6+JI
	oaJAFPerLADRjVdMi3Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL29D-0004WF-Vy; Thu, 17 Oct 2019 09:32:43 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL294-0004Mo-R3; Thu, 17 Oct 2019 09:32:36 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Ludovic.Desroches@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Ludovic.Desroches@microchip.com";
 x-sender="Ludovic.Desroches@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Ludovic.Desroches@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: RiPCekASyK4XX90kgCguTCZ6Fewhru0nFfg686muQ+X+vlhkeieyRjrnEUVS3yVAzWUE6DVNG+
 GbSV9HVpkfwpF5mY5RfpApF4VBMWZ6Nxn4Q20rPm7PF5NNjQ5Cpi7M9xdDogU32xpnXuMWJm0n
 3t1QxTxeSK2r8AE+Fb7kj5deB6wBEHEx99oxp3Qz0lElf95HmZxlZUQrQNXL1fWFtxS0DWquEo
 AGwgYe+DhTVb79+g3k+w7BNGS4y2GVg7aRO4olJlG4V4OVjeRqhLz2OBHRZLPchMQ6XbubaumY
 geg=
X-IronPort-AV: E=Sophos;i="5.67,307,1566889200"; d="scan'208";a="51838929"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Oct 2019 02:32:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Oct 2019 02:32:10 -0700
Received: from localhost (10.10.85.251) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 02:32:10 -0700
Date: Thu, 17 Oct 2019 11:32:37 +0200
From: Ludovic Desroches <ludovic.desroches@microchip.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 01/13] hwrng: atmel - use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20191017093237.3poaq7unlm62mhwt@M43218.corp.atmel.com>
Mail-Followup-To: YueHaibing <yuehaibing@huawei.com>,
 herbert@gondor.apana.org.au, mpm@selenic.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, eric@anholt.net,
 wahrenst@gmx.net, l.stelmach@samsung.com, kgene@kernel.org,
 krzk@kernel.org, khilman@baylibre.com, dsaxena@plexity.net,
 patrice.chotard@st.com, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
References: <20191016104621.26056-1-yuehaibing@huawei.com>
 <20191016104621.26056-2-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016104621.26056-2-yuehaibing@huawei.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_023234_882163_28AC8FE5 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, eric@anholt.net,
 f.fainelli@gmail.com, herbert@gondor.apana.org.au, khilman@baylibre.com,
 krzk@kernel.org, kgene@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-crypto@vger.kernel.org, dsaxena@plexity.net, arnd@arndb.de,
 rjui@broadcom.com, l.stelmach@samsung.com, linux-samsung-soc@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, mpm@selenic.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sbranden@broadcom.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, patrice.chotard@st.com, wahrenst@gmx.net,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 06:46:09PM +0800, YueHaibing wrote:
> External E-Mail
> 
> 
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks

> ---
>  drivers/char/hw_random/atmel-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
> index e557057..b3138ec2 100644
> --- a/drivers/char/hw_random/atmel-rng.c
> +++ b/drivers/char/hw_random/atmel-rng.c
> @@ -62,15 +62,13 @@ static void atmel_trng_disable(struct atmel_trng *trng)
>  static int atmel_trng_probe(struct platform_device *pdev)
>  {
>  	struct atmel_trng *trng;
> -	struct resource *res;
>  	int ret;
>  
>  	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
>  	if (!trng)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	trng->base = devm_ioremap_resource(&pdev->dev, res);
> +	trng->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(trng->base))
>  		return PTR_ERR(trng->base);
>  
> -- 
> 2.7.4
> 
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
