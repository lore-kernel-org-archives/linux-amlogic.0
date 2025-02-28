Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301BBC282C5
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 22:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8AoEvKl4UH/T2z2feUTcTHfFaRlwjujsFZH71hH2oI=; b=up8lgRtzUxB3Ja
	VNfmWsJGr8WP82vXhaBW2teYkP/iCUtx4fuKMkcHk5Y8Brq7aBsC6YznDe06N3MrmD/gyIG41cSDe
	LQvrXx1iV6wsxB6otL8JmebqMUf12VTSw4Oa4uX3F1oBhMM/9/11tVucAhywwffq/sfLXeHA4Z+tr
	cIUEA04bt/UthfYwfVzcMpn2QTDuGySvyPrsWGIGuXfEjXkkNV+wpKPVdHZ62uqcRq9H0WanQ3imp
	nmr2Nw3ZHKggFTDtetbrw+KsktvlLKM9lcook9Qdtj3uyBr89a3X35uidAQ+cqxF6odFZspAQhTaC
	ldgT813yy+k2GOMBi7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8RI-0000000Cnuc-4899;
	Fri, 28 Feb 2025 22:02:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8IF-0000000CmVA-23Bf;
	Fri, 28 Feb 2025 21:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2822B5C5BCF;
	Fri, 28 Feb 2025 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B09C4CED6;
	Fri, 28 Feb 2025 21:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779594;
	bh=vYi1mGiS+7/01/+oN5mP+NkIR8gD/X3Dati9GNTQoD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk7Tj5YHRqU292yTupv6Yb4e0vYzpQ6QXvvbuAFptKjGEmtQmVgMXr4NXPH9ZOgvk
	 xaRQPaKPUjidd2+KbC1kFymDR90knzNoSxlwzZqgbHbNMKQeZIE8MIYQaSlbZlpyBh
	 GDhu1YpLU/INurNIqvDGiernot51ozXh4WsUqdGNFwQI9BMedpXVnlo51QXeSVR1lr
	 h6o2BH4tfYuOUPy/X/zZYLEMKn5mRG8W1elJxgyrl3fCxDukNQE5aH3buGxe0+Wtr/
	 oJsbgjvQDZqHW4YaAgYHWsaiYKXBazgOYZ7eS0LmF3jOa4f02KgHZB6Z6njIZ6BtQ9
	 S907/hx+MssFw==
Date: Fri, 28 Feb 2025 15:53:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: jian.xu@amlogic.com, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
	linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	shuai.li@amlogic.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	zhe.wang@amlogic.com
Subject: Re: [PATCH v3 2/6] dt-bindings: clock: axg-audio: Add mclk and sclk
 pad clock ids
Message-ID: <174077959192.3759834.11760233362510893380.robh@kernel.org>
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
 <20250228-audio_drvier-v3-2-dbfd30507e4c@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250228-audio_drvier-v3-2-dbfd30507e4c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_135315_566995_C3FF5082 
X-CRM114-Status: UNSURE (   8.28  )
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


On Fri, 28 Feb 2025 16:04:10 +0800, jiebing chen wrote:
> Add clock IDs for the mclk pads found on s4 SoCs
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  include/dt-bindings/clock/axg-audio-clkc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
