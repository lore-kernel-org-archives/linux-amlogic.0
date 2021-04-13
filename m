Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E945C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 20:59:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8A661158
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 20:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD8A661158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PobFYr+YKBkim/FqUSlyIwZ9kwGNu0xFYzzjb4h3IkQ=; b=VSt3PiN1Nwg7u41qpWxwPP6C1
	VEtfdnVaqJGPZRPI2AeJrswn20ohQ39+7ZxwWd4IfUtuOzieUhkHzs1vmveqkEruGw60xC6IFYPGt
	95NsOTbtPrxabC+/1slST1FHqA+RyIYIKcQlnn6QHx4OH8MMAKyWcvkZE6JaLLa8OLwWsPghab1cQ
	pySCCRjA01+k74eTTcsbMhveY2MOUsMiJA5H8adzRSWYKfZioRLgVx2ttjW5WgQR7BpXAkifoUhma
	bx3vmHwH53jE+LWAFf/VkCPDT/HjNsY3BezbJ4J+BRDM4BPUjzgSYJTmfwytxrgtHN/rHB3uq8F+K
	9yc6E9VgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWQ8N-00ASMB-70; Tue, 13 Apr 2021 20:59:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQ8E-00ASLA-Pu
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 20:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Hzr+drbNXiK2tYxvWmdfvPi+leW5/F2odA/8wjTreJs=; b=yJvsg7f1pnUA+vUIn08VCJenns
 u1OVZBYRAwoXgLXXKv4te51shr+O4M6GA4y6gzfaGps337Otsw+p4HyytLAgLmY7c4rXSSFIEifTz
 PEAJxf+STTbFdjnaaBKN1lbms5xcD5D89+MU9bRxgLUExR+tuEvtzU/+3Mwwd0sFw8l/yYbUSKaZO
 2m0W9uISssM/36L3U7ctoODghjcPBO4PDZztsS7amzOyN+S01rGvYa++7BWBiGbxq19GsE1NjwbdI
 cmgnTORnnTlLB4gD/wKc0qsxLv/x7/k3D2aYP5EtXQksU335KJh7k+OKKUaapnVbuAMo4zKmiN4nd
 RQBFutmg==;
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQ8A-007JvH-Gp
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 20:59:33 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 i16-20020a9d68d00000b0290286edfdfe9eso6769328oto.3
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Apr 2021 13:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hzr+drbNXiK2tYxvWmdfvPi+leW5/F2odA/8wjTreJs=;
 b=BmCcB2+ghlq6G0idKSkghL7hw/drvsShjVRVqiivG/kJ5+Q7Oq+YPu1vkeejFWXNwb
 TJ2yDFWdrxEUbKb/f+FByYO6x0C36v96mQkiLaLcCSQDWDANdosfCpEz5DPzO6Rksscf
 0BLN+2VrM5LYCa1zTCiBA7+TlHfg79OkfCdC2TCoP8u9Ih0DAUcuJJ5RMUKvFcSklxAo
 tT0eBStnNd9/O8tqQL+wRFZ2DHgxJu622oBogm8XVo26eNc3D5bLZTHGCOMH4EHame0f
 hPjM9stcFyseRXfs9AJtH4owa47Wf+vMzE7p8jbmmbi3mblxBYM4TIy/4VYkwOv5t4/y
 KauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hzr+drbNXiK2tYxvWmdfvPi+leW5/F2odA/8wjTreJs=;
 b=RJoXr82oH4qSVeH/rG3R1ekz4IvqMwEwjNaK8kxRp1HzYoPUKw7vEXKAF25u5e12UR
 vAXpdqHACpTbT0UkKLcIThKBuxBMORrsTK/nzqV7coLeUxpi0ob5BNhtaEg6QQ4/Q1Z+
 P/VgZ+NLnMuOxgQRXu1JlB+0ESoIxCmLj9L23eoybUYdLXM8Il1xKK16ftR3L5FReDrG
 m20x8fMpx8MHfSdjxsB8quClwC+ntsmyDLIV7dYey5xHyraT5Wr2YfQyzhHTyWPiU+Ac
 n0uMsrt9VeRxX+fLAYz1ch6MBI95xURqdvmRCGKpXYMh0qspr5EoA30s0HbeaaCePJsw
 +UmA==
X-Gm-Message-State: AOAM530p6So+nvznH/sm8weX0wRp+Gt/SXIC+o9BQT0sTud6y/uyC5W2
 Y8U8u1HxbI6m85KDz6ByY7XXZQ==
X-Google-Smtp-Source: ABdhPJwCzRTr0jfeqL0F1t8YVvyEYWo6fiplNERisZ/Csco6W/DlnVdtqr3ILpTAnP2qdq6a9FwjAg==
X-Received: by 2002:a05:6830:c5:: with SMTP id
 x5mr17821007oto.317.1618347569113; 
 Tue, 13 Apr 2021 13:59:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n25sm735157oop.13.2021.04.13.13.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 13:59:28 -0700 (PDT)
Date: Tue, 13 Apr 2021 15:59:26 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, ohad@wizery.com, robh+dt@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Message-ID: <YHYGLuxIN7WMakco@builder.lan>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
 <YFLBPGNQpT9mM3AJ@builder.lan>
 <CAFBinCA92411o5+AGApr8+nkMdmzJ4ddzVY+Cb5FLBez+-92nA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCA92411o5+AGApr8+nkMdmzJ4ddzVY+Cb5FLBez+-92nA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_135930_594336_B05227EF 
X-CRM114-Status: GOOD (  33.56  )
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

On Tue 23 Mar 17:02 CDT 2021, Martin Blumenstingl wrote:

> Hi Bjorn,
> 
> On Thu, Mar 18, 2021 at 3:55 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> [...]
> > > +examples:
> > > +  - |
> > > +    remoteproc@1c {
> > > +      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
> > > +      reg = <0x1c 0x8>, <0x38 0x8>;
> >
> > I'm generally not in favor of mapping "individual" registers, do you
> > know what hardware block this is part of? Can you express the whole
> > block as an single entity in your DT?
> the answer is unfortunately not easy :-)
> 
> some background information:
> Amlogic SoCs have two power domains:
> - AO (Always-On)
> - EE (Everything-Else)
> 
> AO includes (at least) one ARC core for which this remoteproc dt-binding is.
> EE includes ARM Cortex-A7/15/... cores
> 
> The AO registers can be accessed from the EE power-domain and vice versa
> 
> Following is an extract (with comments added by me) for the AO
> registers (taken from the GPL vendor kernel):
> #define AO_RTI_STATUS_REG0 ((0x00 << 10) | (0x00 << 2))
> #define AO_RTI_STATUS_REG1 ((0x00 << 10) | (0x01 << 2))
> #define AO_RTI_STATUS_REG2 ((0x00 << 10) | (0x02 << 2))
> these three are used for communication with the firmware on the AO ARC core
> I am not sure into which Linux subsystem these would fit into best
> 
> #define AO_RTI_PWR_CNTL_REG1 ((0x00 << 10) | (0x03 << 2))
> #define AO_RTI_PWR_CNTL_REG0 ((0x00 << 10) | (0x04 << 2))
> this includes various power-domains for the following functionality
> (and probably more):
> - DDR PHY I/O
> - AHB SRAM
> - video encoder/decoders
> - EE domain isolation
> 
> #define AO_RTI_PIN_MUX_REG ((0x00 << 10) | (0x05 << 2))
> first part of the pin controller registers for the "AO" bank pads
> this includes various GPIOs, UART, I2C for communication with a PMIC,
> infrared remote decoder, two PWMs, etc.
> all (known) functionality can be used by Linux as well.
> especially the UART, I2C, IR decoder and GPIOs are functionality that
> we use with Linux today - without involving the AO ARC
> remote-processor.
> 
> #define AO_WD_GPIO_REG ((0x00 << 10) | (0x06 << 2))
> (I think this is related to the watchdog being able to trigger the
> SoC's reset line, but there's no documentation on this register)
> 
> #define AO_REMAP_REG0 ((0x00 << 10) | (0x07 << 2))
> #define AO_REMAP_REG1 ((0x00 << 10) | (0x08 << 2))
> remap registers for the AO ARC remote-processor as used in this binding
> 
> #define AO_GPIO_O_EN_N ((0x00 << 10) | (0x09 << 2))
> #define AO_GPIO_I ((0x00 << 10) | (0x0A << 2))
> GPIO controller registers for the "AO" bank pads
> 
> #define AO_RTI_PULL_UP_REG ((0x00 << 10) | (0x0B << 2))
> second part of the pin controller registers for the "AO" bank pads
> 
> #define AO_RTI_WD_MARK ((0x00 << 10) | (0x0D << 2))
> again, I think this is somehow related to the watchdog but there's no
> documentation on this
> 
> #define AO_CPU_CNTL ((0x00 << 10) | (0x0E << 2))
> #define AO_CPU_STAT ((0x00 << 10) | (0x0F << 2))
> used for booting the AO ARC remote-processor
> 
> #define AO_RTI_GEN_CNTL_REG0 ((0x00 << 10) | (0x10 << 2))
> seems to be a multi purpose register as it (seems to) contains some
> reset bits (for the AO UART and RTC) - not documented
> 
> (more registers are following)
> 
> to summarize this: I think there's indeed three different sets of registers
> having one big device-tree node spanning all of these registers seems
> incorrect to me as the other IPs are independent of the AO ARC
> remote-processor.
> so the way I have done it in the original patch is the best I could
> come up with.
> 
> Please let me know what you think!
> 

I see.

Describing these kinds blocks in DT is indeed tricky, I've had
both cases where a block maps to multiple "functions" or where they
contain misc registers to be used in relation to some other block.

The prior typically lends itself to be modelled as a "simple-mfd" and
the latter as a "syscon".

So perhaps you could do a simple-mfd that spans the entire block and
then describe the remoteproc, watchdog?, pinctrl pieces as children
under that?

Regards,
Bjorn

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
