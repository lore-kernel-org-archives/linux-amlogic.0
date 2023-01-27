Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993BDC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 17:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHk0gH3CZwYsSyYV9rX5LHitS/WpwQg0uRUffOy3nJ4=; b=OuVHBSOYAs9tep
	/Y0Nven9m6qJRjAYuYZG2+t3v5RtCXkxvCfsisx+hr9jDoEoFmXgcneSx71/Hm7DQebLV2MYFoRQI
	e+EJ3eEUEPaR2mElHaTf7ZZvkERlxcHJDtkqvIYbRTbhksBd7KcZ7bEEOKRP6ARO0x81kjUi9AwZO
	t4egdT/i8fpY3LX3+mD7NYVFpAc4m9fHAB1yn22X6E8MOG8fDqW9IIjNbCBRqSjAos3WX/wBEx4xh
	1+HBS0aqP0bkdjaUGVCcSrG0dTGl9ZKnBi8jLFb6Gl5RYNyak2qeUvZpmDf/j8DWjYDfYQlA6zZem
	a7y11Bw8u+y/FFFgsvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLS7u-00FrdJ-Vt; Fri, 27 Jan 2023 17:02:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLS7W-00FrUX-TD
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 17:02:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id j17so3939019wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 09:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbU1jG3eBIib3Y4T/FJmhjrIYuLNHNTwPimhNEaBXnw=;
        b=ZYqzKu5blklwUObA1H3gAkwCboO6R1adMPHjlKADOpoynUElxQHWl2yhz5fmMJ6/OC
         2nzf1af85r9C5QwP4LdAALucQ0GJBKLp9Fc7M0AxBfPmo4zHYq1dLUyHbWOh2U+NM1uk
         pDccnDz9SDYqiePHluMiOQypB7bl+tRkOzl31LQiaCkIJWj3RHd4BP0dS4he+VRiqu0W
         b6vyXb9jET2cF6MJXg4WQkSifFOwnXSbZ9p/ogX/DXyGRLg5epYZ/2i4hjnIK/d+ES7a
         9u9eLkpvlzjN9eiRcqUcmx74E1ZgC5+yt4Dz+/J3EFtI5q/P0UiM4sAHAQaa8mDJU5vL
         TsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbU1jG3eBIib3Y4T/FJmhjrIYuLNHNTwPimhNEaBXnw=;
        b=mR9ryK/Q8jaCDkYk8C8Qe6i2rlrYnjWrK/LfH4Dyee9iS9t/kcIzZNWReCXlabP0KD
         2wBGPk+s8S05hYe0aWsleIIzJRf6e7u2yPl4Y0MMHU2jLCbbSENLCH4c7MLX/volMky9
         r7IE9rc+GqwPdtm2XAtQjJ+tlzt3mTP4ZsNbnVbYrJo3n2ldvnW87V2mFvGacB+lEXCp
         XW5ne15/joUXW1GIj724aKX4JyM1y1uqrN7mqhLDkt7nGXVbyZWPBYX8wPstlJm7Ty2p
         D22wSJ8ymXs0OVe7CkQpVUdhOsF/JQGZc8EhjG9gmcsiuCyf0BvT1/uGvtfOUCAUX2r9
         zuxQ==
X-Gm-Message-State: AO0yUKW+Zh/i1jzAAJCsR1b8kM5p0g7q4c0HGHdcUpyFjhXfsS11Gar1
	8AgjsISlibf+3LKrqfyA5f+Q/E9U343Gs8RCa3Y=
X-Google-Smtp-Source: AK7set8nKe1EwJJz5qSh/iMOOjsbaKe0SVJ6gB0BYq3Td23vOrRiaDhe0P7jCeUxIxn6ZPoBJ0Fjww==
X-Received: by 2002:a05:600c:2189:b0:3dc:4334:22e3 with SMTP id e9-20020a05600c218900b003dc433422e3mr790979wme.17.1674838951034;
        Fri, 27 Jan 2023 09:02:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c12ca00b003d9df9e59c4sm7925935wmd.37.2023.01.27.09.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 09:02:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127150536.3719090-1-christianshewitt@gmail.com>
References: <20230127150536.3719090-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for
 Radxa Zero2
Message-Id: <167483894978.2238401.2111173691502093407.b4-ty@linaro.org>
Date: Fri, 27 Jan 2023 18:02:29 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_090235_544625_E88B4EF0 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, 27 Jan 2023 15:05:35 +0000, Christian Hewitt wrote:
> The Radxa Zero2 is a small form-factor SBC using the Amlogic
> A311D chip.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/2] dt-bindings: arm: amlogic: add support for Radxa Zero2
      https://git.kernel.org/amlogic/c/229cfc6b16ccedfcae1ee10dc1aed04e7a85ed32
[2/2] arm64: dts: meson: add support for Radxa Zero2
      https://git.kernel.org/amlogic/c/d747e7f76a5fa6e3deb4c419df768f9ee49c2161

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
