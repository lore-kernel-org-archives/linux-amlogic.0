Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E0ACA0ED3
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0MDfNLNH96n5I4+s9l4kgMcisQZDO8F6HrG5788Rrs=; b=OhiOOckQayyAdT
	H+o2YcrTZPiOqGCaqOAg554/z5P5qsIhmwfLAdAseqIXdCK7h554Nt+Pkcr394gWZNOOFfixQmSg1
	xkt4y+hzB7Gk7kb51ftykdc4gt/Nq4woaU3PK/A2kwT/rIU7ZFeUH8aJK5TUjOPUuEpGW0GgJDdiN
	sQQz/uVRUsE7pO/3fX1PEO6OuJ8r0lI83E4CQpuBBOsGhY7Vh4W/U25WiyDt4U6ay/pl7TGY7izZI
	yHexMtbmRKnVKAXpzE6v52RpZU9UJU7YtZUcpCfVyi42i7M3cb9fujVZIYXgqlU/pYARv87gpuoT2
	hEqjzdXVpGvIAVWhlP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2WB-0000000DXDV-21st;
	Mon, 02 Sep 2024 08:34:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2W8-0000000DXBC-0TxH
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 08:34:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42bbc70cc19so22319175e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Sep 2024 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725266070; x=1725870870; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+za/cAcdZ0XOTg3FDU5KvmgY/loVMFZsFxv5CioePC0=;
        b=nQVB6jHYOVeOqEQ56Jjv+T2JURPnDHkCnR5kMKwAh8I1kRZnuZ9WFMXmQPhLBFazJc
         knWRYGJPOYgE6D6U5/k47W2lO5rZrWGPXr5HDPtSKKiSZX1YpLXHfYbtgGcm8t16mTip
         opAk79YLjqm2URA4JmPDYEPLYQnEcfm92wmOWiTvFKL8lJebzby5gnC1OsgXLBn/BFFk
         Eb9II4XlT3f7p6vJGU3rMwnfJIf4vT0JvsXTIM+O30oc3AXNet+UWmBo4M6tBAw5mJiO
         B35Js14rw6WDwoe+dCiTMj4AFtFl5W0oIlmWF91AI/vgvZQD9qlqLI+iU1UmH7hdaLFy
         wfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266070; x=1725870870;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+za/cAcdZ0XOTg3FDU5KvmgY/loVMFZsFxv5CioePC0=;
        b=l34QTs54s6aBt0q8KYnJ02KL5ODbhIRoKVoE3js3isKJ8rU04D1QlFkjcmF43NM93N
         Dybzr5V4nYeKPoXhby6ombn+SvB8IutE7gcgLwryNFFLBcWb6ihSsJs9r87VseUuc1UZ
         D3RvEkgvuBTgqSYfXmdEu1x6gcQvEF7PT+pqE6IlpzvYgw21JUYuWDKZKSwLFJpb2i2U
         WSHIa5S4GZNQppRcU/T5AmW/FnRdPsXpWTpbwV6QAqQfeih8D9vG+vmlma0h2L9DiwG5
         SK2MbEnImNRg5AbHr8oNdcNrujyEUAuwx53Ynn++WVjcaWqz8gWrShHVGLEImlWr0zwT
         jteQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/XNGgv9IN8Ne7HrXDmuRIWSdthTDwl8ZbuJmvjEoXwdee8jy3QkbCtfQPoLaBzz8nL0pzEYEEQSaqtQWB@lists.infradead.org
X-Gm-Message-State: AOJu0YxJCOq8/iVH0E8dxY8ocZjHArxSs2/wzcHwuLY3h+5vYxGVEgtk
	UF3DdkBZaLN43YCNKHXQUrgJk+WZvoiQ3ouD9XEPWQ+Sjz6bQSqvj2hRvQ2R0Ss=
X-Google-Smtp-Source: AGHT+IFJUVovWbnX5nY+Y2YkBfcSM9FaAqLveWckf0TJzKcGo4CXWwjHWFVMGHxm8ScNSGaXGnfepQ==
X-Received: by 2002:a5d:50ce:0:b0:374:bde6:bff5 with SMTP id ffacd0b85a97d-374bf1c94aemr3336071f8f.46.1725266069342;
        Mon, 02 Sep 2024 01:34:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374bfbfc7b7sm5807456f8f.88.2024.09.02.01.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 01:34:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20240902-fix_warning-v1-1-037029c584fc@amlogic.com>
References: <20240902-fix_warning-v1-1-037029c584fc@amlogic.com>
Subject: Re: [PATCH] arm64: dts: amlogic: c3: fix dtbcheck warning
Message-Id: <172526606853.2176850.7789984946561002736.b4-ty@linaro.org>
Date: Mon, 02 Sep 2024 10:34:28 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_013432_238561_2E5B9A4D 
X-CRM114-Status: GOOD (  11.60  )
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

On Mon, 02 Sep 2024 13:29:39 +0800, Xianwei Zhao wrote:
> Fix warning when use W=1 to build dtb, as following error:
> 
> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning
> (unit_address_vs_reg): /sram: node has a reg or ranges property,
> but no unit name
> 
> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning
> (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a
> unit name, but no reg or ranges property
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[1/1] arm64: dts: amlogic: c3: fix dtbcheck warning
      https://git.kernel.org/amlogic/c/ca55a30d27cb37c07f58e5c3448f4d19edb1829c

These changes has been applied on the intermediate git tree [1].

The v6.12/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
