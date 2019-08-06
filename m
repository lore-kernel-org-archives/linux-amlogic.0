Return-Path: <SRS0=TmCu=WC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628E7C433FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 15:16:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F50216B7
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2019 15:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gSKoHCbs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cScU+ROG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F50216B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+7+GR39sLRtCESSBtEXxIr1ubXxcWlYz/Yee2z0u2c=; b=gSKoHCbsTiC++O
	J9Z3h6lSqeDcmU+lNbYmovR6Ss5cL87DD6HoWaMoid4YzCr644znkk8mFmTp/5nzz2F/VRTRxDlTo
	A/4JwHUtWI7pcmG2jWaqiO5P4ClD4rcoZMMvP8vSySHVePNUuLLJ4BLyfZ9SAr1USeQLV3VEqhJjI
	uphdj2ElSEYA77GaGag/2cnr7Wgf9zNTtiA6DhVBu1A26QMpHCyqaNNLlxZBKBSNHw+f8f334umS0
	TC0oINPlqrR9fi8N/dorCwJOVUDckNROGyOErt2dJS/e4TD6hP9wu0i5/w1negeiqZFoaVkWkMRXx
	lqhPsBCnVFKoLmTIctfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv1Bw-0004NB-Mo; Tue, 06 Aug 2019 15:16:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1Bu-0004Mm-1a; Tue, 06 Aug 2019 15:15:59 +0000
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97FC820717;
 Tue,  6 Aug 2019 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565104557;
 bh=la0HnOemoXK5fpvWjp+yCiuvCkWWSLx12p8REZ1hLrc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cScU+ROGIiEoPjPJtTRdXG1cbQsMMpzEBSty6kfgERiB6umRY2L+C2ht5GwKKeCdJ
 nf0igOibxERc7xRV173c1Dp8A004bt+yeTKLrOFqRSGcUO70GxzHw5vhMW517vqGh3
 exHqFJOsZ4QKxPe/HxRcIXgWmdcw20oZH+8I7bEQ=
Received: by mail-qk1-f174.google.com with SMTP id w190so63143573qkc.6;
 Tue, 06 Aug 2019 08:15:57 -0700 (PDT)
X-Gm-Message-State: APjAAAXUN2AcXZNq3o0WGfr4CeiyV0xwbir+DEOIxyFNynqYQ5y3VYk/
 FswC6xz8OQPzSDm4+uwRwZiri7jtUKWZ9Q6cPg==
X-Google-Smtp-Source: APXvYqwLPJFWVImQ45weKYeyNJR2eA5NTRfK2u/H55qjIL0tD0cxfdGp8MnhGn/VAZvOKrsEobtM9NSgRSK3rhzUNug=
X-Received: by 2002:a37:a010:: with SMTP id j16mr3781144qke.152.1565104556857; 
 Tue, 06 Aug 2019 08:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190806125041.16105-1-narmstrong@baylibre.com>
 <20190806125041.16105-3-narmstrong@baylibre.com>
In-Reply-To: <20190806125041.16105-3-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 6 Aug 2019 09:15:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKnzNMittFbvmz+ELu9UVMkmPmFoVT8ydWOYtCST+MwVA@mail.gmail.com>
Message-ID: <CAL_JsqKnzNMittFbvmz+ELu9UVMkmPmFoVT8ydWOYtCST+MwVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: net: meson-dwmac: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_081558_107937_F0009017 
X-CRM114-Status: GOOD (  12.32  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Aug 6, 2019 at 6:50 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Synopsys DWMAC Glue for Amlogic SoCs over to a YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 113 ++++++++++++++++++
>  .../devicetree/bindings/net/meson-dwmac.txt   |  71 -----------
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   5 +
>  3 files changed, 118 insertions(+), 71 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/meson-dwmac.txt

I don't love the compatible schema with 'additionalItems: true' and
contains, but I guess it is what it is. I'm hopeful schemas help limit
how many variations we end up with.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
