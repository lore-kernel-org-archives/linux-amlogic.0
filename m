Return-Path: <SRS0=Om+1=PH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BB4C43387
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 18:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD292084A
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Dec 2018 18:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WsmKsEiz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD292084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6N4z+mulcpnrLy1Ncu4aniRxBmb1eBKi4fCLIVsGCM=; b=WsmKsEizLeu8eM
	mRtOkIbuJ6ejCfzgXN8I0ck4yhDVyHr7USe8f8BctXszjXCKPpIrD0+H/YCCfoQGzGH2P3dwAb+fM
	PIm146gtU6FFotf4rw+2bZCHC8w08Ig+ya8Lt9i+3jhuMOGANcoBCzqjLRLlzRo3Lu8JsYJ3dZHSY
	kIsb/y3ZZtbEgR9jnzlK3euaalpMcpoNiTN5I9fCAiTQDWfmN1of1q5LuMTHzNaS6mOLMteWn48k0
	mxQtAahheMGQG+YCK8QkzBQ65W9lFYYSySUOxPhWHUnrHPz5ocndo6IeYW01vIYxtzCtxv/HQ11tX
	dDLWJaGYpSdVVmEfF57Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gdfcb-0005Ot-GN; Sun, 30 Dec 2018 18:15:33 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gdfcX-0005O0-S7; Sun, 30 Dec 2018 18:15:32 +0000
Received: by mail-ed1-f68.google.com with SMTP id f9so21214728eds.10;
 Sun, 30 Dec 2018 10:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j1iCa5yHQKIiN1YX6or79K8sF80oF0yY3QWuDmdZF8M=;
 b=BqBm1Z62SqAtzWyCiIxmCv21RXhvog2jCOf1Wodu7jSeJcg9nkYyPThfHbxMoPglp9
 /JZc3DD7gJHCYe8tvCpeDkEbJkv6F/SoZw5O7LBKJgxTr7VD5I3Z9JkNEmVaxUhT96r7
 SY37hxXC1HKnCyGGHQkN0SJoRDShgqDAcTZbvpECs0DSbKkwH0s5sAGki9k/EMZ4vYIm
 BBXW2I4oSBQyq3XOHHJEo3uyJsDWCgg+7yQO0Bo/19eU0p2PNKWMJq1imCF2ilIm0aCW
 XtqoQJTfk+ciDHu3WXC+AbuRnUj4Ov7X0afACHebdfO0SA4tjEBx3SvvyGcEW4wUZxnw
 vXQw==
X-Gm-Message-State: AA+aEWYCSfo8JPQxZdF/L0XkUIh6tLdALtZvH5LMZAhqiBFgXG+BnK2s
 zpnxmSpJiJNIdpDuBXr1670=
X-Google-Smtp-Source: AFSGD/WsY5VZGM0kM1ItWwHGmaOy2vydo2djpa0voBOmBt6g8cmMXKHthd5NxJ8OwOXE/rfl00ty4Q==
X-Received: by 2002:a50:a741:: with SMTP id h59mr28192128edc.106.1546193716767; 
 Sun, 30 Dec 2018 10:15:16 -0800 (PST)
Received: from ingrassia.epigenesys.com ([151.24.40.5])
 by smtp.gmail.com with ESMTPSA id x47sm16246058eda.91.2018.12.30.10.15.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 30 Dec 2018 10:15:16 -0800 (PST)
Date: Sun, 30 Dec 2018 19:15:05 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 0/2] Meson8b RGMII Ethernet pin fixes
Message-ID: <20181230181505.GA1690@ingrassia.epigenesys.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181230_101529_909249_5E78E757 
X-CRM114-Status: GOOD (  20.59  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sat, Dec 29, 2018 at 03:35:54PM +0100, Martin Blumenstingl wrote:
> Hi Emiliano, Hi Linus,
>
> could you please test the patch from this series on your Odroid-C1?
> I tested it on mine and Ethernet seems to be improve Ethernet transmit
> speeds greatly (at the cost of a small drop in receive performance).
>

I redo the tests described in [0] with your patches applied.
Here is what I got:

1) Start packet generator on laptop:

              | incoming traffic | outgoing traffic
=====================================================
nload (board) |     ~940 Mbps    |       0 Mbps
-----------------------------------------------------
nload (laptop)|       0 Mbps     |     ~940 Mbps
=====================================================

2) Start packet generator on board:

              | incoming traffic  | outgoing traffic
==============+===================+==================
nload (board) |     ~460 Mbps     |     ~256 Mbps
--------------+-------------------+------------------
nload (laptop)|     ~256 Mbps     |     ~940 Mbps
=====================================================

3) Stop packet generator on laptop:

              | incoming traffic | outgoing traffic
=====================================================
nload (board) |       0 Mbps     |    ~940 Mbps
-----------------------------------------------------
nload (laptop)|       ~940 Mbps  |      0 Mbps
=====================================================

4) Restart packet generator on laptop:

              | incoming traffic  | outgoing traffic
==============+===================+==================
nload (board) |     ~460 Mbps     |     ~256 Mbps
--------------+-------------------+------------------
nload (laptop)|     ~256 Mbps     |     ~940 Mbps
=====================================================

So, now the board does not drop the entire incoming traffic while
transmitting at full speed, but gently decreases the transmit rate
as one would expect.
Sure it's not working as full-duplex yet, but this is a huge step. Good catch!

Just a question about the patch 1/2: why you didn't remove the variables
"eth_txd0_1_pins" and "eth_txd1_1_pins" in "pinctrl-meson8b" driver?

Apart from this doubt, your patch is fine for me.

Tested-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Reviewed-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

Regards,

Emiliano

[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009397.html
>
> Changes since v2 at [1]:
> - Thanks to Jianxin for providing the documentation for the two missing
>   bits in pin mux register 7
> - added a patch to add the missing eth_rxd2 and eth_rxd3 pin groups to
>   the pinctrl-meson8b driver
> - update the meson8.dtsi patch to include the eth_rxd2 and eth_rxd3 pin
>   groups on top of the previous change which only removed eth_txd0_1
>   and eth_txd1_1 (including the patch description)
> - update subject of the cover-letter and the meson8b.dtsi patch
>
>
> Changes since v1 at [0]:
> - rebased so it applies on top of "ARM: dts: meson: meson8b: add the CPU
>   OPP tables" which will be part of v4.20-rc1 once the arm-soc tree is
>   merged into mainline
> - updated patch description with more details
>
>
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-May/007274.html
> [1] https://patchwork.kernel.org/cover/10744709/
>
>
> Martin Blumenstingl (2):
>   pinctrl: meson: meson8b: add the eth_rxd2 and eth_rxd3 pins
>   ARM: dts: meson8b: fix the Ethernet data line signals in
>     eth_rgmii_pins
>
>  arch/arm/boot/dts/meson8b.dtsi          | 6 +++---
>  drivers/pinctrl/meson/pinctrl-meson8b.c | 6 +++++-
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> --
> 2.20.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
