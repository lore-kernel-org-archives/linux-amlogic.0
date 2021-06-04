Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8308C4743C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 17:20:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80676140F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 17:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80676140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vk0Q7NJbR+ss3RfdVT7cSJcEMDhNNRWkQbVrTWG4k0U=; b=pCnt7ZV4RPqrkF
	/7G93ifx3aXv76zUtF155LWf3cg/DfPb9dic0+klYiFyoc9JhxPp0Te3rAgGCgQqmnGaaVlYK+o6n
	6F56nMrVNFZQ5WMRz42xJ0rnKp0LQknjbibydEmsJsibNDtijzDE1VJXePchxkT6uGhyaRpbdp2wa
	sKuC5QbAdW2eGemhUSi5OeujYGxTH4bCq2jzWYWGS/gYH2lYHsV1ShLgcKrWkQGhWQQvzyTR0uTGH
	2Q7MtEHvczx+RoNCYx+QcYQauLfFTAvY4VBnI7H9JMlHzD0LaHw+/lpDBbvBdhJWfhlyLeIzaZVSX
	77TkM923PrznlSFHzGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpDUF-00EdFm-Qu; Fri, 04 Jun 2021 17:19:59 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpDUA-00EdBh-6B; Fri, 04 Jun 2021 17:19:58 +0000
Received: by mail-ej1-f47.google.com with SMTP id ce15so15624327ejb.4;
 Fri, 04 Jun 2021 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aV8VFwDqQyLM7O/HC0yXgAxy4pRZKgMLngJbx9RyuLw=;
 b=r0PFQO3W+KWBaNQd9bdmLdmneEcX0chXaML3BDsrowJ2hvRJ0KdPRAuw7blwxP/6lM
 nwme2xV9y2H/tmYu33xcBcmrDVvaFkt6hCFm90AlnTOvEScyVVz1+Q5HMB2g25p0zKbi
 l7mzBvLH/5tz6TBtsgvLHcdXtU8ADcWXoK6ekTlcc4XhfFuRiVq/XbN53NwVD6pjJLB6
 xmLF2He5kAEwqrS4Zpq4NSEl8dXj2ppmntpg9mD5h32AWrxc+h2aLTqrm2CcaaYdsA3m
 N3TgjGIbybuaRxsIM7giWe2zn/59EHbaW/wk9G8I6JR05zEH5n7gtmXqiGl48SWPYF2R
 4sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aV8VFwDqQyLM7O/HC0yXgAxy4pRZKgMLngJbx9RyuLw=;
 b=UPo5s2ZTTdc2lmTiQ8eD/L2QdsGpgolCwgAX32YIqbzvNHIymzbHNDcsYVeOn+DPc+
 ZsB8GrW6LwPCUNuBK+C/hxGOz2+8LyO+V4MBbDYyJ2zkVX4VIRZ4G8H06/9Zi7SgSpwv
 wf2wyyICRDLvDISsmERMFN+KEKMzSK8YlqnNkD80KCoHzDiK5ZVyj19G4PioUtpOSX6Z
 AE3t6dBcbdnmaYaK7Q3fP4wfWCaQ3tre3vNNN2Gvhv7OTcK9HCc3niFAUDRCFPDkzHj8
 q7pYnVXtRsXKeFNrOUUloq0GFy8VzXD9tQs5KCrR2UT/UG49nz7+u2/Vt75/vU9A9/Bq
 9FUQ==
X-Gm-Message-State: AOAM5312tP+JmaeCb+PgU0JypajDdplxSFO4KQLfTjC6ZgecL4CfbXwX
 iOTpH4XB5LYxzP9iInfxq3xv/rfmwENMH2KAnRY=
X-Google-Smtp-Source: ABdhPJzmfa3gSEAJuAKzn67r0Jj59tYYouwbp4UpcgEO7HHUdbgQpZjEUqVT3vW5n6TSpxJr7orxiv4DyldBSQSjhKg=
X-Received: by 2002:a17:907:2d8d:: with SMTP id
 gt13mr5324328ejc.162.1622827130788; 
 Fri, 04 Jun 2021 10:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20210524103733.554878-1-martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 4 Jun 2021 19:18:40 +0200
Message-ID: <CAFBinCDn_0TeyLG9b9uB+4-4PdeNXgja11wf2CGcQ99tUNjkyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] clk: meson: rounding for fast clocks on 32-bit SoCs
To: sboyd@kernel.org, jbrunet@baylibre.com
Cc: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com,
 khilman@baylibre.com, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_101954_276350_FF4A259E 
X-CRM114-Status: GOOD (  21.25  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome, Hi Stephen,

On Mon, May 24, 2021 at 12:37 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> up to approx. 3GHz.
> This however causes a problem, because these rates require BIT(31) to
> be usable. Unfortunately this is not the case with clk_ops.round_rate
> on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
>
> clk_ops.determine_rate does not suffer from this limitation. It uses
> an int to signal any errors and can then take all availble 32 bits for
> the clock rate.
>
> Changes since v1 from [0]:
> - reworked the first patch so the the existing
>   divider_{ro_}round_rate_parent implementations are using the new
>   divider_{ro_}determine_rate implementations to avoid code duplication
>   (thanks Jerome for the suggestion)
> - added a patch to switch the default clk_divider_{ro_}ops to use
>   .determine_rate instead of .round_rate as suggested by Jerome
>   (thanks)
> - dropped a patch for the Meson PLL ops as these are independent from
>   the divider patches and Jerome has applied that one directly (thanks)
> - added Jerome's Reviewed-by to the meson clk-regmap patch (thanks!)
> - dropped the RFC prefix
please let me know what you think about this v2
I am asking because clk-divider is widely used, so I'd appreciate if
this gets some time in linux-next (so for example Kernel CI can test
this and report issues if there are any).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
