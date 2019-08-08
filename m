Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3CAC0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 14:23:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CC52171F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 14:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6BZpjy0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh3Ota7Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70CC52171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSsTf43NbqbXCt8sh7QFKa7yW62UswjuM8rJISht8pI=; b=j6BZpjy0mXr3zt
	5yMQvDFW4VN/ZwIrhkRae1OxPoTaxfoR7cePtFLFUJLghy5qd33JvACOqgSgJ/OYMYRttADGbRq8x
	HGPqvMZ9tmufQYgIbrz2hLwCVS9LJW5nyInwR319S2cDqTBZmVcbfg51GY6S9p0mA6psVJM4EsiHX
	aQZmJLoCkJLRZDyP0XXoY1sAbLOYLYC50NuSexE4WaiIqoyS+zIZzQxOuY2sdIQinFtPwTiR7Zckd
	ZsFCOh5ySOe5rQoEXqrD5I9R6tYOnQyJcngbjPqVvWFIw0i5klelteciWGxcUfecpNr4sPcUR99nT
	V4kDH0a2LS3mEjsrN5VQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvjJg-0003tz-6r; Thu, 08 Aug 2019 14:22:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvjJc-0003t9-Ry
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 14:22:54 +0000
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAAC921880
 for <linux-amlogic@lists.infradead.org>; Thu,  8 Aug 2019 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565274172;
 bh=tmkfuAM/VbXi3dTJBiWU5XaSo7kk4pDqqmiZFl+44xQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Kh3Ota7Qb3KPespHWImHXoScmyw6mRjvw3gzIxKQaNgkH4K00LfA8hjq+Erq1NDhu
 HeYQg36E2zSdaPvivUShUYkHJ2g7lNAU77X1wjpmReEMRLqvYo8m0DWM3uOQf5n/1J
 KUgLP8ZJBYXrm3NSGOPHgk89AnAy/978NYu35e4c=
Received: by mail-qt1-f176.google.com with SMTP id r6so88070219qtt.0
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 07:22:51 -0700 (PDT)
X-Gm-Message-State: APjAAAVERjU3IX0D1WNp8QtTar0lt9a+qnH9R9UQ9IcX+qdfHCE6h8NB
 dTK+fpyuLZAQuQuqzbDUICdgn8bAGUr8tq2DaQ==
X-Google-Smtp-Source: APXvYqwuFDlDdhRjgs2OPhZLe+JL3U+8wBZdlI8Nkb5wYrKcFge+RCokmdszImo6kO7eQS5L3w25UCHbyuo3F8pjpiw=
X-Received: by 2002:a0c:b786:: with SMTP id l6mr13538682qve.148.1565274171003; 
 Thu, 08 Aug 2019 07:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085522.21950-1-narmstrong@baylibre.com>
 <20190808085522.21950-3-narmstrong@baylibre.com>
In-Reply-To: <20190808085522.21950-3-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 8 Aug 2019 08:22:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgjjPzb4uWaJ-M=11-LRjByyRcHmot6iRyK-dXMOnkxg@mail.gmail.com>
Message-ID: <CAL_JsqJgjjPzb4uWaJ-M=11-LRjByyRcHmot6iRyK-dXMOnkxg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: amlogic,meson-vpu: convert
 to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_072253_726378_875AB926 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 8, 2019 at 2:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Display Controller over to YAML schemas.
>
> The original example has a leftover "dmc" memory cell, that has been
> removed in the yaml rewrite.
>
> The port connection table has been dropped in favor of a description
> of each port.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/display/amlogic,meson-vpu.txt    | 121 ----------------
>  .../bindings/display/amlogic,meson-vpu.yaml   | 137 ++++++++++++++++++
>  2 files changed, 137 insertions(+), 121 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
