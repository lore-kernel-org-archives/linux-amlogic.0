Return-Path: <SRS0=tEAa=6P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3600DC4724C
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 14:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087E920857
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 14:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UsaiNPMi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="W3eBxkRV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087E920857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvAPqn5BwYmoA5W8N29664zEwpvmtun8FBf1w9F/fc8=; b=UsaiNPMiSC6+Vq
	tofIB7qbhcBX5198sZ4sd0NN/FIFy8yj9Q8YWQd6/La5c+rcJvruXrDmi2R2XqOryFDdrc9rvwfE/
	upgioJhso8Ft1TieOJAxrNkvSuQ1hQEM/+Ptx+iayveR47aknGHDh73NjytdqBLMlLquHiphNcdvE
	EGat+3bbJi7gAta5Ud0MzyirWxBRlEtKgUIHUQqmHXT/kOjexZrWsQUoXEpWMb6Jvo+FowLjh/cgC
	i0Yq7aJm7c8B4mhULI5P48ClWpg+lvW2OJry3OIvaQLv3lUWIT98x4aaBlT4S5wq9gHiWayZDGCKG
	VPvQzs5PVNFyPLcbylgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWyg-0005HU-7W; Fri, 01 May 2020 14:49:22 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWyZ-0005CG-Pk; Fri, 01 May 2020 14:49:18 +0000
Received: by mail-ej1-x642.google.com with SMTP id a2so7659399ejx.5;
 Fri, 01 May 2020 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fxPFkW3QxOmRfYj2h3nMtAxuro0T/xEXMFbcE0LTrVU=;
 b=W3eBxkRVCUkRmVjaeZxdY0eWXI1WeV14Y3GZ6cGG6qX2rTNYODG/BhL8vEpRBcwaX8
 5zyBVQI+Panp/tiEK/dymKhhil24IaILyAaTbA3+8a3McJf9tacA3Zc7rwjq5i0wWM3R
 kNZhVSx8yndKHndGwo7LMgJt+4oODm4bGQ7Xu4rUIJQYPUR40Ev/Jg4FjzSM5/gEV5+x
 oQPS5n4+5GFiF2LMJceZVHlRYcpEj/Q9OldY0p8kPupcGJLxLMkoKGeFEXfmjNy1T8g+
 5HfzjwGCytspb5OaBLFNKMcAUGG9Oz5jmvrc5BifLpcq/oGghD/DAsv+kcGzitsc9hJ8
 702w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fxPFkW3QxOmRfYj2h3nMtAxuro0T/xEXMFbcE0LTrVU=;
 b=NQxAy8WK28qWnrA5yu509vr/lbCTvuJCTq9CEcKzeiJaROnyD8bE/cPlr7no8fpEY+
 ja5XidlUHrApssZOekzzk0MRBqwjrnKEQkPHMQElAWIEflMBJfjSjTyyScN/2yHtTo6r
 h1Ke+r0JDccXx95Xdn/uJ6Ee2MEzDwpSLWCfzWxjjn9rSb/I8pZCFRX+E4xRHPeHDvTm
 y2xyvEO2pW1DlolBaf0INxedz/v+kp+nQPivEyBozkn920++aSgRwWfewz6XcLu6xMkd
 7ZPWh9v224p/XLUhxrizfzcSsGiFGT/iM/w2dlSOIZxE6Z0Hu3flRYjdbuSU/ynCaQoc
 DgRg==
X-Gm-Message-State: AGi0PuaMmOWRkQg+g9t9TsE7mM+NdxFRHJ1mJV2gWXDf1Biw82tR2CF/
 mp1Irw81dxOH2dOdhuxfC90hoRYh/k1xpyFdWMU=
X-Google-Smtp-Source: APiQypI+1+VQOUh4IFgtlgbygkJrSop4NKMEXZUd+7VOMUopczAN+iZLGHuyibbdAMVPCjuSWytmI5hAyJGDHqrKplU=
X-Received: by 2002:a17:906:4048:: with SMTP id
 y8mr3549075ejj.258.1588344553010; 
 Fri, 01 May 2020 07:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429212933.GA76972@lunn.ch>
In-Reply-To: <20200429212933.GA76972@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 1 May 2020 16:49:02 +0200
Message-ID: <CAFBinCDAz48BKjvLHOmuHk6nME+vpCueFW14UWP1b8Ae_D1j5w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 00/11] dwmac-meson8b Ethernet RX delay configuration
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_074915_838538_F32F47E5 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Wed, Apr 29, 2020 at 11:29 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > - Khadas VIM2 seems to have the RX delay built into the PCB trace
> >   length. When I enable the RX delay on the PHY or MAC I can't get any
> >   data through. I expect that we will have the same situation on all
> >   GXBB, GXM, AXG, G12A, G12B and SM1 boards
>
> Hi Martin
>
> Can you actually see this on the PCB? The other possibility is that
> the bootloader is configuring something, which is not getting
> overridden when linux starts up.
at least it doesn't jump straight into my eye.
I checked in u-boot and Linux, and for both the RX delay is disabled
in the PHY as well as in the MAC.

The schematics of the Khadas VIM2 also show the the RX delay in the
PHY is turned off by pin-strapping, see page 7 on the right: [0]
It's the same for the Khadas VIM3 schematics, also on page 7: [1]
There are also high resolution images of the Khadas VIM3 online so you
can look at it yourself (I couldn't find any for the Khadas VIM2 which
is what I have): [2]

I agree that we need to get an answer to the RX delay question on the
arm64 SoCs.
If there's no way to find out from the existing resources then I can
contact Khadas and ask them about the PCB trace length on VIM2, VIM3
and VIM3L (these are the ones with RGMII PHYs).

For the older SoCs the RX delay has to be provided by either the MAC
or the PHY and right now we're not configuring it.
We cannot simply enable the RX delay at the PHY level because the
bootloader enables it in the MAC (so we have to turn it off there).
So it would be great if you could still review this series.


Martin


[0] https://dl.khadas.com/Hardware/VIM2/Schematic/VIM2_V12_Sch.pdf
[1] https://dl.khadas.com/Hardware/VIM3/Schematic/VIM3_V12_Sch.pdf
[2] https://forum.khadas.com/t/khadas-vim3-is-launching-on-24-june/4103

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
