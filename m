Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE85C56202
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:54:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EFE120657
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 10:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EDZRtEYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EFE120657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l4SWrdSyI7QTOEt9v8+U3oJxe9Fa20vRSS/zAXxvzFE=; b=EDZRtEYemoMoBmk08xXLxuSPQ
	dFvi/qeaqKekzDueqOxg2/62QEOn3DTFqJ58qF3N4kkSZTvvNGQ+duQhMA4xsL5z67CRZ59hR6LIY
	veUCwQ673j99HdNozA6X62XkNlRV77xDM1Yv3ibhgwe0KMHgvlhWSm72AQ7aRGErGRWsCxFkhvpZz
	s9p+6W8hDGg6FiB4Zvp5j8CM/IIJ8Upbcb0bbl8uwgkPDQZRt8dIUCV2JCNWmA6X/yfx1+qaaLje/
	SIvH7MvAo6VnAq6r0DaBpZjLbbrIVAciOmCxDQoPZSXWvgDPrSMDTBtVZf8CBE11YbicLBQkHe7HG
	riKOuvORA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg43n-0004aC-Fc; Fri, 20 Nov 2020 10:54:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg43k-0004Yh-24; Fri, 20 Nov 2020 10:54:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 8FBA01F45E80
Subject: Re: [PATCH 2/2] drm/meson: dw-hdmi: Enable the iahb clock early enough
To: Marc Zyngier <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-3-maz@kernel.org>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <966e90ba-5b38-9ba5-65b3-1a17dbd51871@collabora.com>
Date: Fri, 20 Nov 2020 10:54:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201120094205.525228-3-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_055432_229505_8BD58C08 
X-CRM114-Status: GOOD (  10.89  )
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 20/11/2020 09:42, Marc Zyngier wrote:
> Instead of moving meson_dw_hdmi_init() around which breaks existing
> platform, let's enable the clock meson_dw_hdmi_init() depends on.
> This means we don't have to worry about this clock being enabled or
> not, depending on the boot-loader features.
> 
> Fixes: b33340e33acd ("drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers")
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Although I am triaging kernelci bisections, it was initially
found thanks to our friendly bot.  So if you're OK with this, it
would most definitely appreciate a mention:

  Reported-by: "kernelci.org bot" <bot@kernelci.org>

Thanks,
Guillaume

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
