Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23FAC07E95
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 20:23:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6E661164
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 20:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6E661164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=phystech.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ra6ksCPHKk7Y2ketm+ILiLsl9NJzpNrgRQ6is2Gibkg=; b=hN4mM635wUUsqi
	I0Kczwms+1En/LCZqI/tLow53b6nd1rlB2uJuUlnGFgToIZWw2836cUBdJiRvnRKGg4lyEgA8u79I
	XMa2FqxGmkuE4LPq9Rfp+xkhGmFdrPFmn45rSfa1rQj8h6WuvIxngSG3tlx9G7yWcNi/enR/wa58Y
	nQVY92nDVYI+wCwI7Vj4Nyy8/+txtjS4AKo172xSFx9oDj7m/mwsEoD1rISkT/3z2jWv1CEkGWPm6
	NNa1LvHBDA5JfR/Pxe78fBYqu0YG21ghDxB7Gg2XfuMbV+njNXRDCg+4pZgZyMm0siX40ql1YgFsy
	V0631Dz5YVzHvU/1rE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzPgz-003yzn-CZ; Fri, 02 Jul 2021 20:23:17 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzPgw-003yyD-D7
 for linux-amlogic@lists.infradead.org; Fri, 02 Jul 2021 20:23:16 +0000
Received: by mail-lf1-x130.google.com with SMTP id a11so20146581lfg.11
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Jul 2021 13:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=YS7Rh7bjOGjf3GzbkGuMZZqduHpV/ZItv36o34+uxXQ=;
 b=URbyxG7Joz/rVUHzhPvmmIZ5C77NVhMjqmoxjqEbCAfbJ7+Py2lYdDaQ2km8wcPrAr
 mGnMbqoXv9MpvRXKAV4SCMWYyFsj+UjsN0hktMR+E8RoJ20E5WmEALnI6Z5ZblNBPeJ1
 dsjlrGx3wGG+aZL6gyybLP7REh0Gm8XCgvD1HQj7zbVimeiZ3y2PCfLdOZjzv7MKD6VA
 fB7Bfht/TAXGm2kgZd9GTZAgPKC40M+CsW/Pa2NcsfRzc17Xb45w0IfVqPIUnM0yEbBk
 vuTmFzu6DJF3zlUeDHU+aWcYxP+5lkUvwcIj3fVO0rHtlvDd7q43HOv4q0ffAFAgIWs9
 zMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=YS7Rh7bjOGjf3GzbkGuMZZqduHpV/ZItv36o34+uxXQ=;
 b=l76+mMDM/bunAi0jQZHsP0gUWBGgSnacWo/tYewzUtQK1a0GBHAyl9AxgPpbDLLwmt
 HwixbGgBxh0Xj1cojSWEflI4wNxJW7LrPIfJThxd1vSgNDU2Zisovw5+tW085wnG+uMk
 k5GmtJ3w3ENK0sIKYE+bUAGaYNTuOUDkCR1qSoAsg8jMiqwAe7PEUDyLJXOJblQ7DUsv
 X2BqjEgc8iin01lWUJC8tkbpL59f30No8C650jzZIiBeH+vBy8RJAB7TGszuxe+DqBMi
 dlWnWyAI6bGxDyqa4owVjzLF2UFo3tivXo8d/j/jW1U7YxDrCgwAtuw6GiE2RMQigQMm
 3GKw==
X-Gm-Message-State: AOAM532+vQlgtaAN05lyi+9wWvX1PSCjUoHlaEKploEE9xcGqObQ2fYG
 g//+w7s1tYpWg+V2AvMLHRLGLA==
X-Google-Smtp-Source: ABdhPJyAnONSruQCpJ77tfZgLVDFMcoJBz/dX6KycdmqQHOmvUz/HM0dEDf5d6/1kvt34oxf4TphzA==
X-Received: by 2002:a05:6512:1188:: with SMTP id
 g8mr1032423lfr.114.1625257392632; 
 Fri, 02 Jul 2021 13:23:12 -0700 (PDT)
Received: from 192.168.1.3 ([2a00:1370:810e:4d3d:fdb7:f150:ee77:eba5])
 by smtp.gmail.com with ESMTPSA id m1sm453543ljb.138.2021.07.02.13.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 13:23:12 -0700 (PDT)
Date: Fri, 2 Jul 2021 23:23:05 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Sean Young <sean@mess.org>, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 rockosov@gmail.com
Subject: Re: [PATCH 2/2] media: rc: introduce Meson IR blaster driver
Message-ID: <20210702232305.5060a04b@192.168.1.3>
In-Reply-To: <CAFBinCA+zud1THT6z2QsGCqXMT-3nqN_S4nR0FhaDGhcKzoe-Q@mail.gmail.com>
References: <20210701215132.16317-1-viktor.prutyanov@phystech.edu>
 <20210701215132.16317-3-viktor.prutyanov@phystech.edu>
 <20210701224646.GA18540@gofer.mess.org>
 <CAFBinCA+zud1THT6z2QsGCqXMT-3nqN_S4nR0FhaDGhcKzoe-Q@mail.gmail.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_132314_532294_20410D3F 
X-CRM114-Status: GOOD (  15.15  )
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

Hi Martin,

On Fri, 2 Jul 2021 18:15:18 +0200
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Sean,
> 
> On Fri, Jul 2, 2021 at 12:46 AM Sean Young <sean@mess.org> wrote:
> >
> > Hi Viktor,
> >
> > Thank you for your driver. Is there a datasheet available for this
> > hardware?
> The public S905X datasheet [0] (starting at page 515) and the public
> S905D3 datasheet [1] (starting at page 1105) document the registers.
> If Viktor has additional or better information then it would be great
> if he could share it with us.

I can add that descriptions of A311D and T950D4 blasters are the same
as S905D3, including 0xFF800000 base address.
The A311D public datasheet doesn't say anything about IR blaster, but
it is still present on this SoC.

Best regards,
Viktor Prutyanov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
