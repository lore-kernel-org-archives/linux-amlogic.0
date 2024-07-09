Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A4C3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E13rbKvZ3d+VSfM1N9WfMPf2az//v/ZQokomxBxCbmU=; b=PzH/M7zSaIE9qj
	RYhQGXBIKBXDxWysR1mPpsyKXYR5vTcNf74nVeesrs+8gPnnX9th2m0zauC2YRi1I363iXLYKD/9p
	iGAMpdsb0oiVk/iZvtD0+zY4X2fLEkk08AQ0QEk9iLEZWEc2pOkAap4EzGHRIc8d39lqetbQMdSop
	x3hhvY9uNl6C0JBcRcGnR7oW4Zbv61BNm13flL/k7JKXxqfcrCudTwHr135ScGLjxPFgG9bsjrTE6
	TwfOGUdFmSUAPL0GgW/kwFFH6ThwdCX+bk9MEWezY6yhJqE0Q7Qtzstcy92B2XMH1fwjWvSOqfcPY
	YGWHG/VmQZijz6ckrMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCp5-00000007kvz-0J4j;
	Tue, 09 Jul 2024 15:32:07 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCoq-00000007krR-1bD0
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 15:31:54 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52e976208f8so5840409e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720539111; x=1721143911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHpq5wMNrD2/hubIXHOBObHVSlKgS/wJVizku6aE47M=;
        b=d2LBVP5bKATJveGiOaQtrrK3OmM4CLwkcOHnzKF5Rtpsf67BEhDLU8jtaJLbDof4lQ
         ly7xTqSnQN64AmzXiZ+L7rgi0Uoy+bwNlTLOjyQ1qg0Agukc0KYaxnnb6vekr4RXBpBz
         3SQAo2fsU0ClOQGacN1cOdSbUuuHd6aCsI62//6+wM5m48vFMo7X81EoLsnRTeYzLA0f
         n+qNtYtRwF+sYKL2uZ4k0IZPtfAurpxDs0p/JAnWbnprwJz0l7tY2iQr1HIZpiENGMy6
         Clp2yGol5Kio+pG1XZ5gg/tijpvCerWVFQ5/XDSs2AsT8x4CLBPsR+cJPv+iSS/H1Pzo
         xlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720539111; x=1721143911;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHpq5wMNrD2/hubIXHOBObHVSlKgS/wJVizku6aE47M=;
        b=ZEhVCnf4Lw6UrLM0VremxahnOuqPt8WLEJ+TswaIIBMNLYA8HRftyZf7Zs/41mE6jL
         7IemSs0DXQehZ4am3xSqGN+pvwDxFaMRAYhSROdpcyQ8ojj9S1nJI/Hrc4QMs3F+S/EQ
         jBDeRecOVA42ID/kB09C+ZA7SHDanxFY3i6e3SoX9YJbxaru4gvcediBMHX+HjWiP7bC
         VPOpH5U92wP/8t08kPm2MaOqFFrubqWz2zqlwLTEBpD+tZo2z8AOGeGuC2Si5RcaklcI
         HU0OPsN/PTz/TN+znSbcfS+/gtiHFaaCUVDH9mWD1ETSfxjDwG7I+zlqniBLAyDZeYxz
         J+lA==
X-Forwarded-Encrypted: i=1; AJvYcCWK7p+ih4th/ZRGn69si+nme5XCVKTcnAeXWA4vKLQItM2Cb/5UeeL30tF4RmTNMV+DPzd2IkjzxjtC/S5Q9jkBtDUKBSzQ8+EP96CQsC/ArO8=
X-Gm-Message-State: AOJu0Yxqsfp8JNt0v9oXdRCSobhr/7dxEmfVPnIGkvyfmBXKFREIRVcj
	6q79e8ktgLycssxZ0LJdJ6PJe0lQkcclFDngw1Hfndqyumlxw1Kmn319Ft4tvgs=
X-Google-Smtp-Source: AGHT+IHewN66x2HRe8W5Nt8NVnXoo8G3n2GpDN/d4haqMEb11yeCmND6FM7mgc4d6Mu6XfbF2ACV5g==
X-Received: by 2002:a2e:7c04:0:b0:2ee:4af7:d78e with SMTP id 38308e7fff4ca-2eeb3181914mr24259971fa.34.1720539110506;
        Tue, 09 Jul 2024 08:31:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d16b0sm209556185e9.7.2024.07.09.08.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:31:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240701165210.578817-1-krzysztof.kozlowski@linaro.org>
References: <20240701165210.578817-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: amlogic: meson8b-ec100: align GPIO keys node
 name with bindings
Message-Id: <172053910960.1180991.4934338719791810029.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 17:31:49 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_083152_490919_45A58C0A 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, 01 Jul 2024 18:52:10 +0200, Krzysztof Kozlowski wrote:
> Bindings expect the GPIO keys node names to follow certain pattern, see
> dtbs_check warnings:
> 
>   meson8b-ec100.dtb: gpio-keys: '#address-cells', '#size-cells' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)...
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm-dt)

[1/1] ARM: dts: amlogic: meson8b-ec100: align GPIO keys node name with bindings
      https://git.kernel.org/amlogic/c/488386d7ec680c8900f81b3fd7570797935bf1ff

These changes has been applied on the intermediate git tree [1].

The v6.11/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
