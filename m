Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D723AC4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:39:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB1021775
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YUmBl9B0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rX5DrMgl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB1021775
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6N/kGJ3xSqxQQkzK7gOpX5XlxEZiLDseX5Z+Otq4YG8=; b=YUmBl9B0rVFK6kyecve0bA5GW
	HwrJ/hd7KcJ7ApmPSJOTLa/GDudECOIRav9tsczZD/PKlbzp+IFS1MiwgjSjnMK8uwVrdydivfZ56
	qypvC3dU7yknhpikmBtxe8lOtGqjY4+gBtIU1XCBmci2zad9abp0chkIlIyVH70IAENJ3HkDiVq7d
	ItFNruR5B++DpPPLAXrQUtW3hXF9L3lTIzLkZ3gTgjusKsSz60bdZqLKVJk+pZ1wmK9EoR+pfpOSc
	60Jcsk2t+Jpd42Na7Jxg1vH5+Gd1gd4ZukJo1mB4z5ZNRPS6SzL9S9+dT9RYEgRoPB3YMd05BVslm
	fm4uI06fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLwNG-0003SL-KP; Fri, 25 Sep 2020 22:39:30 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLwNE-0003Ro-1f; Fri, 25 Sep 2020 22:39:28 +0000
Received: by mail-ej1-x642.google.com with SMTP id o8so701179ejb.10;
 Fri, 25 Sep 2020 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zqcW3rl891dr3qudKSLhS4tM1nPfMjp/6k/SFPe8aho=;
 b=rX5DrMgl45l4foK7sUE7lDf1V4ef0f/JWh2cBca7Eg9SfMIt9B6IzyokAhBP4qxsWq
 W8nojKscvzMqKBkOb/KfvVzK1y3wg3w4qzAXy3mkXeagrLF/X+ih8t+adz3pWMEfA5K3
 go118JTDfgio6nvFtY/0Cw/RQiaYrlzn8xcUlduyu2WcImRls2t5v91UmcCxlCbY+aOZ
 eKokjTkFno08KvKc4DjaiwejdCHgC2/+LfszJHvEStNijjxaDXXNK9bssJkuDdAsFfK7
 /otOJFfZ9vWQf+FdYyqtF2hpy3jI9syz917xlAXIOA0+/86psRguFOBN8lDBEJGeiPOQ
 Zl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zqcW3rl891dr3qudKSLhS4tM1nPfMjp/6k/SFPe8aho=;
 b=hNk0K0nmYgGPaSZZgL3sMm6Ct1+4J3Q2GKi22dNiQl+SMpjDJ1dTY7ds2xvzIzU6M4
 RdGT9Zl34kEGQvXH3C3GrbjWtOhOKmsEQkF6NiJKc3YmYrETf4yhtNLGPoIjY0wq6RG3
 Z6AIjmz+ZMWtZdBQuaSEoadYWckiC5CY2QaZF/+IgmTAafUwzpaYCrz7YZay7Ipe68Ze
 wEulrWCaRCKg5GwEckLjd1LWNi/NsDndLOgfQ16TcV+2wZqYjsP9b1VL1Ww8vl84ycLi
 RDuSsE1LoAQ3MasqXaTXOLAbgEqCQ4LmBl87JbrbzlpV2/QEun0q6gF8EixQX5xR6T1A
 DrbA==
X-Gm-Message-State: AOAM530LGjHXhvdxslaiICsh37xQbdiyzImFYavkyoXHYZfpXpbb+j2Z
 boRShhU0K/Ct676s1huTBQ9Ly2Di3x1hsB5O3xc=
X-Google-Smtp-Source: ABdhPJwBDw1ys7C5G/etJuJ74bio79gE0vxTaamvelT5Kj77dUcSW09e2b0vXr1hy05/QOK1InVs9GRY7IMSc+Grlts=
X-Received: by 2002:a17:906:7b87:: with SMTP id
 s7mr1062698ejo.328.1601073565571; 
 Fri, 25 Sep 2020 15:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925221403.GE3856392@lunn.ch>
In-Reply-To: <20200925221403.GE3856392@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Sep 2020 00:39:14 +0200
Message-ID: <CAFBinCC4VuLJDLqQb+m+h+qnh6fAK2aBLVtQaE15Tc-zQq=KSg@mail.gmail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_183928_159552_1F749C05 
X-CRM114-Status: GOOD (  26.00  )
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
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Sat, Sep 26, 2020 at 12:14 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Sep 25, 2020 at 11:47:18PM +0200, Martin Blumenstingl wrote:
> > Hello,
> >
> > Amlogic's 12nm SoC generation requires some RGMII timing calibration
> > within the Ethernet controller glue registers.
> > This calibration is only needed for the RGMII modes, not for the
> > (internal) RMII PHY.
> > With "incorrect" calibration settings Ethernet speeds up to 100Mbit/s
> > will still work fine, but no data is flowing on 1Gbit/s connections
> > (similar to when RX or TX delay settings are incorrect).
>
> Hi Martin
>
> Is this trying to detect the correct RGMII interface mode:
>         PHY_INTERFACE_MODE_RGMII,
>         PHY_INTERFACE_MODE_RGMII_ID,
>         PHY_INTERFACE_MODE_RGMII_RXID,
>         PHY_INTERFACE_MODE_RGMII_TXID,
>
> In general, we recommend the MAC does not insert any delay, we leave
> it up to the PHY. In DT, you then set the correct phy-mode value,
> which gets passed to the PHY when the MAC calls the connect function.
yes and no.
The reference code I linked tries to detect the RGMII interface mode.
However, for each board we know the phy-mode as well as the RX and TX
delay - so I'm not trying to port the RGMII interface detection part
to the mainline driver.

on X96 Air (which I'm using for testing) Amlogic configures phy-mode
"rgmii" with a 2ns TX delay provided by the MAC and 0ns RX delay
anywhere (so I'm assuming that the board adds the 2ns RX delay)
I am aware that the recommendation is to let the PHY generate the delay.
For now I'm trying to get the same configuration working which is used
by Amlogic's vendor kernel and u-boot.

> Is there any documentation as to what the calibration values mean?  I
> would just hard code it to whatever means 0uS delay, and be done. The
> only time the MAC needs to add delays is when the PHY is not capable
> of doing it, and generally, they all are.
This calibration is not the RGMII RX or TX delay - we have other
registers for that and already know how to program these.

This new calibration only exists on 12nm SoCs so I assume (but have no
proof) that they need to solve some challenge that comes with the
advanced node (previous SoCs were manufactured using a 28nm process).
In the old days the vendors put calibration data into the eFuse.
However I think for mass-production of cheap boards this is not nice
for the manufacturers (because they need this eFuse programming step).
So I think Amlogic added a calibration circuit to handle tolerances
within the SoC manufacturing as well as the "environment" of the SoC
(there are some TI SoCs where the MMC controller's clock calibration
depends on the SoC temperature for example. For these Amlogic SoCs I
don't know the factors that influence this calibration though - one
guess however is cost-cutting).

All of that said: I don't have any scope that's fast enough to see the
clock-skew on such high-speed signals so I cannot tell for sure what
problem they are solving.
What I can say is that u-boot programs calibration value 0xf (the
maximum value) on my X96 Air board. With this I cannot get Ethernet
working - regardless of how I change the RX or TX delays.
If I leave everything as-is (2ns TX delay generated by the MAC, 0ns RX
delay, ...) and change the calibration value to 0x0 or 0x3 (the latter
is set by the vendor kernel) then Ethernet starts working.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
