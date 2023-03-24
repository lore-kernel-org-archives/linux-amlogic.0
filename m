Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B057C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixTs+tT6rRKmbXAXdyQifcW76csUGHwRrHdQGfODOwQ=; b=aoH7Mc4gWKADyV
	TW5pAX6LoTzgiK83FFnDdpfRjDC/l/xymWq6UgLhXCc+LoCTPkTK5ljw0z16JcCOHIurK8H6PAPqm
	ftGQCg8M3RnxUd3tcx2EA5U1HkAOjXzuEqtWWAtdMhaVenMJj0rhMNyAcxuv9W7uo0WEfp3SRWnwW
	9yd8aC+3NL0y3Zy8TFIqtw7LsZPAqy1l9fkSpDa95ZJLb7i75+vDHsdDT87NZxoWXC04VjxLtOTCO
	X+LJx1/rpv7y61ITYnfnhAQ0AlykWpFbiwTJWX4G4qa+krKtEyw7w9MWT/G+xJPLdv69NLb0MyNpW
	2bJdeYVWRuoQCKn4DNSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfi5o-004ais-2H;
	Fri, 24 Mar 2023 14:08:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfi5m-004ahN-0c;
	Fri, 24 Mar 2023 14:08:31 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4D4D65FD31;
	Fri, 24 Mar 2023 17:08:26 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679666906;
	bh=GIGUes9grLnNpOjpVxn5S3xYCykF4Trt90IBGzePe04=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=lRJky/Xg2KQO+O20y0BWvrEDEx+EJmS6r1yMCY51bcRaLCQWyU8xUryY/LahRM/8k
	 VRweX6RTh6eYUQWdfUN54YNfkG+9lWHJisJ/eTwFaVb5LPaaxImpmPfhSSh+xKW+A5
	 tIDo3Iin2Ckgw5T6f/TOy3X5FQJIlRpXrtlSb+fuZ7GNKpIc4Ien0GBXGZm/r1D4+P
	 x1I0CcqvwJtTaI7JMQ2eLkNgT/7I5h+Qw0F7XVA3Vpot5OlWQcJtFxtihb6gq45dxG
	 ddR9c7TVee6FScYbadJq5l+GkBHbMEOnT4uHWDqEhZl/IcxSXBQQdetVPv5DZ2Bi9D
	 W1c2VRTLfShbw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 24 Mar 2023 17:08:26 +0300 (MSK)
Date: Fri, 24 Mar 2023 17:08:25 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>
CC: <kernel@sberdevices.ru>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <rockosov@gmail.com>
Subject: Re: [PATCH v2] firmware: meson_sm: populate platform devices from sm
 device tree data
Message-ID: <20230324140825.tnrufiqypfv2m3ze@CAB-WSD-L081021>
References: <20230324140141.6743-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324140141.6743-1-ddrokosov@sberdevices.ru>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/24 06:52:00 #21002836
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_070830_407881_3C9ED6C2 
X-CRM114-Status: GOOD (  17.95  )
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

Sorry, I've missed the changelog. Please find it below if any.

On Fri, Mar 24, 2023 at 05:01:41PM +0300, Dmitry Rokosov wrote:
> In some meson boards, secure monitor device has children, for example,
> power secure controller. By default, secure monitor isn't the bus in terms
> of device tree subsystem, so the of_platform initialization code doesn't
> populate its device tree data. As a result, secure monitor's children
> aren't probed at all.
> 
> Run the 'of_platform_populate()' routine manually to resolve such issues.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---

Changes v2 since v1 at [1]:
    - decline the device tree /firmware based solution
    - introduce devm_of_platform_populate() solution in the meson sm driver

Links:
    [1] https://lore.kernel.org/all/20230323185548.13731-1-ddrokosov@sberdevices.ru/

> ---
>  drivers/firmware/meson/meson_sm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 77aa5c6398aa..b79d0e316cb1 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -316,7 +316,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
>  	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
>  		goto out_in_base;
>  
> -	return 0;
> +	return devm_of_platform_populate(dev);
>  
>  out_in_base:
>  	iounmap(fw->sm_shmem_in_base);
> -- 
> 2.36.0
> 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
