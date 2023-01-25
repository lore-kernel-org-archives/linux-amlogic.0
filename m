Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C85C27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/A0nOX9LU1sBHjTfbwmw8sKZiEgMGmy68frqWWfLpg=; b=LbD+ME6QBdxm8Q
	nCP6fAGH2KkefG4WV2mila7gOrBjKIG5qj1fRFW7ntHZcnHzYay50iyFQ4CWvSuNjJ2K3TkmsqYkA
	c2H4+E8hPi1YK+Dsjxg/CRfR3L/5Dbswi7rxDZRBWWw6fFv8+X34KYsC4vP6LbHNen6mqOVcZenhB
	sXkv/+eDqUPKSGGIqoFsrvk67/awMnPN0F1oPL/+MblRCaFkf1q/eBNdd+JcYo+07gN6XUKAZxaBX
	Merg2oQtfnCn40pVGyJDlP9VJHEWRf2K4Eya5N97dPNittqm/1Vs0zmcP0Eq80rKM5Aw/YFNV0JVe
	PzReUq9J/bBRhsAkISSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgz3-007dBb-4k; Wed, 25 Jan 2023 14:42:41 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgxx-007chR-81
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:41:36 +0000
Received: by mail-vs1-xe34.google.com with SMTP id 3so19943043vsq.7
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kODBhOs5SF/g+uKKdGLvYQ1uu9onF2vNH+SdUo5BiI=;
        b=aVwUVFhMTb8XjI5LFcDMTUWQumvqpJiF/5rsORKZkMSpoyjjDhM3LS6kHT2ODXPMwC
         8z3dRrv9t5ow0Idu2TYW755IxsMeseHCM7DoMwwXwr4BrsOvV/MXd/swkOiuCvuEeSkv
         jakH+mhd8Ibp0gvy2RyYgRfyj+9r54BWTECL3lXF5hPNtYwHBSBE3pK6jubf5mFne84n
         5R6wp0ItP9wDUlaVkH/dLsFP/VaoN4lLw2thV/0uLFrP0k1n1kTkEjcydNh+E7sx+OEA
         Im9g/sg5lSn4mnlA4B7li2dcapRNEGnwSuhAp/gaiNGNxPTrzjfs9TOwOFAHj6tAW4oE
         snZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kODBhOs5SF/g+uKKdGLvYQ1uu9onF2vNH+SdUo5BiI=;
        b=s47Ud7ivU+W2ei+UHVs9MNdBXG2VWY5qzpXThzfIlBFma8zTu1iYzChgcLPaVSoLP5
         PRE/fP6tTUy7Azq7WzfApnla5HRUuQPCAfRZl/TzVJFvsYc8Dyj1KSx0yI+GdhG96VXh
         6tCTpM9z8NrFfu3z0eI64RDuo+Gs54VnL3bWgtsGCcQsvlAzaNQjCOcw2nPKvQmIkokt
         juWKY6ac6B3AkPh6Un9InKa17MJeOLy29P7I6dgt0Prpn1xjLB2qsDazKkhQfgUsJ1ia
         bOXXmDmIyauzNtqZuYDz+ys7ZTHmq+i6dF6y++sb6LfEaa1r6Hxu0YKq3Qje5fn10TA0
         3N3w==
X-Gm-Message-State: AFqh2koizNhugPJCcT9IOYndpQAB2soYAR2H6tNeZhxUUMYniAWd6O5l
	ArE1MGe/9aH1BE/k+loS/oRd4b+1Tiyop2a2HtI=
X-Google-Smtp-Source: AMrXdXtWNtz7jGkvrEjuW/eC43d0euK66cieClgRJo4Ag8TIa/cgv5PNKGO3RiqydqTOtwzFpXTffRtcFZiv2Wi6MIk=
X-Received: by 2002:a67:d097:0:b0:3d0:cb3d:ad47 with SMTP id
 s23-20020a67d097000000b003d0cb3dad47mr5103870vsi.76.1674657690896; Wed, 25
 Jan 2023 06:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20230121175639.12818-1-linux.amoon@gmail.com> <20230121175639.12818-2-linux.amoon@gmail.com>
 <Y9E98OLYedOsXHHV@kroah.com>
In-Reply-To: <Y9E98OLYedOsXHHV@kroah.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Jan 2023 20:11:13 +0530
Message-ID: <CANAwSgRe0PdB5iWi-fvK4NFsH4XbaSR3M_KwBNm7wQXzxTkrRg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: usb: Add device id for Genesys Logic
 hub controller
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <uwu@icenowy.me>, 
	linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Johan Hovold <johan@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_064133_339287_3EA63CEC 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Greg,

Thanks for your review comments.

On Wed, 25 Jan 2023 at 20:04, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jan 21, 2023 at 05:56:29PM +0000, Anand Moon wrote:
> > Add usb hub device id for Genesys Logic, Inc. GL852G Hub USB 2.0
> > root hub.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v3: - add Ack of Krzysztof
> > v2: - drop the vendor name from compatible string.
> >     - drop the -OTG and -QFN76 suffix from commit message.
> >     - drop the GL3523 USB 3.1 root hub device id.
>
> I only see 4 of the 9 patches sent to the linux-usb list and cc: me, so
> I'm totally confused.
>
> I'll drop them all from my review queue now and expect a full series to
> show up if they are needed to be merged through the USB tree
>
> thanks,
>

Sorry for this mixup from my side.
I will send the full series of patches again tmr

> greg k-h

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
