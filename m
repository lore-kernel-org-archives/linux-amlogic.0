Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11683EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3Cfiy84+MBYpp5NXa4ZzFFxH7NNgFMq4JXMCK7ZW5s=; b=zPYdEa5boBgskl
	0VpFC3QM8c8FQMQif0F54tAjoNN9PlvM/5fRGEjySiEKM0EvwAvxln3vOwmHOsUw8LNQvwuXNW3/w
	qCjjsDTO/7ZfjOY3aPKJDnAGoYBcMxJMWSEHnDeReGgQhY9UB+nRGPNmMqg6N7sSmOhdKpOy6TufD
	oKbYyxo4csSyQ/Wa50uQOYOXejlR1+AmR9C8uAAQ6gRZ3dpQH5DsQ2njXlWTARCUtLhQcG/ZtietW
	boQ7rda/MxLvG+37W7jkHzW+HH8P/vWhZru6XJE1MJWVqPI+o0JMXglYhfpUzEIMlS5ggzbsi7nXi
	ZVOsNwhCVpVqsiT650Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiRy-00DkP9-28;
	Tue, 04 Jul 2023 16:00:22 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGiRs-00DkKs-0r;
	Tue, 04 Jul 2023 16:00:18 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A6301120058;
	Tue,  4 Jul 2023 19:00:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A6301120058
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688486412;
	bh=NlclJLW6iFoo+Xt0fn1OTOrZ+APYHvkqRmXZG6Ftu9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=hocKwe86v6D+fUlu2y8/SnQBi1U4037eBgiEWJ8w8/OouoAKzJqKwHHQuNNnznu2a
	 55T90PRqLj7rwX95FOHexZFMZyYylS6mE8XLZv1J4+NHe6eSX0SYnQ6/YWsoO2Wtpx
	 o1wMVCwInWDhs2K3i4Ff3VsvA3tmt0RWjff2DFyARcMYrlAKLNCWQbsCT9x8rKYb7K
	 819aETP1Oo/vKmfW8LKy1ISw9+DH1GXt2tlEV8zTXF+Zc0NTAWIe9buyO+PdF1miYI
	 FdFJXJquAr1NA+PQz4jdaaODUWqkZf+hwqKniK8uMX38WreAwlhh/TDjsdhvzvX8gn
	 4Jov2Q/utejsA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 19:00:12 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 4 Jul
 2023 19:00:01 +0300
Date: Tue, 4 Jul 2023 19:00:12 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<jbrunet@baylibre.com>, <jirislaby@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <kelvin.zhang@amlogic.com>,
	<xianwei.zhao@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 3/5] tty: serial: meson: apply ttyS devname instead of
 ttyAML for new SoCs
Message-ID: <20230704160012.yoaqgk4plpyd6v26@CAB-WSD-L081021>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-4-ddrokosov@sberdevices.ru>
 <eb0dab5b-2fc7-728c-c6e0-43d2db422ed5@linaro.org>
 <20230704145933.y3o3fhjj6q7df44d@CAB-WSD-L081021>
 <9fde3632-2419-d36b-9c54-337155bb482e@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fde3632-2419-d36b-9c54-337155bb482e@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178428 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;libera.irclog.whitequark.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/04 13:59:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/04 13:58:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_090017_040513_7A4234FB 
X-CRM114-Status: GOOD (  44.01  )
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

On Tue, Jul 04, 2023 at 05:29:57PM +0200, neil.armstrong@linaro.org wrote:
> Hi.
> 
> On 04/07/2023 16:59, Dmitry Rokosov wrote:
> > Hello Neil,
> > 
> > Thank you for quick feedback!
> > 
> > On Tue, Jul 04, 2023 at 04:42:39PM +0200, neil.armstrong@linaro.org wrote:
> > > On 04/07/2023 15:59, Dmitry Rokosov wrote:
> > > > It is worth noting that the devname ttyS is a widely recognized tty name
> > > > and is commonly used by many uart device drivers. Given the established
> > > > usage and compatibility concerns, it may not be feasible to change the
> > > > devname for older SoCs. However, for new definitions, it is acceptable
> > > > and even recommended to use a new devname to help ensure clarity and
> > > > avoid any potential conflicts on lower or upper software levels. In
> > > > addition, modify the meson_uart_dt match data for g12a, a1, and s4 to
> > > > their appropriate values to ensure proper devname values and
> > > > functionality.
> > > 
> > > I'm not confident about modifying a global struct from a probe,
> > > I think you should add a separate meson_uart_driver/meson_serial_console couple
> > > with ttyS instead of ttyAML, refer to the right uart_driver in meson_uart_data
> > > and in probe() register it and pass it to uart_add_one_port().
> > 
> > Could you provide some insight into why you believe this solution may
> > not be acceptable? It appears that the meson_uart_driver and
> > meson_serial_console are not labeled with __init, which means it stay in
> > memory forever.
> Yes but nothing forbids registering a g12a and an a1 uart on the same system,
> but you modify the meson_uart_driver/meson_serial_console struct.
> This could cause some issues.
> 
> In practice this will never happen, but since we don't control the DT passed
> to the system we must make sure we take in account any scenario.
> 

Yep, agree, this will cause an issue.

> > 
> > To clarify, are you suggesting a solution that involves segregating the
> > meson_uart_driver and meson_serial_console objects for each scenario and
> > subsequently declaring pointers to both objects within the
> > meson_uart_data? I want to make sure that I have accurately grasped the
> > essence of your proposed approach.
> 
> Not both, only the appropriate one.
> 
> So either we make sure ttyAML and ttyS at exclusive at runtime, in this case we can
> modify the global meson_uart_driver/meson_serial_console, or you add
> a second set of uart_driver/console structs to handle this improbable case.

Got it, thank you for explanation! I will prepare the v2.

> > 
> > > > 
> > > > For more information please refer to IRC discussion at [1].
> > > > 
> > > > Links:
> > > >       [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03
> > > > 
> > > > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > > > ---
> > > >    drivers/tty/serial/meson_uart.c | 33 +++++++++++++++++++++++++++++++--
> > > >    1 file changed, 31 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> > > > index 87c0eb5f2dba..361f9326b527 100644
> > > > --- a/drivers/tty/serial/meson_uart.c
> > > > +++ b/drivers/tty/serial/meson_uart.c
> > > > @@ -82,6 +82,7 @@ static struct uart_driver meson_uart_driver;
> > > >    static struct uart_port *meson_ports[AML_UART_PORT_NUM];
> > > >    struct meson_uart_data {
> > > > +	const char *dev_name;
> > > >    	bool has_xtal_div2;
> > > >    };
> > > > @@ -683,6 +684,7 @@ static int meson_uart_probe_clocks(struct platform_device *pdev,
> > > >    static int meson_uart_probe(struct platform_device *pdev)
> > > >    {
> > > > +	const struct meson_uart_data *priv_data;
> > > >    	struct resource *res_mem;
> > > >    	struct uart_port *port;
> > > >    	u32 fifosize = 64; /* Default is 64, 128 for EE UART_0 */
> > > > @@ -729,6 +731,18 @@ static int meson_uart_probe(struct platform_device *pdev)
> > > >    	if (ret)
> > > >    		return ret;
> > > > +	priv_data = device_get_match_data(&pdev->dev);
> > > > +
> > > > +	if (priv_data) {
> > > > +		struct console *cons = meson_uart_driver.cons;
> > > > +
> > > > +		meson_uart_driver.dev_name = priv_data->dev_name;
> > > > +
> > > > +		if (cons)
> > > > +			strscpy(cons->name, priv_data->dev_name,
> > > > +				sizeof(cons->name));
> > > > +	}
> > > > +
> > > >    	if (!meson_uart_driver.state) {
> > > >    		ret = uart_register_driver(&meson_uart_driver);
> > > >    		if (ret)
> > > > @@ -748,7 +762,7 @@ static int meson_uart_probe(struct platform_device *pdev)
> > > >    	port->x_char = 0;
> > > >    	port->ops = &meson_uart_ops;
> > > >    	port->fifosize = fifosize;
> > > > -	port->private_data = (void *)device_get_match_data(&pdev->dev);
> > > > +	port->private_data = (void *)priv_data;
> > > >    	meson_ports[pdev->id] = port;
> > > >    	platform_set_drvdata(pdev, port);
> > > > @@ -780,6 +794,17 @@ static int meson_uart_remove(struct platform_device *pdev)
> > > >    }
> > > >    static struct meson_uart_data meson_g12a_uart_data = {
> > > > +	.dev_name = "ttyAML",
> > > > +	.has_xtal_div2 = true,
> > > > +};
> > > > +
> > > > +static struct meson_uart_data meson_a1_uart_data = {
> > > > +	.dev_name = "ttyS",
> > > > +	.has_xtal_div2 = false,
> > > > +};
> > > > +
> > > > +static struct meson_uart_data meson_s4_uart_data = {
> > > > +	.dev_name = "ttyS",
> > > >    	.has_xtal_div2 = true,
> > > >    };
> > > > @@ -794,7 +819,11 @@ static const struct of_device_id meson_uart_dt_match[] = {
> > > >    	},
> > > >    	{
> > > >    		.compatible = "amlogic,meson-s4-uart",
> > > > -		.data = (void *)&meson_g12a_uart_data,
> > > > +		.data = (void *)&meson_s4_uart_data,
> > > > +	},
> > > > +	{
> > > > +		.compatible = "amlogic,meson-a1-uart",
> > > > +		.data = (void *)&meson_a1_uart_data,
> > > >    	},
> > > >    	{ /* sentinel */ },
> > > >    };
> > > 
> > 
> 

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
