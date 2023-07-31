Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2FAC04FE0
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuSef+frohzhX6VIWdsrDo2e7qwnbRm6iu+44ZIEf+A=; b=r3rClIuQYSmaKA
	DtR7o5ov4UnSzl2hmjPR+nnCPkhn+wndCw9nAZ//HpHoLJOQ0SnvRfSDoft0cBwv0Nnnm71CQQoO7
	9aheX6pIKuyH6+J4wELixqHW5zIyhcXhujNx7aJlBlTbEJ9evngVsWwIup7LXoQ/g8DkveoVg44ih
	l8t2iflJ6GQNVUCxVKrwvlCE1UebNx4PyY6KonbgXUh5s7/f/dUf0PKmBhXAoZqShU/SVqbTX0u4K
	0foiPoMnUPPIJtiCMdnNAflxCpoBGz2mJVbNkW+Tb4orV7tPEmi2hqUXakwECMi6lliYLDRPW7kRc
	fUyDP0PzCIsZ3/JBmGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUZ-00EowO-2m;
	Mon, 31 Jul 2023 09:47:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUU-00Eosl-1L
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:47:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so4532716f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796821; x=1691401621;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zClCjZjOdixGCLkxsyJvj3NbPUjrYERXcvMYfwjLNfE=;
        b=TilFRbTFqa4TuaX6WgCSre6+GR3T3GgCkO/0zcJ0BwEZiLsOO1AtT4uArKHRBiQadM
         TQybXelE1vzPKw3YOUBUYc6QQm2O75tInpgLqiCOnJ9WZFa7jD1keWuBYGEMB2RJkaz5
         fyJp+8t8V/MfyqbA2vAKKpHLoHg2ilPCGpv7I90w6h0AEzQAWEX1oIAhL7bM01dIWCxF
         NlBCPGN9FYkGOxMVf92bWa1U2U5xuQ8XGUhU+vEpIkV8GVXzHlcNIVY72SsLrIoXh1d1
         Z1vxty/Ycinf3Tef/hO/iwdwxekiw5pBge/LmCrfIyqcsgz0fYwhpyN1klMtZnXiKtzQ
         TWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796821; x=1691401621;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zClCjZjOdixGCLkxsyJvj3NbPUjrYERXcvMYfwjLNfE=;
        b=Atd7uq5NhNJQ0ZcHiiGZ7AqO++hphR9QZd2mGfpajQNOo9WxtEC1G4sYmOqjwwH79F
         QTnNkYrwvK2o2vMKmH07VkXlOH5NCj40J9LfLohFm2hBkZrtDpwhLoXnUYWhEUyQsAhK
         tMZmkb9dVhHRyanKfT3HxNTkjgHoiuU53R93m8AwTVTRj+hW6EBvqbBYeB/aHb/3aBmB
         O3dlPwDsokCebr0IyJN3PbiIoIR0MYaUJn6zIVX8qanvw70/BxhIXWLi63ygXr7kLEaQ
         0JXEAOF0gE4DrO8TGH7khhQB1czCT4CKixb0Km4YHNk4+So55Qz/sSzCHfaqFWciWuep
         jcyQ==
X-Gm-Message-State: ABy/qLbA1Ldd4t5UYMGuw8ydvzFXUfFyNaui49gqsc56W+x+RtCOkva8
	F6eO62KiZ54DIcUVyiO8sAGZ+Q==
X-Google-Smtp-Source: APBJJlE+g5uUfGniF+8kFuxO1Nky2BcsSvbHb1jzL9PNTzoCO3wc1waETL2Y9ABFdvHQELPLFaSrNQ==
X-Received: by 2002:adf:cd11:0:b0:317:759a:8ca6 with SMTP id w17-20020adfcd11000000b00317759a8ca6mr8047426wrm.62.1690796821004;
        Mon, 31 Jul 2023 02:47:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b0031433443265sm12556878wrs.53.2023.07.31.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:47:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230706091954.3301224-1-xianwei.zhao@amlogic.com>
References: <20230706091954.3301224-1-xianwei.zhao@amlogic.com>
Subject: Re: [PATCH V2 0/2] Devicetree for board AN400 based Amlogic T7 SoC
Message-Id: <169079681994.186625.5295354786398700202.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:46:59 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024702_454619_33C3089B 
X-CRM114-Status: GOOD (  10.59  )
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

On Thu, 06 Jul 2023 17:19:51 +0800, Xianwei Zhao wrote:
> Add the board AN400 tree bindings based Amloigc T7 SoC.
> 
> Add devicetree support for Amlogic AN400  board based T7 SoC.
> 
> Changes Since v1:
>  -in memory node use properties "reg" instead of "linux,usable-memory"
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/1] dt-bindings: arm: amlogic: add board AN400
      https://git.kernel.org/amlogic/c/015623ec05f96b1614ec2753d25f36743c17c530
[2/2] arm64: dts: add board AN400
      https://git.kernel.org/amlogic/c/6f048cc7a635b8736b4c7ae0e5230a92e3e648eb

These changes has been applied on the intermediate git tree [1].

The v6.6/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
