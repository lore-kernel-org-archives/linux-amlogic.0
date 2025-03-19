Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E31C35FFA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OesaYHJn5l9cJKMHgNbQcLyHNPYhk0D/aC9To+DHDfc=; b=JABTJPj4sDJ/6j
	n8KJgI/oIgtWsEiORExXfK8czOeKvMVYt9AFsX+hlVvsXqOnzM++t8elLuITVPfPw1WBR/Q3XmiBe
	VUx1xjk72i1i7Yu3GGGUKFcuQy8YOmbsIFnTykKIitTDC9T+AjsGjgtTyisqu/K3h5pY0/a6JUHc+
	birxwfUoizEr2kT2jERER/XzefDslKkZ0i1i4Xl9NEu09ej4PnooZDZZmrF/hTyvYsDQ0JR2xQkv1
	hcmHCK0fNp3t4RXMJigbzM4s/GLbrRJNoxmBlrwB+nCp15Pz+j4j0/bMyCWbCWt/GS7iqN5YYhCC5
	Jg3yzrjaPaHkUVdgs6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuoiY-00000008Kqb-2Who;
	Wed, 19 Mar 2025 08:24:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuohe-00000008KiM-3ZoO;
	Wed, 19 Mar 2025 08:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE636615D6;
	Wed, 19 Mar 2025 08:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D8CC4CEEA;
	Wed, 19 Mar 2025 08:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742372585;
	bh=it2hB6Qpnfpwmus4HAxB8waVLgv2/xDPUXA+bYmeDWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxgSgvvr+AxIdcW1pLBUzbPsszc6G2Jt7fN4hByJdp/Pvg/0qhNc8qOjIAihamn9O
	 K2BZN2WOY33xnEz+8zx5GE+0PLFWXsWVvmH8vrgrQHHL6xjEanXg7/26SBeOpeQ9CT
	 ohl0x28d6SfzHRjillUCsiy1BSHfdufjf7b4eQWwXepP4pZeoMZYDTZqZUlPCN1/9c
	 tdHcXJT3yVuPgdXUK5a9WU9vZ9HTdeV4TIkXfdaKnO6mwUVJ0dObx+qVEXMZDG62gb
	 U4s5FACE6LNofAfg32bhrFe2wPNYGvnARLhDoKMdieutACuTddYF46igopjHw1Rjl8
	 t8n29ob65S0Xw==
Date: Wed, 19 Mar 2025 09:23:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v4 3/6] dt-bindings: Asoc: axg-audio: Add s4 audio tocodec
Message-ID: <20250319-panda-of-unknown-wonder-236812@krzk-bin>
References: <20250319-audio_drvier-v4-0-686867fad719@amlogic.com>
 <20250319-audio_drvier-v4-3-686867fad719@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250319-audio_drvier-v4-3-686867fad719@amlogic.com>
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

On Wed, Mar 19, 2025 at 03:04:46PM +0800, jiebing chen wrote:
> Add the s4 tocodec compatible
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---

So you just ignored everything you received?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
