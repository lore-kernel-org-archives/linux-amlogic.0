Return-Path: <SRS0=UvWR=2F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF03EC43603
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 20:44:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF01B2467A
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Dec 2019 20:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8yyKMlG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IQ2bT4OF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF01B2467A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CCmOj055Hl6zisLouzU2rye0QpoisNm9qT6hHmzIEE=; b=G8yyKMlGo0RNnm
	11eWRG4APAcRGevVkrWNLcvmhV15916SJa/B4DCCVW7+4jh8XH9PNjElSMHxCM1sf/JxrPz4LAbzE
	APGQWISYxQEWQ0lVzGo7Olb4uxNrqWeaj88uUs0YRu81YFLYBerxglts42THIXvci5shMwQBYTHol
	u0wJwyJZa95eDqZSMwfM+SGNgQ96Bm1fpb5GsWZUumdJVchTXZ/8DTpE0XgFTg8oytI6IIkkNqWyj
	BFcIh847+vqhVa0qunb8oKgegCogX+WnyUJcggJ0BCLacEgkyCE7hk9BPhGPflAzxYIUTDu6GLMwS
	pQ3RsKIAqoP5Ye01SIdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igakl-0001QI-Q7; Sun, 15 Dec 2019 20:44:35 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igakj-0001PO-Cs; Sun, 15 Dec 2019 20:44:34 +0000
Received: by mail-ot1-x343.google.com with SMTP id a15so6315921otf.1;
 Sun, 15 Dec 2019 12:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zt9xL93I8MsKs6Socqd2NmMVjNPgCRRv4tjGDgdBCSw=;
 b=IQ2bT4OFZQWWliGC6Q+V6Kf26jnuzpQACPXwyY6cwPMUJe0lD7BDA0rJLHRc9AXQ+7
 nUEzp1ASKVPv7h6zeGDoll31LQwdkrQtAcIN2+6nx5WZny6yhUJOnqiwFNTkut6yFTA1
 kMeckmsoC3tLNdBKledAnfZnx8cHXghd3aBmZLI7ZhyyT7sXyrt14wocHkFxe9A4kW/J
 SThbE0Mx/WoCntEioF+6KZz/gHL1umZFXDjGJA0WjPEcfmhgXl2Jo3YntsteRQfjRX/4
 ZPaNmW+HeQ2+x76oRGia3CS2jcc7ASMO27s5yHqdVri5kjws8+FioaxM5SYJmTl3k36V
 MjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zt9xL93I8MsKs6Socqd2NmMVjNPgCRRv4tjGDgdBCSw=;
 b=RWOESetTSbaIvv7onmRzZEfOuef/BLAOmSbLj5OdDeSxViBlHiz9CS9zITnPoh4qc2
 Y53UYezqQ3Lm7tXOC/ENOK2OHC1bssdXGm1d6UhOMOF3nQPjTHlCdJb0iZytrtLtnil4
 DdYTRk1taoV1GJPjWyOj+DpT/GTxYhGeQ+64xlPNZarS4OwSFRDxJbnD094x2HGmCYec
 NoLnwq1Y8Zd7JMnoKu4UTzfxBGjutW2/r2GoWls2koKHMGkPQOLM1jF5pVDQ3w86odBT
 pGIviUc4d0iBBpqSUflxh6+0Ch7sYH8GDRYwg/T6EwGW8GZlAK/TiWQX4cZGzcIpbtT6
 nX5g==
X-Gm-Message-State: APjAAAWyTiCuaBRrWGsjDQzUv9OWk3y5PEYg1VXWSVIYydUu7wjgJoxt
 P8TQcbyiNapQs2L6T2zZyGwEFlKXuGF9jt6e9W0=
X-Google-Smtp-Source: APXvYqzTskIRt2Xw6EqKZjSVIvxiX/lSFCf08HAZcNVOCGDv9OhkOltw6Or9ek9Mtm4/ItWI9/ZSUmrTMq6qqm+Z6UI=
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr28669493otn.81.1576442671149; 
 Sun, 15 Dec 2019 12:44:31 -0800 (PST)
MIME-Version: 1.0
References: <20191208210320.15539-1-repk@triplefau.lt>
 <1jpngxew6l.fsf@starbuckisacylon.baylibre.com>
 <20191215113634.GB7304@voidbox>
In-Reply-To: <20191215113634.GB7304@voidbox>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Dec 2019 21:44:20 +0100
Message-ID: <CAFBinCC+i5nFdyHGZkaV0gm3Qkn6OA8xR91iQJAK1SGUBRMJTw@mail.gmail.com>
Subject: Re: [PATCH 0/2] PCI: amlogic: Make PCIe working reliably on AXG
 platforms
To: Remi Pommarel <repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_124433_461525_379579C9 
X-CRM114-Status: GOOD (  15.10  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Remi,

On Sun, Dec 15, 2019 at 12:28 PM Remi Pommarel <repk@triplefau.lt> wrote:
>
> On Mon, Dec 09, 2019 at 09:32:18AM +0100, Jerome Brunet wrote:
> >
> > On Sun 08 Dec 2019 at 22:03, Remi Pommarel <repk@triplefau.lt> wrote:
> >
> > > PCIe device probing failures have been seen on some AXG platforms and were
> > > due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
> > > solved the problem. After being contacted about this, vendor reported that
> > > this bit was linked to PCIe PLL CML output.
> >
> > Thanks for reporting the problem.
> >
> > As Martin pointed out, the CML outputs already exist in the AXG clock
> > controller but are handled using HHI_PCIE_PLL_CNTL6. Although
> > incomplete, it seems to be aligned with the datasheet I have (v0.9)
> >
> > According to the same document, HHI_MIPI_CNTL0 belong to the MIPI Phy.
> > Unfortunately bit 26 is not documented
> >
> > AFAICT, the clock controller is not appropriate driver to deal with this
> > register/bit
> >
>
> Regarding both @Martin's and your remark.
>
> Unfortunately the documentation I have and vendor feedback are a bit
> vague to me. I do agree that CLKID_PCIE_PLL_CML_ENABLE is not a proper
> name for this bit because this register is MIPI related.
>
> Here is the information I got from the vendor [1]. As you can see
> HHI_MIPI_CNTL0[29] and HHI_MIPI_CNTL0[26] are related together, and
> HHI_MIPI_CNTL0[29] is implemented in the clock controller as
> axg_mipi_enable which is why I used this driver for HHI_MIPI_CNTL0[26].
I agree, the details you got so far are unfortunately pretty vague
(with my knowledge at least)
from my experience Amlogic has very good documentation internally, so
I'm sure that more details are available.

Yue Wang (the Amlogic PCIe controller maintainer) is already Cc'ed and
I added Jianxin. I hope that they can explain the meaning of bis 26
and 29 in HHI_MIPI_CNTL0 on the AXG SoCs (assuming Remi's contact at
Amlogic can't) and how they are related to the PCIe controller (even
though they're in a MIPI related register).


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
