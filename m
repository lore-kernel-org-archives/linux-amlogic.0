Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C709AC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHaRPpjE6+/+Q5/sYRkNQg7rZpcukJmUTgatjNXUbBY=; b=RJ2qiPxiCg0k2X
	gCpGMDQicm86YwjJalTO7nFu00ehBTF0QipMtZ4AVF4v2GvPH50vuzDyRPPWAi3AJIG3Gu+1M+xDR
	rjpD2nM+wmRjM4Q5cHTJwbN90AIp3IMZx+2mSSDewPMqTwOiPm+03Tmb7SuikcExvfrF7UQMRQwnY
	AiFPkbilZWQuwZf2qSC+UNtTiuJnojwKq5uAOf2PpJAUhs5lyNlMeMR2H9t0F8bZi/y4XtqyNsjgZ
	Onm1Hn4sqCJy5WErVvA/OgxZaBjiigiOvnqSNCcfICeQ1dGOd46m4FA12DoPXzR9MKEIQ0XKyiX1B
	BvUW4+qdaHtn1dPLCxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzitC-00000005p89-1Kol;
	Wed, 24 Apr 2024 20:06:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzit8-00000005p4e-2M4z;
	Wed, 24 Apr 2024 20:06:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECB4360F38;
	Wed, 24 Apr 2024 20:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C641C113CD;
	Wed, 24 Apr 2024 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713989201;
	bh=3QQAIZ0s4nvmQ6DvzguWJ0rhp8Fhy0GLTpNHl1lPOLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQXOtZW38nEGkTLID/XVwTTx6OIgTzHTdTnMfP9XE79DnO1xhe9xW/IKwLFKAi71K
	 m55CT2LM9MPjQw8QGtPOa+tj7rTQwchVkLtYqt1uWEr7AqYFAmx/obA8atSrOJTyw6
	 zrKsXAYYzQmV2kI7v0fnZyGMLb9v6JQRv94k90b6tM8vNBVZ/JHfTMTtD1N7jcqLib
	 nxUGE93x/r+52RJd8OipeQhLr4cy5SrRjVl3X5Z2saAaOp+PLqga+r/lbE0eBwr97h
	 /3ZxiN05xZcvCHTiu9j9HlVIgT9OjiEubk4N66DmW4L/rqNMEodCW6XyZWi7VWipGq
	 1+1CCPrn4z+qA==
Date: Wed, 24 Apr 2024 15:06:39 -0500
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>, linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: clock: add Amlogic C3 SCMI clock
 controller support
Message-ID: <171398916736.412339.6884561050040801002.robh@kernel.org>
References: <20240424050928.1997820-1-xianwei.zhao@amlogic.com>
 <20240424050928.1997820-3-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424050928.1997820-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_130642_688904_98B2862F 
X-CRM114-Status: UNSURE (   7.44  )
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


On Wed, 24 Apr 2024 13:09:25 +0800, Xianwei Zhao wrote:
> Add the SCMI clock controller dt-bindings for Amlogic C3 SoC family
> 
> Co-developed-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../dt-bindings/clock/amlogic,c3-scmi-clkc.h  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-scmi-clkc.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
