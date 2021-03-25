Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2009AC433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:40:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FB061A1A
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 15:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FB061A1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPeUXAdXPImonCBof8wCJOJNKJOI95eMFKyJ11y/Nu8=; b=WaC5ocdZ6KbcN3ykkZn8jVqJd
	+k9KvAJDxo4L0oo+ryh4sBLpFQhrQOA8O0jXvdFFpQO70RoTgDbMC2NdVOqJRkzpv/peGS2c7Aqps
	0pvQi2LllvoW0T8qjQDLabPIdspjGCxP47OOQaw2VUbQIfQZIs2CtSD2Eyfr6cb2lJ6R29vO9jySq
	uDg8B3B8AoTLbA8kH9Z+mfmy+DiJl8HOaqCT0+VquteX5p5r+LBGFMBkwOTFxNvIbB3Nx3qJpFs/Q
	9lNcmcRhun6Klpcv281Fc+HEAgSJxISkKMcBycJKTZkRXOCBfwCTHlL6kz+Wxbi5Mo4RBhmAqZX4K
	U3zRYyV8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPS64-001kC4-GA; Thu, 25 Mar 2021 15:40:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPS5t-001kBQ-Iv; Thu, 25 Mar 2021 15:40:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id b16so2921641eds.7;
 Thu, 25 Mar 2021 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVovXqBbk0wGC2HDbPVyA2PvUhMQtNnpOLKoi6ckjaU=;
 b=iFeLm+OF/avp81DNNgzalw+tsL7iEPbBLPRqw3QAv2eEf+f749073yoE76q/f4hx8P
 Vw24m/ksowquw8kplSXYB+L0ibKnbnILK1cPUwO73Rmg7ivRPbbM2XvMzdwn5Gp7y/XT
 xM6/pSXNvFwDpf8JI2yHsGLpuN4gJdQ3/ouesF9hmV4ZC6mZEjuNuFJuTHzqPjVoBN9X
 Y9SlykxFTTSawYVTtXAUUtmTUsHM4uZ6RWTtp7PzmePktV9KPzBPzmvhSCPiJUTUp2Pb
 Rs4Cz/vOU5uumF/DmWhE3FHqDX7ary5poTrZbTHlqXxfODwXPp1wgqZD266Mi++tcku2
 vp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVovXqBbk0wGC2HDbPVyA2PvUhMQtNnpOLKoi6ckjaU=;
 b=esFfUdI/0rR1mupHwnQD/IDjlULMVmS9DNpD2U6i1F3mub9vgdKB/8unt/Pg1DgO6p
 RMNEupo5Ei5Fxbgl+WKMmZl0LXNkYNvRABsl5U7LbOs22Zz9yH0XsWmWdEFjc1GtaRwR
 u/Ng9SkKEqDOio0PCtHcAufVraRSKEciiquCnfr0dCkAgyReMy31WLl78Lr9pefkJo99
 ktmED0ITM+R7hzYaMOURLqf9OyagL+Ut8NCDwxDdQadiFEYEgqIYbDYs341ZWH4EBvNo
 NBMFBpf0kSz/ab8bT5I3DfEuOQ7K2Ej2ieRVV++ApUItQVZ7EEsNXLNvyf/mTsczjWBc
 6jUQ==
X-Gm-Message-State: AOAM530Oz1CIxePmvVlhTwqnMMC1bgCChuRDXtQPlMgyGnOvq3qdMF3l
 apq5daNo9rBrtLoIyu54pK3QlZ5teoqH66rPilA=
X-Google-Smtp-Source: ABdhPJxvxq8ahShyOo02COOTW4cd6bEFSU4bQBwGxzqlBBO4cZcfia1CXqKD5Wfaga/VcucZpJdv5Evt9QNBzFKwyo0=
X-Received: by 2002:aa7:c6da:: with SMTP id b26mr9920197eds.254.1616686820913; 
 Thu, 25 Mar 2021 08:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <4ce8997b-9f20-2c77-2d75-93e038eec6d8@gmail.com>
In-Reply-To: <4ce8997b-9f20-2c77-2d75-93e038eec6d8@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 25 Mar 2021 21:10:10 +0530
Message-ID: <CANAwSgS4SLdYwY9n6uNci+rgE1Q4UAzCy29gX+CL4patDgH15A@mail.gmail.com>
Subject: Re: [PATCHv1 0/6] Amlogic Soc - Add missing ethernet mdio compatible
 string
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>, 
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_154022_966377_A39F8A90 
X-CRM114-Status: GOOD (  25.85  )
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

Hi Heiner


On Thu, 25 Mar 2021 at 18:49, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 25.03.2021 13:42, Anand Moon wrote:
> > On most of the Amlogic SoC I observed that Ethernet would not get
> > initialize when try to deploy the mainline kernel, earlier I tried to
> > fix this issue with by setting ethernet reset but it did not resolve
> > the issue see below.
> >       resets = <&reset RESET_ETHERNET>;
> >       reset-names = "stmmaceth";
> >
> > After checking what was the missing with Rockchip SoC dts
> > I tried to add this missing compatible string and then it
> > started to working on my setup.
> >
> > Also I tried to fix the device tree binding to validate the changes.
> >
> > Tested this on my Odroid-N2 and Odroid-C2 (64 bit) setup.
> > I do not have ready Odroid C1 (32 bit) setup so please somebody test.
> >
>
> When working on the Odroid-C2 I did not have such a problem.
> And if you look at of_mdiobus_child_is_phy() and
> of_mdiobus_register_phy() you'll see that your change shouldn't be
> needed.
I will check this out, thanks for your inputs.
>
> Could you please elaborate on:
> - What is the exact problem you're facing? Best add a dmesg log.
   1> I am aware all the distro kernel I have tested ethernet will work file
   2> My issue is when I compile the mainline kernel with the default setting,
       Ethernet interface will not receive any DHCP IP address from the router
       Although the Ethernet interface comes up properly.
      This does not happen frequently but I observed this at my end.
  3> I tried to collect logs but I did not observe any kernel issue
like panic or warning.

> - Which kernel version are you using?
     I am using the mainline kernel with default settings.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
