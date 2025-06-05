Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF0BC5B543
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jun 2025 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qg37HYh48/ID13tDUjirm3cstuE/A3XVtP0BT1i9t8=; b=UxWLI8iWlERqKJ
	ixOmYjGqBoWonN9QD1Bf5rv2fyVJvDM/M5/gmQliUpvVfk9Iyd/zLtBWhqk5mEm0WWuOJ2QW079pS
	zi2rs2xnywdKv+rFGPPrt3ow074pQTQ8+Df+30CoNONwuKvLUZniXc0FPFPpnno+T4Bae0j5STlh/
	PCpYvCP4v0iRvgv985nfG0wZTSNt+xlIY9DTemL+RyuTqlU4xu4eS3GRN+oCCA6phML34xAaEsjBp
	hjeBqfDPZ7pqijXVI+7D7n5Q+Tv3JKrXoJgG/62XJHV4mM81j1kDelTifmS3KdlEzj5s46SCKTfSH
	HguZvnxIRvFQYJeJ23oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7ji-0000000FEmT-1aVn;
	Thu, 05 Jun 2025 10:22:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7jf-0000000FEl5-2LfB;
	Thu, 05 Jun 2025 10:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DD4E4A505AD;
	Thu,  5 Jun 2025 10:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27ABEC4CEE7;
	Thu,  5 Jun 2025 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749118928;
	bh=IAbfwq9S40+fyLHx6nXIBRtY/yzVmF8ctVF1noJJbiE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=MA92+zVI9dwJ3AzdEL1EHzB9zvYjgjH8GzTT6tqxSfJnIIdFaO1gaLZqxiSzNTcCO
	 KbeBlu7pGa8o9LnEau/fx2LQTk2CKmiYl5PeuG8Mv2hxc1iMle8Uxi+mKd5rnkLMEI
	 jWBBze06vwaM8u/PBOtWpxzsr5uWsvRthCXjehmu5gdCmR3DQmDOcg7OuvXBHf6+jE
	 NxISM3tt7fbRpryygPNKlLhwz25pNNvlyASKczbagtbDw7OiyCgRWvgbJxmvUbPvbF
	 /s++HRS3rw8YaVdONhfFNI0CN9OY5gvMcSpakmHwBoXta3fNf9Szp4ZRFGScEh3Opa
	 HFYZsTkuULv8w==
Message-ID: <1affbb8a-2f6f-4dc5-ace1-4058721f0947@kernel.org>
Date: Thu, 5 Jun 2025 12:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
Content-Language: en-US
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_032211_685269_806EC823 
X-CRM114-Status: UNSURE (   5.63  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03.06.25 13:57, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sven Peter <sven@kernel.org> # for apple,mailbox.yaml



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
