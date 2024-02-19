Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC7DC54766
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oe7pgWRFYtyDOlnF1HJPE9BUSbUscD7MiEfMg8Ho4wE=; b=sij2MpQiz4YxTn
	YKhZonYp9ofSXfFxSyG9jry9J8mY7/GkTrQ9CYwGsFpDTTLXTbDXtc+EcPhYo0t/zYPmFWVDTvsX2
	zm9CN3ngpnLoFOX6EtO9/x/uY6sTaHBMAtKX5WQw8TOW3AeFFiQuyh3nrj7w0B6xhwOQdeTFzsFTc
	9MvzuRIRUB/OkaYiDk9hMq9lR+EhQyjp0HFU75FFH2H3MZ8tMwmMpQCnPXhreYIvT7mJdoPnMI3ZK
	9kKdQhjxU9G7MEimU2hWJXuqmKcIHcw62yg3vxUgRCgHVVTOCl+sQUPEaoc8mFhmU2/+IRaq9DXU9
	cNwi77OAmnz8zeRhGaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQ2-00000009gX9-3zXB;
	Mon, 19 Feb 2024 08:54:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQ0-00000009gVm-1OFa
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:54:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-512b42b6697so580869e87.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708332871; x=1708937671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TjtoHHVJwBCBgF4vkxUuzybe9FB5c5TV1bOCfwn0jE=;
        b=A7gTmOumYaGfF9XuygdWof0fijsLJr6FBmYzugxXJJ9Sh+/I4VdGzs1yAUkGW1agp/
         AGUt62m6XCPg5xbiH34Dj9JvQYvq0Y/FIJldgCggQzKalGJSVZq1AREZZ33L1lBz14Un
         xHHTCNOnE7sQqNCZ2yNvBht48qT3DD1ZKX5O7F7P7Nf4kcCt1I0e5EeBmhRiOx0QLOQL
         +69b25Ml8zqygkaICCNEZ5ggpzfLLcbH9BSUdo2kaZhwUujDqJebXY/86EkNvKwQ6gWY
         OOj0RjfVBJ8mwp588TjkC88WhubzYJX9dGOJ+7HxsJ41OsCWvjeFqX/Xt4dWMVE68n2S
         EGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332871; x=1708937671;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TjtoHHVJwBCBgF4vkxUuzybe9FB5c5TV1bOCfwn0jE=;
        b=MHuzeUlJFqGonqUpiMzBq4EhtScptbEPElWIMcblwdA/BznLLFotgWR+9R6Ah6GVqQ
         0HL7EiTclWKsrCa6MpNBljDsP6OaR+9N3Tw28lUhjvmAdBWTKVTfldNILpCXDsTcSqHX
         mtbhotl6QxAlwxBhat+m97DyZmt4U8ueW7AI+67WQpWqY7ddF+7hCYGgxFobtWvEKKq5
         o8Lh/ySVLkkaoAJcTnBHQ6XUK8WyJKxZ4SRrjrUQ45ZerH0gM5IqVb2skquC2kL48nDi
         QfztSBzJXOMHx4R8oPW5k5qXjNcF4I5mPZ0Q4OeiolCYMt8kuUp3wNfcqKgvYkIrJaeU
         N+Aw==
X-Gm-Message-State: AOJu0YyS+nCzsS/F6IWhNg0IQmYsb5taQgNFgqp2M82+hOxojbAd3II6
	zYFYrGQtqzDAjs+hVvT9dqhNuXwHxQNUQdYAnBeJW/7n+NI4/ICbihB8nRNwrfw=
X-Google-Smtp-Source: AGHT+IEffHf+TRXcEYf5qMLMOrMRRF7qdm+gvz+nuZYixXROVudQLHmb7QAOcaN2s/Igl0azgsf5ZA==
X-Received: by 2002:a05:6512:1052:b0:512:ab7e:6ba8 with SMTP id c18-20020a056512105200b00512ab7e6ba8mr2810169lfb.21.1708332870681;
        Mon, 19 Feb 2024 00:54:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f5-20020a7bc8c5000000b00410bca333b7sm10516716wml.27.2024.02.19.00.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:54:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: AML <linux-amlogic@lists.infradead.org>, 
 DT <devicetree@vger.kernel.org>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
In-Reply-To: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Message-Id: <170833286959.1749763.5981999865888937241.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:54:29 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_005432_409389_38D6E97D 
X-CRM114-Status: GOOD (  10.80  )
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

On Mon, 12 Feb 2024 18:47:33 +0100, Marc Gonzalez wrote:
> Add support for Freebox fbx8am boards
> 
> Marc Gonzalez (4):
>    dt-bindings: vendor-prefixes: add freebox
>    dt-bindings: arm: amlogic: add fbx8am binding
>    arm64: dts: amlogic: add fbx8am board
>    arm64: dts: amlogic: add fbx8am DT overlays
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/4] dt-bindings: vendor-prefixes: add freebox
      https://git.kernel.org/amlogic/c/fedeacff9611917231d710382e7ccb518cd440a6
[2/4] dt-bindings: arm: amlogic: add fbx8am binding
      https://git.kernel.org/amlogic/c/beee431b3257334e450999ebe77636bb18ca87e7
[3/4] arm64: dts: amlogic: add fbx8am board
      https://git.kernel.org/amlogic/c/acbe5b6b0fb74197ebff06a62abcfec9858c23ae
[4/4] arm64: dts: amlogic: add fbx8am DT overlays
      https://git.kernel.org/amlogic/c/13636d5502204e671398470962babbfb46bc2721

These changes has been applied on the intermediate git tree [1].

The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
