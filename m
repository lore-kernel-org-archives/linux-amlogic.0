Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C637AC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 03:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9828E20B1F
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 03:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m8oulwyY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z1LgyUti"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9828E20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ug0xf+SX5JF4ervCzhwTqnUZ5/l1iJRmt/xXNpqdOA=; b=m8oulwyYfj/9RP
	IMvCQUeZWFr6JvLk6ysPtLOy/i4QbobvFoIx6wwba/ODXSpURJllFarG++tak24to+xhG3tze5zo9
	6J3tIDyEMuoX2+38DxaQGtt/vFVGfDLp5e2hylw6onn5l9ZYYDEzwMjo8EhFq7AMIZVB/aqlDqzun
	gixbEAHHfQBeI4jfLuqTy2N5311fhreeUoORgTdFCsWCBPrxbCVt1hJuQtY5300oW4cxD2i6SlVF4
	XrkYuQ7iCmWNyYdQ8n+ZwkA2PYHqe8aHWr9IdD+N5d/tu5HZJK5SNZaxZ0/r79MuiA9fONygnLOqX
	74Dc7bQ0J7mPM+3yCkFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdnwv-0005lT-8u; Thu, 20 Jun 2019 03:41:21 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdnwi-0005bz-Tc
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 03:41:10 +0000
Received: by mail-pg1-x542.google.com with SMTP id f21so812367pgi.3
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Jun 2019 20:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=yXSKF3KCooCH6IcstSdp1nFOTcORw0aEc+AxKmLDy7Q=;
 b=z1LgyUtip5NsTjNacdDhfzm+Ed6a07P8iqtB9CkZy7wdwCNLokZLIx1qf3aZs7jPAG
 nOh6YKx/Z5pcYp7y259rMlClr9ZC+be8UUIpLARGpIgiObtp3gTY7/biPfl9XSCdwr6s
 esKA8N81cqVr0Ep7GVeSZUWkMSsWpVMaJDjdfFltMhvLKTSM9HMgTSruQZzIZNODM8Jf
 cscCRC9wc2valBsWioyVDgHelvyjxkN+jpsWl1itwjIBlDJkJfqje+lshczT9n13RMpI
 LGBYc00TMUJvGqRz4a6CZRHawT4XaUQ105jrvvZL6E8QvcXN3WMHzrVBXbjLQwcSjMLn
 eX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yXSKF3KCooCH6IcstSdp1nFOTcORw0aEc+AxKmLDy7Q=;
 b=jhVQ9cuguUDpTyZEjbd67VoZjVUuRkwHP8NMuCy3rzGgzm5/rhgaRVkyLYD54Y2khz
 1csD1atxvY90kmMS8Co9cW37nXAaPPe+BsWbCZag5CWdBne7Sbp6ghS7T0VNCDCS5gRX
 Rhui5+5wSLvsq6nnn7tgA5fLoSZRQreVSr2fzdwTC4w9C898lvF4VyYONwSZRUxvN34z
 dX+GhgKjNZN7Xj2pSv8VRy4yCKj/PBj8sF0HJzR68caTPIRAg9Bg9gxl7SvgGDwKlWEF
 g4Tm3uHgIDnwV8uE1DyOu06bpgIZtkPG/tMZcul3d1wo3KuqLcDh0fC6CIcgzFQtWkZ8
 MEuw==
X-Gm-Message-State: APjAAAV4PJhs41NIenIbJOua0wrU6eszRNTG0Ll3JiH4h4NdFossyAcb
 e+vzxfoPIEj0pItK+bfkWwNO5Q==
X-Google-Smtp-Source: APXvYqwic/TSqTqVCd7HklEgT+a+qLMKSeZd98mTFCizUJYVZby3+cXpM1Hiwh7Iqam7m5933+GUjQ==
X-Received: by 2002:a17:90a:cb01:: with SMTP id z1mr724373pjt.93.1561002067810; 
 Wed, 19 Jun 2019 20:41:07 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ec6a:e4cb:28b2:e322])
 by smtp.googlemail.com with ESMTPSA id h6sm5198434pjs.2.2019.06.19.20.41.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 20:41:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: g12a/g12b: add the Ethernet PHY GPIO
 IRQs
In-Reply-To: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
References: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
Date: Wed, 19 Jun 2019 20:41:06 -0700
Message-ID: <7hd0j8j54d.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_204109_070396_BD9A5125 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Avoid polling of the PHY status by passing the Ethernet PHY's GPIO
> interrupt line to the PHY node.
>
> I tested this successfully on my X96 Max, but I don't have an Odroid-N2
> to test it there. The reset and interrupt GPIO part of the schematics
> seems to be identical for both boards (and probably other "reference
> design" based boards as well).
>
> This depends on my other series "Ethernet PHY reset GPIO updates for
> Amlogic SoCs" from [0]
>
>
> Changes since v1 at [1]:
> - added Neil's Tested/Acked-by (thank you!)
> - rebased on top of v3 of my other series
> - updated cover-letter since the GPIO interrupt controller support
>   is now merged so it's not a dependency anymore

Queued for v5.3,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
