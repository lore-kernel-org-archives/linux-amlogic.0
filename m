Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7747C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/Lx1+nDQPnCdFo9Tjrh/QC7QtC5x+NNr708+TeN7+Q=; b=f6sOH4JOnwtx2E
	eDKbxpzmZ4X4fEP6E/vaAD06KVW8HUcpVe6DcS1f45Lq+qsjJo+DhYsWyDny90wXpPUtFzdXsmdHd
	ruX+FSYjFc8abIKhJlCPc0DDG9cmUMMFQPOdIvND8JTq/kMXXjywcGAkNqQTrTLrq1/h8g6LH3EEz
	cHSgIxKtIDbNm+g1Aoq5q7VrYxJ658mIrpwKC7jAesBChN8ojJom2egnoV9jkYdtPn9BsF5oIR3Ik
	g9rPvIA0Qyh0bc9nHKzB8dlEjgre1Jqs3PnDPUrz2DA/6uLeFlxKnfbf7qWEfm/I9UQa/CLnWSAfP
	l2vrg1Qx7Woukz/n+tTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUJS-004KDL-8Z; Wed, 28 Dec 2022 11:09:34 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAUJP-004KBb-EC
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 11:09:33 +0000
Received: by mail-vs1-xe35.google.com with SMTP id h27so1485603vsq.3
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1CvxPRIDVT1nlOHFUSTb+riWEiFvrCUY5v0nfrRaE1U=;
        b=HMXFlEf+CZ4SixDofP0Wxuev/ISinqvAGBy2hHxXrEu7zJVWbKrEfHBbmeAkRxcYvP
         3nZzJt1ScaZzBLTK5jXqw6h5AlwjNiZfgEYLy17+YDLYKlvgSyYv8E0173Wr/CnsI91D
         gqeNqGe59TqYzrWJoigg10uuJO5HQqjqGM2x+4Rcsn4lxf3gDtcMSkEi3ups0+g3FYQV
         1oB5y4Da1jdQUtasLoQXEBZ8e/ldIHfecxdwbXhG3+pY2krptsej+802I9fKl7NKSmli
         c8Lw2Rm6TASSBu1K9DQzY2DAxKRzU6E0IhOpRg4DrgrmXzhccP/hLj+p+lU2P16PQwD1
         jEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CvxPRIDVT1nlOHFUSTb+riWEiFvrCUY5v0nfrRaE1U=;
        b=jbX5OlXYv20dny0xYtTMRrqS80xid7FfmmmrPaSqPqTLujOvy5heq6BX9qnQV29ii0
         OYw50b2+DB2MyvYFAI0h8pPYBea5C7IKgj8JSHZBhTaQAeLhHZ7juyud4tEaiiSk8V8G
         k388so36/mQF72YgGeYgRSU8907cuA3r4LhW2NgNQxivEMsr06ZV5l2zhy/v6oTelCcD
         0pw15cBTFZHUcl6sKSVc9004cpkz/pIzL2NYMVRYJTMR2iYj6onoJ+SHCF0hu6RwrHuU
         ZAPv7rKvGtDjEZumqKwMaBmdb1Ael/DobyXaM9YWnioHu10yIxUH099porXKasLvnfnU
         pPqg==
X-Gm-Message-State: AFqh2kqkaFdTr6b+rbIcWui84XKPgREi6hM4X1n6Smj7bQ6kf4HEFDOA
	L775oPCJEVaD/ZbsE0t9YnBKLtdLQtKds/5K3WQ=
X-Google-Smtp-Source: AMrXdXuXc0bJ2Iae/CwTiyA+ZMoJb28nQikQvULssdkmceYo23LWBl6lxh2qfJufFz3h9ArkNk9Y3oyFve8Yn/ktVoA=
X-Received: by 2002:a67:fb07:0:b0:3c9:35c8:e6a with SMTP id
 d7-20020a67fb07000000b003c935c80e6amr809992vsr.63.1672225769058; Wed, 28 Dec
 2022 03:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-9-linux.amoon@gmail.com>
 <Y6wiWIH5S3jJnkai@hovoldconsulting.com>
In-Reply-To: <Y6wiWIH5S3jJnkai@hovoldconsulting.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 Dec 2022 16:39:12 +0530
Message-ID: <CANAwSgT5D-8S7MkDXruztck6S6vjsrPDqbGg=k1=iYW5Bm_yPg@mail.gmail.com>
Subject: Re: [PATCH v1 08/11] dt-bindings: usb: Add binding for Via lab
 VL817Q7 hub controller
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_030931_607150_892BD983 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Johan

Thanks for your review comments.

On Wed, 28 Dec 2022 at 16:32, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Dec 28, 2022 at 10:03:17AM +0000, Anand Moon wrote:
> > The VIA Lab VL817-Q7 is a USB 3.1 Gen 1 4-Port hub controller that
> > features 4 downstream ports, an internal 5V regulator and has
> > external reset pin.
> >
> > Add a device tree binding for its USB protocol part.
> > The internal LDO is not covered by this and can just be modelled
> > as a fixed regulator.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  .../bindings/usb/vialab,vl817q7.yaml          | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> > new file mode 100644
> > index 000000000000..4ae995160fd5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/vialab,vl817q7.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Via labs VL817Q7 USB 3.1 hub controller
> > +
> > +maintainers:
> > +  - Anand Moon <linux.amoon@gmail.com>
> > +
> > +allOf:
> > +  - $ref: usb-device.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - vialab,usb2109
>
> This isn't a valid compatible string for USB devices (should be
> "usb<vid>,<pid>").
>
> Same for the other binding.
>

ok, I will change this in the next version.

> Also the bindings should go before the driver changes in the series.
>
> Johan

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
