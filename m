Return-Path: <SRS0=gyfY=5M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F51C43331
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 20:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E4220714
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2020 20:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2JzmvYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E4220714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvzTsQBxDk9NlfGcmcKxPXbo4EwKexgAyutTlDPzNvE=; b=E2JzmvYQy7gwZJ
	Z2R70RIqyzYg2L1Li0nMHl4se666nvcV4RU0gi+Zx4VfczXRuNSrTxFjRciwHpE9SnAnZDKsuybTW
	rvrfCypUZxjpAT7I9BjMEDerln2LrXKTK+kEJnR7B8SviceTA6meEVMCKxibJuteWQWBB56yFWdQ9
	dJtLQK6RcFYZ23SUSTQwJ+dwoTuSs6GXjWrdeEBplJ4JLW5iaGkJp0tQ+3XtFE/g+c+FcirzmyQaJ
	NU5eJPIZK19QRUn4I0EJ282wzgA94lb1rkpLjOOXmGxIggqhOP8YRvW4NbqH6zTya/XLQgKtPS7wb
	5c43Z1up9yC+641oW28g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHvUl-0007uW-BQ; Fri, 27 Mar 2020 20:22:23 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHvUf-0007tO-J6; Fri, 27 Mar 2020 20:22:21 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 14C2B804E5;
 Fri, 27 Mar 2020 21:22:01 +0100 (CET)
Date: Fri, 27 Mar 2020 21:21:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: iio/accel: Drop duplicate adi,
 adxl345/6 from trivial-devices.yaml
Message-ID: <20200327202159.GA12749@ravnborg.org>
References: <20200325220542.19189-1-robh@kernel.org>
 <20200325220542.19189-2-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200325220542.19189-2-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=DN42nk9sAAAA:8 a=e5mUnYsNAAAA:8 a=KWDWuRJ9IF3UujpQpV0A:9
 a=CjuIK1q_8ugA:10 a=oVHKYsEdi7-vN-J5QA_j:22 a=AjGcO6oz07-iQ99wixmX:22
 a=ee1JA_unvF1TMR62yWF-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_132218_010914_E174D557 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
 linux-media@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob.

On Wed, Mar 25, 2020 at 04:05:38PM -0600, Rob Herring wrote:
> The 'adi,adxl345' definition is a duplicate as there's a full binding in:
> Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> 
> The trivial-devices binding doesn't capture that 'adi,adxl346' has a
> fallback compatible 'adi,adxl345', so let's add it to adi,adxl345.yaml.
> 
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: linux-iio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/iio/accel/adi,adxl345.yaml     | 10 +++++++---
>  Documentation/devicetree/bindings/trivial-devices.yaml |  4 ----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> index c602b6fe1c0c..d124eba1ce54 100644
> --- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> +++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
> @@ -17,9 +17,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - adi,adxl345
> -      - adi,adxl375
> +    oneOf:
> +      - items:
> +          - const: adi,adxl346
> +          - const: adi,adxl345
> +      - enum:
> +          - adi,adxl345
> +          - adi,adxl375

I assume it is my schema understanding that is poor.
But I cannot parse the above.

The mix of items, enum and const confuses me.

I guess that if I am confused then others may end in the same situation.
Can we improve readability here or amybe add a comment?

	Sam

>  
>    reg:
>      maxItems: 1
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 978de7d37c66..51d1f6e43c02 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -42,10 +42,6 @@ properties:
>            - adi,adt7476
>              # +/-1C TDM Extended Temp Range I.C
>            - adi,adt7490
> -            # Three-Axis Digital Accelerometer
> -          - adi,adxl345
> -            # Three-Axis Digital Accelerometer (backward-compatibility value "adi,adxl345" must be listed too)
> -          - adi,adxl346
>              # AMS iAQ-Core VOC Sensor
>            - ams,iaq-core
>              # i2c serial eeprom  (24cxx)
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
