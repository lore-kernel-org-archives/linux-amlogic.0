Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70F0C282EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Mar 2025 16:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JlryPMB0hUWceffVMoE9bDn/IYMivHQS0BDnsz2lzPw=; b=iJvZnsoOtc5+w/
	Ln4Kd8Qlwl/4itQnPmDZJBd0EBW8u4sv3P7UDkeX5va+WecQEutbMD1qOhzBLjEoI/rVyuyLpkSES
	YJbPvukfunbuNfGSAQyLHvoksxXWe5n/ola1G9i5xADaYYjIxoularKsB4IC1+yj6nlxCbHZcq6lt
	R4ZjneriieVN0T0lg07TfpAfwebNSOckBgu9JPkrm0Rgh+Y9IC0pU9exCdpf7pRhsji0VKYdtWSn1
	+4l17U4w8mAOU2xLDd2oSkGBmouGZdpqdW7UI+KrLGYRSUVK0a2uJ8+ISvtikuY8t/4Ew126Niqd9
	DkjZvxNit3xADe0Gq/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDK2-00000003KTe-2cJF;
	Mon, 17 Mar 2025 16:28:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDJv-00000003KQk-2AJz;
	Mon, 17 Mar 2025 16:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E0AC5C3EF8;
	Mon, 17 Mar 2025 16:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F584C4CEEC;
	Mon, 17 Mar 2025 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228886;
	bh=ZVZb4jCcDrvXrs/O5aeyNMWmVf2cKnbebKhQIZUZXQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epaRQui2CqqpUPQ4zQJyNTEAPsH0wAdW1pYN0GnfYnKZGms/3cwuiLtsc1E7H1fgo
	 XUBGTi6HbHJsokqR0MzUjhN3ScQ2xtgIkR1Q8Haq7nt1HRr0CLUf2ogpLjR90Xiwqw
	 hXQ/sgf1kg5WvgXAEXdBEjEqWoduwZNT/0j6G9/RYUT5k4ib/bWaYex6lCsEoNijq6
	 HzpEp5xwShv99Df2AQKQi/PZ07a/bjkOYtfI8PcAFQv3SJVijxqyToxiByIVv800WT
	 uPHaAKKdND/E0AZaczrE5QV5QKuWShx7ac3P2NqdJmje18UfwF7FCE4iOJLN6MlKUV
	 1OqeDE6qyCEAg==
Date: Mon, 17 Mar 2025 11:28:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: arm: amlogic: add S6 support
Message-ID: <174222888470.174842.6381740588460152313.robh@kernel.org>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <20250317-s6-s7-basic-v1-1-d653384e41f3@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317-s6-s7-basic-v1-1-d653384e41f3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_092807_593561_92796FB2 
X-CRM114-Status: UNSURE (   8.16  )
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


On Mon, 17 Mar 2025 15:16:52 +0800, Xianwei Zhao wrote:
> Document the new S6 SoC/board device tree bindings.
> 
> Amlogic S6 is an advanced application processor designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
