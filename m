Return-Path: <SRS0=b9va=SI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02651C282DA
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD67B21871
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tra3ZiAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD67B21871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KRewXX5AAXQvEObrO+bqhnf2E2YYj/pvsogAPbV2PXk=; b=Tra3ZiAcCoyYcHvaq+SvLLHIme
	qoOdQmZ/XsBAmqCOgUUBM8g2JPZJn74B3CEmcYFW12a9lDWjxYE4f+Upgt7ULtLrodXv3jpBR+d+6
	mD4IuO/HtVxP+Z+3dunk6oCTJDC8JQ+Jnbt8kkmt9p8atSEGfiFIgiEJb1JwkQK3k8sMer2Zoy0ki
	A1eNWMSbzt7uwr+AB0dV4orW1SnvT8VP5AsmuKWvxESL8tC9laz9++s5N1aZ0zPu3Locc05rfqIZs
	3rm1c+NnXfBINeO5ufcQoV5L8vWIGePCn9l1wjTLaKiEDHXZaa2kqbTAERYTe7zjf4RWTHLamhUgY
	vdkRdlMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCeTJ-00005x-8g; Sat, 06 Apr 2019 06:06:33 +0000
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCeSu-0007zW-6U; Sat, 06 Apr 2019 06:06:11 +0000
Received: by mail-pg1-f194.google.com with SMTP id k3so4194856pga.6;
 Fri, 05 Apr 2019 23:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=9w7EQ59djVMT/yra/zVaafD2a787JfvjnjqhLIF7aV4=;
 b=FkSqznf7EUmb7ViMdG1sA74ZLaL1200MqxEt2ICKjvA+Z1bzzZfh2UX8xFhH8I0B/u
 swx2F/lJvkmE2+WT6V4OwmnwtJYLwIBlrB7uj/ZDF5cf3GoFRy+mDMnt91nCA2qU2B2Y
 6j9lqlTNU9uRWlYmgHPO0q89orSeJYNE3XK3zfiOODeGjg9eqgmIWSy1RZOjmxCcPHPr
 X7r0PVuLGS4Psfqtlln1uzowQeD3RyWM/HRmjO1y3+IsYvwrNxxG0Dk1oy+2RlEtRx/d
 PK9kDso0VAsRXtXFRxgS4N0Do0zBhMZ7Xlr49S4oFwuOgXSDoHrGDGVFt+HAIhf3Irt9
 4vew==
X-Gm-Message-State: APjAAAUU9f6KFTNEhkxs1IQAOUIOzDK6e56C1YxuX3JN8hNnX0/x2H89
 JXhaZT+jLwP8FE1EyU03f+eZQc5APQ==
X-Google-Smtp-Source: APXvYqx7bRQMsiuxKhAYYZopO8h/29m6921AqiMQE52ewGPkhRyb/xhTaS9itC1tktt9KbFu+PKsVQ==
X-Received: by 2002:a63:f956:: with SMTP id q22mr5235243pgk.210.1554530767243; 
 Fri, 05 Apr 2019 23:06:07 -0700 (PDT)
Received: from localhost ([210.160.217.71])
 by smtp.gmail.com with ESMTPSA id f1sm29751400pgl.35.2019.04.05.23.06.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Apr 2019 23:06:06 -0700 (PDT)
Message-ID: <5ca841ce.1c69fb81.b2f88.e449@mx.google.com>
Date: Sat, 06 Apr 2019 01:06:04 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
References: <20190401081959.16474-1-narmstrong@baylibre.com>
 <20190401081959.16474-2-narmstrong@baylibre.com>
In-Reply-To: <20190401081959.16474-2-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_230608_541413_76C27889 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon,  1 Apr 2019 10:19:57 +0200, Neil Armstrong wrote:
> The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
> the other one is AO-CEC-A described by the current bindings.
> 
> The register interface is very close but the internal architecture
> is totally different.
> 
> The other difference is the clock source, the AO-CEC-B takes the
> "oscin", the Always-On Oscillator clock, as input and embeds a
> dual-divider clock divider to provide the precise 32768Hz base
> clock for CEC communication.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/media/meson-ao-cec.txt      | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
