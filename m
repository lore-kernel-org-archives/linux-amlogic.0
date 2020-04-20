Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE5C3A5A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 19:15:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CF5208FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 19:15:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RDxEx+It"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CF5208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KBcmoA2ffghhlzCGGgn0Vi4TqVOSlQ5hF5s9dDqqpo=; b=RDxEx+Itn5tgEx
	UjC9MzQtah14nkLRSDkrkwZ4s8W0Oih9ja99Z4iHn2tswF9nkSebgWcq2FQWQmXalicX41hkRGdIK
	yhwVN7OPOBL2ahlGDs7BwcutCS6rNZ9bPIY26Bt0V0vCg2JU3PR3COLV73FVB+yT0Ui8pyXPB5l4v
	r8qkWcDc2sIqtsjB/IGbUTbZl7MAnDgYXj3EE+MDE9L9etSO/BkeORa3cmDBGA3+Q0ldhiwgab/CM
	tTZXgneti7lykSRlbgHfbT7rY0qzPb0PkmsD5omXYEZJEoZfEzKRSDg+MBwnZHr28BLTiTTcqFNGM
	guCmzUWiUVbkqh1gCztQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQbtK-0006us-2G; Mon, 20 Apr 2020 19:15:38 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQbt7-0006fb-A4
 for linux-amlogic@lists.infradead.org; Mon, 20 Apr 2020 19:15:26 +0000
Received: by mail-ot1-f68.google.com with SMTP id 72so2697787otu.1
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2020 12:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/E8gPmAs5q5j5c6IF7Y5E5C7JdeQS0MYhxEcRGnaPxs=;
 b=tZFNHRcOh36hkcNmgYX6ngd+Bhn8rxhWLovcH+KACAgimo5XerSxdorozh6Yp+o1I4
 Cb/ozNSsFAZ1eIHng+TifXM5zvkBx6tzlN89v4y0amZ6dKX6dW7DASkjM5xaa9FiLUUX
 wW5xY/NBflUnYVm0TDP3m1yp6KzLDDd80jSPYn+Uoa4Ucn0tjoos/cVxYchFFMUy1fAA
 6k+P9UyPqinTPuqGz4ZBNMpUCxbSElNG07SPnftp+Gad0PzRgneKVejHwnDwYINBwhpm
 d0MGQJd+HwuD7tPCl96NSyAOGoHxg27Pl2Yxa6H6axI9bDdtd5tdkW6AnCtbrf7zkP8I
 lCLg==
X-Gm-Message-State: AGi0Pub+Kt0UW+YyXHJ6ugDQ/mtt1oJt66xqG++yNg4+DSlfqX2EMLZy
 VrHBKOtUikTAHNt8hL4OMw==
X-Google-Smtp-Source: APiQypK4KWrrROkD5Z7eemFuC8Y5bdOwXzixxByT6sDywR+zGy0AuTzZVDCA0mXYc0mjjBP9d9R3jA==
X-Received: by 2002:a9d:6a98:: with SMTP id l24mr10442730otq.133.1587410124253; 
 Mon, 20 Apr 2020 12:15:24 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s13sm71633oic.27.2020.04.20.12.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 12:15:23 -0700 (PDT)
Received: (nullmailer pid 3203 invoked by uid 1000);
 Mon, 20 Apr 2020 19:15:22 -0000
Date: Mon, 20 Apr 2020 14:15:22 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5] dt-bindings: gpu: mali-utgard: Add the #cooling-cells
 property
Message-ID: <20200420191522.GA3122@bogus>
References: <20200411165700.1576314-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200411165700.1576314-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_121525_374386_82E4CCF3 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, Qiang Yu <yuq825@gmail.com>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 11 Apr 2020 18:57:00 +0200, Martin Blumenstingl wrote:
> The GPU can be one of the big heat sources on a SoC. Allow the
> "#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
> the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
> overheating.
> 
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v4 at [0]:
> - Added Qiang's Reviewed-by (many thanks)
> - re-send because I missed the devicetree mailing list in v4
> 
> 
> [0] https://patchwork.kernel.org/patch/11448013/
> 
> 
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Applied, thanks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
