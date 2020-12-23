Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1402C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 02:18:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 224D823357
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 02:18:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 224D823357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xqD6lrxmK/JZ5o7l6LGnXNXQNYjhUZTrTQw3JUEUzUY=; b=GV12bEWOlG6b3jACUs41Q+H4A
	IYKeDmmGBW2pepkM9BHNUBxfXuTURqxtSJ2QU5yYsDsKp4+n7NFKnxL46MnNLT6uLsrsBwLOksmFi
	ot5TarJ68FHP+9nioNiiANjN1+lla3CxwzFIefQ7gFc7k+kuIAfGcEco9vYReDnGSav6PcgI+QkVb
	+fbo/g3dED9hgDWxY+MFZjiqL4QQ2WhzCsMRObCrzDmYMnMifSLW8Zc6hwECbQAP99f/NOguzBJQ+
	bseix+dnosa+g7GlA1NSLfYHKQ8+tIhn1FZLcSlxDceTDvMMN7OMV9tAJUAlCHdifKGOQiao8l26z
	owvJgi0Eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtjU-0007lu-Tr; Wed, 23 Dec 2020 02:18:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtjR-0007kJ-SC; Wed, 23 Dec 2020 02:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=FUVUTdrpirHTiqz+/WH/8DNqizRx3m0CFMGetp1Fmws=; b=rlHqWLWicmVr/d2J/7PqfeHxen
 eSAFGDdnb5kKqrGm2olgKYu/a8tV84Uqa9dW+PL9Jr5Hdvl58aq/mDKTs7O01eiPQVQFV3RhaJXpz
 t02Zu8hS2OHTha+NNPlemyzg8mnhn/vALRpVAgXudFml4TlU280QJ7HXfgghEu59vKFGVTuFZWozY
 1eY5dGmVOjrYU/Yn3w+a0L8LCdYJz9+4Cdz8KUTG/o8gk0iCJg/L2AnQ394ryG2NfWioCfhm70Ily
 mePJreoQgZI1SflN2gwulc2Ffuc/dnUgHUOzF8BM0nqIjtTvsBHB8MzlFDPEJvtGjxNKJUjFj9Quw
 tUEf/ajg==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtjM-00086n-W4; Wed, 23 Dec 2020 02:18:28 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0xYL2T42z6vD5;
 Wed, 23 Dec 2020 10:12:22 +0800 (CST)
Received: from [10.174.178.154] (10.174.178.154) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 23 Dec
 2020 10:13:04 +0800
Subject: Re: [RESEND] usb: dwc3: meson-g12a: disable clk on error handling
 path in probe
To: <balbi@kernel.org>, <gregkh@linuxfoundation.org>, <khilman@baylibre.com>, 
 <narmstrong@baylibre.com>, <jbrunet@baylibre.com>,
 <martin.blumenstingl@googlemail.com>
References: <20201215025459.91794-1-zhengzengkai@huawei.com>
From: Zheng Zengkai <zhengzengkai@huawei.com>
Message-ID: <c069b566-224d-f938-089c-6a69d1ec9d55@huawei.com>
Date: Wed, 23 Dec 2020 10:13:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201215025459.91794-1-zhengzengkai@huawei.com>
X-Originating-IP: [10.174.178.154]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_021825_916394_08DB94C0 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi everyone,

Friendly ping:

Just want to know why this patch was ignored,

Am I missing something?

Merry Christmas and Happy New Year!

> dwc3_meson_g12a_probe() does not invoke clk_bulk_disable_unprepare()
> on one error handling path. This patch fixes that.
>
> Fixes: 347052e3bf1b ("usb: dwc3: meson-g12a: fix USB2 PHY initialization on G12A and A1 SoCs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index 417e05381b5d..bdf1f98dfad8 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -754,7 +754,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>   
>   	ret = priv->drvdata->setup_regmaps(priv, base);
>   	if (ret)
> -		return ret;
> +		goto err_disable_clks;
>   
>   	if (priv->vbus) {
>   		ret = regulator_enable(priv->vbus);

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
