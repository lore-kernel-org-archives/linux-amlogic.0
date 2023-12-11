Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14016C10F07
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 11:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3BMZpe3VFlTrTvgNGl4YyV22hSoHZsMi29AVBWk3eE=; b=saN0lllYHIrRrR
	sgECx9xsiwR6ERObRsRl99TZid7amrBfGgKnja80+ThdaER8SHEgE/ZwBurxPnl327GFx6ePNcinX
	srbZ+HX3sZK1FaNU80m1G920KlMxlgjFYh8O0p5mfj0N0p7plrlUPj+Q/But9HUo3CGGNCO/H4pJ/
	AVBPVKx5y7O1NvLbSf9Z/A9euB0NuL45vwUrq/Uq8KXiHlLiLaW9Yy+55J1hnBbyF3GcFLJBaTHAc
	xTDC9VO2Y/ke1o+JrLV0LJYoJCorYfFN+sBFdGZXh4mKlUWW+VMmF0f9HWY/bbz/xcUrfgMFXEtwY
	tq5KqDihnKYOAqRjD0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe9C-004hOd-2G;
	Mon, 11 Dec 2023 11:08:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe95-004hMe-31
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Dec 2023 11:08:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c0fc1cf3dso45640735e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Dec 2023 03:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702292898; x=1702897698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X9DvPqcQlYaM5FUDcfAEhxk5sJCrCqHh00lsR9yPqOo=;
        b=svppZzxA7uPQukWPDfHuSVZoQm1uNgB8bc2K5uAF+aTcVHQlaa/8Kpy0MNN37U8sbe
         ElcJ+s/QflWL8iJ//cyeychOQDAb3Ej7pcUSrEMuG6BTE9Kwm39ZOsTxDbNFndC5bTkh
         qruVCq4OnJVpUcwlxhAZ52G2XZ/mlIsUKldokTIv/6tGrNVPj9QqJmafRTaX0P5eYFQK
         yJj/59tHOQhmLEkprz58jcbw8tI/qjrbGMARQ82YdK19MbN/zwEAwayA+zQtMGM1T2Cf
         6JS0v+EXEdaeNjI9+SQVkXWPfE2lNe2uQ6r4VrOz5MZmCTsJgDapAHqKyHELU2VAVEVW
         U/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292898; x=1702897698;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9DvPqcQlYaM5FUDcfAEhxk5sJCrCqHh00lsR9yPqOo=;
        b=GIIcyBorIUGT9p0jS3Gx6jfwr+6brI5VG5vDqn+sI7qr9dY7ffkyL3jZyi/QV5cerJ
         u0moVhz8K5rBGkNqmYs4EJxkLe5hM5Nmu+K88kRXQIg4iQZ1m8S7p+tGw0MTd2J/np3i
         DsXTnU6WBt4qsVtVSIlULUYVkpUk3uU6iEQ0zwyW7abtMEgSqNVFdYUt94W5lWWJyDXY
         OJ5CBn6KwR5mfiWtJA088ZmdP2EMqetljjn+wg1MMgXEm/BCivKAZ945p0hns0Sh8Af2
         ne9D/xsk1hdrb0QwY2ZMb0LfepEXbYdiR3boikA6cZ3hrn2Qhbf06hvj8PZFzCo8VfQ2
         Ph6Q==
X-Gm-Message-State: AOJu0YzL5kfg7LEcknMfhLbnCFDWY+GgYkHIEgxq2jQY4JWbugCZSTSt
	13oqOx2yeQek9u1X3FiAFTRUDg==
X-Google-Smtp-Source: AGHT+IEvIQdNqsPU6Vrldb/k/LOO5TUqCUhZQ0MOdKli8Hxnu/yo/fE4DCDx+o9W17Y2lPOq6FJYYQ==
X-Received: by 2002:a05:600c:808:b0:40c:2aeb:c758 with SMTP id k8-20020a05600c080800b0040c2aebc758mr1980634wmp.119.1702292897864;
        Mon, 11 Dec 2023 03:08:17 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b004076f522058sm14981765wms.0.2023.12.11.03.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 03:08:17 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231209124401.93814-1-krzysztof.kozlowski@linaro.org>
References: <20231209124401.93814-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: drop redundant status=okay
Message-Id: <170229289706.2547617.2484626300480503159.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 12:08:17 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_030819_978379_34C77812 
X-CRM114-Status: UNSURE (   9.85  )
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

On Sat, 09 Dec 2023 13:44:01 +0100, Krzysztof Kozlowski wrote:
> New device nodes are enabled by default, so no need for status=okay.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[1/1] arm64: dts: amlogic: drop redundant status=okay
      https://git.kernel.org/amlogic/c/e3c58a44ea7daef26c8c53c93489888ac983f327

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
