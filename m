Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C17DC10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2A62084B
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OyCwt3W5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Tw1R75wb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C2A62084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vipGqXhCNKTfS8jVN9EZKks9kFrn1DdlvHXJmY2mWM=; b=OyCwt3W5dg7BkT
	tNo8BWrxqKgWWjMDfpNhXQBFluY3AGjYcSpJLvr+rcaOvZsic7QWays8mnKze/1GNoKVrLoIS4H6Y
	iJFydyO5LzrwoZKP/iArar89BjtXg3KWxKFYAlDajwv9KXS9UNemdX4vlNndBeT340H06bcBQud15
	yqMM2iyIPoXvzleK7e6vE4n+I08wSi6kveEqHmERPKWQkPn3EnmoiQrtOICOT6LE7CGirOCR/l1R6
	oAKcSYaPmWkkxUnT5Bwr1JhVJToxHrdL/McfY4qT1eVrsGY0DitYBcThrkSqk+aIGzaDNVuDLbQf6
	5IHcHec6z5MRhDmTVEeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGCHn-0003bS-0j; Tue, 16 Apr 2019 00:49:19 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGCHe-0003Tg-7i
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 00:49:12 +0000
Received: by mail-pg1-x542.google.com with SMTP id z9so9416632pgu.10
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2019 17:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=OHIy53jp0JN+BxNZ3p8lR9FcsiEoisvep8pYnRgGgYc=;
 b=Tw1R75wbypJ9p9BQrwN1jgSXpgLo7YPplS7L9OBVX8vSitRmwTQ0w03QnAEBsKC94c
 Egqc6Dq5Ka2ecux9/0d5UDe2BWZOd/piLGW+G+GXSgsMHrnwOMBfeVhnsgBy4xTCT9se
 Bpz2hDHDhazbpAUFfgcoM94zsXc48Ot+VTsZ6N00TXBR3/fWiYkXOl0y0Bsux4Sgj37e
 H4fcDRqDWyXqp+M3erQwo0zh57dVKoFpwIMSAa+9qtcOaQmQ6eesbM1/2Fu/vM9jdUUy
 yQY/vhR20ostPFS3btAXwCWahQNMr0KOgXJP4cvHLjLgzR8vypHlnSJBA6pDp0EmCajw
 bi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=OHIy53jp0JN+BxNZ3p8lR9FcsiEoisvep8pYnRgGgYc=;
 b=Mm2sGINatACbbyt7ADMvYT/ha0RVN9A8api5O87iCZpvu1Xaj2WZqm1yLa5zHSITwV
 jXYeBQPLk0+wBfSkAFC5vkgHqQu6ExCMmsANhADjrfx5sdue6WWy99VmWua+gP+exrBr
 N0LeH1QB8TpNDORPuEO7tbOQkSzkoPKdknLQieePhYDYZZSci4XXkcEK4/e99OffJ0sR
 grLlN13W8LPeL/chc/08Phnd9IV35RUcreTDKUf8pRwemya9O3Rq8MiIsNy5jYxFLptp
 /DEGS+1tA2i/72/DMlWhpo6AoXqoB7skHiLHR46HGKobCMQ4gZh9XURUHf08LQEmxd4i
 ctpg==
X-Gm-Message-State: APjAAAUwQQ/SOj96Q0yQ0ngVrUMEZLRFMBBQshUzfiPCoPJYgS2u895j
 uskG/csYRWVArV45Lz1vnQhIVw==
X-Google-Smtp-Source: APXvYqxva3oSqCYkNH8pK9yZYbUCXmByJ/xklor3Ndaud8sEbhlZnoZ9EeR1uKOf6hoAKp+OVpFMmA==
X-Received: by 2002:a63:720e:: with SMTP id n14mr72547346pgc.93.1555375748757; 
 Mon, 15 Apr 2019 17:49:08 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id 128sm38230819pgb.47.2019.04.15.17.49.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Apr 2019 17:49:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 04/11] arm64: dts: meson-g12a-u200: add regulators
In-Reply-To: <d262d931-526f-f0eb-ed90-d6400453daa6@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
 <20190318100458.5619-5-narmstrong@baylibre.com>
 <d262d931-526f-f0eb-ed90-d6400453daa6@baylibre.com>
Date: Mon, 15 Apr 2019 17:49:07 -0700
Message-ID: <7hy34apyf0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_174910_280756_AFE5D28D 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Kevin,
>
> Seems this patch is missing in
> https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v5.2/dt64
>

Yup, I noticed it when applying  the rest of the boards peripherals DT.
I've added it now.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
