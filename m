Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8686DC636D6
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wButo2FrkZRoWmbFGsBrSRGsdaudUQNy4awJd8Ema1w=; b=xBW9rIy13aE0EG
	ujCRFv36Pv5KspSoEvzAY/lz2Ibdz5Ky4Vtwe4Z520j4uE+Ic3iC/WFx+LENyqGbv0bdluYspEPn1
	Qvh71XX6BhMfVend4l/nlR2yp88Bmufi7pfOqSos+T6oYNAwCqAwSthp50EBcb2BfesyIBoVrFjaZ
	iSjLhUIJHM7JPjlxoaRPd/E2NfJpSo5+rYaArH6GeRFVFod6lFEHnQn5cn8nUBsZkYVliCe7FHXKu
	eCyXIuldyJw36gGL5L8hJqVSq+aE8oRt2diayejMLh2ObXDbFJfRxx66/06xrl0gQHnw0PyC8bYtc
	LJt8QGoxBdMN2NpCjWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr32-000vQ3-9B; Fri, 03 Feb 2023 08:03:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr2r-000vIT-PV
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:03:43 +0000
Received: by mail-lf1-x12d.google.com with SMTP id v17so6662178lfd.7
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGYEX31cIOUlSxZudKjVopVzn91z3Ew01YpLoqcpKls=;
        b=S/60yaFdQiaph4QS9kkuj+ea2XwVyrywllXnGIQ+IkTP+ldBv+p6rxiVqeUDCnzyWH
         LHu9uivsd8Fw/uvmqtQIHvF63F2lo/DeYreDaQUnzGc9jpytJm6bB65qfBvXfdvsGX4Q
         HdFSE+S/rVYBUN1CVlRW1dCBSYIaGYgdwAI/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGYEX31cIOUlSxZudKjVopVzn91z3Ew01YpLoqcpKls=;
        b=VFRHyQxIHeotOrB8nbXMOMxshbYhVUzHRed59WYvmsL7UtraM9gwEma2kAHjA9oEcr
         HNDdkBPRvuUIiVgukyaenHfWQ9nOdzae5GKI7lAl84wRTq1ya1Kpw4tncKA/5gZYfbPr
         PSgvsulkMoww5pAiaOvSFYGKrMzhNWReAbQ/uAcqi2pKlQCoGTJAu14A7an0ouP6LSM0
         cxm4CSP5KmydMXN/u2e0kFyf/aVZ1xvSnG9uX9j686OAxZp89Yk7JNUEWBEikjsIhWNP
         +7FVrTv9T2dhRlo6fNY7qVjOee6XDbD1kL+FNeBBsohpkTWRtW/YpmtVghDgRz+yuzyw
         l/mw==
X-Gm-Message-State: AO0yUKUmvlf2rW0FIXWkEReNIDAvqTogxw6futgcjLF1XAm2XgX2+MuG
	pm7Rz6gGjFioR4CLaux+2m4IAQDZ2mb7h/mZW7jnDQ==
X-Google-Smtp-Source: AK7set91XwnaYcZbBk/Yz9RWLdFi3h485mqp5EUXwdslWc6MSPZlMY9ANjRIQq6nkxM/JF5EMtZO+TPQ/q336fuis0Y=
X-Received: by 2002:a05:6512:4005:b0:4b1:7c15:e922 with SMTP id
 br5-20020a056512400500b004b17c15e922mr1719439lfb.214.1675411414892; Fri, 03
 Feb 2023 00:03:34 -0800 (PST)
MIME-Version: 1.0
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org> <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
 <1jedrg6mkl.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jedrg6mkl.fsf@starbuckisacylon.baylibre.com>
From: Da Xue <da@lessconfused.com>
Date: Fri, 3 Feb 2023 03:03:23 -0500
Message-ID: <CACdvmAhW-uDUK-iL4HT1PgEnRHrBmNr26Q6M=wBYcpZ8=DF4Tg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, neil.armstrong@linaro.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000341_836252_5BB3662B 
X-CRM114-Status: GOOD (  24.29  )
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

On Fri, Jan 27, 2023 at 10:10 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Fri 27 Jan 2023 at 14:02, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> > On 27.01.2023 08:59, Neil Armstrong wrote:
> >> Hi,
> >>
> >> On 26/01/2023 15:03, Heiner Kallweit wrote:
> >>> The usage of edge-triggered interrupts lead to lost interrupts under load,
> >>> see [0]. This was confirmed to be fixed by using level-triggered
> >>> interrupts.
> >>> The report was about SDIO. However, as the host controller is the same
> >>> for SD and MMC, apply the change to all mmc controller instances.
> >>
> >> Thanks, I applied it in for-next so it runs on the CI tests.
> >>
> >>>
> >>> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
> >>>
> >>> Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
> >>
> >> I think we should find a better Fixes or perhaps split in 3 so it targets the
> >> right commit adding the nodes for each family.
> >>
> > This would be the cleanest option, right. Practically it shouldn't make
> > much of a difference. The chosen commit is from 2019, SDIO interrupt
> > support has been added just recently, and regarding MMC/SD it seems no
> > problems caused by edge-triggered interrupts are known.
>
> ... Well, I wonder is this might be linked to instabilities seen with
> very high speed mode (such as SDR104) and DDR modes. We have seen quite
> a lot of those over the years. In any case, if it helps stabilize the
> MMC on amlogic, it would be great if it can be picked up by stable.

On S905X, I'm still getting SDR104 failures with this change at both
208MHz and 150MHz so maybe not completely.

[    9.071641] mmc1: tuning execution failed: -5
[    9.579765] mmc1: tuning execution failed: -5
[    9.761580] mmc1: tuning execution failed: -5
[    9.871836] mmc1: tuning execution failed: -5

>
> >
> >> If the test doesn't report any breakage, I'll probably ask you that.
> >>
> > Sure.
> >
> >> Neil
> >>
> > Heiner
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
