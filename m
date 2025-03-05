Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2C2C19F32
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Mar 2025 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKD65vA0smVjR/fiqjrarevv1/duHoF8uKPW5Rz8Tl0=; b=SBp4aufNlcU/5O
	7KHMa8Tm9qCK9qFtBSJX06mLV/xArSPcY1ZhNiDBI9rI3eCxo91wDobSlxi8TxfqNiCqK/kYS0TmW
	9XxOmmryDfpESvcIgrHjYwkkeKvy6tp6pTomFuNpIXLrGh2Cuz9N0iK3ZiLQI9v762qxkbinUN3N3
	fF1MBpuvbqN+iD7GddRctddnAOxwj1dNxGPPjNp1GE1Xfl8suJJVO3otJLYbthrNfjURnBtwmgZ63
	SKq3aqL6/cJygHhdmGtUimrzlsSP0hz2hZXp09c/N2jbsFXfzjtjnM2HHLukvIZy/jEoeLxxIxfK2
	lfR7FeLnU+OhWSvyS8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsEc-00000008lGk-3P5R;
	Wed, 05 Mar 2025 17:08:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsDO-00000008l7V-0oa1;
	Wed, 05 Mar 2025 17:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA9845C6A90;
	Wed,  5 Mar 2025 17:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23704C4CED1;
	Wed,  5 Mar 2025 17:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741194445;
	bh=bLNqQdLWuR0xn/KW0CPq8vI0e4EX5wAgnKJpoztWMHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRcZL88mboMBgd/Z6RV1twdyEVm5uiwvcj4bZ5HeqWq3rGDvMJj272ouZcy8jt696
	 Gt6I0vBWZSsLLK9oLqRWGhS8PmCY9yy3lTLffYrpI1tGcVn++96k/4Zg61hguEDlpn
	 TNiFw5QnMMsVfifjFKcedAr2rZJyOoTzWKcwMLoUTDNywAMJf1JNfO3Ao9lYy7TPVu
	 BmrhSupwkTUtu51i7rYMxSqU2WGejx1ENCuAH8+40TAv2W1lBBjF+G/R06Q+Bn2lv9
	 0LqmyGGqNMOz0WmjEsZwBaNxN3SMt+t7HJcWwxYxV2dfJY+PjLFOX3ML5q8jS196f7
	 9WkRotH9uWkgQ==
Date: Wed, 5 Mar 2025 11:07:23 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: interrupt-controller: Add support
 for Amlogic A4 and A5 SoCsy
Message-ID: <20250305170723.GA2143418-robh@kernel.org>
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
 <20250305-irqchip-gpio-a4-a5-v3-1-1eec70352fea@amlogic.com>
 <20250305-corral-unfair-a7f25abbfd64@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305-corral-unfair-a7f25abbfd64@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_090726_323786_CFFD70FD 
X-CRM114-Status: GOOD (  17.91  )
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

On Wed, Mar 05, 2025 at 04:28:16PM +0000, Conor Dooley wrote:
> On Wed, Mar 05, 2025 at 06:02:56PM +0800, Xianwei Zhao via B4 Relay wrote:
> > From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > 
> > Update dt-binding document for GPIO interrupt controller
> > of Amlogic A4 and A5 SoCs
> > 
> > Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > ---
> >  .../amlogic,meson-gpio-intc.yaml                    | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> > index a93744763787..3c5853c71efa 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> > @@ -35,6 +35,9 @@ properties:
> >                - amlogic,meson-sm1-gpio-intc
> >                - amlogic,meson-a1-gpio-intc
> >                - amlogic,meson-s4-gpio-intc
> > +              - amlogic,a4-gpio-intc
> > +              - amlogic,a4-gpio-ao-intc
> > +              - amlogic,a5-gpio-intc
> >                - amlogic,c3-gpio-intc
> >                - amlogic,t7-gpio-intc
> >            - const: amlogic,meson-gpio-intc
> > @@ -49,8 +52,6 @@ properties:
> >  
> >    amlogic,channel-interrupts:
> >      description: Array with the upstream hwirq numbers
> > -    minItems: 8
> > -    maxItems: 12
> 
> Please leave the widest constraints here, and let the more restricted
> ones in your if/else below.
> 
> >      $ref: /schemas/types.yaml#/definitions/uint32-array
> >  
> >  required:
> > @@ -60,6 +61,22 @@ required:
> >    - "#interrupt-cells"
> >    - amlogic,channel-interrupts
> >  
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: amlogic,a4-gpio-ao-intc
> > +then:
> > +  properties:
> > +    amlogic,channel-interrupts:
> > +      minItems: 2
> > +      maxItems: 12

And then you don't need this clause as 2-12 is the full range.

> > +else:
> > +  properties:
> > +    amlogic,channel-interrupts:
> > +      minItems: 8
> > +      maxItems: 12

And 12 is already the max, so you only need 'minItems: 8'.

> > +
> >  additionalProperties: false
> >  
> >  examples:
> > 
> > -- 
> > 2.37.1
> > 
> > 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
