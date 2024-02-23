Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75982C54798
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA1bbKLR8BJ6Lafn7PDoBUA2CpnGf5pdeXVWYXiwAis=; b=WCNIsSydsKradY
	nzq/lu5Te9z7J+7K9eqHtEzXOkejxR7PWtIcicfwDiJFD3N+ZjOSh2g5tCtmT0jedojesiuoCovzg
	MiA9HvFBB+hlhNp5+DqprvO9/tWrt52r5riC3Akr1v2txAy1c/35uJRNQb6iaVj2QFSO7S79uj/4+
	bFt7zZpJD7RwOwv8wdhNK7+DBin9ZYDHpqGh+kRBHIpH3nhV+SmFWIDcAAPdRp2tnE8dzWZ8zgTC/
	iGypG4INSGDfJDxJ7GG+/jqy7fy8+zdkpPKBFaz108Bb/4x9nWwOzcRivI1KSfGzCaAelE+CgLRfI
	19A2LOSpjs36xQ51DRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWP4-00000009jbU-3Btc;
	Fri, 23 Feb 2024 14:19:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWP1-00000009jal-42US
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 14:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6211E633A5;
	Fri, 23 Feb 2024 14:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39E4C433C7;
	Fri, 23 Feb 2024 14:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708697991;
	bh=ETKYcbVy9F3oKzFZtWeCfPtjpmK5klMob+7HF4Z81lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eacw6DRV+EHA5iO8RBu8bFKeMyPlp8sbd8pkC2N4jM3EIR6XjC7et+quyXaCCwdgt
	 Em0tIE/Xm8LXtSYZ9Oc+pr/R48EkxRke7rHiQgBLJCcokMyKu9M5wqzV7xgSXGa1Ej
	 IBYEAN/HFqOEoklKNm1DIQY3f1LkKLcjDYxGSMt6Fv223meRzd4AXzZxg4rhVyyxs2
	 0n99jNUBQ/I5UpGLszwm8Yx8/QNwbX5cH5gzXctInzIK8CKcqom0rzHNfxeaCgxOSG
	 g2HRRJ4Or+Ws3aTaDLLdXVvGlmuqr0Aa48s4F8CqKf4B/Q6mW3318awmLA+NUjGnNE
	 Bk0jTbFFLj0Xw==
Date: Fri, 23 Feb 2024 07:19:48 -0700
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	JunYi Zhao <junyi.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/5] dt-bindings: pwm: amlogic: Add a new binding for
 meson8 pwm types
Message-ID: <170869798755.1908267.1779690942757984843.robh@kernel.org>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <20240221151154.26452-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221151154.26452-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_061952_074277_956565B0 
X-CRM114-Status: GOOD (  13.80  )
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


On Wed, 21 Feb 2024 16:11:48 +0100, Jerome Brunet wrote:
> The binding that is used up to now describe which input the PWM
> channel multiplexer should pick among its possible parents,
> which are hardcoded in the driver. This isn't a good binding in
> the sense that it should describe hardware but not usage.
> 
> Add a new binding deprecating the old one that uses clocks in a
> better way and how clocks are usually used today: The list of
> clocks describe the inputs of the PWM block as they are realised
> in hardware.
> 
> So deprecate the old bindings and introduce a compatible per SoC
> family to replace these.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 50 +++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
