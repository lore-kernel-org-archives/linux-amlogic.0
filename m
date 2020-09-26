Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E78C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 08:30:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38DC72177B
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 08:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bXnOs2lE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vJgVOXcn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38DC72177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qHLYSGR6E2ca6zZfFsBYpiKN8TJ0/QYBgZtlofVwsXk=; b=bXnOs2lEzU9mhNUYqgZqllbwD
	89wdQWAZzBlU4T9Mxg0eGY0FAnRuSf/nDKludmKKXvg2LmTJ7MHNr63u/7OMfPBcSZz76npUr/N5b
	yLz+OwUd5msSPN0Wl13Vil0vqm2dwlGRnUzKLDxvkKmeEjok9y77ADccg11Qga5s2pxfMNOmlUMQ9
	fqaoRXTF1T3YY00vl85t491SMe9p1c1DefKiZCsUw7XQ9Tyo3LuZ9/uUD5e6cF4TyOQEvvP33Ef0A
	oLiGWAbA+tiqjvrnqezzQk2IggttX9rBIiPC/jMAaiKnHeh/vvrVkAer16ldTplrtBfpY+yS4AieV
	4RehY5NtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM5bI-00029t-Tz; Sat, 26 Sep 2020 08:30:36 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM5bG-00028b-IM; Sat, 26 Sep 2020 08:30:35 +0000
Received: by mail-ej1-x641.google.com with SMTP id p15so1732106ejm.7;
 Sat, 26 Sep 2020 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=geRPT82jJQC5Dnh8QLGuxC3SCHWc2B1rPydy51X3y1Y=;
 b=vJgVOXcnyREOuagh28h8Q0hP3/36E2V95YTMGWyefkvTqTzDsU/nh6s/sw4djktg3j
 HbkKAVtMTuwM5NugaibhxmZgkmRRJWoRqqLTZ/5ntZQHR6uy3YUb4P/uysiZCAaSvbA/
 msjSbkjTd12PbiMT3mhH2UCLjfm7tQehqgwXLMpNLY2P+CvIspAi96cQ8qLYROGdyk3D
 N7KWsJRDacxkzT98nQyZ9cwRf+IDqnS/+I6iT26Knfn4TbMHXiVzVdEe6z5JI0v7ap5M
 bOdUV8ACbNvb3vg+pMNphJUzHaYRHQ5TLQC8JBDgGhRqav5Wb7RAhSqjkDGlmrodmtFe
 uPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=geRPT82jJQC5Dnh8QLGuxC3SCHWc2B1rPydy51X3y1Y=;
 b=pqCzM5TgElpRLgQA/5nft5mGyD+94CYrvuh/F5Xdj/RaUQPaNrt7n1OjUsWn5D4BYn
 M80tgfMp7BbNmfXSu9I9viGAOJAqxm/wdsrjxhtGceYBDSVQx5tCDoCg7BYAJ0Y3rTfv
 0HGuuusTWGn6iNlab5wGqGeKBwoxJAjTEX+/+8SDZkPZ7SSBhWmocju9P1vHZL1PFmhi
 uOVkWgy/US0X/9vYdT90OQgcz5aWupuAlVIPsrmNfrO0ZC8OQm072NX1j176z8w/wdpV
 ByD6h1FPk7i7YYRL3i2Mn/O0vvlmsRQ4hj0ZAa23+SrQUaVLgfgpElSmbsuotD9FkPnn
 Uyiw==
X-Gm-Message-State: AOAM531gZ2C7GeJ6ze7otf4tWyvxVD4GOv8Vm9h3lCyMa91AeEbjgY18
 qTnuE34cEstura8NtmfF6mj/6zzVEEarmaBnq5w=
X-Google-Smtp-Source: ABdhPJx0csOOAv2vhhfuNQzBodoKVpINTDv/Y6G8FMXBH5RtOuMbitW1hL9frNPcQ2pHadXidMm67gt6b4kDUQ954Cg=
X-Received: by 2002:a17:906:3791:: with SMTP id
 n17mr6423102ejc.216.1601109031457; 
 Sat, 26 Sep 2020 01:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
 <20200925221403.GE3856392@lunn.ch>
 <CAFBinCC4VuLJDLqQb+m+h+qnh6fAK2aBLVtQaE15Tc-zQq=KSg@mail.gmail.com>
 <20200926004129.GC3850848@lunn.ch>
In-Reply-To: <20200926004129.GC3850848@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Sep 2020 10:30:20 +0200
Message-ID: <CAFBinCAc2-QV3E8P4gk+7Lq0ushH08UoZ0tQ8ACEoda-D8oaWg@mail.gmail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_043034_645497_822807F1 
X-CRM114-Status: GOOD (  38.62  )
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

On Sat, Sep 26, 2020 at 2:41 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The reference code I linked tries to detect the RGMII interface mode.
> > However, for each board we know the phy-mode as well as the RX and TX
> > delay - so I'm not trying to port the RGMII interface detection part
> > to the mainline driver.
> >
> > on X96 Air (which I'm using for testing) Amlogic configures phy-mode
> > "rgmii" with a 2ns TX delay provided by the MAC and 0ns RX delay
> > anywhere (so I'm assuming that the board adds the 2ns RX delay)
>
> Hi Martin
>
> It would be unusual to have an asymmetric design in the PCB. So i
> would try to prove that assumption. It could be the PHY driver is
> broken, and although it is configured to use RGMII, it is actually
> inserting a delay on RX. Also check if the PHY has any strapping.
I checked this again for the vendor u-boot (where Ethernet is NOT
working) as well as the Android kernel which this board was shipped
with (where Ethernet is working)
- in u-boot the MAC side adds a 2ns TX delay and the PHY side adds a
2ns RX delay
- in Linux the MAC side adds a 2ns TX delay and the RX delay is turned
off (for both, MAC and PHY)

> > I am aware that the recommendation is to let the PHY generate the delay.
> > For now I'm trying to get the same configuration working which is used
> > by Amlogic's vendor kernel and u-boot.
> >
> > > Is there any documentation as to what the calibration values mean?  I
> > > would just hard code it to whatever means 0uS delay, and be done. The
> > > only time the MAC needs to add delays is when the PHY is not capable
> > > of doing it, and generally, they all are.
>
> > This calibration is not the RGMII RX or TX delay - we have other
> > registers for that and already know how to program these.
>
> O.K. so maybe this is just fine tuning. Some PHYs also allow this.
>
> > What I can say is that u-boot programs calibration value 0xf (the
> > maximum value) on my X96 Air board. With this I cannot get Ethernet
> > working - regardless of how I change the RX or TX delays.
> > If I leave everything as-is (2ns TX delay generated by the MAC, 0ns RX
> > delay, ...) and change the calibration value to 0x0 or 0x3 (the latter
> > is set by the vendor kernel) then Ethernet starts working.
>
> So there is just one calibration value? So it assumes the calibration
> is symmetric for both RX and TX.
yes, there's only one calibration value
the reference code is calculating the calibration setting for four
configuration variants:
- 2ns TX delay on the MAC side, no RX or TX delay on the PHY side,
RGMII RX_CLK not inverted
- 2ns TX delay on the MAC side, no RX or TX delay on the PHY side,
RGMII RX_CLK inverted
- 2ns TX delay on the MAC side, 2ns RX delay on the PHY side, RGMII
RX_CLK not inverted
- 2ns TX delay on the MAC side, 2ns RX delay on the PHY side, RGMII
RX_CLK inverted

now that I'm writing this, could it be a calibration of the RX_CLK
signal? The TX delay is fixed in all cases but the RX delay and RX_CLK
signal inversion are variable.

> What PHY is it using?
>
> https://dpaste.com/2WJF9EN suggests it is a RTL8211F.
indeed, it's a RTL8211F

> This device does have stripping to set the default delay. Can you
> check if there are pull ups on pins 24 and 25?
I checked it in software (see above)
to let you sanity-check this:
in vendor u-boot I read: reg 0x11=0x9 and reg 0x15=0x19
in the Android kernel shipped with the board I have: reg 0x11=0x9 and
reg 0x15=0x11

note: I haven't found a way to "fix" Ethernet in u-boot so far. I
cannot get the exact u-boot copy that's used on my board (since
there's no vendor to contact).
so I'm careful with interpreting what I'm seeing in u-boot

if you really want me to I can check the pull-ups but I prefer not to
since I managed to short and break tiny solder joints in the past -
and I only have one of these boards for testing

> What i find interesting is in the driver is:
>
>         ret = phy_modify_paged_changed(phydev, 0xd08, 0x11, RTL8211F_TX_DELAY,
>                                        val_txdly);
>
>         ret = phy_modify_paged_changed(phydev, 0xd08, 0x15, RTL8211F_RX_DELAY,
>                                        val_rxdly);
>
> Different registers, 0x11 vs 0x15. In the datasheets i found with
> google, none describe any of these bits, but at least register 0x15 is
> mentioned, where as register 0x11 is not.
>
> Git blame shows you added this! Are you sure about this? It seems odd
> they are in different registers.
I asked Realtek about it back then and they were kind enough to reply
- so I got this information from Realtek
double-checking with my old mails (I have to type what's shown in the
screenshot as I'm allowed to share the info but not the screenshot
that I received):
Function Name: Manually Enable TXDLY
Function Description: Enable TXDLY by registers (default by hardware
pin configuration)
RTL8211F series: Page: 0xd08, Reg 17, bit[8] = 1

Function Name: Manually Enable RXDLY
Function Description: Enable RXDLY by registers (default by hardware
pin configuration)
RTL8211F series: Page: 0xd08, Reg 21, bit[3] = 1

In the meantime Amlogic's "hacked" PHY driver is also using these registers: [0]
So I assume that I'm doing the right thing in the Realtek PHY driver


Best regards,
Martin


[0] https://github.com/khadas/linux/blob/d140398907da5a3f4f7dba2acd336e2ef469bac2/drivers/net/phy/realtek.c#L174

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
