Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC6CC32793
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jan 2023 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8tu3zn1f4lMjd/Oh14C0BDGKbHsOWb1YmcBJcXga4o=; b=Wvslrmrct+VXm/
	wmGpVHQYD+VTSWZp/kal5EVkjdsR5uDLmoeVv/hmRsJqzxzNAx1lvQ59RTNgbN+aqCmbWL0nPI00C
	q7C7LI79cQsvECd60J9NHZwAqNMeCMqHQGB1fI9yXu70RQuIJahNEFv0vGTgWAAwnpVAHygjZE6uz
	qNdCFGVf8RcMnumafdR0uwxBKcUXbD+umtDanrVLIOwiCkdZ1S6BwX/h3fVBe5qCr8xJY+syfwQBG
	MMXqs5I6+MKpgwnb/Wv1bykCUv1SjlYQwsr2M+w+XoebuHF394sdajSV5qSPLYIbwL6ENFhTot4az
	C4gEHdKlLAxqFkGERTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI72T-000cnw-OP; Wed, 18 Jan 2023 11:55:33 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI72Q-000cmW-MK
	for linux-amlogic@lists.infradead.org; Wed, 18 Jan 2023 11:55:32 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id i188so35415417vsi.8
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Jan 2023 03:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uFwEIEOiSaW9hXN4k5YwZLmqm93pKj/xVyynsfLQsUA=;
        b=R0kiAqJYRSp/UTQPUDyGlM8oim8OrtDNUFJ/VlCzx/Xz4ZdBcong/DY/nekEOAdtzM
         CLy/t1aqHPjL/uJQ/6UxMuJeW60mzLgWwDh3uoUmrVidKcel2SUYy7Fi/8mAWrclK+lL
         QeEgNCtgZ/f3je+Ds1lpR3Cc9qf6AoHP45CFGBx8gMCVTPx7o2MJgBbA3tsy8a4ywpTI
         ir2+Hmy4s6s2FBFNsUHTkce82EOHqXSZkdskCfGSwfnyMRX1419R/Mg4+5z/VP9VE0wk
         JIQyOGYUTaaBpEzB57nMeLemi4zy93VSIX8cVse8V00WmdgaL6mms/wKjnasesQBub6R
         Vqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFwEIEOiSaW9hXN4k5YwZLmqm93pKj/xVyynsfLQsUA=;
        b=bUb5GoAWdGg7DVyZDULVX77UW5tyRKPRLMKDUHaCQ2EFz+/toPcu6WP4JBb3nRxVxE
         PFu5eFjIUC4EcNWXQgZ3h/WHw5lQd/XuNjeCTDh9GYWeE3Ip1wcti3IB4T+dwyXNDwWq
         WL1zk53VcpVDwGoiDV3rlo+TTRDNAwTxix4hqubkk2+t6PRtrH2m0y9rioxMjppz07j6
         DaKoe5idSlUt0ofl43q2SNXqXSZecarhhTP8YmBwJvhGgYx+vqOug4SO3HNoNXWji3nW
         PN+bxHYj5vBubvRlv7nDJxkdEsEguJN1taC2brX5jETFJEdXBNHliRfRx2fXL9YEvPMc
         p4Gw==
X-Gm-Message-State: AFqh2koO1MiT1cQHLosmNswRW9bcSN6x76VtdXjNfRPiTWaPX7Wub8IN
	dfwA9lyW5hEX4/X1H+YbR9IklqtQwom1eEpbtro=
X-Google-Smtp-Source: AMrXdXskNkq+CbqgiO87f6+YCzqH7CO6djk3enoyI29WdSBF6Z/zFZS74ORoGWFWatnmI3x1aSC6mTW4xu2ljMf6pow=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr891572vsl.10.1674042928915; Wed, 18 Jan
 2023 03:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20230118044418.875-1-linux.amoon@gmail.com> <20230118044418.875-7-linux.amoon@gmail.com>
 <2c17eaa5-ee93-58c5-a35a-8366eb4cfc36@linaro.org>
In-Reply-To: <2c17eaa5-ee93-58c5-a35a-8366eb4cfc36@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 18 Jan 2023 17:25:14 +0530
Message-ID: <CANAwSgRJ6Tek7NxSfsExkrWrQ94Ro8mmitoWm3wfrg7NKbO+Lw@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: usb: Add binding for Via lab VL817
 hub controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	Matthias Kaehlcke <mka@chromium.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_035530_752784_87BA1789 
X-CRM114-Status: GOOD (  26.92  )
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

Hi Krzysztof,

Thanks for your review comments.

On Wed, 18 Jan 2023 at 13:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 18/01/2023 05:44, Anand Moon wrote:
> > The VIA Lab VL817 is a USB 3.1 Gen 1 hub and USB 2.0 hub
> > controller that features 4 downstream ports and 1 otg, with
> > an internal 5V regulator and has external reset pin.
>
> Subject: drop second/last, redundant "binding for". The "dt-bindings"
> prefix is already stating that these are bindings.
>
Ok
> >
> > Add a device tree binding for its USB protocol part.
> > The internal LDO is not covered by this and can just be modelled
> > as a fixed regulator.
> >
> > Add combo of USB 2.0 and USB 3.0 root hub using peer-hub.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v2 - fix the compatible string and fix the $id
> >    - update the commit message.
> >    - update the example for use peer-hub node because it
> >      combo of USB 2.0 and USB 3.0 hub.
> >    - rename the yaml file from vialab,vl817q7.yaml to vialab,vl817.yaml
> >      as q7 suffix is ued for USB 3.1 and q5 suffix is used for USB 2.0.
> > ---
> >  .../devicetree/bindings/usb/vialab,vl817.yaml | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > new file mode 100644
> > index 000000000000..5f9771e22058
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/vialab,vl817.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Via labs VL817 USB 3.1 hub controller
> > +
> > +maintainers:
> > +  - Anand Moon <linux.amoon@gmail.com>
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
>
> Drop items
>
Ok,
> > +      - enum:
> > +          - usb2109,2817
> > +          - usb2109,817
> > +
> > +  reg: true
> > +
> > +  reset-gpios:
> > +    description: GPIO controlling the RESET# pin.
>
> maxItems
>
Ok,
> > +
> > +  vdd-supply:
> > +    description:
> > +      phandle to the regulator that provides power to the hub.
> > +
> > +  peer-hub:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle'
>
> Drop quotes
>
Ok,
> > +    description:
> > +      phandle to the peer hub on the controller.
> > +
> > +required:
> > +  - peer-hub
> > +  - compatible
> > +  - reg
>
> Keep same order as in properties: part.
>
Ok
> > +
>
> Best regards,
> Krzysztof
>

I will update these in the next version.



-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
