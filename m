Return-Path: <SRS0=SHiD=UY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD05C48BD4
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 08:56:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E653214DA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 08:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKmIlW0h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="swXBv7qi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E653214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3w5Hvu9vtBu+e2VB+RLsceGYz6sab48sVrOWmmN+Czw=; b=AKmIlW0hqlxGE0
	SGWKB9M3qxB+99CITgHnnSqham/HLC3Ct1Sv7uBZPaJM1KZ6nUj9Hf8besW5YTzMHw6u/78kAjZtM
	yskvRy0uohGWBrrnulEXZgDkLkBXXCHuqQtV61gdV3r/nDX3fpJGGZSirYqjedxzosUH0C92VaaSG
	PT9z754gX0sH8+hy9wA4ZpY5SUucX1aOJClS1XLe4q9XMATg3+pEMPLfob15053U/l79BhLNbV1P8
	Z+eukqSb4rH7i7NBImE/mNYlz3AzkWJuXnmhZQsp3AkMj6H/r0NNsCqXXVJBR/d4aLEk2z45WNLrK
	Vxzb+AtS2DjK4uCnf0+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfhFk-00014k-IJ; Tue, 25 Jun 2019 08:56:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfhFF-0000iK-SB
 for linux-amlogic@lists.infradead.org; Tue, 25 Jun 2019 08:56:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id c2so16879954wrm.8
 for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2019 01:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cfaOZkANMwu44tL34oJmOKtMH5CsINC0TJ7SIxnqEAA=;
 b=swXBv7qi9HZUpONZ6YkxoWLj5Qxn/BP6RLInNEY/laOVxaa1Xx82Ylp3QzQYIqg7LS
 76K3qwaxIEfb9y21jCPWZGaO0H39E/FjGG4DI0ox4fFuXsckYZZmmDKuOj77vucYjNT6
 62+z6hIsaZI0mWoSrl8pgxjt2lsmXUqle2ugzsFMdtmp/NMjetm/AF+iDMB5IliGyakn
 aotsGXY+y6L692CxaeITKJ7YYDP/7rxXeQ4ettcRas9N6hpN+H5w7JAdenj7iKPlvQPz
 u1aRob71mk/MOPyNeAhNfS6TCKWvhk15NMOkZJUQ+pF+Ku2YDeiwvkAQGzRPWGLyU9Lz
 todQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cfaOZkANMwu44tL34oJmOKtMH5CsINC0TJ7SIxnqEAA=;
 b=LBBGnjeR+n0JKVbraJxPN5TQD+6YYezS0S9n0XOQU2b4QB2vNFzwNzygjV03x+Amoi
 yX21UHeD+7K+Sk7RxCf9cLy70vcxPC+1bDmA5XSB5y9YWDHOJhyPj8aPU8UTiYHTph2f
 w8Mew5fCrr7lVpfTlOER2r76yxdYwTdiLtI9KOQK7ktczCjNHwYFW3B7s/JIqUoomXVF
 8DK6/1SbI3jmKXR6Ar2Dc62cQ73Bypx0nwt4NWb63nxOvCNE4xLgTRhys5u1BJBIBykr
 8U2wl+4aZBBjCiGvcTlzx/g2DTOwoGsz6124xNKyGVaMVJtkeRPW8UezLLHiQxM4KgWJ
 ntfw==
X-Gm-Message-State: APjAAAX3cp5X43m2jsZ3GbtIhANph8m8EsNcqJ1fObU+v0e1BEkja52V
 t262zzF/sg0etRuJx2/mzybiLw==
X-Google-Smtp-Source: APXvYqwTrpHPSGEW1+VvK0lRPAdQP0t16ak5m/1igVT58l6NUTGkndJAhuJUwhdLzQnH2EiAQEqE4w==
X-Received: by 2002:a05:6000:12:: with SMTP id
 h18mr49242077wrx.29.1561452963946; 
 Tue, 25 Jun 2019 01:56:03 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e21sm23970154wra.27.2019.06.25.01.56.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 01:56:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: update for v5.3
In-Reply-To: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
References: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
Date: Tue, 25 Jun 2019 10:56:02 +0200
Message-ID: <1jv9wuyrfh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_015605_939534_1BDF9F3B 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kevin Hilman <khilman@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 11 Jun 2019 at 14:38, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Dear clock maintainers,
>
> Below is a request to pull Amlogic clock update for v5.3 based on the fixes
> we just send. This update add the init() callback to the mpll clock driver
> as discussed in the previous cycle. As promised, the rework to register/deregister
> will follow.
>
> Apart from this, we've got a fairly regular update, adding a bunch of new
> clocks to several SoC families. It also adds support for g12b derived from the
> g12a, which explains the significant line count in the g12a file.
>
> The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>
>   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
>
> are available in the Git repository at:
>
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1
>
> for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:
>
>   clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)
>

Hi Stephen,

Could let us if you intend to take this PR as it is or if you are expecting
any change ?

Best regards
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
