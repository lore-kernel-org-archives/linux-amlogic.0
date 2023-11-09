Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEE4C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1pMYsmosHgaEF80onjbHw6Ose3vuX2rmbwVwyJXEXY=; b=A6GysvInxU8am3
	dLFSMKS1oh1e8Q9PnUedmR1AC3tWbz/nViv36OtXe79O+CEAj9Tw1HrwZK7Ty96Qa9ihS9sIflCPa
	+n8n8Y9kFBYhRwOnWb/RKeq+5ZxfwI9Qw23koU+mXYo+RR+t0ctYo4+u1gaHvvmp1QD3T5gIX2AK8
	vJKqfzcOgGEQqfgbt7u7brMuQs8/HGHlLZMB0bN+N7WQDJ3qjp6BOe/Y2KgBYDf1F5FiBkvh8pxJ/
	jMJnFB85x3UJ8C6ckwb+LSGrrHJ6/RNKbXQMgwlnYdZ0h7UtlGrkONgnLdlgijgYWmN809yZIYmyD
	xZHipQms0Vb26lR/RXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r19Jg-006zTD-1Q;
	Thu, 09 Nov 2023 17:59:44 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r19Jd-006zRU-0Z
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 17:59:42 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-33-bLC80emNPv-UQE7EuSLIUQ-1; Thu, 09 Nov 2023 17:59:32 +0000
X-MC-Unique: bLC80emNPv-UQE7EuSLIUQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 9 Nov
 2023 17:59:24 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 9 Nov 2023 17:59:24 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Viacheslav Bocharov' <adeep@lexina.in>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH] firmware: meson-sm: change sprintf to scnprintf
Thread-Topic: [PATCH] firmware: meson-sm: change sprintf to scnprintf
Thread-Index: AQHaEunNN2AngpIfEUOhTXwrGwSTX7ByRpLw
Date: Thu, 9 Nov 2023 17:59:24 +0000
Message-ID: <bd3a9ca738444c99855c6aabe318e351@AcuMS.aculab.com>
References: <20231109085029.2079176-1-adeep@lexina.in>
In-Reply-To: <20231109085029.2079176-1-adeep@lexina.in>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_095941_497594_2CC61721 
X-CRM114-Status: GOOD (  10.75  )
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

From: Viacheslav Bocharov
> Sent: 09 November 2023 08:50
> 
> Update sprintf in serial_show frunction to scnprintf command to
> prevent sysfs buffer overflow (buffer always is PAGE_SIZE bytes).

Isn't the correct function sysfs_emit() ?

In any case that particular example can't possibly overflow.

	David

> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>  drivers/firmware/meson/meson_sm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index ed60f1103053..c1c694b485ee 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -265,7 +265,7 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
>  		return ret;
>  	}
> 
> -	ret = sprintf(buf, "%12phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
> +	ret = scnprintf(buf, PAGE_SIZE, "%12phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
> 
>  	kfree(id_buf);
> 
> --
> 2.34.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
