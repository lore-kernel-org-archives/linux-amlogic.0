Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05650C7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfcqBSJAzo08DvF7vuxQjXUSIhNF0T/e2OYS203dOV4=; b=26K9oKp4SJJJ9O
	iboiXDN09uyWnTRSqTcKWleYpmQaN8yBYxF9zAG+eTXFXGzuaICThG9CBhd7FSvC2V5Cn2YKzzOUw
	lNszSjX/ezYxqwxUkteYHgaJTwOCE9WP5pSDTQIrP621RtrzvkR3p7gYhiP2Y89eRDbG/PZtAi0/K
	ZtYmHe2A0o9SbSbcuHy+ZvCoBEPCWhXn7I2lPbOfzdjGcf0YyjwQYsXt20CCXv/FHZdD7kDZx3cNt
	/vfnTuj12mjt1MdMKHrBlgWp5u6TQXHcMAXAPVT62d+SJtrYgee54KBkx9VFkUWR6BHc4/+ieenNQ
	qiI1A2lECQHwi1v7+fGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXNM-002Vvb-0e;
	Wed, 12 Apr 2023 10:06:52 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXNH-002Vrq-15
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Apr 2023 10:06:50 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-11-OIVFlk1zNIulZSxCxWqPCg-1; Wed, 12 Apr 2023 11:06:42 +0100
X-MC-Unique: OIVFlk1zNIulZSxCxWqPCg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 12 Apr
 2023 11:06:39 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 12 Apr 2023 11:06:39 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arseniy Krasnov' <AVKrasnov@sberdevices.ru>, Liang Yang
	<liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>
CC: "oxffffaa@gmail.com" <oxffffaa@gmail.com>, "kernel@sberdevices.ru"
	<kernel@sberdevices.ru>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 2/5] mtd: rawnand: meson: replace GENMASK() macro with
 define
Thread-Topic: [PATCH v1 2/5] mtd: rawnand: meson: replace GENMASK() macro with
 define
Thread-Index: AQHZbQcFy/8yOpNpAUyIp49WWIi1Cq8ncmZA
Date: Wed, 12 Apr 2023 10:06:39 +0000
Message-ID: <2f89000bdbbb4e2bb7f1dd96c1b498f9@AcuMS.aculab.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-3-AVKrasnov@sberdevices.ru>
In-Reply-To: <20230412061700.1492474-3-AVKrasnov@sberdevices.ru>
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
X-CRM114-CacheID: sfid-20230412_030647_676026_C439D46A 
X-CRM114-Status: UNSURE (   6.04  )
X-CRM114-Notice: Please train this message.
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

From: Arseniy Krasnov
> Sent: 12 April 2023 07:17
> Subject: [PATCH v1 2/5] mtd: rawnand: meson: replace GENMASK() macro with define
> 
...
>  		len = mtd->writesize + mtd->oobsize;
> -		cmd = (len & GENMASK(13, 0)) | scrambler | DMA_DIR(dir);
> +		cmd = (len & NFC_CMD_RAW_LEN) | scrambler | DMA_DIR(dir);
>  		writel(cmd, nfc->reg_base + NFC_REG_CMD);

What is the point of the mask?
If the length is too big it just generates a different
'hard to debug' error.
If the length can't be too bit there is no point masking it.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
