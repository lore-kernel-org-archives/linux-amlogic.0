Return-Path: <SRS0=VcWo=IV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E31C433C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Mar 2021 21:36:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59A5619CC
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Mar 2021 21:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59A5619CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+GitUBpkT383FRYFhHmQsBJ/IRpteAXqXYcCXTv2B+k=; b=UYRoFrwFoVxalB7nL/xKQowr6
	bG2uSIhTHoPCRNNoGTtBDIEJD3ujbRAlk3n3YbFpEKGb7CNO2usuTqur22Q9pY+IxYRQmjV2qbtoo
	12vSX/xc+2kI6cmT0jian45vB9PQC35M2hfHxQjyx+Q0fn871103kqnQ4M48huB1Yuzd2p99FHdtK
	rJujSNOxpmKOaIXwfheuE54sOKhrNBQjACVox0vv699AhtFYBYQrE6S8FVcppAriT0iUo363JDo2p
	L0+Tfaq1d7UrKcMDfe2Q9yz38zR3j0qWJqBXRWRpRBvUXDfd3WISA0Yz1X4RHJ4xetUXEGLslZdTr
	x2yM9iVxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOohg-00FnHV-KV; Tue, 23 Mar 2021 21:36:44 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOohc-00FnGl-FB; Tue, 23 Mar 2021 21:36:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id b7so29517019ejv.1;
 Tue, 23 Mar 2021 14:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tFARsFj6G6XnxpNZg94WWZT6eJ0EvH/1YhJXH6db/GM=;
 b=hQ2FHoHRGajLA4j5gih9viiqjuceuy9pDG9idkOf2ruP5/eTxxKxlKe+ldaH89avGn
 LhoDHGmd1mDEkcehXy6K8H8jvYyiRLKGSaVfc9EJyUgPVT9GIWGQq1a57VafD6t3X/tM
 IvwAN7YSedyOAKIt+/yA2lHLJF7ZGyMv5SdrAkfSci1YV1fOlh+JHf1buVJVe/6CShii
 oUGddUiPX05migzCZoMcX4orQQ6NMbtFEVeWvWF4WeOKpuIDfFjsYGSMLJ/c56dl/hv9
 x8PVkT58lTdaX0sZabCDoeJlZJfYh71cCA+Flpn2Aa7GvuSB2q6ujetmlyMaWQG0W3Q5
 ofJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tFARsFj6G6XnxpNZg94WWZT6eJ0EvH/1YhJXH6db/GM=;
 b=pb3PnEKCikOmDR46jZAjLONyLWNnd5b4vqwVm2VQwaMv1PwMGZg9AjHTwGpW5IPkJ3
 kNtkbOpfiARV5OkdVWdr/jeJ5dkdEVgQFQdkwO1i5diIBOhWGu+GmR3gexx9S5IzhO8v
 MbzWY4EkuAvd4YfVIAfCga7E5UZvIIu04O3h8NLTO9m/9PDU3tqQnaBfqHRP5YumZlxf
 ZpkqUValKdga2KFPbNE4RaInmuf9WgrMDmCBWsgPFHD0czrKiNZkj5mbbWc7i8JbcXVG
 AjkaKVapsLpPt3WAUQAuFFxwMaf4fcUeYr8BrtV0pPfzDdKYnaZpc6jCegEvTFTHGO//
 Lnfg==
X-Gm-Message-State: AOAM533Da9/5+FKxim5cpu+c2i0yldbHdh3aTLUTA8Z8DChWsf48OA30
 J2mrBZ0WcZuv+ABhJbrxnrz6vn1vc8sbzetuRW/Ojd9T
X-Google-Smtp-Source: ABdhPJwx9fPxfIIkRAvbrX8L29AYkkSxTjTk4GDR7+TnKy+9eYa2i/Fp1/ws2zM1Cl04c4z103ujMsKRGxZkChFWSEY=
X-Received: by 2002:a17:907:e87:: with SMTP id ho7mr257007ejc.2.1616535399923; 
 Tue, 23 Mar 2021 14:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
 <20201230012724.1326156-5-martin.blumenstingl@googlemail.com>
 <YFLARj7RX0m+BBsA@builder.lan>
In-Reply-To: <YFLARj7RX0m+BBsA@builder.lan>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Mar 2021 22:36:29 +0100
Message-ID: <CAFBinCBx1GtN_CYqOorfKVgXq8utXAr04ab815sVbNH5+qGBQQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] remoteproc: meson-mx-ao-arc: Add a driver for the AO
 ARC remote procesor
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, ohad@wizery.com, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_213640_621160_3911CA5B 
X-CRM114-Status: GOOD (  21.60  )
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

Hi Bjorn,

On Thu, Mar 18, 2021 at 3:51 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 29 Dec 19:27 CST 2020, Martin Blumenstingl wrote:
>
> > Amlogic Meson6, Meson8, Meson8b and Meson8m2 embed an ARC core in the
> > Always-On (AO) power-domain. This is typically used for waking up the
> > ARM cores after system suspend.
> >
> > The configuration is spread across three different registers:
> > - AO_REMAP_REG0 which must be programmed to zero, it's actual purpose
> >   is unknown. There is a second remap register which is not used in the
> >   vendor kernel (which served as reference for this driver).
> > - AO_CPU_CNTL is used to start and stop the ARC core.
> > - AO_SECURE_REG0 in the SECBUS2 register area with unknown purpose.
> >
> > To boot the ARC core we also need to enable it's gate clock and trigger
> > a reset.
> >
> > The actual code for this ARC core can come from an ELF binary, for
> > example by building the Zephyr RTOS for an ARC EM4 core and then taking
> > "zephyr.elf" as firmware. This executable does not have any "rsc table"
> > so we are skipping rproc_elf_load_rsc_table (rproc_ops.parse_fw) and
> > rproc_elf_find_loaded_rsc_table (rproc_ops.find_loaded_rsc_table).
> >
>
> Thanks for the patch Martin, it looks really good. Just some minor
> things as I expect a respin of the DT binding as well.
thank you for your comments.
I will send an updated series in the next few days and include all of
your suggested changes

since I sent this series (it's been a few days) I also got an update
from Amlogic so I know have better understanding of some (but
unfortunately not all) registers
so it'll be a bigger update. but don't worry: I'll include a changelog


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
