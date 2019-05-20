Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA259C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:49:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DD3214AE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 17:49:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dhPxPEB6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d/QiLwSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DD3214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bu3nLvAI9pl9oyrnC5id3G28AqJ3wg9ZiXpgeFjzfBI=; b=dhPxPEB6uWNFNF
	dCXfljbdyHBj0f9424F0KZY4GcTBQiA24FeWEPzMEj2L8TcOO1HzorvfSs5tos1uTniwmB2z0C8cX
	g7M0Lfh6k98Ko/NIdumUJEE2bU+moCpMBcJgSu+SQDBULXyMCm+DKghZhjTNudoW3OSe3o5Ys+nWc
	2+Vw/il7CPpUjyYIBbVQoX5PtUtDZdUDIE1Led6TE9/CMisAdxE8gKiVBe5htCuBt3hyIpekCEAL8
	E85pInTBNTtzx7Dvi5gTVDIjnwOV9+MeKy8fzLtEBOoyEEOV5PUeiFG4Ru2fSnMbjVDxXrzXHDCI0
	i0+rvlxI+63KzTY1S3Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmPk-00037g-JJ; Mon, 20 May 2019 17:49:32 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmPh-00037H-E6
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 17:49:31 +0000
Received: by mail-pf1-x442.google.com with SMTP id z26so7580530pfg.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 10:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=me1hOjgWTri45Cc6hO9sgRzbDQwaWnoPUzfvVUbP8Uw=;
 b=d/QiLwSw40EjvxwHCoBy3JWseUPcQPvj4auj0c7ZAV6OKodF1NvnM2hOAOdrKopZjE
 z1TqPkMCjHuXZYkHxVjL4TRbCv8RlImwtrVTHTaQggD5Cxo9AQHwpqNUyk9RusnPyO0F
 3mU4YL7YU2vzL7rzy3003fROJc64CQMa7tAuUKK9CYwpGekMkMa20Lscc1Jz5OFTtdfj
 29jjvyM7sJ7dzn129bnFYI0dKuAdoVmheVZc9iXFeOtqJLEN9CFeqtP6W66FfPgHb3O3
 l5nF/Pt63UZNRclggayxHiMiul7NSEG7d1434MGHCWBdSMDu6YVqpR1CxE7E7wDl9R8k
 0dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=me1hOjgWTri45Cc6hO9sgRzbDQwaWnoPUzfvVUbP8Uw=;
 b=GUYPZFWgX+wdd0aWk6kl8r2Hr58QFyCr/0/iPPWsA2w6bLTG5rqLEpRAxq751tjeaR
 STVAPc4/4CLOsZaD8DsS/xXlndnI2bRZms62izOOxYB/gqFzSdxE35lc7ppwrkCYl9+e
 QOkgDaX1yCn9G4QIaj6fsJZ6vMn7oIBvG/PbY8DI9fhW1u2PutacfHfOzLCp+pdJxFst
 R9DfRO370UBRmkXuZndFIY3JG275JsDvaPaRZ5/VSJ2ReAOPfSBRxI2wpemywHMxfySO
 pOBrc/zh/Wydv8w5nhvVhG6Y6HvJGGp/NgFZV+zORw/vMXr8bq6+yuz9kypoQ7Xrmivz
 XSEw==
X-Gm-Message-State: APjAAAWF1Xw+GQMzKMM0vlLGRtA+BcGWoyR/ujzA62diYGiHXYsMr+PD
 vW/8UZVUYBURtFJp4QKN6we4TAnJXIF+Zw==
X-Google-Smtp-Source: APXvYqyk9OeosmdVRNKnZ4nmNCQduMXDaoErB894LgjM/sAuCd4TBUUogmj2zXI/rVGiZTJf8fb28A==
X-Received: by 2002:a62:e10f:: with SMTP id q15mr81286283pfh.56.1558374568375; 
 Mon, 20 May 2019 10:49:28 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e483:1cc0:e2c2:140d])
 by smtp.googlemail.com with ESMTPSA id
 s12sm28713070pfd.152.2019.05.20.10.49.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 10:49:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: meson: g12a: add ethernet support
In-Reply-To: <20190520131401.11804-1-jbrunet@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
Date: Mon, 20 May 2019 10:49:26 -0700
Message-ID: <7himu58195.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_104929_608366_8A05FFDF 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add network support to the g12a SoC family
>
> This is series is based on 5.2-rc1 and the patches I already sent last
> week. If this is not convient for you, please let me know, I'll rebase.

Could you apply this on top of the "consistently order nodes" patches
that are already in my v5.3/dt64 branch?

More specifically, if you rebase this onto this commit[1], I'll be able
to easily replace the v1 of this series that's already in v5.3/dt64.

Kevin

[1] 5b9533f6de2a arm64: dts: meson: u200: consistently order nodes

> Also, you will need to get the clk tag "clk-meson-5.3-1-fixes" (to get
> the update MPLL50M id) from clk-meson [0].
>
> Changes since v1: [1]
>  * rebased on v5.2-rc1
>  * s/eth_rmii_pins/eth_pins
>  * fix MPLL50M typo
>
> [0]: git://github.com/BayLibre/clk-meson.git
> [1]: https://lkml.kernel.org/r/20190510164940.13496-1-jbrunet@baylibre.com
>
> Jerome Brunet (5):
>   arm64: dts: meson: g12a: add ethernet mac controller
>   arm64: dts: meson: g12a: add ethernet pinctrl definitions
>   arm64: dts: meson: g12a: add mdio multiplexer
>   arm64: dts: meson: u200: add internal network
>   arm64: dts: meson: sei510: add network support
>
>  .../boot/dts/amlogic/meson-g12a-sei510.dts    |  7 ++
>  .../boot/dts/amlogic/meson-g12a-u200.dts      |  7 ++
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 90 +++++++++++++++++++
>  3 files changed, 104 insertions(+)
>
> -- 
> 2.20.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
