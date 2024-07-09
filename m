Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42166C3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 15:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCCFgHfHHxK0OVeF9XzhzPRQobOi0/s9Ixo9i9WqOuw=; b=oRa2FvbRTPGbzh
	lCUlARyCcrq/pBFOpIYJE9lDy8oiTh2bky6We13xXNgB6Ty3uxu4BtWoACdAfMBv8yRONxAyunLVr
	o4IWD2wKrkrzuL5cSxlM385NA3f63LjV1leYwtytMsH6x12PpCWLxY38R5jTEjD16Q/6gsVyVXHrE
	ukOmapvwn4xR9t8AM+RIxZlPoayI7WZWzlulMOf7bBmM7xQtMtTXpIlCQRrUXmq4GMTROe04aK34Z
	r6akCtDfdwjzafM3uVydxXZzEnBSDGLvLLKInAzG8C+uDZfmDEmnsoBuB7RAHEMSi9eKwAqph0pcK
	/+2GkoxwjJyraCKGJNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCm8-00000007k1O-2XUM;
	Tue, 09 Jul 2024 15:29:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRClq-00000007jvb-2g0k
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 15:28:48 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52e99060b0dso5811002e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538925; x=1721143725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7VCefezFc30AtwGu+xav+TuUFtkI2yJOqQ6ST8ep6k=;
        b=WqcGbKQlB7Oeww5/RFNyB6PdgnFmVd91OowmgCaoSgwf/8zYEI7NsfMt9yfkGGCCho
         30tA1IzzMtuDKGMDsWEb9NKFyPSwCQZmTYaPB//nQ1evhdQr3hf1E44zNvF/BGM9K1yz
         a+QJm8AsOOrUFz+QPC7xAlQMLNjVeK39YfOhAOhISuMObpBcucLs3xi6ZCmLR5q7LjQO
         elbJG1qDzaesgck6FitkK/cRRCHMlvJr1hx1kzjPDDwv60R0DtGCgjd0YF2XeqRV3nxF
         epDk2r0kIjpMobE1S5PwyzL+WXq19IuUv/jiylyh7fFb+UtRmMvrTXq6Bra/YT7QPM2h
         /0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538925; x=1721143725;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7VCefezFc30AtwGu+xav+TuUFtkI2yJOqQ6ST8ep6k=;
        b=arEkIrD4RQcZDy0Kif8WXrzL0HCN3yHGS13MOEASaUPIcruHA71BRjQcbTlhq+4R/8
         x95Y9zHP1sbSDEWOAnwoOypzeJ6OwFnhM3AuA51507ld8yRyUhHjxR1rgoCt9q8bgUug
         gL4yMs2pWh5UumcK0YNQ/Fpv8hvgVzf/ESN/N23D66EOlXHG9Z8OXM2JhxzHY62xyVir
         bzqgcjFwgj2mHIKWW0ZfFZLf2xJ/HZl5rPydy1/3lc8Q1ogAA5j/Wi4bQYogUlPHrbtx
         GWr6RXRQYkdG5uI3du5T9GWh9vAiV70QZw4erX4r9SEym9K0Ch5wC5C7+z3C6HhQDNJR
         1Rfw==
X-Forwarded-Encrypted: i=1; AJvYcCU0xtqdoHeqEK9t7M2x0MJ8h8fnOsYOI0gazTom0vcc3VFPhIBhALcfNgHo8C9zWPqXKgaOkXlpq7xSJ/OWpISLGriEQiG4xl3IHdzOgvnQLug=
X-Gm-Message-State: AOJu0YxTf7p+DiX59x10mJYDKNgxXB15b7L7UXS1SccMI0wt7glrt/sX
	6I7AcLTbaNo6y+FnXoDVQBFwD2/e6f3IpmWoQZs+eAJdQ27174iibz2FIIKv4QY=
X-Google-Smtp-Source: AGHT+IFa2X1bOPgyGU6tWNjQXbvCOo8F9vMPhtpQvUqb8MkspFBRD/98lPiJyeKG8fauhInR8IKF6Q==
X-Received: by 2002:ac2:4641:0:b0:52c:df5f:7b4e with SMTP id 2adb3069b0e04-52eb99a3087mr1588779e87.38.1720538924372;
        Tue, 09 Jul 2024 08:28:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab748sm2849119f8f.111.2024.07.09.08.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240705-s4_node-v1-1-646ca7ac4f09@amlogic.com>
References: <20240705-s4_node-v1-1-646ca7ac4f09@amlogic.com>
Subject: Re: [PATCH] arm64: dts: amlogic: enable some device nodes for S4
Message-Id: <172053892355.1166789.14049124707326749938.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 17:28:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_082846_718700_88072C47 
X-CRM114-Status: GOOD (  10.10  )
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

On Fri, 05 Jul 2024 13:39:16 +0800, Xianwei Zhao wrote:
> Enable some device nodes for AQ222 base S4, including
> SD, regulator and ethnernet node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: enable some device nodes for S4
      https://git.kernel.org/amlogic/c/d3cc1daf38aaa0dd6546dd915ce5d536c250f3eb

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
