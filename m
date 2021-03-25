Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D768DC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:34:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C68E619C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C68E619C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YYSJNRLOLVPpcqcSMKbCOfCo5sTrxIFL/4DtnIU1jwA=; b=MBt1w/K3p+y9rt60GwqIcrY/u
	14Eg1OYmBJ260SpVPLMJbHEkELkdxnRSIsQWKGHj0xBjY3Lz2qWQponLXFlohqDw15ckN7fmanuNe
	jg9fszP/aj9Ru6n78xDtbrnQ7ti2W4PX/DqHe2ZondNUV85uj1qTNBeUGzHPEkXgY6pUbWIx81SDR
	Uz3Uth2TxFFy1N6Be8gHHw2XfN/oulw3E3QGt3zu9j2zJV1r00P+CSmH99iVVygWbHXSotHx+xdgW
	3jwEviBlYpk8DhAYVArutHhc0Z7IbVSKr6NwcsfV3DFtuskMlGQdVh78uoQ1MPaP6woJ/yB67dcRR
	7r94TSogQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPQ7U-001WwQ-Vn; Thu, 25 Mar 2021 13:33:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPQ7H-001WvU-BR; Thu, 25 Mar 2021 13:33:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id h10so2389768edt.13;
 Thu, 25 Mar 2021 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTsRHpZndxgeS88GP9I79vuy4E3KHPhBU7D9Qw0WHCM=;
 b=g9CIjKlm8pC7lTaO6uioaZLuZC7fssojA8XJFkYo5/aLirEkOJVBCwx8YMv2zhwGB/
 Qa2M0sLrbOWVGBVSzz7xnqlK0m8q76T0WEJeVlIsUI4X6czuSc2crrOcL4v8HBeFuo/M
 bHRzYDJhTP9xpkrIVAwvHn13mtNG6XbgbgVTNWL6XCX8XbwMwY3MZQD6lqy03mjBzA4h
 2B12c0rlZypC+/dH48k+ZfPYGxjhsHozVWcfkJJ2iaAeDWNCK5prMO8JJ73cQReZc1/g
 UT18/by426/eKF+CvLHsKL0Z3sf0DcMMSBQqowcpMPIK5LUlZo5hTAx4XFnma4mmXGFl
 NAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTsRHpZndxgeS88GP9I79vuy4E3KHPhBU7D9Qw0WHCM=;
 b=BjL4LcBKnCPNNvOLF071PKhNW+aOd9NzvYWw4hZFeUUmZLYsahM+qepOuz4VWua2D4
 MqdnGd2ohsZvtQYDaHeuWRW+v9AJNUcK2E0WrvW6I6z3/rDiK/FDZhZ8sXicWf5WSsBt
 ceFugX6ONh6g9u1NQc/aWpx9e2j7ub5tO22/T+jHPKUkiXiUEp4v2NwsaVizlAYcXbY8
 4TWbxxsivA4YUKQyqY+roz5+r197vNTt220EGHswnkx2T/3eEkvUryNvLOmBNiCu/Pfj
 12rcO1e8fLYWlCdmiGweyz+HolJEvP4GhP6l6zXKM8lx86JNrbAP8aWONOjaP1LJKeB6
 /vZA==
X-Gm-Message-State: AOAM532SBpeY4R8OInvm0JOuatqkih8LIr71co8Og8HoNZAqmxcWPFxu
 xsr8oJp9uifWBRiKznJknfWt7Dqzhg+bQL/apnM=
X-Google-Smtp-Source: ABdhPJxqmMPzuMrRzVuL37n6W7+MhKOw+Qkoq79g9Qi9zRISYcKyjKP6R1Xm2pEhuzO54fISTX6r5adSAeKLqF37+Kk=
X-Received: by 2002:aa7:d0cb:: with SMTP id u11mr9144416edo.163.1616679218814; 
 Thu, 25 Mar 2021 06:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <20210325124225.2760-2-linux.amoon@gmail.com>
 <YFyIvxOHwIs3R/IT@lunn.ch>
In-Reply-To: <YFyIvxOHwIs3R/IT@lunn.ch>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 25 Mar 2021 19:03:28 +0530
Message-ID: <CANAwSgRHHwOtWb87aeqF=kio53xCO0_c_ZkF+9hKohWoyji6dg@mail.gmail.com>
Subject: Re: [PATCHv1 1/6] dt-bindings: net: ethernet-phy: Fix the parsing of
 ethernet-phy compatible string
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, 
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_133340_253875_DF18B96F 
X-CRM114-Status: GOOD (  23.44  )
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

Hi Andrew,

On Thu, 25 Mar 2021 at 18:27, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Mar 25, 2021 at 12:42:20PM +0000, Anand Moon wrote:
> > Fix the parsing of check of pattern ethernet-phy-ieee802.3 used
> > by the device tree to initialize the mdio phy.
> >
> > As per the of_mdio below 2 are valid compatible string
> >       "ethernet-phy-ieee802.3-c22"
> >       "ethernet-phy-ieee802.3-c45"
>
> Nope, this is not the full story. Yes, you can have these compatible
> strings. But you can also use the PHY ID,
> e.g. ethernet-phy-idAAAA.BBBB, where AAAA and BBBB are what you find in
> registers 2 and 3 of the PHY.
>

Oops I did not read the drivers/net/mdio/of_mdio.c completely.
Thanks for letting me know so in the next series,
I will try to add the below compatible string as per the description in the dts.

               compatible = "ethernet-phy-id001c.c916",
                            "ethernet-phy-ieee802.3-c22";

> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > index 2766fe45bb98..cfc7909d3e56 100644
> > --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > @@ -33,7 +33,7 @@ properties:
> >          description: PHYs that implement IEEE802.3 clause 22
> >        - const: ethernet-phy-ieee802.3-c45
> >          description: PHYs that implement IEEE802.3 clause 45
> > -      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
> > +      - pattern: "^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$"
>
> So here you need, in addition to, not instead of.
>
> Please test you change on for example imx6ul-14x14-evk.dtsi
>

Yes I have gone through the test case.

>    Andrew

- Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
