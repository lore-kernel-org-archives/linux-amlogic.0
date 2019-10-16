Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198AEFA3728
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 11:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFEA42082C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 11:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S4LFmcHG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="S1dIOLgH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFEA42082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOxvfqdYocglbnx84VgBd7JhOfqipKPzdUNvzKv4Gq8=; b=S4LFmcHG+p10i2
	yizFhb6AJ85jl0/b81gsvfnPD02aI+ZEpCwnA6glPnr+BJfhRTtxigI65hHvGtoak4XdchrTRHjCr
	0vpTEIi9YMsIAZUY4hyVvOLeOZmjIdIddDZDqCv0607DM/kojKyNcNvFTXxsLqxh9mUCEj15C1fX2
	4U7a1UvUxrZXBsHnzFhKNfJB1hsvIi8Kf26PGdlqEzmvr50IT/pxoWg/cFES4dM4Nz7SmAJgUbKEg
	b+6Th5AxQq2jI4e3NMof5BpOPexzWc77jwq1iEPLP2bXdYAXTnGa1Dx9T8dIIDxFnwSAQT34BH6y/
	ZJB3SBjiiEiEZJ15HplQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKhWN-0007nY-5Y; Wed, 16 Oct 2019 11:31:15 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKhWA-0007dm-LV; Wed, 16 Oct 2019 11:31:04 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9GBQG43023848; Wed, 16 Oct 2019 13:29:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LG7dUwNIu0+LFfdXsArrTdZw8lqv6tMm88WzwKR6KrA=;
 b=S1dIOLgHhlnWOXh0gObHc7UsclwUejJlDnyrM1B+IDgosRXzZubyieCbZiLXGnEqlKYL
 hpd61tPz7LkYexBy/HvcgZ45lzNg6K5RFrtQsR1/CsvmQpM0HL/LOKFVqbEJoCrjqRaJ
 /E9EoqdTnfvZ+edK6JdPaQOvWKFGFEXldD9L/94lcNehviIcFV2PYLDKjiVqFaJ1Wjsg
 dwmH1cOV1yvdz2fcgJRj41SW6+7vKlTL7PDE7rlsl1xD4adXDF9AaC3xXAi5DlfpperF
 v7x4omaQWAxF3KYwgM0sjlCaITEkEpA4SQIgW0FP7lZAToaCZOv54Gin4gnBg888vRQx Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vk3y9x8wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 13:29:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D01310002A;
 Wed, 16 Oct 2019 13:29:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 38E132074CE;
 Wed, 16 Oct 2019 13:29:16 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 16 Oct
 2019 13:29:15 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 16 Oct 2019 13:29:15 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: YueHaibing <yuehaibing@huawei.com>, "herbert@gondor.apana.org.au"
 <herbert@gondor.apana.org.au>,
 "mpm@selenic.com" <mpm@selenic.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "eric@anholt.net" <eric@anholt.net>, "wahrenst@gmx.net" <wahrenst@gmx.net>,
 "l.stelmach@samsung.com" <l.stelmach@samsung.com>,
 "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "dsaxena@plexity.net" <dsaxena@plexity.net>
Subject: Re: [PATCH -next 11/13] hwrng: st - use
 devm_platform_ioremap_resource() to simplify code
Thread-Topic: [PATCH -next 11/13] hwrng: st - use
 devm_platform_ioremap_resource() to simplify code
Thread-Index: AQHVhA8R7X2BGSeJiEmwGCSOAcwdJ6ddADyA
Date: Wed, 16 Oct 2019 11:29:15 +0000
Message-ID: <d9fd5224-a858-e7ea-eb71-2ed6696a6ffd@st.com>
References: <20191016104621.26056-1-yuehaibing@huawei.com>
 <20191016104621.26056-12-yuehaibing@huawei.com>
In-Reply-To: <20191016104621.26056-12-yuehaibing@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <B3EF5CC03322D04D91346E3040ABD037@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-16_04:2019-10-16,2019-10-16 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_043103_371355_1E6C34F8 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi

On 10/16/19 12:46 PM, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/char/hw_random/st-rng.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/char/hw_random/st-rng.c b/drivers/char/hw_random/st-rng.c
> index 8634483..783c24e 100644
> --- a/drivers/char/hw_random/st-rng.c
> +++ b/drivers/char/hw_random/st-rng.c
> @@ -72,7 +72,6 @@ static int st_rng_read(struct hwrng *rng, void *data, size_t max, bool wait)
>  static int st_rng_probe(struct platform_device *pdev)
>  {
>  	struct st_rng_data *ddata;
> -	struct resource *res;
>  	struct clk *clk;
>  	void __iomem *base;
>  	int ret;
> @@ -81,8 +80,7 @@ static int st_rng_probe(struct platform_device *pdev)
>  	if (!ddata)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
