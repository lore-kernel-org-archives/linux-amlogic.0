Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90715C83F1A
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Jul 2025 23:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SYkCL7+ocq0h+FcWYcNhyVCujppVcwE8XyCPWtpuCKQ=; b=Nk69FQH3mtKDVd
	Ix73TnruHDgVY6iBQHTiEVCeeUcnIsLw5jUn2lntueES7Ore87ug+8sFWdtaWHErTNKKaFVoe4aIq
	nIqkysURkQTrW0YVhGt0ERJglXGIrpyI9W+K7JX92sxaOSl2WI9pKuc9tWANYHYRdO3tcQ79FGrS3
	i0/7n5KtdjQD89DmCnzWJWPTu5cY2fIXLnJ20wCbW1P28yHbUalTJJwYoMLLOLQJ6fVEGy9iXJftz
	0aQ+Nz5nTDSB9iKlfJDCnYy7897NgHnZhiHTwtBD+X/cQ4lhbqmrcbspE3o0qI2TYPmCFMTFYzGXa
	NNpx2FjubQUOO7mE1zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddW6-0000000Fpjk-378z;
	Sun, 20 Jul 2025 23:32:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddU4-0000000Fpcz-0jtK;
	Sun, 20 Jul 2025 23:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47B7C600AE;
	Sun, 20 Jul 2025 23:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6832C4CEE7;
	Sun, 20 Jul 2025 23:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054219;
	bh=Uw7o8viWBAcFgkSMOuAiVgFI/VtnomVY/vJupcJsJDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYQqNfdVLiBlC1jA2b3qxIWsp6u90rsBEDuUjDPEHnL94DtSCB2nZoGUKlSddRA4O
	 fb5bIdp9Qvh7LfG+S+KXowgIt5GZyPSbyVu2WuEj6IJhUz8ngWaYAzUChgWr/HAbx5
	 XMru6fVsIDIFIj5Mikj5O7uOXyg0auJKIQA/X1of+9k4keNdrFtR30VORViU60IgGA
	 khqGRzoccntp9a/fYdOTBYpSVwrFaWZbAnbXD4jt8m5/VHQj42d+2z9DumCfEuGOc1
	 i6T1c5yaTC2mC6cRMq6h36vDrZOiaBWkxZvGrTiIMjB9uoVvUuboTEYvgJkmpalZL4
	 c3I8xZwYgkvqg==
Date: Sun, 20 Jul 2025 18:30:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: amlogic,a4-rtc: Add compatible
 string for C3
Message-ID: <175305421760.3067874.9815406474339904105.robh@kernel.org>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
 <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250717-rtc-c3-node-v1-1-4f9ae059b8e6@amlogic.com>
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


On Thu, 17 Jul 2025 17:38:37 +0800, Xianwei Zhao wrote:
> Amlogic C3 SoCs uses the same rtc controller as A5 SoCs. There is
> no need for an extra compatible line in the driver, but add C3
> compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
