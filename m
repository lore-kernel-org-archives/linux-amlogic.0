Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE9DC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 16:55:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 511D8206B8
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 16:55:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hq9dmNpx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAImF8l+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 511D8206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyhy6+yybHYEJRJHVjWcQjNcm+Xxm9IJ91TuOil34AE=; b=Hq9dmNpxLLkNKk
	+cxEE2gZVCBvtU0vE5KVTH93F2Nv4rVs7mh3LR0hKtLF/Ses4vvItR+2wKyz3SfSIx+tps9VioOmb
	MVXeCre/Jb4TO2wCwki3V3suPlZJqVA+NmWs2MnbK4/4PdeE4w61N5cNPvu6FcCdPm+seXvzWFrZZ
	ESq5ROBHCcuAibAum8pA2RSFaoEhdf14mFigjPK7Cn2ccNT8zf5QMrg6F0L3OGGgBRcsjwAdWuAv8
	fNxA2qgMMGq55vKzp1FdzgQtc3EKdeKbH1ShpbnqF5rMaCg4+HAYOKMljeVmoa/PfyLDYa0tsaL9D
	kAWmrk386TYaEfKWA5Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsrsg-0005x8-C5; Wed, 31 Jul 2019 16:55:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsrsd-0005wd-DO; Wed, 31 Jul 2019 16:55:12 +0000
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DBC46208E4;
 Wed, 31 Jul 2019 16:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564592111;
 bh=JDEMB0zREMLmLrMHdC+useYBlGljcUC+uo1OriFFjzw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cAImF8l+MTX5ADdOiJKH/QneD3b8zhh4NS+aA1NAyHVfIxsAaqLYpsv7WWoB0TtwC
 2c+ItTFSXRfvJm8NLwOGBwC1tdL2l53EDDw8O2zAvqikMvMFvGEZ4ep8NiaBCipCVO
 J/gR1tv6gsEb3B4cn2OBbd6Mpyprif+nWU17dCsY=
Received: by mail-qk1-f179.google.com with SMTP id m14so24080097qka.10;
 Wed, 31 Jul 2019 09:55:10 -0700 (PDT)
X-Gm-Message-State: APjAAAUXsBgaIpHdx9QEN1BgOXBqqzIQE7/EjEpfBaIjzV2hLCQFqM82
 c/NkNJ1ZGofB+cp1P5S4Fo3HQORHmNQaB6P53A==
X-Google-Smtp-Source: APXvYqyL4gjIwP3FgCPMgYyaj67zGUm/qznjmZ2P2Af+LHVuDZ8XmiPXVioHVdq5jApCgeXPOXaATEbkx/ux3T/Eogs=
X-Received: by 2002:a37:a48e:: with SMTP id
 n136mr83759357qke.223.1564592110116; 
 Wed, 31 Jul 2019 09:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-3-narmstrong@baylibre.com>
In-Reply-To: <20190731124000.22072-3-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 31 Jul 2019 10:54:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJh0VJpRQtjEv4B9Zhw4vYPbx8spJtoR0Pmx3Mier5gjg@mail.gmail.com>
Message-ID: <CAL_JsqJh0VJpRQtjEv4B9Zhw4vYPbx8spJtoR0Pmx3Mier5gjg@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: arm: amlogic: add bindings for G12B
 based S922X SoC
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_095511_468819_6E1F5B42 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 6:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add a specific compatible for the Amlogic G12B family based S922X SoC
> to differentiate with the A311D SoC from the same family.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
