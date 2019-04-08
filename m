Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252DAC10F13
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 17:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED65C2084F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 17:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNSGLCKJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhdP6jdQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED65C2084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIzm9SNvY/H1U5xnECXtRveRf2WB1F7dpHfyS57fTzg=; b=NNSGLCKJQ6fObR
	ZS/P0J1W0cAAe85CYa8nb0SY32pJlfiI1PiqXDLPekAwhm9UP3gktoGT/xN6EGQaBbzECvHTchgjU
	iUL35W5XJK1Hw61CrdTyxi4rn034pTUcYMd4HvJmn5aNpJh5mF4NYWUH7Px+J0ybsBVbZxQ4re0+6
	yJJIIA4WVxGR/PMyVtliEtBUDcJIXvyz37ZQFCpXNRt+jRqgkJgsmufWWaVLAQsneDcKm6tNDH4TE
	9R0hBUxii6DyUGnz7y4sgqXpv4k+6F+B7c4+c34PC5xUs9oBddKmeznRp0luwaA/VJghuilk5Tk4A
	2wfUxQa050b+pxnvj1PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDYKl-0000YD-6P; Mon, 08 Apr 2019 17:45:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDYKh-0000XK-NI; Mon, 08 Apr 2019 17:45:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id a184so324469wma.2;
 Mon, 08 Apr 2019 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GRUNV5oGcXckRtLhTDyTVRFJWAPelDcxnZ9k23CSt7w=;
 b=fhdP6jdQ4C2X6LZ91q5BzQf1AYXJxZeAQbR/GnwF3ObwiVVzKvc8X5D6oMmjYHL0lK
 uxQK4ezeSw8hKZYWnrlN8W+fPAcyU9qDlz1+iNrRbvO/Vd30+LHnWFMVPXZDkUqTfbkj
 v4d0Skf3pbKbMbQOJ3Pwz760z42OwoaZPQFGlqJcae9DmvKLnvLwpNr8njsy0ask632q
 ZXNCvM/c3JdZ2FFRWDxvOxW/UiVcAiPgBoXDfqHXcbDUUTupwPomZk1DqHXHYF1btlhh
 E3CaQYpStHMOB2iGCnDJRh+/Z/n7zk+J60OGwijPbNpx8/FQ8u1TU9J0OEpgzYcw+66S
 yhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GRUNV5oGcXckRtLhTDyTVRFJWAPelDcxnZ9k23CSt7w=;
 b=rvzaQvO4FbWzNMdDMEln3fnAw0rklDJDUgxZViO86DxyldlfOvili9AtfExakBG+hU
 Tjyw341yLNL7ycc/r/rxy5ZCfMrib/ZZA+BhkR9NGBw179tpNkxw/BPpBKs92kjE2dfh
 idRU4bweE3oH2UDLOVLTnZhuLgLKs0W4UtxcDjpRnXNXIF2zTkY5tbLRGdPqcwhAxo1U
 rlWU3f7SPfnbeyBxFNJgrb8mdfqKHskwUrMlfyi/TVc7kG3Zophwi5KUh1gV+JqIl9d6
 Mhw8IiCHtImZ8W8W8v+BAkbj4m80efVmiqzKUV36TP22sZitKDqbBzB1EgzO+XFWuBsH
 xq1Q==
X-Gm-Message-State: APjAAAUJzAG2v2imZ+iAGEa23raAJWUTUCemAvmTqjGA/f5AWbyyIaYP
 oXGs31dFqYcoSHZlejVbwHTMDldL
X-Google-Smtp-Source: APXvYqwJaV55JFkra/rNQOH6nc2BpIM7/I0dndyXv4LagrDxJF3S8zhS8O0FGDpr7VQBZHEJX7xRhg==
X-Received: by 2002:a1c:6309:: with SMTP id x9mr18361258wmb.101.1554745521505; 
 Mon, 08 Apr 2019 10:45:21 -0700 (PDT)
Received: from ?IPv6:2003:ea:8bde:d800:1488:bc0a:4c8c:6b35?
 (p200300EA8BDED8001488BC0A4C8C6B35.dip0.t-ipconnect.de.
 [2003:ea:8bde:d800:1488:bc0a:4c8c:6b35])
 by smtp.googlemail.com with ESMTPSA id f1sm27840379wrt.87.2019.04.08.10.45.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 10:45:20 -0700 (PDT)
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
To: Andrew Lunn <andrew@lunn.ch>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
 <20190407221312.GA14347@lunn.ch>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <bc5c192e-78ce-89b1-eeae-541836f5f0fb@gmail.com>
Date: Mon, 8 Apr 2019 19:45:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190407221312.GA14347@lunn.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_104523_780917_A72EC89A 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 08.04.2019 00:13, Andrew Lunn wrote:
> On Sun, Apr 07, 2019 at 11:57:13AM +0200, Heiner Kallweit wrote:
>> Recently genphy_read_abilities() has been added that dynamically detects
>> clause 22 PHY abilities. I *think* this detection should work with all
>> supported PHY's, at least for the ones with basic features sets, i.e.
>> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
>> features explicitly and rely on phylib feature detection.
> 
> Hi Heiner
> 
Hi Andrew,

> We could make this a two step process, to avoid regressions. For one
> cycle compare genphy_read_abilities() against .features and raise a
> WARN_ON() if they differ. And keep using the .features value.
> 
in general this is a good idea. I say in general because this would fail
with several, if not most GBit PHY's. Reason is that the hardcoded
features currently pretend we're supporting 1000BT/Half, whilst several
PHY's don't support this mode. 1000BT/Half has been specified but never
really been used. If we see it from this angle, the series is actually
a fix. The feature detection uses very basic C22 registers/bits,
therefore I consider the risk of breaking something to be relatively low.
And just in case we have the rc phase to fix support for a broken PHY.

Splitting the series and waiting for a Tested-by, as proposed by Richard,
may be problematic because most PHY drivers don't have a dedicated
maintainer, and we lack the hardware to test.

> Then a release late, complete the swap removing .features and the
> WARN_ON.
> 
> 	Andrew
> .
> 
Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
