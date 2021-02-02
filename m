Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0A6C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 00:42:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD3A64EAA
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 00:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD3A64EAA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bee0FYOwYgJt7JA8IshKj+AWs/Y8e30Hu61Pc/X7b40=; b=SNkUB9JwtxGnZgj0OIZClShzV
	xfjE1blzO801Uog2SXPNjYUJH221uO+ptgRJSiDgs7lVAA+gBaujQAZ0YjTRIDEieES53DDg6JKDu
	GbzpFEB1ngmSlixR/gZZdUQMnOMg+RTBYFt57Vb0HDFClSsVa2n9qrMPwaa8sWKC3fRy9SZCFhisZ
	x/QxyYY6AiuoRF8j9okm7HoCoN/14Vyin3leZPAlDqbOpKTzo+MAaUG9gV0KI9ytqfW/kEtRWpxFd
	EK8yE+wOzm+Rm/STMvE0/mw/qVgpdhR+/IEEzqqteEOYEPwNSrL7toqZ73zq9svukA8sa+WmG7SKP
	NWcq8UwcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6jlh-0007hL-Ig; Tue, 02 Feb 2021 00:42:09 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6jld-0007gS-Is
 for linux-amlogic@lists.infradead.org; Tue, 02 Feb 2021 00:42:07 +0000
Received: by mail-pj1-x1033.google.com with SMTP id a20so1145686pjs.1
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Feb 2021 16:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=r9Kg/gf6E4HWfjM0umPzsi5Eq8z2VKtkBzcF9+Dc93w=;
 b=X7hzWRxLsDVvI9aTtpXS3+RoX3xXcmt8pX+BQUFi0OwKFeWKrsuuKstUzc6WzJUqez
 PH8ltZKUVYRfGmg533ddSsLLx6WYWe3LR/xr6yNcP6urOWMKMWn0fRYjzyenxqPVPa8C
 9bxJvh8KZ/ciGjakxcAdPLwrT6JXA4X/8tHRfTt+hWBXaPEHrW50WijvCh2z931B662P
 XcIalQmKW90qt0Ro6b3M/FYYdiGjo35Guv7Qer5i6Q0nZil1htc59xG2tZtAxgBeOEsS
 jsq1oIB4wnChyWFvw9m/R2dD8GR/EX+8Rz23LCrIcZyE0yKD8uvqQToWX8tc69+C3RfT
 VCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=r9Kg/gf6E4HWfjM0umPzsi5Eq8z2VKtkBzcF9+Dc93w=;
 b=KvawkGLAhRntaIpcgj851VMZ1q95P2rsdgenA0eAyTjtriHgTk4takLQKemFnl9R45
 ox4V3yp5gFJEJ/CJ/pdhWX+/4pngAXq5YcKd1yUYLVFVIl23AWqRBlPMRZy3K9gumpwa
 PNF6+k4hTcJGl838sLq+cakcpycsUINW5RQqWLCath8Q2pneTJxQ6bNZXkq3oXNTsgDf
 CcN5fPzMr4n1UsHUPoHsDMGMUhtSWkWqiRmq0Jfxd1AC7pLDL7OZYhfdEGGDhGvzlcZR
 PN87P1Gh7m30MDib+L6/CnXHk/JtkB/7pN9PVwVw0yng+fZC9ahpKcF4UBsVhcZsVVyQ
 OQqg==
X-Gm-Message-State: AOAM533eaYmY0gRGVVlfuhhd+jmwwmBVYi3MZa9napQ8csw2E8843FoO
 8wXkXA8IqNkIIeQHda5zk2m0dg==
X-Google-Smtp-Source: ABdhPJzD0q+nzsD62zpnYipUPZDwrw468Av/Fbt+gUMrc5zo9WnDW65ogFssHkKfRnLSmaRxv3Jq5g==
X-Received: by 2002:a17:902:b716:b029:e1:575a:139d with SMTP id
 d22-20020a170902b716b02900e1575a139dmr7890707pls.78.1612226521938; 
 Mon, 01 Feb 2021 16:42:01 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t129sm20509673pfc.16.2021.02.01.16.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 16:42:01 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: meson: add support for ODROID-HC4
In-Reply-To: <20210131055358.21293-1-christianshewitt@gmail.com>
References: <20210131055358.21293-1-christianshewitt@gmail.com>
Date: Mon, 01 Feb 2021 16:42:00 -0800
Message-ID: <7h5z3bi9lz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_194205_784931_807C9CB9 
X-CRM114-Status: GOOD (  16.11  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

Christian Hewitt <christianshewitt@gmail.com> writes:

> This series fixes minor sort-order issues in the Amlogic bindings yaml and
> dtb Makefile, then converts the existing ODROID-C2 dts into dtsi so we can
> support its new sister product the ODROID-HC4.
>
> I've also given the devices different audio card names. This is partly
> cosmetic, but also because HC4 is HDMI-only while C4 can be used with
> other i2c audio devices via an expansion connector so users may want to
> use different alsa configs.
>
> Patches to support the spifc chip are still being upstreamed [0] so this
> will be addressed in a follow up. A WIP patch for the dts change can be
> found in my amlogic-5.11.y dev branch [1].
>
> For reference, here's dmesg from LibreELEC on 5.11-rc5 [2].
>
> Changes since v1:
> - fix ODRIOD typo in patch 3
> - fix SPI-NOT size in patch 5
> - add Neil's Acks/Reviews

Could you please rebase this on top of my v5.12/dt64 branch[1]?  This
has conflicts with some stuff already queued up there.

Thanks,

Kevin

[1] https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v5.12/dt64

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
