Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88947C43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 12:44:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362C12073E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 12:44:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbQWkYFb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362C12073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jN292uGmFysbi0Okprsa0ikuLaBreIBa7ZzbmeCMO0=; b=lbQWkYFb1K+B7K
	fYezzdUNXWI5oJFijwGh6xkh+gOeB0tL2XtpedcSerOzKQsS7xdu8z1ueKZy2yf6c+nENY0PDcjEK
	pSPUzCffLhdmHHp4rLiIwy4wkAKbj2FqKp32tR5RCGXvrXq93YhypXCx9rvV0UVA8aYa+tGcdv3Pf
	TzXYeXWbmzlugSd5n7qXf88aodg/azswI3lgPkdC2y8TdeoPmOsSCNIe1O1+pih12CYaXx7kLfb04
	+vDphesb9UK1PQqVwrUsBJm8jAc3f0F2LG75QQkf6EhPlU8FyS/B2kUlOsSh4udqA8bszi6H6i4ra
	Hck0V1gP3akzrQ3ZwKYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHRrq-0005cR-KC; Thu, 26 Mar 2020 12:44:14 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHRrn-0005at-NA; Thu, 26 Mar 2020 12:44:13 +0000
Received: from lhreml709-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id DB07DE27201CDD85434C;
 Thu, 26 Mar 2020 12:43:59 +0000 (GMT)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml709-cah.china.huawei.com (10.201.108.32) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 26 Mar 2020 12:43:59 +0000
Received: from localhost (10.47.88.85) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 26 Mar
 2020 12:43:58 +0000
Date: Thu, 26 Mar 2020 12:43:49 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi,
 adxl345/6 from trivial-devices.yaml
Message-ID: <20200326124349.00001d32@Huawei.com>
In-Reply-To: <ede75c098e3e354ff7e93e4e1d6191e35ea1fbd2.camel@analog.com>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-2-robh@kernel.org>
 <ede75c098e3e354ff7e93e4e1d6191e35ea1fbd2.camel@analog.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.88.85]
X-ClientProxiedBy: lhreml739-chm.china.huawei.com (10.201.108.189) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_054411_904196_11D5C8EA 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "glaroque@baylibre.com" <glaroque@baylibre.com>,
 "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "lars@metafoo.de" <lars@metafoo.de>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Hennerich, 
 Michael" <Michael.Hennerich@analog.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "knaack.h@gmx.de" <knaack.h@gmx.de>,
 "masneyb@onstation.org" <masneyb@onstation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 26 Mar 2020 07:57:31 +0000
"Ardelean, Alexandru" <alexandru.Ardelean@analog.com> wrote:

> On Wed, 2020-03-25 at 16:05 -0600, Rob Herring wrote:
> > [External]
> > 
> > The 'adi,adxl345' definition is a duplicate as there's a full binding in:
> > Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > 
> > The trivial-devices binding doesn't capture that 'adi,adxl346' has a
> > fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.
> >   
> 
> Acked-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> > Cc: Michael Hennerich <michael.hennerich@analog.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: Hartmut Knaack <knaack.h@gmx.de>
> > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> > Cc: linux-iio@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
> >  Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > index c602b6fe1c0c..d124eba1ce54 100644
> > --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> > @@ -17,9 +17,13 @@ description: |
> >  
> >  properties:
> >    compatible:
> > -    enum:
> > -      - adi,adxl345
> > -      - adi,adxl375
> > +    oneOf:
> > +      - items:
> > +          - const: adi,adxl346
> > +          - const: adi,adxl345
> > +      - enum:
> > +          - adi,adxl345
> > +          - adi,adxl375
> >  
> >    reg:
> >      maxItems: 1
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
> > b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index 978de7d37c66..51d1f6e43c02 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -42,10 +42,6 @@ properties:
> >            - adi,adt7476
> >              # +/-1C TDM Extended Temp Range I.C
> >            - adi,adt7490
> > -            # Three-Axis Digital Accelerometer
> > -          - adi,adxl345
> > -            # Three-Axis Digital Accelerometer (backward-compatibility value
> > "adi,adxl345" must be listed too)
> > -          - adi,adxl346
> >              # AMS iAQ-Core VOC Sensor
> >            - ams,iaq-core
> >              # i2c serial eeprom  (24cxx)  
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
