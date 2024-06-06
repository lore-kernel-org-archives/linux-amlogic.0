Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9D3C27C53
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 00:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcldsJ8fzgKCv/+enCZm/OEMu1otakAqgEfRRZf5M38=; b=uTeyExPaL/A5wH
	DzRcZiYA9adS2Rj5A0fKMfM8aRBl0KO0emFTLGTZbhATOuhRF7m+ToUXtWzL3x/oRa1IeBHcF6frk
	NhPUb+8Okvy/OBVmh86vqRjrdjP5PllSJYfCycKst3xrCaQ3GtXk1zhKRNoCWUWsk2KW3Fayn6t1d
	t5YOi+uIdVYhgGGZOEXTAfsXKuHTIv9tMg3W3pU+1ljqeQcsY03BX+KdlCs4v2q5XBKeyLP9dEz79
	dyPjxkeN59iZi5hyRPMMljx6UibWUbXrEUpFwBtEKLCspZsYLe70v3IG6NzLfaTgjBRdj58yWt6R4
	cKlSxbs7UkYV0ZbpOFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF14V-00000007yJJ-33pz;
	Thu, 06 Jun 2024 00:33:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF14S-00000007yIH-3cYG;
	Thu, 06 Jun 2024 00:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F217CE1901;
	Thu,  6 Jun 2024 00:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72639C2BD11;
	Thu,  6 Jun 2024 00:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717634013;
	bh=56qUZqP/b9o5DLhPAmeKSWqAvPFqXnecS90zH8EEqvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6ml0GK5ln8BzDQqNTUhmFXOlKge2R+ZxDTU1gpyOWxj7gGZbShGTGL1/p6yczmuu
	 MuNpPaHlO4siG4s+uqlzmsa15hrL8J8XDoPZBqKEGjmOGZ+om1+W/VMrarYKE3tTyp
	 kZkCAfqLa9Z+Y4HqiMBDCjMNXfx6o5p3nqcyFoCR2gV7qjdjmIXJcvCYyRKAEn1ZcO
	 tb90g5xhpDatlVKVzZmAk2x4+gJQxWBrR7akawDsNmOtssCeSfvbEUgk2TnSy1lk0E
	 FDib/zdUE0GgZ12jUT8qIi1Wq8trXGjhPdB30msXlkji0SL5n+lq2cQI+gB98zaNLl
	 0/WzEJ9G4wkeA==
Date: Wed, 5 Jun 2024 18:33:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: nvmem: amlogic,meson-gx-efuse: add optional
 power-domains
Message-ID: <171763400890.3519005.9651126174187029952.robh@kernel.org>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_173337_209983_024D4C55 
X-CRM114-Status: UNSURE (   8.55  )
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


On Wed, 05 Jun 2024 11:35:22 +0200, Neil Armstrong wrote:
> On newer SoCs, the eFuse hardware can require a power-domain to operate,
> add it as optional.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/nvmem/amlogic,meson-gxbb-efuse.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
