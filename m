Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F31FC27C5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 11:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNt7C6ORmm8CmLRtdcMq45OOcdurJo0pyl/8D6UEoOg=; b=u6XZySvqkWuNLq
	G9v7XdF66xpr2mTCFTxTSdCk6TW3KkEHD+9jvkUfKn6NDJY79UsquZPsT9aVELOimza49d2e1XVCb
	hPOOmJ6BiIif+EXaAcgWEf3EKszW+DeWS9ZGAk6qDLPBtQ9riPlRXArgSp7bvwy2/WnB/lNIiZi76
	Ff10MVZWQec9YGaMkSlzSJ1E1CNCIr5aw1RSx9b03qEMDLpczR1nct9gQ47BoTIQfmmBwxIBrEVMC
	zZT802Sr135lptORwSYVvrlNdBExroX/zSWBeddh+wxIGoT8bLXue0F5yCaqp5emi2NsysG9dB1sj
	Z+cH+ejeJjpCW08/wkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdUX-00000004rOK-359v;
	Mon, 10 Jun 2024 11:47:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGdUT-00000004rMk-3iXM
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 11:47:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35f225ac23bso909809f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 04:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718020028; x=1718624828; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rb8Pgp2xqT7cIYki1CL83VCOh424IkKn+0tsBgMjwTI=;
        b=ruOGH+Nzfb0SfCy6ZvzQlfBGfXsSNNdzNjJqEuCj7MU9f1RT0nFgaZ+jQZH23LwaGi
         yx/Vri9VWGsratPf7ZNbxwwtVabphGs3rgHmYspUVsDKhDcclPQd/FLYXJ9KdIt/KElo
         GWXusjsx7TjaoHVcvTeQsTE0JFKTWKGViUggiSW0LBJ33wI7ZkLNm1kt1N+5T1x/l19c
         FZ5rMtkll47RRM/bQJfwgjaIqbtfG7+U2NSsBqgtNuA/aAwkc5SglvRjmDkWUcuzpXZa
         qEpoyKaH3phaPlGrEGMJ6BYZZzrPBtiZvysCCOqtHCK/iii7+5CLsT8qleWvPUa4iNCM
         bwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020028; x=1718624828;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rb8Pgp2xqT7cIYki1CL83VCOh424IkKn+0tsBgMjwTI=;
        b=wkD7RIgS79MKbYO/+dDie4/uw02WdOPRb4Nnd5NktVC4vkhEVF7XDG0kiaFU9YFZAh
         Y6y7mXgzIlh4WSjhWsRLh3O7i2iLspuXitxd8TwFGhrrXE1GRvbvUPB5HlzaZB9ahmMD
         1GGV0JYIeHC6FlbXS1alj9jyNOUfsDp26wCr1K/TvXOFKUrtLIlSb0ttShRzStBFv9CP
         Kq7EkyHoIuCa40Hr6oNBF50+s3ypGrpAwK+rZ6vS3JiLzMt6ScsfcsLldO1Ls0yQTX+7
         gAF/oZ+SqLFAFJdbkK+dc0Xg2EjK92uTfLFWP8MdvMLqP18hkZEu7Hz9ZcT1ex6xseiN
         zPrw==
X-Forwarded-Encrypted: i=1; AJvYcCVcCBtsTMnvQ/5v/m2jRaz8J2B+GsAWcvYXs49y4PGX3DLwRou36pKc4kXuasArfR2brunP8dcCzwUK5wnIwOnCEjdl42RnPRp1HOzfDv7ZmwA=
X-Gm-Message-State: AOJu0YwMueYrZ0PXc7uBTxSxaDif/2U3mLpiZ6gcClHW3kXPx2ODREOs
	TPZAdOj3kfRLNq3HSCKfI3GPwcuwqnJR/vR+pHLC5ik6bgIDGk52wQ/A/4wV7mY=
X-Google-Smtp-Source: AGHT+IHALXrUP/ilTuRks1bDqpKHDSOZ0fxOLIroYwbtLGrwC2bQGMJQpHI/3NMnoy0xSxmxFpGrmw==
X-Received: by 2002:a05:6000:1886:b0:35f:17c8:fe2d with SMTP id ffacd0b85a97d-35f17c8ff54mr5235072f8f.37.1718020027718;
        Mon, 10 Jun 2024 04:47:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f209c4a4asm3601821f8f.43.2024.06.10.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 04:47:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: clock: meson: add A1 CPU clock
 controller bindings
In-Reply-To: <20240610111826.im3mz64hjfkxrxhr@CAB-WSD-L081021> (Dmitry
	Rokosov's message of "Mon, 10 Jun 2024 14:18:26 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
	<20240515185103.20256-7-ddrokosov@salutedevices.com>
	<1jtti1p10m.fsf@starbuckisacylon.baylibre.com>
	<20240610111826.im3mz64hjfkxrxhr@CAB-WSD-L081021>
Date: Mon, 10 Jun 2024 13:47:06 +0200
Message-ID: <1j7cexow91.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_044710_103938_12F73770 
X-CRM114-Status: GOOD (  29.11  )
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

On Mon 10 Jun 2024 at 14:18, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> Hello Jerome,
>
> Thank you for the review!
>
> On Mon, Jun 10, 2024 at 12:04:09PM +0200, Jerome Brunet wrote:
>> On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
>> 
>> > Add the documentation and dt bindings for Amlogic A1 CPU clock
>> > controller.
>> >
>> > This controller consists of the general 'cpu_clk' and two main parents:
>> > 'cpu fixed clock' and 'syspll'. The 'cpu fixed clock' is an internal
>> > fixed clock, while the 'syspll' serves as an external input from the A1
>> > PLL clock controller.
>> >
>> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
>> > Reviewed-by: Rob Herring <robh@kernel.org>
>> > ---
>> >  .../bindings/clock/amlogic,a1-cpu-clkc.yaml   | 64 +++++++++++++++++++
>> >  .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   | 19 ++++++
>> >  2 files changed, 83 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
>> >  create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
>> >
>> > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
>> > new file mode 100644
>> > index 000000000000..f4958b315ed4
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
>> > @@ -0,0 +1,64 @@
>> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/clock/amlogic,a1-cpu-clkc.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Amlogic A1 CPU Clock Control Unit
>> > +
>> > +maintainers:
>> > +  - Neil Armstrong <neil.armstrong@linaro.org>
>> > +  - Jerome Brunet <jbrunet@baylibre.com>
>> > +  - Dmitry Rokosov <ddrokosov@salutedevices.com>
>> > +
>> > +properties:
>> > +  compatible:
>> > +    const: amlogic,a1-cpu-clkc
>> > +
>> > +  '#clock-cells':
>> > +    const: 1
>> > +
>> > +  reg:
>> > +    maxItems: 1
>> > +
>> > +  clocks:
>> > +    items:
>> > +      - description: input fixed pll div2
>> > +      - description: input fixed pll div3
>> > +      - description: input sys pll
>> > +      - description: input oscillator (usually at 24MHz)
>> 
>> According to the documentation, fdiv5 is also an input of the CPU clock
>> tree.
>> 
>> That is typically the kind of things we'd prefer to get right from the
>> beginning to avoid modifying the bindings later.
>> 
>
> Could you please share which documentation you are referencing? I have
> the A113L documentation, and there is no mention of the CPU clock IP.

You should get in touch with Amlogic.

> I retrieved below register map from the vendor's custom driver:
>
> ===
> CPUCTRL_CLK_CTRL0
>
> bits 1:0 - cpu_fsource_sel0
>     0 - xtal
>     1 - fclk_div2
>     2 - fclk_div3
>
> bit 2 - cpu_fsel0
>     0 - cpu_fsource_sel0
>     1 - cpu_fsource_div0
>
> bit 3 - UNKNONWN
>
> bits 9:4 - cpu_fsource_div0
>     Divider value
>
> bit 10 - cpu_fclk
>     0 - cpu_fsel0
>     1 - cpu_fsel1
>
> bit 11 - cpu_clk
>     0 - cpu_fclk
>     1 - sys_pll
>
> bits 15:12 - UNKNONWN
>
> bits 17:16 - cpu_fsource_sel1
>     0 - xtal
>     1 - fclk_div2
>     2 - fclk_div3
>
> bit 18 - cpu_fsel1
>     0 - cpu_fsource_sel1
>     1 - cpu_fsource_div1
>
> bit 19 - UNKNONWN
>
> bits 25:20 - cpu_fsource_div1
>     Divider value
>
> bits 31:26 - UNKNONWN
> ===
>
> As you can see it doesn't have any other inputs except fclk_div2,
> fclk_div3, sys_pll and xtal.

You might not know what to do with it yet, still it is part of the
documentation and should be part of the bindings too

>
>> > +
>> > +  clock-names:
>> > +    items:
>> > +      - const: fclk_div2
>> > +      - const: fclk_div3
>> > +      - const: sys_pll
>> > +      - const: xtal
>> > +
>> > +required:
>> > +  - compatible
>> > +  - '#clock-cells'
>> > +  - reg
>> > +  - clocks
>> > +  - clock-names
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
>> > +    apb {
>> > +        #address-cells = <2>;
>> > +        #size-cells = <2>;
>> > +
>> > +        clock-controller@fd000000 {
>> > +            compatible = "amlogic,a1-cpu-clkc";
>> > +            reg = <0 0xfd000080 0 0x8>;
>> 
>> If reg is <0 0xfd000080 0 0x8> then node name should be clock-controller@fd000080
>> 
>
> Okay, I will fix that example in the next version.
>
> [...]

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
