Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B594EC2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QseCxXdeEiEI+mvTpiJu+DNVAq0IV6Xet1dma54qbIg=; b=q49q5wszgzYzFb
	RbUaOR+g7dgVZbz2yABYBwlfM7VJ0MQ93Ir9z0tJTpXs9XW3C5KIrdlCOZVLme5pKwxBYNdFv6bR6
	Va+UnlakGDPDpNEgvcd2jqguz3M2zDuC66fUupOlsNu+IyYnuU6K/ix9rbRxFVa2CIoY97f3NTEV9
	766GPJ/bWaQptxMZwRPMUrjisZ+AcSvBqCflZ1U9JwvHAyU8ccMFLbp6p0MheQU5d6tIlMKl3KAT4
	1GXnzXgO65/yUfHUNSG5ma6WVCKOAfSvqkOx4AJShPTkXFAVaf8qRFLFPnbxxiUQcWPFiLuWGrpi2
	8/jscL49QePbAFact9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLewy-0000000G0lT-3exo;
	Mon, 24 Jun 2024 08:21:20 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLewt-0000000G0jN-1rxa
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 08:21:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ec52fbb50aso23457011fa.3
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719217274; x=1719822074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlDb4mi6NTpX7sDJc09JrhEmbwE1hAUanv6O8UAsVHQ=;
        b=osmgIxT/swoTzSbA3bGQyHALFwwDhtUGrdfuAj1j5D6bq1ngPgpRQkvpcFOfjLyisI
         fzMTWay8WNTryoTbBhuZs+WSu0+wF4wfMP9Z4JoLeNooze7Vg/1kDNJ6vKykciGwR9TJ
         x1my0Gqx/K4zoDlZNPtSvzNGsMRsW09QKFCHB0svZ68y5ThwmBHdoZkXSsfGU/enWj+q
         PDkxpwE1ait9Od/yxkcwn7oAO8IZl1F5yudkIgjk5Uc+4p/d6kKKJeAJldsroImO9gu9
         HzCCqfaPxr+QMNap0KUdRmV4odoV8t8AjISUb5Oh6s6+V1+NS0V3Dz0m/HOSwo4QO3Rd
         0dHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719217274; x=1719822074;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlDb4mi6NTpX7sDJc09JrhEmbwE1hAUanv6O8UAsVHQ=;
        b=oW0xTC0JKWni71N+FyKepjYc234d7pXLUibD1P0UILq5nz/3TbtRa4bH8ChiZ8X5UK
         9SAh9B+PC8h146wHU0WUJVM4GG+qXSzuPSVhwdMS6PDNGxHkwoPrMlIvN5N5O8V2qxxY
         vFH78U/GMqkeLH1d7l8pALBWlwzmfNgsH9bP11+GuH8CpUwMPc/DexK/fgbAePBJhIl3
         LeQMuqJ139WlwuQQiKWzg+wISK8ANcd+pKPbuBt1D6XIT0ms5SBIHDA9pB1HcZWjxIR/
         JTVxn7KWb2wTPi/eGN0jWlIvUffsvFlrGKgeOT91KYJrksC0wl8pDtOC1aqmGafnnihq
         CrNA==
X-Forwarded-Encrypted: i=1; AJvYcCVpZM/8epxWivxup8Uo9bFv98VCJ+ArnTH+1FKRAqyGyawZ1T5VCUe3EMcOF8s5uSk3aDy7FeY74GMoW7o6dIEPi/D7FI6q8v3v47+QzApmx7U=
X-Gm-Message-State: AOJu0YwLd+GGNRuBKAl+YHnxlKt8Jl/alqrOO6z6IljAHCb2vUPdDedD
	JlK7AdkKc2l28SYSekRKwzSlGgNtV0/FyzPMfeXoQX5kw3vDQVBYEtRxKGgUbg5SJ/vXESeMYb+
	M0G1E9g==
X-Google-Smtp-Source: AGHT+IFPKBuSxSa24ffNl0qmiOjXu2IewrcJ94Gg7qLXnxIIuPS9D7LNMxJIkCRpfUF0FuMsV3Vwkg==
X-Received: by 2002:a2e:320a:0:b0:2ec:3d74:88c8 with SMTP id 38308e7fff4ca-2ec5b30bce2mr31274271fa.18.1719217273323;
        Mon, 24 Jun 2024 01:21:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248179d8e0sm132450205e9.3.2024.06.24.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:21:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Sam Nazarko <email@samnazarko.co.uk>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240622135117.2608890-1-christianshewitt@gmail.com>
References: <20240622135117.2608890-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add OSMC Vero 4K
Message-Id: <171921727248.3499124.11397122409029609758.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 10:21:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_012115_544929_07C0A382 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi,

On Sat, 22 Jun 2024 13:51:16 +0000, Christian Hewitt wrote:
> Add support for the OSMC Vero 4K Linux-based STB
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add OSMC Vero 4K
      https://git.kernel.org/amlogic/c/7d7dd631d1af471a6c909e197be2ef3df526d00f
[2/2] arm64: dts: meson: add support for OSMC Vero 4K
      https://git.kernel.org/amlogic/c/5feff053b08ce5d2167b9f44bcea3b466b5a81a0

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
