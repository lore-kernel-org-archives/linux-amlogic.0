Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814BCC2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLdRE3fBci6yCmr+UtjMFTxGv+KLsmN9/W5x8S055Xk=; b=I8Tt072HudE8Am
	vW7X7JwTD0+Ke5J2DpjCcPr0MiQszH2uPboAx7OLyeNT/+r0NC0BskunJFs1xmvfZksszOYbN6+OB
	v2nZRaCpsGLS+1klSzbPzTCfQVApxsAG0eX8RL8ueb3NDXYS3s7zF7P14umte8s4n+BZJnSa0McyE
	bUQz3m3GscHKSgiPvx+2IbbR1xneoRY0htI6S4efCGMcdEQfcHC0bjHiDy054VBohN37czsMgCsTZ
	CqhBcH+Wzb6X4FjdLpPIl05smPb486A1hWvhMj3edUN4hXt0qWwCLzFv5s/joKLneEDEb28ptGFfw
	YvS7HCZOhFs2lLj5/9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgHr-0000000GJ3h-0WlG;
	Mon, 24 Jun 2024 09:46:59 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgHo-0000000GJ26-47JN
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 09:46:58 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so55852611fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719222414; x=1719827214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcNWKnHkeIJRMOmqnabShMaVabM5q9PDRYhoyvuhdTA=;
        b=qLhSxLJCYhc/vKUOE3h6HLmhV7tAPd32Lv0cKg+qvhKYPJfW/mtAacfs5wUA9C2Jnu
         +TyD6q0IRW17P6VHR4mKSjjiG76uUQcipAidlos6AurYwqYli4ZXOAv3LQltXtvEQ2gf
         nG94mDpxrGEJu+gTQS4VTxvX1YwaguzQmUBvbwNkw0CUedsvj4S/8eTinDv6Pw7NS1J0
         ou90Rw2lhmDc7a9LkXBFbtikv/vvV5B3IqDSdbTvLm1pC/8SmzMnpK1eH8kJB30bcN/B
         EKuGYB1cQHVUWFvhI0hEynpM3VDnB+l/ukVTPXJ1HBmHbWi7ZJcK4b6Hq0debV+KNLED
         GisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222414; x=1719827214;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcNWKnHkeIJRMOmqnabShMaVabM5q9PDRYhoyvuhdTA=;
        b=FnOg9psil+WXqVthSPgYCxLRs6SnFYvj8Lm6JgrKf4466C1a6Jj51Y9sfDfEGgFrBe
         7Rqnfa+cfqClHBSTQNT5Q6SVCndEWyXWSUxNojCGFWdyhD8CNVqEJRq4Um3LjZPsVh03
         I/rlllsGlMIacS4ShBmszED+hzWKg8CD604OExPhfm8BtwlNi2UgwLDAFKWexB1WHbW2
         c8IiPCm5K6Wj8DgIduBB+rjikC1z9Yvzr4Wizm13HYjZJwK511nu21Qd/JTQy9t0vbc9
         C1qmbO5RWZZ1t+cMbpQ7JXsFpOXuybN08ibk86l3rUgVB/RdxCZIoLQtTHTizzj0btFu
         ROGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUehZVvSmbGNSovni5TGiMM8Jx3dBKecYbaizjg6SGqDvqkhGmpJVGxcd4/qBXMywSGxLJuWmwFqbWUSiVNfdR0df2uEYRjT+ucdaRewX/7Dn8=
X-Gm-Message-State: AOJu0YwATOEV9cY8Xz66JqldJlURFa1WQRmFUsITs3DruWk1D96enmfa
	guCgCXLyGWqMC13mBHjFJsRngBuYmI0xbRWDep/UgZhOvXZWpTopj6jtDbipFwc=
X-Google-Smtp-Source: AGHT+IHpNq1ix8ySZk4ztfCVIL+kyhyoHsHxl6o2d4h29CU2dII6GfkHgVi26P1w+CJMTNmjxLwS1Q==
X-Received: by 2002:a05:651c:22f:b0:2ec:1708:4db5 with SMTP id 38308e7fff4ca-2ec5b339debmr25928351fa.51.1719222413972;
        Mon, 24 Jun 2024 02:46:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f65easm9528339f8f.23.2024.06.24.02.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:46:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240624-topic-amlogic-upstream-bindings-fixes-dts-round-2-v1-1-0a21f456eb8d@linaro.org>
References: <20240624-topic-amlogic-upstream-bindings-fixes-dts-round-2-v1-1-0a21f456eb8d@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: ad402: fix thermal zone node name
Message-Id: <171922241292.3679804.1552417731983704893.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 11:46:52 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_024657_079058_180C0F93 
X-CRM114-Status: GOOD (  10.02  )
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

On Mon, 24 Jun 2024 10:59:36 +0200, Neil Armstrong wrote:
> Fixes the following:
> thermal-zones: 'soc_thermal' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: ad402: fix thermal zone node name
      https://git.kernel.org/amlogic/c/ca88b172eebfaa923ea752f6eb41ec5c9cb587c5

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
