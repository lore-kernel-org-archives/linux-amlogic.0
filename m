Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF563C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPuW2ghELCPm+cqcYJP7fcOOya70jpAP3NkqtqI3Pi8=; b=E/1RmYQjfPEQI2
	qw59Y/Dv8hsAQk/BMR6KZB7gikFbqc4O7SGYK1szF7ShnxH+1KdsNOARcC0oS9OWtu3nCifhbvcQD
	d09j9AwITBIxOapB0pd5Z4wTfSVwbei+3p7adPgnncH/0sh3xL12yx3mpBQe3NxCjdiS3QJpZQlka
	POeB2ioyOOVO1D11IT//ff0m1bPaI8PP72XW+e4fKL+Aq3aKpAYLl3BmFGI+QCm0CosK/bEa6vN7h
	JlM1z5hdUsyli3FH8XVNSCyOw+eOWgTq6AGcy1R1V7PYWYDxgGSblBoURNw3lHSesBql6a5icsqLD
	yGz9H1HgaC7BRGVVuRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQx-00000009goS-1pWC;
	Mon, 19 Feb 2024 08:55:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzQu-00000009gnU-3QaK
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:55:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41263dbdfeaso7187335e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708332927; x=1708937727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iA8hL0vmryN9XM9ciwuNyT7l7HkIEUflQrFOUN/duUY=;
        b=ZOxHvy8FdaAQySrBo0Gmhqup8Jjm4cWoJ1+kND3GriEr21A8+JTYYZapVtiShPXFk2
         1OnQXh7HUtsxr4q6Z3AXFyWzhZw/x40rdrvDGBvvBFEqsUdzb0G5hS2+8VA0KASZ0FUV
         momyhXU6qRWCSWqJyoOcoIrdhUk6TFqYwQt0shHcRl30BMsYE42glpltQTIZPCHZsyGV
         Q7J7BWcGAG5weBX5lPNccEHaDbJYmz4H+ooBF5u62IwF0KzW0tHUrFOl+zKWz6EC4uOm
         1+qGyc9ZPzC7Hydy4DN+Abk+D1kQmIbd/BE3Wg9mOOWk4cPujkt3NsSJWJEtM+vx3BWS
         mlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708332927; x=1708937727;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iA8hL0vmryN9XM9ciwuNyT7l7HkIEUflQrFOUN/duUY=;
        b=SpgbRJu4kHSOViA7i3O6wrVjNUqVS+YsoNC+dgRK2mGUVFlo+4HEKzzf0lWH0qGIMA
         OOfgwmVEBhKncGXmR8MYG0o6BfA9X2qCU8JN1V8INOB+ehvWkD3bDpBQ8Xxa6L9xVp3j
         yogCB6G1ApWZYmB62CUSFtGliHkogSy3Q1qs0bo+czPKyZjV6HF1GlaCgOq4WigF3mrF
         AcwLjXnCmIH4Q2J/BGTVKi4vseTfo9Dz1g6q56Vwpq/st1jszEpOZItviRLkeVyv43PM
         nILc7JHy01wI974v9resLjsO19Tr/s3N6r+dITRrNcijtkO8KzN1OeKv2HUKhVYkCQQt
         t77w==
X-Gm-Message-State: AOJu0YyUSAxxJ+0g3WwX40izmPho+4EeEcR2N48Yp1y3AEZwyEMoZlPh
	qTE3K2xNZLbgsj0dl11KPC47L6nqtLzriAQow2mtzPVchA2uM++U3w7abi6sH0w=
X-Google-Smtp-Source: AGHT+IGXNRor5SWq6PVxqhZAe3rTmCqaW2L1WMllERpSnnHE4+0llmEdPEPP8Xj/3W+6Y0poTE8lkQ==
X-Received: by 2002:a7b:c415:0:b0:412:e80:be4d with SMTP id k21-20020a7bc415000000b004120e80be4dmr8310293wmi.36.1708332927387;
        Mon, 19 Feb 2024 00:55:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q17-20020a7bce91000000b00412656ba919sm2952458wmj.20.2024.02.19.00.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:55:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
In-Reply-To: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
References: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/3] ARM: dts: amlogic: Three small binding check
 error fixes
Message-Id: <170833292669.1750802.15916025234070714227.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:55:26 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_005528_894179_3EFF7161 
X-CRM114-Status: GOOD (  11.63  )
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

On Sun, 18 Feb 2024 12:19:56 +0100, Martin Blumenstingl wrote:
> This series contains three small binding check fixes.
> Nothing functional was broken before, so no need to backpport any of
> these to -stable.
> 
> 
> Martin Blumenstingl (3):
>   ARM: dts: meson: fix bus node names
>   ARM: dts: meson8: fix &hwrng node compatible string
>   ARM: dts: meson8b: fix &hwrng node compatible string
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm-dt)

[1/3] ARM: dts: meson: fix bus node names
      https://git.kernel.org/amlogic/c/0a20438f4531b55393a2e85bd0cb9cc45362a6a4
[2/3] ARM: dts: meson8: fix &hwrng node compatible string
      https://git.kernel.org/amlogic/c/6f2cc11b4340cb5b0f81fe72eb732144bc7b6287
[3/3] ARM: dts: meson8b: fix &hwrng node compatible string
      https://git.kernel.org/amlogic/c/778a2c000470ee56551d0833a0eaa387530e4bec

These changes has been applied on the intermediate git tree [1].

The v6.9/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
