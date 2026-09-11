Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A3AC88E4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRayCOiU2h8H6w9UoZYTHy5VZZVJDOZVDly7TrBlzjw=; b=DMaMYwFsKR0Uv6
	MwFlnNLC4fQ29u+Db6dRnhQYsKlr+Iml5MztFK35fIHiblWOEyu67mud0STOaKZsDFgnEfwRYTVzV
	FB9NC03ksCeOzSatghaC731XSmooS8V73lyZbx24JaW8yiwuPezOFlw0ZEAKGZDRDNh7tB5Kqjyqy
	x3Em18ZmoczHQT4DGKitOR6nJgnql45ONJzlEUV/e/3euiDMttAxVz1IQRQWSerh3epRzZsGsoslq
	YnfeQnamsu5+HPOFtyjuWXiXUaphqKpkkL+gb87wLmH3l2uexmQ+eM2c9w3JZego/x41d5EbC9bHX
	7Fs/WLdBuUw5gS01vsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK3-0000000GU5i-3MAH;
	Fri, 11 Sep 2026 11:21:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK1-0000000GU5E-2BI2
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 11:21:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE8E4602C2;
	Fri, 11 Sep 2026 11:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB29A1F0089E;
	Fri, 11 Sep 2026 11:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125692;
	bh=8XDMnyUmoPxzFs0KDbpvtdyvol8xfdQdSsxVWCm3ZR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aaeUVIx1xO1DM5m4PLwQlG0K2urXU8SGwnNoLN9DOl5ffZ2L6wjhdz6OnCqSrugbj
	 7IK6pdSmFZVrXBAvRx4aVAh9kkG5ZaMiNq/2jAxx1RQgpoVZ3YYUdPZZU6pZRT7ip/
	 8EauHuUBQ7ipMSHNsD8GyT8KratAks7IWWotm1BaUt/MD52ib0OyRjeJbMKiFnh8Ia
	 SThHNJyAiEq75iFvFyzxiQ7tP6Ial0M/XQzhMoLoqcNQIYKlq7Cceuhm/z2w687AJh
	 tFrD7TFEbd52v9/syuTgOT4qw6QH7bdtloSUpqs4KlhWI8nknvPX2LWUAfeB2M8Quj
	 IRMLM2f4+G1aQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Subject: Re: [PATCH 5.10.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Fri, 11 Sep 2026 07:20:53 -0400
Message-ID: <daily-reply-0034-re-clk-meson-gxbb-5-10@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910072814.334323-1-jbrunet@baylibre.com>
References: <20260910072814.334323-1-jbrunet@baylibre.com>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> The following out-of-bounds read has been observed by Christian on a
> GXBB WeTek Hub:

Queued for 5.10, thanks.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
