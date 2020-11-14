Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76744C5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:54:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1906622409
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:54:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ht/DNycF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES1K3w8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1906622409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F48kqt80gjqRRPt1Kd8OSj5/mc3YK+4PvsOzR8V2rT0=; b=ht/DNycFt4fjElX5u1F4quJR0
	eW0i+1lAR1ZMWqZy9vCXU8fVyf8GAGEXYtXBeGiIo8MvVaOUmVga3mTQJdZQKr7DIpdp8ztQJcrcw
	4OwFXRyjzkmEcIW/WQ30/VTXzz9I6pbfeI0/fUJKX/V4GImKdHar7f/TQAPbXHde+njUt+6RI3Pob
	Jmq5YYEFuOfJfB57q/3nU8Wkcmn55UhljjCgCaFQqp+6Q9ArpqBfmG0vMdzadoN/Deq9ittot9l9z
	KJ/l2ReHSQX+rv5ZHdak930JwvhIZHyIQfew8AddNV1azeGhGckG9sK95yPFHv50Lkcbz65kZ4epr
	oPpd/OdeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2ZC-0008Eq-1V; Sat, 14 Nov 2020 20:54:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2Z9-0008Dy-LD
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 20:54:36 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C42C22409;
 Sat, 14 Nov 2020 20:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387274;
 bh=Iwt23hbsl5VQbWNx6NNp6vv8PfR3pLoUQgv0aUq3IhE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ES1K3w8gsQr1pegsMlgZxBYtRlI/aJeTS5JsrsUG4t7soo4GF/lA22f2amJhbvAhm
 cQWlZHu3KldcGrBZkZamvmql+9eou1Nr2wBfjvbsg/OJ29zGdJZiuy2+mFii6vKebq
 HhDHVs1ks8mvhxnK0cXv70JA0OBGpRCeK5cUM4Qo=
MIME-Version: 1.0
In-Reply-To: <20201021162147.563655-2-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
 <20201021162147.563655-2-jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: avoid devm_clk_release name clash
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Nov 2020 12:54:32 -0800
Message-ID: <160538727297.60232.6643959847633368696@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_155435_783305_B719C0CA 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-10-21 09:21:45)
> In clk-devres.c, devm_clk_release() is used to call clk_put() memory
> managed clock. In clk.c the same name, in a different scope is used to call
> clk_unregister().
> 
> As it stands, it is not really a problem but it does not readability,
> especially if we need to call clk_put() on managed clock in clk.c
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
