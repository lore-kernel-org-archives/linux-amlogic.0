Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE689C04FFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2024 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogI2HgdxU8gp2DclkGOC92PCno+WqsA1nGn5Ji25Wfo=; b=17GUqfK+OPL9ks
	Ynv4voJgRXtIXrjhCKb8wqB4vhTKAoVs8fxj/rC4N8brj7BUJ6QchUXckV5UX9ASycLnNEZivKiJQ
	1Pm43QKSvLmdRTAGTOvQ2wMBXSXAlPQCZTYr4X8tahttXWkeGPaSP+/GkpF1fySSCTXBlg/fzncDi
	IkCXH/kdc4gqDrVQ2PCwqNbnQ7z896eEbfg0p+PednIRXokFJkf4L57JcURS0hQict7jEGJzB/fzU
	q3/9iclS2yCdhA0SDsFsB8YrZHV7M8/eEmm4vWY7HX5sMsOJ/Pco05MNpKU8s3pRCp8/g6F6KWip4
	tOJKrAkHmRwxjcgiOgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s98Hc-0000000FKLi-080S;
	Mon, 20 May 2024 19:02:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s98HY-0000000FKKx-32SM;
	Mon, 20 May 2024 19:02:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B6DECE0C6B;
	Mon, 20 May 2024 19:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4173C2BD10;
	Mon, 20 May 2024 19:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716231765;
	bh=dkXTesGMU6jZNIordQLu62eFnIDpxh9YbpGxrA3wPHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WAiKxWSjaXKR4mqQ6nLwgo9Xh3p5iz/KCWxCXJWMtUnnVtR59AyjBBSRAdcb8xzum
	 uy4bil57SaeFr1eYLHFjWp3Gtb/CF792chYvi1v97c3YGl27IeLNcWLQgix11MPs1z
	 8fXekqVVQJ1zWcZd8z5pmIGKVI1rCCwUMnc5V0ZeXtkwIWNQjBrxlkcvtqir8+haO+
	 ws/P2Ctgc/8chsKq5lCiLJ/qqtPs8DlNzmGkYK1sE7GqY/TQ7hZWb/Gcp/jBaWQhyq
	 X2f1kGXnqgqjZxfhjM9OYwRReGsKbX2gNg5Z+XUlEk1bPJT4Ug9tq6qSXM9TRrShvR
	 OD3aTAHoWsu3w==
Date: Mon, 20 May 2024 14:02:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org, jian.hu@amlogic.com,
	kernel@sberdevices.ru, linux-amlogic@lists.infradead.org,
	khilman@baylibre.com, devicetree@vger.kernel.org,
	neil.armstrong@linaro.org, sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, mturquette@baylibre.com,
	linux-kernel@vger.kernel.org, rockosov@gmail.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <171623176256.1307290.6324910189601723683.robh@kernel.org>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
 <20240515185103.20256-3-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515185103.20256-3-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_120248_982692_40A7DD47 
X-CRM114-Status: GOOD (  10.48  )
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


On Wed, 15 May 2024 21:47:25 +0300, Dmitry Rokosov wrote:
> The 'syspll' PLL is a general-purpose PLL designed specifically for the
> CPU clock. It is capable of producing output frequencies within the
> range of 768MHz to 1536MHz.
> 
> The 'syspll_in' source clock is an optional parent connection from the
> peripherals clock controller.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml   | 9 +++++++--
>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h          | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
