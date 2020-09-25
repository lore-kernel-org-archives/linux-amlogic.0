Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF63C4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:03:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D7920717
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/6MSXak";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYd4vVau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D7920717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LNqFZ9GxmHVeI+oO1Rfog7kg7Zs1IDzwf9UBRIhOSyU=; b=R/6MSXakTYfSLJLFi6AQvbN+q
	dQF5mbSf0jPKksmzxPTxmdPFvVl0CM7lCPfu04n0gvoilka1Lbv7Y6zq8Fv8Y/zk2GfkrepLB5kVr
	T1+9ohgOEUIVccvnTtVmUUgaMxy/LLDh3vFJAWG7xeRcLezltqR6cJWmMuQr3tLEmTCUJSWjFDbAR
	zi+3zTx2fgWD2TN6n61cgXSezQbER1sl56DaHy/ILg5/mCMYPJlbCKGWPc5YIR7PwuPVkMgqK/E7L
	TtOs2bnOWwwsEg7pMDwrCpQjRuB42mbrDwKCG4pgP655UvNNSpmGDgKuV+khVEJgVJQzWsCM10Nxz
	fv9n3HZ5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLvoY-0008RZ-NN; Fri, 25 Sep 2020 22:03:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLvoW-0008Qm-5o; Fri, 25 Sep 2020 22:03:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id l17so4031150edq.12;
 Fri, 25 Sep 2020 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PfB5GrheyIxnuAWoT4Dsjo6Mha9ADMRuQTrX6xNqieM=;
 b=jYd4vVauL82htavV5DVWBFt35LGUeihssisY05RbiHtTLMH1W2WclaKNei4NEaX1xF
 mjJN1hc11c8Vb7ATOQUoX8r7X2oJIlwZiXmuE9YtGGuejIuEsU6HKZKHlO/kFpnUWiSw
 etcfK56weRaTSIM/YZ0kW1we6+hVqRwq7w3C9QNPWSwrN+Qpbv79oZVJB0iXntdgbD8u
 KAl9vf7vyOhJ5S0dHAlKfoVmBHSklOR7hMVongLBZl29la+Wy5NjQVI++8mW5qL2acHd
 jWgbR0KXJGcbQhH89ciba6kB6lxciOwnSS//IZynAhPVElj6Tc2e3V764l9hfFc3WsZY
 qeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PfB5GrheyIxnuAWoT4Dsjo6Mha9ADMRuQTrX6xNqieM=;
 b=t/Al9+AIUYibNaZkHe+ZYf7aI+61vpiptfsONEKa2GoOXiXSyBmeSYuI7cWiyFeE+Z
 xGPbaYZmAwFn2hOMl0RN2tOWHfcojDeW/gZE2W2RfaEE4VONURdqWAMAt7A0Lz8B7slu
 Xc/PiVmN6uzkIy4B+2jAB1tZe9ZCKbPHVVOZnCwa/+angCs67FqfVoc//Zh2KSfV4Mp2
 sftvi+omzYKBg91oEGuM/Z7OSsYr42lBO+UR/UK/N1En4NsaVQcyQcdhmym2JX6mZQ9q
 LRhsLvBDqWGhSxLw+wuuEqw9kAmlad3Sum7D4pPUgiBKLH+v5puM6Q4x1OJ3OddGfujq
 B7Lg==
X-Gm-Message-State: AOAM5310ff1DUMFL3i/LFEPy/pYw18txEBIjLV1UI60JMXJTdhIeSfR4
 IWZXs0vwwvVAGzH2djZ9W0k=
X-Google-Smtp-Source: ABdhPJyGUVsG+yL+Rkb1/RH2dwFszvvzId3+1LmhXmXvj3lb8f6D/iaxC1P/kNs7PvAxUn8g3w/wcw==
X-Received: by 2002:a50:8c24:: with SMTP id p33mr3715365edp.330.1601071413119; 
 Fri, 25 Sep 2020 15:03:33 -0700 (PDT)
Received: from skbuf ([188.25.217.212])
 by smtp.gmail.com with ESMTPSA id bo8sm2769846edb.39.2020.09.25.15.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 15:03:31 -0700 (PDT)
Date: Sat, 26 Sep 2020 01:03:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 f.fainelli@gmail.com
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
Message-ID: <20200925220329.wdnrqeauto55vdao@skbuf>
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_180336_324395_A7445602 
X-CRM114-Status: GOOD (  21.36  )
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
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, kuba@kernel.org, joabreu@synopsys.com,
 linux-amlogic@lists.infradead.org, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Fri, Sep 25, 2020 at 11:47:18PM +0200, Martin Blumenstingl wrote:
> Hello,
>
> Amlogic's 12nm SoC generation requires some RGMII timing calibration
> within the Ethernet controller glue registers.
> This calibration is only needed for the RGMII modes, not for the
> (internal) RMII PHY.
> With "incorrect" calibration settings Ethernet speeds up to 100Mbit/s
> will still work fine, but no data is flowing on 1Gbit/s connections
> (similar to when RX or TX delay settings are incorrect).
>
> A high-level description of this calibration (the full code can be
> seen in [0] and [1]):
> - there are sixteen possible calibration values: [0..15]
> - switch the Ethernet PHY to loopback mode
> - for each of the sixteen possible calibration values repeat the
> following steps five times:
> -- write the value to the calibration register
> -- construct an Ethernet loopback test frame with protocol 0x0808
> ("Frame Relay ARP")
> -- add 256 bytes of arbitrary data
> -- use the MAC address of the controller as source and destination
> -- send out this data packet
> -- receive this data packet
> -- compare the contents and remember if the data is valid or corrupted
> - disable loopback mode on the Ethernet PHY
> - find the best calibration value by getting the center point of the
> "longest streak"
> - write this value to the calibration register
>
> My question is: how do I integrate this into the dwmac-meson8b (stmmac
> based) driver?
> I already found some interesting and relevant bits:
> - stmmac_selftests.c uses phy_loopback() and also constructs data
> which is sent-out in loopback mode
> - there's a serdes_powerup callback in struct plat_stmmacenet_data
> which is called after register_netdev()
> - I'm not sure if there's any other Ethernet driver doing some similar
> calibration (and therefore a way to avoid some code-duplication)
>
>
> Any recommendations/suggestions/ideas/hints are welcome!
> Thank you and best regards,
> Martin
>
>
> [0] https://github.com/khadas/u-boot/blob/4752efbb90b7d048a81760c67f8c826f14baf41c/drivers/net/designware.c#L707
> [1] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c#L466

Florian attempted something like this before, for the PHY side of things:
https://patchwork.ozlabs.org/project/netdev/patch/20191015224953.24199-3-f.fainelli@gmail.com/

There are quite some assumptions to be made if the code is to be made
generic, such as the fact that the controller should not drop frames
with bad FCS in hardware. Or if it does, the code should be aware of
that and check that counter.

Thanks,
-Vladimir

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
