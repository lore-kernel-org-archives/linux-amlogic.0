Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069026085082
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JAL9WT6U;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AigV3d00
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YpYWuO9zqH2LJbV7yP5mii+3b+LgLeEfA+JcI6agQ9o=; b=JAL9WT6UiVfH0wwODs7B/p3z1c
	bRtnRI+3Yp7c6XNifD1ClUCbm2Sv5zUCeMj3dvBRHMCV/M2FIkh4D60L5EcOp3ge/YwQZwl6FBhP0
	nhJ6lqmVkRZEU8R0PlDIfRb+5Ovgo7j5widHQ/UIHaXEYz35KNLTlhM0WA0v9Ex+3MZdQbUe95mQQ
	B3w5oFmZyDnVIylddNprjTKPqWuyc50FyO87s9JWFdOWte8wST3GCwZT1HS8rDDTBIR10AHHnFVko
	fHxRHtboZZhQcBMl3BjRY0Ial8qU+xZ78RgrlremDnLZI73csTVVVXDospBnlBC/Zixj/LTkQIIH3
	jEL+E4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDX-00000001q3s-33d0;
	Tue, 03 Nov 2026 09:54:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDU-00000001pyJ-0TCD
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a208d93758so42083565e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 01:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699646; x=1794304446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=AigV3d00JugOR+blqYj/YzJSDZ8BdGB3h0pyfUs0ghALbg4nhJlReTFaU8BeslnnkC
         NlzlaGgNFWzwRlvmVGAzT5UoI8/4t9eiFmlSyU2ENBn5NWkC5bc6rBaulIudhC85xwLF
         GYqYXbXaKF79PUuggn5u2aqziXPMw3sLVUmpSrzEpbAx/i5fxhFP2qZSFSW+VT37aUa6
         Sina9eaGsAzc3O+HV9LujKeGUlr613CobfMIRJ42hFnozHnu8GjGfzHB2jONPCI3TOLd
         Ij9vPuTzf5tMJIgCt3DF/AqsJyAphys63tOBfAEh0NnZFbRpxzwLTnzFrtchiC4x6a8R
         N1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699646; x=1794304446;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmeJDP7nY5j/d5FDgC1rx0K58n3Jyjico3gyKAggCz0=;
        b=rUFG5bZ3wAaaIWedlcr7JPm4BkYmwvYqw9f+FW7rI3EpzaRXaQW1GX34kdDaBld2CN
         ZNf3WQgfP4mMBb5xMgZjwJRX37+Re6O9mLV/etnR6QkqklmZuN1KE25f3LkxMVYcMn62
         kFQtZ/MCTvFyDo/84fKSuCU/ti2S2NPHmQsh0/QGSTMy8RXJL0lk+QgSkWCytGleVnER
         shtXJNLeoRsklNrXkqkfV066ZpZOnDCSrQqOoX0OLVdjq1cF5tqZEL6I7YYQVMviOe/v
         S6bZDkzlicgZLXjePxvULGyRQIMbP8IAos8TqanFiLZZbah+3BXHsWI9+OitjbJlH0NJ
         8lSw==
X-Forwarded-Encrypted: i=1; AKwUvBxvdbpKtBZsdLV61/EF0dcZHt7YdM0DSC9MrBPBN2KCYK5MxmWncALUN0yESlMESVQ4FwWKGJVlkPKSDpmw@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ki7cxI73ZnJQFKDCs8XDLX3kunCEEUP4lHKEnHSP8fvjjNL8y
	4TqBBr6Nbi6uCYJVdFg0EJ1E/M+zHxa9JDDpj89DU/04MSWH9wWkxR9RboE5PJHmucM=
X-Gm-Gg: AYBFou2tOQrBG7NqrrX1gJ4pDlV9ATM23renEOu1VqNQ2FgFN8SVDF4aL1+H4ieMQ0z
	E70y1UlSf5rQe286CS6+rQaXLW50JDtN3m3BBxe1JYOhFD4h9fC16a5ogD93bw3edr1GZQeFZxC
	nPV5E7IHIe76fhEAsIG/BYAZ3lGF0Dr3t9179lx0aI/MXMkECfIw4qkFAP23zCLq0sGgak16mtt
	iRqbN374ZSmjreJnPgtFndWyiDGt5PcBryziEKZQ7OmkIT/wAc5bKzy2Qfux7q/hLMCHvRzJ/HQ
	o8BkmefTkqdzV4sDivHuFBiOu4UR8CG+waXH1RMmgdSFvDlpA7fRj32y8dN+NB7awXlpcqAI1tR
	0jSJ8dDan3rnY3AjceRbU21AZKtWwVzjMK5qQ2fo0l2fD+r+pJW/eWFzTD2nHzkJyG1dBVVFJcX
	OALZOEAQh/aH2JXtGNkAr6IEXfhqmTHI5KESgH5rEFnq5FUggZJqAOe0nSFdtBXWh58NI7tB7a0
	s+GmBOvlemoDrRl0XTMUSKcvIk8Jobis7gCEF4RZnFqp/dxkGkEcPQ7cKCiIDh4m69UQYH7V9a5
	D4z/o3CTv9/gQu3MghPPy72wQa5NDOOXk0arONxXmTKQumbAvaxneR1hnVp4t5p3ifLpqVA5
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr284036325e9.22.1793699645988;
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC
 address and LED properties
Message-Id: <179369964538.2330120.3831399405443215739.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015408_173769_CEA8BA6E 
X-CRM114-Status: GOOD (  13.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, 11 Oct 2026 21:31:39 +0300, Fil Dunsky wrote:
> Two small device-tree updates for the Hardkernel ODROID-C2, found while
> adding OpenWrt support for the board.
> 
> Patch 1 wires the eth_mac eFuse nvmem cell (already described in
> meson-gx.dtsi, but so far unused) to the Ethernet controller, narrowed
> to the 6 bytes of the address, so the kernel reads the factory MAC
> address itself instead of relying on the bootloader or a random
> fallback.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      https://git.kernel.org/amlogic/c/06c71037627974652c08ae107032d7459f1bb0c3
[2/2] arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED
      https://git.kernel.org/amlogic/c/94dfd6641686dca8d49439896efe678b47e05654

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
