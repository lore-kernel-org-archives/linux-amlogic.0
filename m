Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE94DC54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 08:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLqwy9AkGQGej9w3wVYd8QmzVnVQYoqzqZJ+yGqx4vo=; b=ZZ+RBLG5VfreIv
	iBLpx3ISgCV3v6NDxdF/RgR5zVD0rJVZSkJBDSBDo/kxrauP2q9pWdDFOQkmllxyCtIL0rn0fMHY2
	cldchKNdIw/vTgm3w90EuJfUZsr+ZVgbDROdP6p5vHwB1210lkbnbeZrIub0IpbXAYhVRVgzecCwb
	Vb4eCt9020MKCX1ISYHPSix+7PeK1uibkKiQfIaFQ2uUnDcGMueKYdzVmXb2lSc1qp56ce+1N0Xll
	zim8CcPWLPx4el4n+eZa9i06fiFXZeIvuZO2kdN74uK/Byk//m7FBb8Rqo9L3xh21qM0QR713eSeD
	O0faIAw9VktZs7snLgxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxon-00A34b-95; Thu, 26 Jan 2023 08:41:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxht-009zn0-Vq
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 08:34:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so2791088wmb.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 00:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8K+2b6qYGhmrfMApP1JL3olzeZ2YP6lL+7+ixOQ9ZM=;
        b=wZTc+VS63T54L++Dg9SWngu8T2SVoeTNy0W/Z1PzOO9b5RxByDYJDJ+us87HIOHZXC
         jgZ+02pGdY55M73FZVGymHp0dYwN/nrKcl8lS+VjEaqg8wTxGe/vodlxnCik0u26DS2P
         iih6YNSyAXU02uf1bV3gd/5hWFK80QxMO0JivFc99xWDhFloJlc/TKKRHaG/S4L62xpq
         bMq6klHfhm6xopM8BFklBsnDyDjasKwqXxpv801JhSUQ819QQZnopjsB24uTf9j04I+m
         6YUM9JX+/yh9WA1+loY4wxQCeQFy0nq+0+59xqYMrohoIUDVHG2DYAbjCAt/UOqxGIPy
         hrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8K+2b6qYGhmrfMApP1JL3olzeZ2YP6lL+7+ixOQ9ZM=;
        b=gFN3DM+1zwAorsJcGmgZcZhETf8b2LVu1W856tgX79V2tYmhTwuDfzaVaAQfU4alpd
         sBXeWqNIuhD44BfCNWJXL0FXm1y5DLFl9evHBCFK+ojtoEQy/2qMRckMtSOSr81EjStu
         qcMs9KVkV8aDwUzHkwwHJwMDjqiafuOAOvF3eWrpmL1NiwnPbc1hNScmEA36rAleL50m
         p6UiGSMj+PGC3XHM3e3mUrNWyGZVDjHkZ3XKhNl3wPMoSPQZYugx/vhQsbmeeOTs+5fL
         /0Oec1E9q4/M3c9BtDtc05f0zzGJ99rssWaVvW/qxzmIXJ+yYwRYzyKRzHkPWTGNXL0X
         8I+w==
X-Gm-Message-State: AFqh2ko/WPQ3nXreQ8kkjEWgdfSKskGEJtOpCNJLmZaKePjQ65uj9BQh
	R4A0y5R5PtfeTwZt2oTUMshgtm/uWztz78nqTpc=
X-Google-Smtp-Source: AMrXdXvUlBtNOqLtKPqGUlEcp3fxlZ8HEpJE7yzJc6lt9UmTN/nHDTyQna7hQ9xXWwN3B4tf6G3DSg==
X-Received: by 2002:a05:600c:6014:b0:3da:2032:6c0f with SMTP id az20-20020a05600c601400b003da20326c0fmr41886222wmb.31.1674722042720;
        Thu, 26 Jan 2023 00:34:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c328a00b003d9a86a13bfsm757709wmp.28.2023.01.26.00.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 00:34:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20230124-topic-odroid-hc4-upstream-fix-fan-trip-v1-1-b0c6aa355d93@linaro.org>
References: <20230124-topic-odroid-hc4-upstream-fix-fan-trip-v1-1-b0c6aa355d93@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix active
 fan thermal trip
Message-Id: <167472204189.456104.2228463020906844378.b4-ty@linaro.org>
Date: Thu, 26 Jan 2023 09:34:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_003406_167731_2B334ECB 
X-CRM114-Status: GOOD (  10.88  )
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

On Tue, 24 Jan 2023 12:39:08 +0100, Neil Armstrong wrote:
> Add an active trip tied to the on-board fan cooling device, which is better
> than describing it along the passive cooling maps.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/1] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix active fan thermal trip
      https://git.kernel.org/amlogic/c/1d2f14117aa7773efff50f832b85fc7779e586e0

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
