Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA8C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 12:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1DW2eMNHsH6XC92ubKNtShTn1HsxJ1pW84q8NL0mFCQ=; b=XUXR5dKa/mYdQO
	HhkrPKDVtXy0PDgg0CZe1tyooStGtpKongB/zsyhWV6Sq+2xMuwRiajpmJb4FQSuGk74Q+XGzwtMI
	HtLqfDtf1LzlMD4gXIXwWvGEaOdFKUaOz2n49uoxX2ql2LkR1VkXVe7OjtaT5ELB8N0KEqD60w5ev
	9J9ByYEFjq4XDSaZw4ARtnLj+OBGVlXkR3vaYcr6x/FVtwuYD3BhcogqSpaJPnD3HfPI7HmrELpgD
	kSMu7pZv0LaeE7P7Sowb65zYTGSnGBhwcDUBqTwz/z36sJPSnI6gulmBPYA+F+Z+IUinqCV7fWYfz
	8G9CVyau4kgXRnXfTK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZAdU-00C82G-E1; Tue, 29 Mar 2022 12:07:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZAdH-00C80O-Qy; Tue, 29 Mar 2022 12:07:33 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22TAHJCk029058;
 Tue, 29 Mar 2022 14:07:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=osMzLdkQ6grvoOD0PPp5+8N1DayXK6oHusZTOhnzDIM=;
 b=WzpjXfluC2otRdrEe4i5lw1dl188CauxupIF+mewKyPX71/QFMK5DvdWjx8UmmtivDGW
 qar4zP/mCmw1UC+kCef1dNuxpgZFQ58pZIJy6FKOm6OATZTwxaXmzY4akFdHxul1zQJW
 OYAHjDvPIZ1etazETuJzN60T9DFLBvyNoNQ+fBbOIJfM+ymxxCkngHi25tzBePPen9wl
 EV+D6BXiuYOqGAIFOgKNuSRM63u4elTJ5Jy8D6LthyQtQpd7Fq0CNcCcOgBxCk7gynWN
 FKHdojIp8gcYQF6OHx9ZLHzO6mwmgrPmvceHoRU7dgezm/Fr1FU3YUL9aSmtPkPcb5bg lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1rud9q5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 14:07:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01DE910002A;
 Tue, 29 Mar 2022 14:07:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAE95221764;
 Tue, 29 Mar 2022 14:07:03 +0200 (CEST)
Received: from [10.211.9.54] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 29 Mar
 2022 14:07:01 +0200
Message-ID: <ca54534d-9752-44fc-7341-a8b45e1a00d7@foss.st.com>
Date: Tue, 29 Mar 2022 14:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 2/5] pinctrl: stm32: Replace custom code by
 gpiochip_count() call
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
From: Fabien DESSENNE <fabien.dessenne@foss.st.com>
In-Reply-To: <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_04,2022-03-29_01,2022-02-23_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_050732_736174_8D617BE0 
X-CRM114-Status: GOOD (  19.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andy

Thank you for your the clarification.


On 25/03/2022 21:03, Andy Shevchenko wrote:
> Since we have generic function to count GPIO controller nodes
> under given device, there is no need to open code it. Replace
> custom code by gpiochip_count() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 9ed764731570..d4bbeec82c1f 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1423,7 +1423,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct stm32_pinctrl *pctl;
>   	struct pinctrl_pin_desc *pins;
> -	int i, ret, hwlock_id, banks = 0;
> +	int i, ret, hwlock_id;
> +	unsigned int banks;
>   
>   	if (!np)
>   		return -EINVAL;
> @@ -1513,10 +1514,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		return PTR_ERR(pctl->pctl_dev);
>   	}
>   
> -	for_each_available_child_of_node(np, child)
> -		if (of_property_read_bool(child, "gpio-controller"))
> -			banks++;
> -
> +	banks = gpiochip_count(dev);
>   	if (!banks) {
>   		dev_err(dev, "at least one GPIO bank is required\n");
>   		return -EINVAL;

Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
