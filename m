Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2D4C07E85
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 09:32:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD5920849
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 09:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CyFuHt7L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="iz9728MI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD5920849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmKXy4r0x7LwCNAxBSo+zRAWjjQqpQHUmA4KRzZ6HFc=; b=CyFuHt7LPs04wr
	ZwUM6mswj9VL2tbyaDrPWu+I+5aOrYsxUAQaKf+Y4aOTEHtvheVVfxfzzYmBCdJHvfvjN5mfWuMY0
	3PjaNg+WimX7XHwoCLgtr32wOKqJZtPRRUhViLPZXHgLvm6kKg6rdgrJo0vtqKxuYZZOR1qkjfxe/
	/bX0mEqL90lar+usQsQef6HIF0+TFR8dW7UMSuSQBZSAgTBNBRyQKloBgTwhutu3ueGAuPx0nHTOZ
	db5GVuXAQpSapnhOloALE7JFy7eagBHB8aOj3FIxAZ571CvD/QZpyDY0la1SxpIrf7FOgMaZeK4XU
	0ollBeELxpM6Kwx7GrGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWePN-0004k1-Ny; Tue, 11 Dec 2018 09:32:53 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWePK-0004VM-65
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 09:32:52 +0000
Received: by mail-vs1-xe43.google.com with SMTP id h78so8455661vsi.6
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFTRYNH/uemX7W+T0FFPzR+3gEy7EW+TmKaAd7Nbgcg=;
 b=iz9728MIWNkugNQZajnrF2W/SJtUSODYXl+fw2R555Pk7ePU6OTF+tOofSV43AMHEa
 5oF0bBpT6hA+hcgT2ZltvM36/Y82EB2WpCmiPEtziC3A6FI3SAV1RRgHGVj/ADiVH0bj
 sfL9GHFac7NxCOnUbAUstOddyfb0ew9GnRE/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFTRYNH/uemX7W+T0FFPzR+3gEy7EW+TmKaAd7Nbgcg=;
 b=nh+6d7mFbOg6P8ozMMvCrtRuET/zcPOs5HklTpcHmIWhXr0fYzzOczmUcOH+6jovs+
 t196kU49FxcEedhU/gL4T+vEbhGinUJ9BSAdsbZvFOrx54RWlF2ms7RTEPJKhmNeiD7A
 nxuTx9Ah96iyGLmu+Y8hdtItpmnB2gscM6tTK7ceSBB0A2ln0XCcGUjATlkJXE/I0Ewl
 3t+HcQS1GLR+zvoxLmnoi/48esbw0OfLaqP8JSYhGQNlL4wQmUVXG2f924PKYWC7PMtg
 GWfqz2ZxZLqRNHvbIdneBv+ZVGuw281sj94qW7L2+RRKVrUtKlp0i8gnJ/dBELvYpIyO
 YHcw==
X-Gm-Message-State: AA+aEWaqlh0aVoevsESdnVKYTA+mS7/mno98io3AdGwYmZm6AIdPYWi5
 //XOKygGYN0onx9F0mQbB2KxNf8fd38wPjaKnZRceQ==
X-Google-Smtp-Source: AFSGD/VBbWfmjWQHPO2N2ypvxVD2cFOYDRMvPU5QSem1xKcDDccdcvtCRovUvOVA9zR1K1Ndnf4J+HAKJSHsmj9qhkk=
X-Received: by 2002:a67:1a84:: with SMTP id a126mr6848245vsa.165.1544520758884; 
 Tue, 11 Dec 2018 01:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20181206151828.24417-1-jbrunet@baylibre.com>
In-Reply-To: <20181206151828.24417-1-jbrunet@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Dec 2018 10:32:03 +0100
Message-ID: <CAPDyKFp8H6jW-d8b51F2CZvr04setP443YbjbJX7dDLbbAtfVg@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: meson-gx: chained descriptor fixup and
 improvements
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_013250_408300_1148D964 
X-CRM114-Status: GOOD (  16.91  )
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
Cc: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 6 Dec 2018 at 16:18, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> The goal of the patchset was mainly to address the following warning:
>
> WARNING: CPU: 0 PID: 0 at /usr/src/kernel/drivers/mmc/host/meson-gx-mmc.c:1025 meson_mmc_irq+0xc0/0x1e0
> Modules linked in: crc32_ce crct10dif_ce ipv6 overlay
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.1 #1
> Hardware name: Some A113 Board (DT)
> pstate: 40000085 (nZcv daIf -PAN -UAO)
> pc : meson_mmc_irq+0xc0/0x1e0
> lr : __handle_irq_event_percpu+0x70/0x180
> sp : ffff000008003980
> x29: ffff000008003980 x28: 0000000000000000
> [...]
> x1 : ffff80001a71bd40 x0 : 0000000000000000
> Call trace:
>  meson_mmc_irq+0xc0/0x1e0
>  __handle_irq_event_percpu+0x70/0x180
>  handle_irq_event_percpu+0x34/0x88
>  handle_irq_event+0x48/0x78
>  handle_fasteoi_irq+0xa0/0x180
>  generic_handle_irq+0x24/0x38
>  __handle_domain_irq+0x5c/0xb8
>  gic_handle_irq+0x58/0xa8
>
> This happens when using the chained descriptor mode. If there is an
> error, we call mmc_request_done(), loosing any reference to the cmd. It
> turns out that the chained descriptor does really stops when we do so, at
> least not completly. Most of the time, it can be seen with this harmless
> warning because the descriptor will raise another unexpected IRQ. On rare
> occasion, it will completly break the MMC.
>
> This is mostly adressed by patch #1.
> With this fixed, I took (yet) another look at the ultra-high speed modes
> and the tuning.
>
> I came up with new settings in patch 3 and 4. I've tested them on eMMC,
> sdcard and sdio on the following platforms:
>  * gxbb p200
>  * gxl p230, libretech (eMMC only), kvim.
>  * axg s400
>
> So far, these new settings seems to be working great but I think it
> would be nice if others could test this and provide their feedback.
> This why  patch 3 and 4 are RFT tagged.
>
> Jerome Brunet (4):
>   mmc: meson-gx: make sure the descriptor is stopped on errors
>   mmc: meson-gx: remove useless lock
>   mmc: meson-gx: align default phase on soc vendor tree
>   mmc: meson-gx: add signal resampling
>
>  drivers/mmc/host/meson-gx-mmc.c | 100 ++++++++++++++++++++++++--------
>  1 file changed, 75 insertions(+), 25 deletions(-)
>

Following Kevin's approach, applied for next to get this tested, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
