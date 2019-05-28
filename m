Return-Path: <SRS0=WX2S=T4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88ADC04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 08:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C92F208CB
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2019 08:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qN8RA13K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jX13nGRP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C92F208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hIRgvwSx4tIyvCC3ghukwumYc6OeoUtA4C5B+77subE=; b=qN8RA13KVrLpkx
	1RbL3Jx/kwxNP52WdhJkTYzr5/BGe3p6JnjhSBLbfBffCQSOYz/6haGvaCVfcCIlnNkudGBc3C5/U
	lkcUA5phbx/AYMckPlKi5oaKMpYmxZKH0iWWMfRM3tzNYfcU3awmXuppca9rYWZkosl2CW282DNsO
	mcTMaD4kG33S1DG3WGKudH6j899/xIyYQwGerWOawdyoBMo+lO6X7oMXepb9ZFylhFd0d4PdlEaiD
	y2D4kV6ewHtso/Hy7r34VzoI3onlrT+2tdpceoZ0oORqtwK5wx2IobuuVPAFlSuiuPRAHSUByzMZm
	bJKCezO08+SZgxU1d97Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVXs2-0001Jh-DO; Tue, 28 May 2019 08:54:10 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVXrf-0000o1-MG
 for linux-amlogic@lists.infradead.org; Tue, 28 May 2019 08:53:49 +0000
Received: by mail-vs1-xe41.google.com with SMTP id z11so12285105vsq.9
 for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2019 01:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OvPyYljb7JCOrJ33Ko5bumzGJo9yaiTXxiuXC/YYxTg=;
 b=jX13nGRPAPQI1hudE0X4kQErmhGYYfoL3HEp017zRgTTQqSLqgi4ZQek3ZoSFMxBdU
 /yRFxKtEShA+2g/SGMrieED29wDcQdd5BGbasxRNkqmWV2wIz0TZjWrcjM7Heh2wMW+W
 c3MKVnGHejU3lxN+pyIMTgv8eooombwckW0jjXenNUvhhB+yjrB+lCC6pS8zZWZk72JR
 Pw77jREudMFS/UiJoYxJWClw3K5NX+ITUS4mvilMNIbIlySv9oEL1B2rkoUjaYJdxRS2
 sfpXJ9cOPN61iuyASFipfhH5HVnpqd87PoQrboLqB8p++c//5p0Vzt3LgQsXLF6Sxpv8
 2YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OvPyYljb7JCOrJ33Ko5bumzGJo9yaiTXxiuXC/YYxTg=;
 b=bISXSQ3XXU/SGp1/YUO08WO/aTttCYE9xcwbArkovod5TvvBrMzE31F2OPjXKvlQX2
 HfbtdkaU55sP43DWNHu7roeUhUHJJ7PHM4zIoeKFkf8IGqq+272cakhLzTZC6z+qL1nY
 6tvpR0qnzbMAnhO4m7cG4TByplQ+6oJzEMaMnw2OXQWaFEp9bVblpxMbzmjHSDI9c7Pf
 MsAfWh7ZGVgqnnyUMJLqiP2ZK0K8uNoqEnV+HLtjAxh1IKcgeUfFqIeBxWaiduVC9LsT
 17M4FT7yDD1HMuIDfFkR5xQHc563VsnCZ9FJph3gT62FnZLOQHwlvakMi57f77ss3dg/
 Ryyg==
X-Gm-Message-State: APjAAAUgH81TfvS8SBUdaDVZNAKk4U2kL5iTvAh2av171yOpssDsuM2V
 P/z5aafL/l0mbIH5CV32hfEtAKIBQ8XteSxlarrBYw==
X-Google-Smtp-Source: APXvYqxxu7B75fGza2d3hxaqgN1ayByiKBL1TJG814+ezkFuh/mzNJ5XOp9JlYbecqc4TcFNqA/1BrHCMWkm2vwSEVk=
X-Received: by 2002:a67:7c58:: with SMTP id x85mr37940337vsc.191.1559033626532; 
 Tue, 28 May 2019 01:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190527124307.32075-1-narmstrong@baylibre.com>
 <20190527124307.32075-2-narmstrong@baylibre.com>
In-Reply-To: <20190527124307.32075-2-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 May 2019 10:53:10 +0200
Message-ID: <CAPDyKFrDKkDO383buUzkWw_4wX15pNvexbHSvJAxHc-na4PSKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: meson-gx: add dram-access-quirk
 property
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_015347_818507_EC24EA24 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: DTML <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 27 May 2019 at 14:43, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic G12A SoC family, (only) the SDIO controller has a bug which
> makes any DRAM access from the MMC controller fail.
>
> Add the amlogic,dram-access-quirk property so signal this particular
> controller has this bug and needs a quirk to work properly.
>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> index 13e70409e8ac..ccc5358db131 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> @@ -22,6 +22,10 @@ Required properties:
>    clock rate requested by the MMC core.
>  - resets     : phandle of the internal reset line
>
> +Optional properties:
> +- amlogic,dram-access-quirk: set when controller's internal DMA engine cannot access the
> +  DRAM memory, like on the G12A dedicated SDIO controller.
> +
>  Example:
>
>         sd_emmc_a: mmc@70000 {
> --
> 2.21.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
