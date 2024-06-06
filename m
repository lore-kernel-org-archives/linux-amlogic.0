Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40427C25B76
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 00:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaNt6rHgKyij0dwrz+aiBM08N0y+jOfz8qwrNO34vOo=; b=OjTiyz+Z1J2odY
	E8IE9/QVdCSrOhnnpFuKMM3JjGviCLBQwx4JdHIheYUCRFGdNBaBgjVNCzKKFHG0V6r+r+HqUr+O4
	DJyfu5XVIpzjEauJWgSskhbXAgZGZ1MzSea7hWUtBaiLlCqk/WtowQZysmDbTLRVn2jEbgG2Fll70
	btGzBJWIndi0mcH3mCP5XMS9MzYCLDyfJXFWHj/rLLnhTa4/bHTDRa0pBtmn0oirgP9a9/gKI7aCL
	otnLgM9IYgXN2ey+rtpfhXWhu3mFYN8fFcSxJv6YUsC1UlcYbLyq1vH15FhhrPJW6d2R0zxegMtM2
	npXkigIyG202F/SVNbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF157-00000007yXJ-2kDz;
	Thu, 06 Jun 2024 00:34:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF154-00000007yVm-3dey;
	Thu, 06 Jun 2024 00:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E85E461492;
	Thu,  6 Jun 2024 00:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520DEC32782;
	Thu,  6 Jun 2024 00:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717634053;
	bh=m0r5W0VjsS2kLZZU03Axuz4ultnH7JPnF9siiZ0d0TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5JNv9tdIuEGHFhQxoSBGim1OynMbSGQIbVQug1PKEGppvqN2xHOC1LNyWYzISMiS
	 IX1jijNfw6Lmx3YK3hQGiYWCQaP+Wnhq2tUvrUYxBWYIAvtiamqc3Iu4bQpdTtTFFp
	 sPdU+Vbzx23eSMmzGOM91Urj8Olm6WVa5FpYTDy5KHW4kj8ufEvm7KeiwPGHvneUIa
	 vU71z4+zbTTiDbwNZ72DSZ5JhDtjqc6MAsriHzJg7jPzJY21sXfiLaIPbi9qE2HLnK
	 tbib7il6J9rU6RudRDAKrib7lqLW8WtcEzLhPSuwOf5rA+D/wtQI00LPXF3JORAeoF
	 niFBTLv1INs4w==
Date: Wed, 5 Jun 2024 18:34:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Olivia Mackall <olivia@selenic.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] dt-bindings: rng: meson: add optional power-domains
Message-ID: <171763404853.3520126.5459259781285680481.robh@kernel.org>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-v1-1-0a55a7ba55e4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-v1-1-0a55a7ba55e4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_173414_998908_835135AD 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed, 05 Jun 2024 11:36:33 +0200, Neil Armstrong wrote:
> On newer SoCs, the random number generator can require a power-domain to
> operate, add it as optional.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
