Return-Path: <SRS0=x061=OP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572B5C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1932960E90
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Sep 2021 17:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1932960E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bxH2dS4rfKW3KOAeNB+YHrd7T7AKPaaClFmj6cbkB18=; b=q9u5AFuuhFhcZW
	H1sPpg6QPpfVQUlwCdkdGkOzraZMBk+pgoDsalJrXg0C36sFwHXgZ2MbEDLQdyZNx5yEmVXBzwup6
	wobUDiQSETZir3Q1CLuuPxBPvJIHOpwNAo2Tg2HLDKZ56VLi6fmGNyVpF87/bqbzT/DNH3y2NGNqb
	cWquKSiYhXXtJ7n1YPK6hDHkiX63KIkQ5/+Cgm+n9y3FY1oFA/MOUtShxb57/fGiwwmJRP/6r6HTq
	Pgv5aaziWqsEMdZh/4qaQVDOLbcv1hk0vbTk9na3nXNGjC5Jfm/C6mG3nSNStkT1KA8muvpKwpjuB
	kT5Oa81OkZ1gfJiD73sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUBgv-00Gzde-0e; Sat, 25 Sep 2021 17:42:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUBgi-00GzcK-8N; Sat, 25 Sep 2021 17:42:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id ee50so49544123edb.13;
 Sat, 25 Sep 2021 10:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IeR6I78v07QTr7GwuPjqPsC9KmUX8D77z/xH6y8yFI8=;
 b=IRAqRPzgfb+l3oosTcNuCrp/+4E0gI9cN8XAOxGuWL0Q86mesco1wT35ZtwEjsPg7O
 mVrG1YDvsUYZw33ZU0BzxOPLenOe+00qlat4v4mAl2f2FD7a3CAar45txxjbowsFXy6n
 cuG9C1NRRPeu+40lWz/N154oiu18PwHQJqe/xXBOmVFfqrCpkA2qjjehQ1IBDLhQYbXm
 RLRbbiW7YweqJRdWVgGHYujen/b2CvdlCsQ6hemxWRVWz7/CTkEWaSsji86pMxchJ0jk
 DoY9/T+PJJUEqfXgfoQk9WRCDeYiBg3zDLg2mIA+Ytwpig5Oxw45in0XnQyMSuHMbKvu
 WkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IeR6I78v07QTr7GwuPjqPsC9KmUX8D77z/xH6y8yFI8=;
 b=iwFnQK7Auh7Hxsq+KnSif6LZBSJWN/2aJ2ugeGttosjWQS1QDKfnPR/fIepbiHWKo3
 Q0LotfP/sep8SlBeOZuYQdhZ58MP5vMUHxV6DgSNMC1s1VAxQ7i2Cllp+oigLxCEekYM
 lqAskCnhg2ZkgQI1Slc0X/7uJYbEvlCiBXPErFmIPv2fff+6D14ByGfXdaLM40ZRoNhF
 zcptUUzabXLur1oIeYccE9+6jlckPegmz5YduZ4xNLpajXIDEqrrgRkJLROAkpfRQQsq
 oX/4/Ae2J3TCfvluPmAKrUkymMnI85ZvYk3b2UOZpyXpaIYKvD+NMJyZJDHFOus5FmaT
 SoMA==
X-Gm-Message-State: AOAM532h8Flx4hqwCHbEqAQxNwrMxVxn8XXfMUQJiUf8Yr5pFomhwvhO
 bqSqsesvvljZmcFrNTSTMEQnNjisKZ7ax9bcyu4=
X-Google-Smtp-Source: ABdhPJw4TvWMdEO0MgDEFaxjkEHiKZXec68E1FwOLvkbn3swXGq+JhkZppepiqKsD9J2+Mhv0mlMjMZvOL7r42tie7U=
X-Received: by 2002:a05:6402:319a:: with SMTP id
 di26mr12638279edb.84.1632591730983; 
 Sat, 25 Sep 2021 10:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
 <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
 <CAFBinCBeNMET2tvH0h6HF3dR+xBb59hifQyaoXigUs3UGkS+KQ@mail.gmail.com>
 <2b07b3de-cee5-c570-8fde-6a4c684122d6@baylibre.com>
 <CANAwSgRNp8UtU+Yy4smwZ5POTWTU+xN1mrf_cH7Pu9yX5HU=VA@mail.gmail.com>
 <CAFBinCDmNt+aXRE4xFZdegOUs8BqJiTPF3+DQ-buvWWXrQLkdw@mail.gmail.com>
In-Reply-To: <CAFBinCDmNt+aXRE4xFZdegOUs8BqJiTPF3+DQ-buvWWXrQLkdw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 25 Sep 2021 23:11:58 +0530
Message-ID: <CANAwSgTcTCNWD3QTt4-c8BeAbFxDewbZewaSouggPuK9cpSXog@mail.gmail.com>
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_104212_339575_BFEE781D 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, 21 Sept 2021 at 00:56, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Aug 31, 2021 at 10:48 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > After enabling CONFIG_REGULATOR_DEBUG, with this patch applied
> > I still not getting the USB regulator to enable.
> > Do you see different output at your end?
> I don't have much time for testing and debugging currently but I'll
> put it on my TODO-list
> Until either of us has found the issue I suggest not merging this patch.
>
Ok no problem.

Basically, I have just roughly gone through the architecture of
Amlogic's OTG framework.
Below is the global configuration registers for DWC2 OTG framer work

[0] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/drivers/amlogic/usb/dwc_otg/310/dwc_otg_regs.h#L66-L151

Within some configurations, it helps tune the power for vbus and interrupt
For example
[1] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/drivers/amlogic/usb/dwc_otg/310/dwc_otg_attr.c#L666-L717

Amlogic basically used the mode parameter to external tune the DWC2 driver
it could help more fine-tuning the driver.

[2] https://github.com/hardkernel/linux/blob/odroidc-3.10.y/drivers/amlogic/usb/dwc_otg/310/dwc_otg_driver.c#L1461-L1703

I feel we need to identify many more PHY tuning parameters to make the
USB work correctly.






Thanks
-Anand

>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
