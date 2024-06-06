Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEB1C27C53
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 00:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knkAHwVsO5hPwF6n5wi7V3qpN8xAljcezX2EqgPTLqs=; b=jtPbJy/KhQErmo
	sU7qqMLUu+b/mu9K/yM28dgx/eYA/kUhFgYLVNlFNBfufHL480ulZk0bYuK2R+K9cKmVgdJ9pufxk
	yx6ENgUu2Sasttd3KOpu02l54TjRjT8oIoYjSrjwncD9Ex7PFtUNJ/8BFSMm2ir7ZbPE72Ta2qUgJ
	HuLGM6hwuxK6S53HrnllbLjE5wYsqIz9YWp4EEvlzF666DR+n57hOJoDnyQKHWefccFy4NZF9/SU3
	bleQ3SBn0z6+XpWs+Lug+VLNS2lzpr+Z3lslVHi+sWRpUrsbl6bCAnxufGRmoSYp0OQ/0dZrBMiiw
	uCtcZtqleCbQ4bEQxMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF14C-00000007yCv-3N6O;
	Thu, 06 Jun 2024 00:33:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF149-00000007yCa-3zBc;
	Thu, 06 Jun 2024 00:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD0D961218;
	Thu,  6 Jun 2024 00:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE93C2BD11;
	Thu,  6 Jun 2024 00:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717633996;
	bh=WQF0gHP8Z0+bptDb1mHSImhPzB/SQ12M5264wKzMY5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLgHCFPvdj12ouyCp2nhTERThnl3msBGm6S6R5Glz4n+rmeMjnM+Ofv7AXjMVRFnk
	 T3BPG9OUGwYxO/yspQrFZu6Ql+3bi+yW9rDNnpa2aTa9jaDsflyriLNeWZTSFt35ak
	 0Agw6hO6zC/TWBLNXhllP5TgOuIbRTyc+W7gwW23Di9jE9vfpGE2/coDik5fSQ9MK+
	 HuHjnsjYqPjTeeAUqvmjVu4JPUkolyX0oOMkUtgW8q0iS4cLAjAVH2+7oWJaFhXgpO
	 Me4Sx7E6+X3aiR9qh3i5jrHwfpkWBNUiigmvLmKU4W8uEvvD6SBEOcH7fXrScX2O8T
	 I0c+AF5sb9WMg==
Date: Wed, 5 Jun 2024 18:33:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-mmc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: meson-gx: add optional power-domains
Message-ID: <171763399122.3518466.10613163286977063987.robh@kernel.org>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_173318_058998_68DD03A0 
X-CRM114-Status: UNSURE (   8.65  )
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


On Wed, 05 Jun 2024 11:34:46 +0200, Neil Armstrong wrote:
> On newer SoCs, the MMC controller can require a power-domain to operate,
> add it as optional.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
