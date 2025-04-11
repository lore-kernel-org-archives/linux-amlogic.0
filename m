Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5312C369AB
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 20:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIeBG8FQDSHLJje/wi1I1wxm96jkowrasxuqasF2Gu8=; b=teq5RSsjWe34nR
	nbbF0Hhv4J5ayJMltxLoLxNeMCrszKDwsSlpvCxx8jLWbwE7JO203M9sew+2D+li1eQHR+T1AniNg
	G01UvyHMmj+eL1lumyVu3RCKHu8TVu07ryVKQPhq+STMuPjWC19YupY8/rlfb0xS92MoolBOGs2zM
	mtgBkBNJs8hCMJBGLDYzUGo3tBc4LFI0iQhlYBVCp7xvbP3g4oK7iJbtM75f7s3VSpP4i2X571qFO
	UfBqpMoeiGnHS/zpG/06fFEsjluCfLOjDhnvzDRJCA82m5NE3V1Jx8o2v0B7fcTcvpPyoxCG770xP
	mX4C2quk//LJNvH4byjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LRK-0000000EsG5-1f5I;
	Fri, 11 Apr 2025 20:57:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LPn-0000000Es0u-2Dce;
	Fri, 11 Apr 2025 20:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D562A4ACBA;
	Fri, 11 Apr 2025 20:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21CCC4CEE2;
	Fri, 11 Apr 2025 20:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744404954;
	bh=7Yea2VHeVaxxpx1gRMlkSHhWtQIBVwXNEO+gJfxR5hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb8hCMsbiyAJoGDvcWgHjoGpFeBOSEm5SL7UUSe0howM4JakJL/osjiD5WxVW/oYG
	 k+8ZE/l3t2wnZPwuCkjkhXeBRL9+0ofKjsajluPJj5FCWjAST3DRnz/EsJiV/nTvNk
	 XkLh4bHkJEO3fLfKqcIl67yJVTPv44igRSFSDiMnmFmuPVbWPlbyW65YZei+5RK5BJ
	 l4h9bG2Mwo3lrIWJ74D6k7NqQkZB5xp2FXpliT8mzKT0mI4tMet58DUnFj+hYuD9Sw
	 gEPDzSHqy+ey5d3tXdhyDs1RmanRZERIZQo93Mijnbk0hZCjIpXQ+pnq320EqCnZ9K
	 tgO8wGi2opQNA==
Date: Fri, 11 Apr 2025 15:55:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/7] dt-bindings: soc: amlogic: S4 supports clk-measure
Message-ID: <174440495251.3987380.11524726650702785542.robh@kernel.org>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-3-cb46a78d019a@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411-clk-measure-v1-3-cb46a78d019a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_135555_626168_BED962DF 
X-CRM114-Status: UNSURE (   7.94  )
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


On Fri, 11 Apr 2025 20:42:45 +0800, Chuan Liu wrote:
> S4 adds support for clk-measure.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
