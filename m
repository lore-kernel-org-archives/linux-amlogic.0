Return-Path: <SRS0=GxHq=RD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE6CC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 18:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53D2B2084D
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 18:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHrEIH1y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53D2B2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1kfazvoPG+nquRnNpCWavIG5qPWNL0IQjieoySzJ8U=; b=XHrEIH1y7vTYbZ
	P35lJJPdu43ZH4Lr9G1G3h7aKsLajI4g94GbFqPW+65YMhgAiKpGTu73zV4/MW4q9t18d+TdpIlVA
	/UjRa7JDmpvEXcbxNkhuExzABEWDZos9W7uhDS/NujEDjVN/o/1LVksGRksVd1xurnkswJQeH3+kc
	AGqE63bTg0Usv1/HkDx/JOJl0hBEUhD5e2JDEWqk1bNTnkVBkCqtlJnwL9/q8zWxXTpcd7usJis+5
	MjRVcYMdX1sa8IHeS0VsiE92d8xC5bzoHzLQCyn1xTyI4CC+E8ZaQO6W13dDoX+ln4TDDkvLDKshh
	G04PcShIFkL0gc7/QBzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzQJf-0008H4-LD; Thu, 28 Feb 2019 18:21:55 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzQJV-00085N-R6; Thu, 28 Feb 2019 18:21:47 +0000
Received: by mail-ot1-f66.google.com with SMTP id c18so18502582otl.13;
 Thu, 28 Feb 2019 10:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yXMRdphL6kd9UzYovrsbOamX2rIv9CqwoFhOUVZxEes=;
 b=g8v2ehhjAIIVHRgBk+iKhLJ3ZTAKWeETn5IYGeybq4fOo30ZLo59fCCGXt0EkDwbAZ
 aaShNlr6Ibi7vemFWEWqnsISWbkWTyEFVA5+wgkkTIEnRLhfiZcC6CCizWazgtfFHcAO
 /WUXQPDPwqvPiWpaCttfD2z5nbUt+zNXq7XEiMuU9Q1jIo5/u86eyY7tsn3U9mSRZvsh
 PqAMWWlq3LRGFuxeHapglf0XW+7CaG2i+L6BN0qRNArwJUGUL7e/A+rtYaSSczv/gmsx
 CjIKrLGRP3nExgQZXAAI3U2n8gRcoR5+oraKLf9EQfyP9tI60Pav4w+kBMAuYcaj2fBR
 Z+Xg==
X-Gm-Message-State: APjAAAUDc9H9a2OPugCw+QNNoaXN6XYV61Tq/zg0OMFvLng+4RO9v+fZ
 UzK9NJivkkmRmhRwe0HrlBVxgLM=
X-Google-Smtp-Source: APXvYqzbnWrQ9tizJSc9FPgK/tcGOpyCXP+oMmv8Uep9g92zsahWILpLF3EFkYkO/HuO4mqzziGraA==
X-Received: by 2002:a9d:4c95:: with SMTP id m21mr678987otf.43.1551378104452;
 Thu, 28 Feb 2019 10:21:44 -0800 (PST)
Received: from localhost (ip-184-203-129-180.hstntx.spcsdns.net.
 [184.203.129.180])
 by smtp.gmail.com with ESMTPSA id 124sm9186994oia.55.2019.02.28.10.21.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 10:21:43 -0800 (PST)
Date: Thu, 28 Feb 2019 12:21:41 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] dt-bindings: gpu: add bindings for the ARM Mali
 Bifrost GPU
Message-ID: <20190228182141.GA5362@bogus>
References: <20190212163838.22644-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190212163838.22644-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_102145_876542_87A73C0E 
X-CRM114-Status: GOOD (  19.47  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 05:38:38PM +0100, Neil Armstrong wrote:
> Add the bindings for the Bifrost family of ARM Mali GPUs.
> 
> The Bifrost GPU architecture is similar to the Midgard family,
> but with a different Shader Core & Execution Engine structures.
> 
> Bindings are based on the Midgard family bindings, but the inner
> architectural changes makes it a separate family needing separate
> bindings.
> 
> The Bifrost GPUs are present in a number of recent SoCs, like the
> Amlogic G12A Family, and many other vendors.
> The Amlogic vendor specific compatible is added to handle the
> specific IP integration differences and dependencies.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes since v1:
> - adding missing G31 and G52
> - fixed example
> 
>  .../bindings/gpu/arm,mali-bifrost.txt         | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> new file mode 100644
> index 000000000000..04a1d63ee578
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.txt
> @@ -0,0 +1,96 @@
> +ARM Mali Bifrost GPU
> +====================
> +
> +Required properties:
> +
> +- compatible :
> +  * Must contain one of the following:
> +    + "arm,mali-g31"
> +    + "arm,mali-g51"
> +    + "arm,mali-g52"
> +    + "arm,mali-g71"
> +    + "arm,mali-g72"
> +    + "arm,mali-g76"

Given that these flavors are all fully disoverable, we could probably 
just have 1 compatible here. It's not often that I suggest this. :)

We allowed this with vivante as all the version and feature information 
is discoverable.

> +  * which must be preceded by one of the following vendor specifics:
> +    + "amlogic,meson-g12a-mali"

We should keep these for any integration differences though.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
