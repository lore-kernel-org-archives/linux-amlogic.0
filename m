Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08040C678D4
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHoJEOR4uTgsgHJfhCmZSQo1X7kKZjsuc7I9TAcSuos=; b=iqhbj1+xEwbLlw
	mIhJ6uqylQpOGgLOQ9Pj4ZQDo8SFuQu1v5d3kWEACal+SMLu9eML3UvnUDiWo14k4behZtok/+dWQ
	mFyttWhzhMXGucQsMTeA6EmP/zMzC2DXHRqA0kCZNi3PXOP5ntF5qkj07ptIHxy+g64ZLe6iptFot
	rq8G+sVbcIiNoS/7gWmvr8aQGqvNS3pPliwlRM45/sFrWoxn8k7A95axUVfuG5SxbceOx8H4lTero
	xobm03eCCBIVqfYhohrhr4iiAXJs732KEX2+C7/Ont/JEshG6LPNUlZLgAQ30WRE8GpjQNx+JFP8o
	z0HphjuEVaAXt5uk4ZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTew-00Guz9-DA; Tue, 07 Mar 2023 09:31:02 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTeh-00Guov-Rh; Tue, 07 Mar 2023 09:30:49 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id CC1F85FD29;
	Tue,  7 Mar 2023 12:30:38 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678181438;
	bh=6lO2QPTQx3VBJm1+Mk1D4msGumd9zL1FfxW8GKaySUM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=WHHQ25INA4QvVTURiwMJGV5hMnZftiN63Ifz7A2mfW+NTpI54v8hESwXAXLZqdwlW
	 MGhxM1iAbBbkzAvjOfAlHx7P4lFY0J707JY0Ucz4s4Y7+r4Lw9LPaYCtWVREMfmGo3
	 HtADJAVAr/t7moCXoAIwX+2nbKjoRbji3xklYAniIVLjG/XqXfFFvvobXzsWf9K0XL
	 HrxTsXy5G9T947pYDABhBthcz9XrmqNVTXUzhl+498h2+FkL0T6dchr33hQEwPO8Yo
	 85OTB9VbLUeq4Qdpfc3ypGS+SS3ndyf6TWZBU1+ZnXkHb+SCk3WHCwTOvF4ieZha2a
	 iDxUMp/n35vQQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  7 Mar 2023 12:30:38 +0300 (MSK)
From: Alexey Romanov <AVRomanov@sberdevices.ru>
To: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "martin.blumenstingl@googlemail.com"
	<martin.blumenstingl@googlemail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Thread-Topic: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Thread-Index: AQHZNxDMFNGdYZWqIECM18Y2pLjN2K7u9V0AgAAZIwA=
Date: Tue, 7 Mar 2023 09:30:37 +0000
Message-ID: <20230307093011.vviyrtygneqy2us3@cab-wsm-0029881.sigma.sbrf.ru>
References: <20230202141520.40003-1-avromanov@sberdevices.ru>
 <9623bc3f-760a-e838-c80f-40d2f9b79f35@linaro.org>
In-Reply-To: <9623bc3f-760a-e838-c80f-40d2f9b79f35@linaro.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.24]
Content-ID: <1566E12FAC27704AB3308B0CAB3B36E7@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/07 06:50:00 #20921514
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_013048_451739_05D7FEBC 
X-CRM114-Status: UNSURE (   5.88  )
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

> The [PATCH 1/2] highly confused b4, anyway it's applied on v6.4/arm64-dt.
> 
> Thanks,
> Neil


Oh, sorry for the noise. 
Thank you, Neil!

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
