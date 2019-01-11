Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AF7C43612
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 14:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DFE21848
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 14:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VYkoXIh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64DFE21848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RillHU6FGV36PuhCCGaVGgegG1CjdFLy4YB2Yp/ek8=; b=VYkoXIh75Ynzch
	ZpFxZaVPfCgmD9IdoEdTZs8ODtRfbX3DB9C2r4PS6pbAVpcsLZJ3nfZn7EBoenF61bd4MjpA+znCY
	JZ8ogwstPCWt3upPEvP7dL+xdliPECtoYO+sJB21N3ld6e76tg9CAJjrawPBccw5xsb759kRBTUyh
	reHYXU+aeezmX5yTDmsVA2fSQwt1Jj3O5wubHy36pMdVsRXPynA321dTZORHtSZGChUXqmjBllpjn
	aL99ZKzCNQ/VE9BZaKWyGu+EE13hpsA0nsTeUWftDUbprQX85vr+owWcUr/+Wgkon9c32Gwv2Q2Et
	emRR1SI7YaYTkJvNJtBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghxyg-0004HC-6g; Fri, 11 Jan 2019 14:40:06 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghxyd-0003o6-V5
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 14:40:05 +0000
Received: by mail-oi1-f193.google.com with SMTP id u18so12343865oie.10
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 06:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5AgKfumJTmCJZDmWpituxPz/5EgWlc5vUnvJmAPLvks=;
 b=MzhK+sKdm3zTfdeGSVecEfi3oDRlsb6UHCo243whQB3BxdZ+MNPOvoml5t4ZG8AXiP
 ehyEH6pBHVw+ThqZArExa0UvM6aMcM8r/R/0bo88jOtb043zUlqNIllmoQJpSG+T7ygq
 N2K0MH3EaKSdBJ5OWDW9jNsfMKMsmuTBeSTixCGeZkT5kXpm7tMiov2PkSJO/6ku8PIo
 8EbOjIxdQhLFMnLc2LuhMHhRMpwZDxyRsH7YGmEHu1XFr9EJYCkLsfGAB2oFiZBy+CRl
 fn4Ej381OPCI8g8i+men/q8JtW2TBLkjbJye1vR+6THq7RFG3yF0oKPvqYSk6SwMPjBt
 +/bA==
X-Gm-Message-State: AJcUukf31cU07xk3KjGAWSgQ7fgxr0WLPLGcKQc7biYmZ/ESaGz6tuFq
 FsC/yVvaT46w31Otw90SdA==
X-Google-Smtp-Source: ALg8bN4bJFgaKoQ7VYgBSgmYkRY3W7YKzzvZdns3BLB2bWN6DX1G1CMUvo4gxJZJ3WjHk8MKSlD0Tg==
X-Received: by 2002:aca:5205:: with SMTP id g5mr9644565oib.149.1547217602122; 
 Fri, 11 Jan 2019 06:40:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k130sm36530903oia.47.2019.01.11.06.40.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 06:40:01 -0800 (PST)
Date: Fri, 11 Jan 2019 08:40:01 -0600
From: Rob Herring <robh@kernel.org>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add vendor prefix for "GlobalTop
 Technology, Inc."
Message-ID: <20190111144001.GA28255@bogus>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <1545994235-8309-2-git-send-email-lollivier@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1545994235-8309-2-git-send-email-lollivier@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_064004_031222_099C2389 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 28, 2018 at 11:50:32AM +0100, Loys Ollivier wrote:
> Add globaltop vendor definition.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4b1a2a8fcc16..a9214767afa8 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -153,6 +153,7 @@ goodix	Shenzhen Huiding Technology Co., Ltd.
>  google	Google, Inc.
>  grinn	Grinn
>  grmn	Garmin Limited
> +globaltop	GlobalTop Technology, Inc.

Alphabetical order please.

>  gumstix	Gumstix, Inc.
>  gw	Gateworks Corporation
>  hannstar	HannStar Display Corporation
> -- 
> 2.7.4
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
