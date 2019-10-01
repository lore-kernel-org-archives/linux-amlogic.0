Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E17ECE587
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 13:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B305221906
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 13:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aRbM/K7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B305221906
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9SKvJlfTXkg5h0QMHm88ZzFPH7Qp0Q2eGbuexu83/o=; b=aRbM/K7MteyC/w
	sNMP0Te88aIZgx8PbCKGXGVfXKxwX4F/TqFRw76YXI7x38rrNi+ah09UrSR00zripBaMhbh9iTUjT
	RMabV0MOIkAH6FHOaWvadwnX0UmgVFeA7Lpvoh8qfmO22vx6qTuNNYvJtTz/WckVhVXivqTR6YyDd
	oFKcr9kWfoOWyyoh6520ziCED6PfHIkY95hi35T3BhQES7VL1QxdunGrEx1vPfLKePQbH5tdOyTI8
	MYWMTKcr9Q5GSu9K5zS4IaiqsZHl/dqomM74eSiORbV++auZLdHp8V/P2THc8Rbad/Vu0G0WaV/kq
	2x5jAWAPeYfdb/gMHY6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFIVI-0008Vu-UF; Tue, 01 Oct 2019 13:47:48 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFIVG-0008Uq-O7; Tue, 01 Oct 2019 13:47:47 +0000
Received: by mail-oi1-f196.google.com with SMTP id w6so14410298oie.11;
 Tue, 01 Oct 2019 06:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rEDnc9Jd/28M1ohLSPCRWsF0EEAGDKVCbMJuC0W7puU=;
 b=SQpziCBm0h55jKEIJlkGzrEoHYqZYVRkaGBdBZYifhDw/795xIZ2e7btiMHT3LEDVC
 5P4sbDZPzprltdcou0Rs86vSvAFC73FwfQc9vooXSdbdfTm7COYRtWFGJPgMt++h2+9a
 UTGhTHsRZ+NIAn2hf0trdAteTDob73zLyUIzWNudRfH9rnkN57tzENfpbOGtGc5F0Cu4
 qhGAVrKQ6Gmrd2du4fqKO388kUstxvFIEgGDULVcpvq9BZyYy3qNKMHWuN8hTSwjMuL/
 +dc9Ku4QfWgY9nonKzOT6LnVnVRMm639f2/pSa28Xdb6gVpEL4MnUgBEBsAFs6n7QbSV
 oQYg==
X-Gm-Message-State: APjAAAVJWBRoWKFREL8poYqB740Ze1tEgviYZ7a18bBDltLZx2txhqyp
 RvqDpL3qHHzIfFes5OYAZQ==
X-Google-Smtp-Source: APXvYqw+KmPmFzmwX23fwaUZyE2kdDvGO96W7ayIpwSq39QK5BvLEHskSHj/M4RX2RX1E5kPaWkipA==
X-Received: by 2002:aca:5ad7:: with SMTP id o206mr3927590oib.59.1569937665296; 
 Tue, 01 Oct 2019 06:47:45 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o184sm5305824oia.28.2019.10.01.06.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 06:47:44 -0700 (PDT)
Date: Tue, 1 Oct 2019 08:47:44 -0500
From: Rob Herring <robh@kernel.org>
To: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: add bindings for the Meson-A1
 SoC Reset Controller
Message-ID: <20191001134744.GA28989@bogus>
References: <1569738255-3941-1-git-send-email-xingyu.chen@amlogic.com>
 <1569738255-3941-3-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569738255-3941-3-git-send-email-xingyu.chen@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_064746_784427_BC249345 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 29 Sep 2019 14:24:14 +0800, Xingyu Chen wrote:
> Add DT bindings for the Meson-A1 SoC Reset Controller include file,
> and also slightly update documentation.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>  .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>  include/dt-bindings/reset/amlogic,meson-a1-reset.h | 74 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
