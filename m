Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E83C6FD20
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAh5kZWSM0XTcHn2AlYKsOsQ6oE+QrKkKcH5jioCuuk=; b=OxQdeflC7hxYBt
	3FxLfRbtUecspTMfnMvzqAV9teg/9QI9KX7F3PXv8YjssMWJex9m5yzNir1Q+JrCrJZddLq6ErNIs
	o5A9L8sOn+IDgmjYOaCidxpOem3XC61LMlzvbvlKVyz6kumjk2tYrYElQUa/kXsiOdB5Ij4pLr7/F
	0ClbnUTpWj1CY8HB8GUu3gRFTtgP9RJqCEaKGIhvopm0EJqF46yP6VyARIN/4GYGePARah1quhIY4
	X4HxbsZeoM4nmvPH8RU2uvZ3bEhKNSEgG3fTmWb7bToRJbIHBGK1TGGH7MMg0mABMuunEltdeR33u
	LYp8UeClPfyXMkbkxKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiAt-004bYn-2c;
	Fri, 24 Mar 2023 14:13:47 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfiAq-004bYG-1V;
	Fri, 24 Mar 2023 14:13:46 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 881A55FD34;
	Fri, 24 Mar 2023 17:13:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679667221;
	bh=B7CmNMAJdYjHdEvEWYvmv46K1UaDZlTyHHFzSrMmmy8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=fcTCQhToIJaeKCoTNwHH9E+n1GtpHIciXhbS0m6Toks9D2HKRlseuyhdMo9QAnics
	 MgQfEZ7+knMATbnanZL17d9guEpYBJL+RZeMhh+5gBpMFarNcy9ElwmBIEKSWbuUdA
	 O7cveLmtgjNhT85Bwk9PHS/LrVc7oyuvU3cjdCo/UoHSaY8FcVT+Lr4m1qqfqhnihe
	 AJ36EV+qN8dLgCp3qcyQy5QDwWSgCuYInaeAPin6Ip90/Oa3ChoKi4+qAdCQWAImPN
	 uEmYjB1YA1fky7DcPYKwkUB+Ec3LyNWreyrnHPuh3OW38R4ZOt9adu33R9FTq9NaGk
	 YvHE+/R6MiT4w==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri, 24 Mar 2023 17:13:41 +0300 (MSK)
Date: Fri, 24 Mar 2023 17:13:40 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: <krzysztof.kozlowski@linaro.org>, <robh@kernel.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <jianxin.pan@amlogic.com>,
	<kernel@sberdevices.ru>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <rockosov@gmail.com>
Subject: Re: [PATCH v2] firmware: meson_sm: populate platform devices from sm
 device tree data
Message-ID: <20230324141340.5dkuqip5zbuwjv3x@CAB-WSD-L081021>
References: <20230324140141.6743-1-ddrokosov@sberdevices.ru>
 <f1088121-02c7-86da-d603-7c2015030b0e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1088121-02c7-86da-d603-7c2015030b0e@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/24 06:52:00 #21002836
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_071344_683209_4F212E39 
X-CRM114-Status: GOOD (  19.20  )
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

On Fri, Mar 24, 2023 at 03:05:53PM +0100, neil.armstrong@linaro.org wrote:
> On 24/03/2023 15:01, Dmitry Rokosov wrote:
> > In some meson boards, secure monitor device has children, for example,
> > power secure controller. By default, secure monitor isn't the bus in terms
> > of device tree subsystem, so the of_platform initialization code doesn't
> > populate its device tree data. As a result, secure monitor's children
> > aren't probed at all.
> > 
> > Run the 'of_platform_populate()' routine manually to resolve such issues.
> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >   drivers/firmware/meson/meson_sm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> > index 77aa5c6398aa..b79d0e316cb1 100644
> > --- a/drivers/firmware/meson/meson_sm.c
> > +++ b/drivers/firmware/meson/meson_sm.c
> > @@ -316,7 +316,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
> >   	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
> >   		goto out_in_base;
> > -	return 0;
> > +	return devm_of_platform_populate(dev);
> 
> You should check return and jump to out_in_base on error instead.
> 
> Neil
> 

Ah, exactly. There is one direct non-devm ioremap above. I hurried up,
sorry.

> >   out_in_base:
> >   	iounmap(fw->sm_shmem_in_base);
> 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
