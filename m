Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A05C369C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Apr 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LJOnu95ZvOO7d96bpBG0PpZ1/PyuTBp8CwiDGwrdfw=; b=ISWejxVmtURAzl
	atXyAmaGnYtkaJh7BOB7U0nCscYm4sGwLDZ6JSURDAKAGLt4RrZxVMPKeYAa/aXhivQXPXJLnP/wj
	t5KHzlsBdT+gU6PUr4PaNEwNqMYr823p+7aab6tvbU3eeD1RKcRjqWog3dOcIuNS+8KfIICyKyeDF
	6Tr82cRZ88hobhOHnCuxpZcICmD8qgpAFgzKGJ0s2fr+3DFockqQKVRYivCoyDeU5JLn/kBQfje7n
	47o41BbAZ7If2L5AyY4dqDbsFy4GDDXFDdVnHKL4xEzHh17g0+PGVzjMdEuvKtROJFvQQo351k/IM
	2i5F71H2pZHjOzUP3LSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Fpe-00000007miI-0rTN;
	Tue, 22 Apr 2025 15:46:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EaK-00000007UGR-0XQc
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Apr 2025 14:26:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39efc1365e4so1835342f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Apr 2025 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745332010; x=1745936810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/8FBWOKis/5gAhZl+kumNEFhsuTOTp0Tn1yNZmhUVg=;
        b=PYkZGZPE0H5wnJGSbqgAGjWAsWTcdjXt92dBuPWRxJx0/lC71x5KZlLCMG5XrhZdBu
         NEXpNICTp5v9K4ufXE+sNqGCGMmIzk9qpw22lSZSrigjPdbaeZZq/fiDoQ3BYGKw60Ay
         YsThTjF10kkccpB7fDgbZEi5CagQLGlAd5fwD75uKxEMVkbLtdkrJBeQxCITMsRDxhsf
         OrXAi+2gbQ/WWwuGAdapouz8xezfmPC7vKIdwYCmnx3V8KBR0PhqXUkZqhKLOBlS3hYM
         kKxGZH6X9N3sGJto2ET2ME0qFVOeu5esM0wDHx5Od3nCrtpxXN5UssnqW/yVtHLGloVj
         CfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332010; x=1745936810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/8FBWOKis/5gAhZl+kumNEFhsuTOTp0Tn1yNZmhUVg=;
        b=Ec6M0Yt0dB1BIDHyRDpm++kUHvj7TSVClbdhxqqbbZJ1yQ4PXvXLwH69OXkzNxHQme
         GIpKo3Fjpmdx39nqbFXjBpqvJGbIhichM9Tl3irpptNxUiFhJMtxAQmlxweD7xSONUiU
         wyRJIx0nJzxBM9wVzaiiUKg9I6GElDb7zJreBlxwbnnQkPxzeBAHgw6uyP+0gTcXizhD
         /9csURM31DYdE9hb7vPgtjTjNxJQLEV04GbNXcBjuEVo2ONGel7tMPshjquzIWaMJEpv
         9rN/iib43w3RFt04d9c+eUIlOFeSFttsV8YHKjnPmii6Bv1phvA43Jwr3x/y2oJUXFh8
         Epgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmCWwi+wVWfhGiFFD8Mk2LngtoCEm5EekPdqaxSTm0g1uRpHf60GbAUsJW6MT2nClryYTGc6ync0w40SC4@lists.infradead.org
X-Gm-Message-State: AOJu0YzKN9TF3aOl/kLLcr19n4SxbANQHZHnsGP+xYHnpOlg3fdtj8qc
	ZOOCtO0fV/jxUj1bkpfYbpDiozhyP8JKCLAq+eHIUohMlfUARzr9bMsYT1TXYe8=
X-Gm-Gg: ASbGnculyk0AzTPgl+EwxrIU/Yb6t4uL/x1glXgWPFE68+yutbrbouiPn+W+qEqc6/0
	Eqqx0LzE3z7msPSAYFkDsNU8HF6ocyPqlp+T3+84SmgUM3oC3LvLH0BvzFNyDmSnZu3R9AQqwCJ
	I+JZPwpZUUscgYy3YtWheDZY58rvRa0QjV8y9X42QtrBEtOlTzKaZccmsqypq3lnGFoYg73svwj
	/PjmXS2APEMfuBDxtjoKhVL576a1eQCA3RShsr2TFYZecOS2N8GhGh2tmmTmdR639H6uaE6HXNw
	FTAP62lrbLX201aCt5TIVXPrgczurEp0sOP7xe09qBJ9TIFub2B/FQcci4ypmg==
X-Google-Smtp-Source: AGHT+IErweWrqcRE3OUYv1Tr/uF6zeqr9g8jYjpvjE6dgePIWhMhbjuHUYd714wO1Cy0fgJwbMEbXQ==
X-Received: by 2002:a05:6000:4308:b0:39f:f5f:5373 with SMTP id ffacd0b85a97d-39f0f5f53c0mr3774129f8f.57.1745332010416;
        Tue, 22 Apr 2025 07:26:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207dbsm15318011f8f.4.2025.04.22.07.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:26:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
Subject: Re: (subset) [PATCH 0/7] Baisc devicetree support for Amlogic S6
 S7 and S7D
Message-Id: <174533200972.67056.15609256008080950446.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 16:26:49 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_072652_166446_0D84B19A 
X-CRM114-Status: GOOD (  10.40  )
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

On Mon, 17 Mar 2025 15:16:51 +0800, Xianwei Zhao wrote:
> Amlogic S6 S7 and S7D are application processors designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Add the new S6 SoC/board device tree bindings.
> Add the new S7 SoC/board device tree bindings.
> Add the new S7D SoC/board device tree bindings.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/7] dt-bindings: arm: amlogic: add S6 support
      https://git.kernel.org/amlogic/c/93d968adbba3d30c625149d7aa12369a42b89d3e
[2/7] dt-bindings: arm: amlogic: add S7 support
      https://git.kernel.org/amlogic/c/5c9871f98b187747a873dad2773493f2117b5203
[3/7] dt-bindings: arm: amlogic: add S7D support
      https://git.kernel.org/amlogic/c/c0c89503f6b722d9eb450ce1cfe52f785be07cfd
[5/7] arm64: dts: add support for S6 based Amlogic BL209
      https://git.kernel.org/amlogic/c/5fdecaafa2377731b84c9f3af5994d990224015e
[6/7] arm64: dts: add support for S7 based Amlogic BP201
      https://git.kernel.org/amlogic/c/1b753fcfcff8ad1a63512b5be01cc6f3968a859b
[7/7] arm64: dts: add support for S7D based Amlogic BM202
      https://git.kernel.org/amlogic/c/1a30661c20dee51675a1ddee1b81b6a0e8580412

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
