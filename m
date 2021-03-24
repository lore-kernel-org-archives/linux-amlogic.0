Return-Path: <SRS0=YWNM=IW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E94C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Mar 2021 17:41:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FFE361A15
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Mar 2021 17:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FFE361A15
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fOipJlG3tlabL+4y0W3ZpPdFH+Zzx4Wh/9YYWH9f+/k=; b=Iwo2dp+A7pTocYEFJvEfylb8k
	7xrCoAJbUhhPZX7sNwyDs2ntF+ZanGeb4Maha4wwJIImx82IuEP5De+RI7UhpBqugfP7BlHZgqx2i
	iU4yoXEgiEjmP/FOWsDsxSQIbLaDPamQDtFhRU/VaPNf2I6apPjkxZ6qXrW3Y9ivhwjlIgX/i0F2t
	WvmaQ/w0A8WNuHk9kJ6ULkJz0Rv8LoRg8rdbqres3IvMOE36T5G+jxkgJXYcqNnSAYGiJhKQslffH
	kyLnm22+I807Nq2BGpe9UIBiF1Js0aOl/uzbsb3TEhqehO/fKY9ZRt9IL93xK9lkLPHkNe1T/lKnC
	yIdh4rYGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP7VO-00HYQd-7D; Wed, 24 Mar 2021 17:41:18 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP7VC-00HYOG-Uw; Wed, 24 Mar 2021 17:41:08 +0000
Received: by mail-il1-f182.google.com with SMTP id r8so22133170ilo.8;
 Wed, 24 Mar 2021 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qx4EDxzhGUtC2AJPebvPB3YgXI61L9lTaX2dRhdfrOs=;
 b=nrxv3r6qebN4VoFDPenIKqbh0Xa0vJvdFgGVg2kNmjkbXKJKbONTnsJA9wa/iEok4h
 uZDyFEYHfHWTYGwZUFjLPjU++ULR+mLeLwiW+zWZYvYg8i1e4W1JM02TZPDcZFGIqrRW
 FoNbda68VfQE9ET+pONhHRW6sPz5ol2doBAP46FVG6Ap1bkH2J647ehhiNXwXNxrv0b/
 b1Ph6VIH20vAaMdNroaYcrnUc4ii4DelYZg8axY9ip9d4/3JfWcr6krRaYnkqnvTfIR/
 pmFAsJ9lcuN+qbmLplUMYhI+w60jni84vvRgBM7x95z1rFjqo1GgNgfCGtH0WO7vOdqQ
 n78A==
X-Gm-Message-State: AOAM5331yFIneRytvLQ/RSkOZhxR1myKQn9PNb8XvHjOiO+DmNnjqG91
 0TRaKtVq7FNSx5RA8qldfg==
X-Google-Smtp-Source: ABdhPJzUTPtzniambejrX61FdLot/3D9UY/ew426v7dAuHtPZCvAW3cB1z4iI77ZW9vSrEyIO6tvcw==
X-Received: by 2002:a92:7d0d:: with SMTP id y13mr3637182ilc.269.1616607665895; 
 Wed, 24 Mar 2021 10:41:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h13sm1334941ila.82.2021.03.24.10.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:41:01 -0700 (PDT)
Received: (nullmailer pid 3309184 invoked by uid 1000);
 Wed, 24 Mar 2021 17:40:59 -0000
Date: Wed, 24 Mar 2021 11:40:59 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, gregkh@linuxfoundation.org,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: serial: amlogic, meson-uart: add
 amlogic, uart-fifosize property
Message-ID: <20210324174059.GA3308031@robh.at.kernel.org>
References: <20210315083459.359773-1-narmstrong@baylibre.com>
 <20210315083459.359773-2-narmstrong@baylibre.com>
 <CAFBinCA1WhtWLEfJ-QyBbZpsY75r=su6uzyWamY6nHOQ+HYvAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA1WhtWLEfJ-QyBbZpsY75r=su6uzyWamY6nHOQ+HYvAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_174107_066434_F712A501 
X-CRM114-Status: GOOD (  20.55  )
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

On Tue, Mar 23, 2021 at 10:33:15PM +0100, Martin Blumenstingl wrote:
>  Hi Neil,
> 
> On Mon, Mar 15, 2021 at 9:37 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> > power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
> do we still need wrapping of long lines in commit messages?
> if so I think the line above is too long
> 
> > a different FIFO size from the other ports (64bytes).
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> one additional note below
> 
> > ---
> >  .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > index 75ebc9952a99..e0a742112783 100644
> > --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > @@ -55,6 +55,12 @@ properties:
> >        - const: pclk
> >        - const: baud
> >
> > +
> > +  amlogic,uart-fifosize:
> > +    description: The fifo size supported by the UART channel.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [64, 128]
> I personally think this is generic enough to be described as fifo-size
> (as it's done in Documentation/devicetree/bindings/serial/8250.yaml)
> let's wait and hear what Rob thinks

Yes.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
