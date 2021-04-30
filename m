Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84380C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 02:02:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1998A6113D
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 02:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1998A6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xt0qzKpo9NvovzlcQ9gOZMOGAoZfkYxFYbpLfH1C+WY=; b=lzDlDtGsK1PlD9L7qwQJzjclX
	xwEY21dstxvAeZLhGeNeSi59h5GRsX0cY/oh305hxyoCUsprVc9FHnPBtvTg+N0Rw7yI4w56FtWOA
	HqZ2YMpcPbsp5+3PDle+zl71KF9nN8tmyA9HcNVV8eWVulhEoWIptliJLF9nRo8Hoj2NiAqRdGotl
	U1pBDmHQslcahvipyrs97am2pLW998h7C6G20yrFeql9u+Nb6pCTTR0RxdIbE7C8hhzwquyw+HazT
	GeNIiTFcVjoxu+P4LrM1rwfstdw3taFWiZUodEOqGUHuBIVYzYJ9P5p8i6oI4AFmu66K6vWfCq3oo
	yMqp/G4wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcIUE-006yrQ-95; Fri, 30 Apr 2021 02:02:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcIUA-006yrF-La
 for linux-amlogic@desiato.infradead.org; Fri, 30 Apr 2021 02:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:Date:To:Cc:From:Subject:
 References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=sam0ecu/SlGctM5G21gebfjM0rwM0JJOlCkbFBo0NFw=; b=ybfz/oX5iCpytUVWu1Zzwc8icl
 zLiBPIfdc8tdkKSKTSFvDdCNTcoY0zjKQotvlyF34yqJ25ZtCcClLZV/ggiBMKhE7zZ5WscckgMy6
 h2VGKAOGJfmLX7+YziP7iPqdF1f6mvRmmp6qlSnDZ0dLQ6eNFaF+afN2+Rnn/N1MP9ws+73cdm/rR
 U8XKQAZC1DJXDdAEzIWq9v5b9TYNR0It6aVty6VGlbZutmThLrQySbfsJ+UZUiS/YRR6GYC6tD/po
 1fuTrnqWcqmXgP7a1zTiNYSHDbbRy2zd0+GuYNFZMu/72gXC3CeqRFueu+3scZ8zaGOqdeGm5bpTZ
 X1fK30EA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcIU7-0014Nh-Rn
 for linux-amlogic@lists.infradead.org; Fri, 30 Apr 2021 02:02:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4743E613B4;
 Fri, 30 Apr 2021 02:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619748147;
 bh=FHzujwGmdMUBeThmjTcOfbavQK2/+QHmQ2rFXtDGaNo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=dYboXGZsaAygY3Sd9pzVuSPtxPquPZe38FhvP9d5GrYeebWEOvOjvIsXlMptguvLL
 nB0OwFo+ngDKl3uSc/WpwBpWaD0v8+0KFLgh0IUHxKbm0We/2NGoi3qXgIBCcyHhbi
 pMCowSpPZVGrD8e3BcpUX4MS0dwdlTgs1PJFhHpPRqkS5bPt1A/XV3ticIAA5iPXIH
 YXHvTVsLOVT6DN4sZZSMQ8r5FuXEuo/Qwbm+z8M6RZ7SAPmulZfncnXjL0Fnu0+ELw
 neUh0fWgCKuyMZ2ATB0FS6bdkZvwSGpuXo60I+7wdMqOeSwbxHJrzslzfPQJKuKGP1
 V1UbIUimAhAzw==
MIME-Version: 1.0
In-Reply-To: <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
References: <20210429090516.61085-1-jbrunet@baylibre.com>
 <CAFBinCCcKHqd7Mh3bV9NyyWzi=96pCWxzSZBOjg5Puy9wOuihQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: axg-audio: do not print error on defer
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 29 Apr 2021 19:02:26 -0700
Message-ID: <161974814600.177949.13534344520666393105@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_190227_940242_427EB74E 
X-CRM114-Status: GOOD (  12.12  )
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

Quoting Martin Blumenstingl (2021-04-29 13:49:54)
> Hi Jerome,
> 
> On Thu, Apr 29, 2021 at 11:06 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> [...]
> > diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> > index 7c8d02164443..5e501eff0840 100644
> > --- a/drivers/clk/meson/axg-audio.c
> > +++ b/drivers/clk/meson/axg-audio.c
> > @@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
> >
> >         ret = device_reset(dev);
> >         if (ret) {
> > -               dev_err(dev, "failed to reset device\n");
> > +               if (ret != -EPROBE_DEFER)
> > +                       dev_err(dev, "failed to reset device\n");
> many drivers are switching to dev_err_probe nowadays
> According to it's documentation:
>   In case of -EPROBE_DEFER it sets also defer probe reason, which can be
>   checked later by reading devices_deferred debugfs attribute.
> 
> so I think it makes sense to use dev_err_probe here as well
> 
> 

Yes please use dev_err_probe()

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
