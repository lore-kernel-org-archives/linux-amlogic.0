Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156CDC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 08:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mj1zbYHD0fbsB7QIBc73LwP+cw88E3XMD/UmHbCuCiY=; b=NWUF841dm2NDErxs7VGnaKaeaF
	jnu9H+GFXpCoK1Qf6QheYxQJIgwUFFd/z1IIwpDPpSTdZi+DmCAJAGIqPX5AEbRcHtGlHxzXvKz4H
	JrngDdOVHlbW084hqHFJ6A6CDN3GdLZxZU8gjfpTL3RYC68cxyBS4TEwWtNOHWS6cIUTbbrqUtjp5
	z4cR6JD8JGie9A/PDMomDkiTS9bBc8SHLLKCopVtbsLFrezMzM4Be1X0NABttHgjYXZOxy6F8xx7d
	UGIkjy2yMczl745+fmTbwRAQ1JYiy1FdJTfg4jJxwLz+P+uGJ8guinDWLL2jyagVwIChd0x2j77WB
	W5ncsQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1zX-0042eY-5c; Sat, 26 Mar 2022 08:41:47 +0000
Received: from mxout03.lancloud.ru ([45.84.86.113])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1zU-0042dX-32; Sat, 26 Mar 2022 08:41:46 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru DA04E20A8247
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v1 5/5] pinctrl: armada-37xx: Replace custom code by
 gpiochip_count() call
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <3415996d-e8b5-2416-fb66-e65779a9b507@omp.ru>
Date: Sat, 26 Mar 2022 11:41:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_014144_368482_F3694CF9 
X-CRM114-Status: GOOD (  17.20  )
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

Hello!

On 3/25/22 11:03 PM, Andy Shevchenko wrote:

> Since we have generic function to count GPIO controller nodes
> under given device, there is no need to open code it. Replace
> custom code by gpiochip_count() call.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 24 +++++++++------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index 08cad14042e2..ba94125f6566 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -728,22 +728,18 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
>  	struct gpio_irq_chip *girq = &gc->irq;
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np;
> -	int ret = -ENODEV, i, nr_irq_parent;
> +	unsigned int nr_child_nodes, i;
> +	int ret;
>  
>  	/* Check if we have at least one gpio-controller child node */
> -	for_each_child_of_node(dev->of_node, np) {
> -		if (of_property_read_bool(np, "gpio-controller")) {
> -			ret = 0;
> -			break;
> -		}
> -	}
> -	if (ret)
> -		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
> +	nr_child_nodes = gpiochip_count(dev);
> +	if (!nr_child_nodes)
> +		return dev_err_probe(dev, -ENODEV, "no gpio-controller child node\n");
>  
> -	nr_irq_parent = of_irq_count(np);
>  	spin_lock_init(&info->irq_lock);
>  
> -	if (!nr_irq_parent) {
> +	nr_child_nodes = of_irq_count(np);

   Mhm, 'np' is no longer assigned to at this point...

> +	if (!nr_child_nodes) {
>  		dev_err(dev, "invalid or no IRQ\n");
>  		return 0;
>  	}
[...]

MBR, Sergey

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
