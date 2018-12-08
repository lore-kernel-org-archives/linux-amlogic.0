Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE2FC64EB1
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 10:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1732082D
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Dec 2018 10:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3y0mVw3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hoXwhhYc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1732082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f53IEoTKwWfLK7GNf/0/gHjoZNvJcNtgu/eCV75e66Y=; b=F3y0mVw3PCY/Hc
	6AVi/UaO/4gK8yobqXv2D/rOWXctSdnmQnoo0DAanc9Ea5qy/tc6XJsUDlf0WOGbfKXAoe6jrX5fj
	dKSjG8hQiy2C4GXY3DjrBx3VUK7nCGip06/VIWAUSBGe+YrKmkCAeIaoQnyJUvKpoINLViV6muyFC
	xzST7crZMRvIs2D4ieYFe8HuK5lROO5EAZeC2THRETAY311yC0UaxIw/Nvc6xmUBDvEj6SGKBUdZh
	pAg001iZbSRLATJq0tOHWWqFfzB/Wd15WfjEvkaO5NJY6kCcPWHV0za/re7oqx8fGBi6Q7SF8ODmm
	ERWgIcrq0xLQlMD5X1CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVa8C-0004AG-FJ; Sat, 08 Dec 2018 10:46:44 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVa80-00042B-1j
 for linux-amlogic@lists.infradead.org; Sat, 08 Dec 2018 10:46:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id x10so6014375wrs.8
 for <linux-amlogic@lists.infradead.org>; Sat, 08 Dec 2018 02:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=DYjw/ytpYvIAwi4u/Lz8ykrgaWMCIJzGrg0SOWwIZ5k=;
 b=hoXwhhYcBoR9LHFj+HcdYr3FDGPb+91AieJN5PlUPWEIMrMucso+zymYWm28Xz0PcH
 GEhTv/FBMDFlXJoaNH4eW+AW2wYbYicVE9ylPC2VV07CAROmyGP63n5a76itGq1nffbX
 P+GDg/DBLW5yc/05XnNjAA0dmRSQCwKZng2DnbSpYEAHSedJWz4ifpFfg+VE0ydkWecx
 PzcD4a4klf4GQmIFeuhfK178T+JFVzx40oPPDvGDzucW5vHsTn1FUBQdLjV9dlGYngNK
 CEoReYIBoUoypp9X6uLGVzsICLaF+60gMWxZmI8bWHye5gH9z/WU2op2TXKj7gXhYIBs
 ++jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=DYjw/ytpYvIAwi4u/Lz8ykrgaWMCIJzGrg0SOWwIZ5k=;
 b=OmeCttzZKVLIj5doS2JxiV/up0F7XJGZIW9481csMdRr/QaCqnWR7Hw/IFbqSFbhlN
 ZaZ34WRbI8zIkX99EoIlFgK1f3eyYCkh9uU8Ne1ms4knncltQWUHXmWxOqEUrURkx+CL
 EjQMsk1YCcGu+y++3VkKnkTNpAWU/xsrOI5KC7NZCTao1wTc2tFvVDNH0zlqa4VnIGeK
 M9krlbMsjtHKrAcZFNIttScFuBVj8I9bQdwR1J/aZ87XaIZ7glWZ0Qt8Kats6XZpdsUv
 0QIAOeBz15MYrNKv2epJcEVfGpaqhfwIZmkeruM3c1GMZbcU1PMQ28xI1g25yiOHstkn
 Ys+g==
X-Gm-Message-State: AA+aEWZqSEsPYavS3i1dj4c/ZI9Y2xDZvpuOX+FRHIgmNzmADmW7caJ6
 3/7mgEGyVttZlmEQjSjHXNWIow==
X-Google-Smtp-Source: AFSGD/V9lki5nG1DRl8OKjZUVtk4khsPHJz6rf4FUbc5rSI+SYPuGr2QvrAXRnDaA36SRFCIQxXxWg==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr4706875wrn.185.1544265978826; 
 Sat, 08 Dec 2018 02:46:18 -0800 (PST)
Received: from broadband.bt.com ([2a00:23c4:f7a1:ce00:5105:4b7b:c922:7c6])
 by smtp.gmail.com with ESMTPSA id s66sm7528118wmf.34.2018.12.08.02.46.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 08 Dec 2018 02:46:18 -0800 (PST)
Message-ID: <d318a99306d21023f92a249cb78bec010baf11db.camel@baylibre.com>
Subject: Re: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
From: Carlo Caione <ccaione@baylibre.com>
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
Date: Sat, 08 Dec 2018 10:46:17 +0000
In-Reply-To: <20181207185136.GB17435@ingrassia.epigenesys.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-3-ccaione@baylibre.com>
 <20181207185136.GB17435@ingrassia.epigenesys.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181208_024632_181539_85D076AB 
X-CRM114-Status: GOOD (  19.34  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2018-12-07 at 19:51 +0100, Emiliano Ingrassia wrote:
> Hi Carlo,

Hi Emiliano,

> tests[0] conducted on an Odroid-C1+ board equipped with a Meson8b SoC
> have shown an high packet loss (90% and more) during a simple ping
> test from a laptop to the board.
> Testing the two patches separately clearly showed that this depends
> on the
> removal of the "eee-broken-1000t" flag from the board PHY description
> in the relative device tree.
> 
> About the first patch (MAC IRQ type), no tests have shown an evidence
> that it is needed. I suggest you to conduct some test on real
> hardware
> as I do to confirm or disprove my tests.

Let's try to step back a bit and see what we can do to clarify this
situation.

First of all for arm64 we are pretty sure that both patches are needed
because we ran extensive and lengthy tests, especially regarding the
change in the IRQ trigger type. For arm things are not so clear, so for
now we decided to merge the arm64 patch and just wait on the arm one.

First of all we can focus on the patch regarding the change in the IRQ
type.

The problem with the IRQ type is triggered on the arm64 boards we
tested using the script in [0]. If we run this stress test on the arm64
boards without the trigger changing patch after a few hours (variable
from 2h to 6h sometimes more) we can see the connection dropping from
~1Gbps to <30Mbps. Jerome gave a nice explanation of the why, but after
changing the IRQ trigger type we couldn't see the issue anymore. This
was confirmed not just by BayLibre but also from other different
sources, so we are pretty confident in this solution.

So my first two points for you to answer are:

1) Can you reproduce this problem on your board without the patches
when running this script?

2) If yes, does only the first patch solve the problem?

This brings us to the second issue, the one regarding the 'eee-broken-
1000t' quirk. Since the two issues are strictly related we are
confident that the change in the IRQ type solves this problem as well
(and this was confirmed by Jerome as well on the arm64 boards).

For this case I cannot provide a real reproducer so we need only to
stress test the network with iperf3 trying to reproduce the issue. This
is also because we think that you approach of using UDP and your packet
generator probably is not the best way to test the patch given that (1)
using UDP is not reliable according to our tests, (2) there is an
asymmetry in TX/RX, (3) the packet loss could be due to the saturation
on the bandwidth, etc...

So AFAIK the best way to test this problem is using iperf3, the same
way it is done in the script in [0]. I was not involved with this issue
1 year and half ago but AFAIK this is the way it was reproduced.

This brings me to more answers for you to answer:

3) Running iperf3 tests in TX / RX / TX+RX without the 'eee-broken-
1000' quirk applied are you able to reproduce the EEE problem?

4) Any change when the 'eee-broken-1000' quirk is applied?

When testing (3) and (4) also please check the status of the EEE using
ethtool.

Hopefully this will bring a bit of clarity to the whole situation :)

Cheers,

[0] https://paste.fedoraproject.org/paste/GBFxjAQ0JULsYQlyYO2KOw

--
Carlo Caione


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
