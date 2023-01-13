Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5513C54EBD
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zK8itaT4NX0mCelJRiG5kAuLleX6iMXCIbvYnXCqRSM=; b=CcArG0kadV86Tp
	wRtYInIzcEFD7yzfUVN6zJ9WvFuq8oHKJdX3FU85pUAKJeX01gro1Vr9vOMhgOhi7I12bkG6rx3JO
	/sB+rUMm23zRI1HTWFQ9DQmUcKF1IKGA/KljdNuU3I+hD6tVGCU0WZDaX/K9VNyG+2D6msf5hPxQB
	S+dN6la+3ufy6EFbKAm/xbUVfxAmrUZNW3GfQehsvRDPWExtjtTlcGSLBvsiYFeTOqqd6tXAYgJXC
	kiw8rfc9GGJ5fCsAlQgCKi+cdHNRnWUbqjo7tga86PUMiCqATsQDASWxK/lhhSJkAtl6MEymJuQwJ
	qCy7/H9AdeFTEH3YGfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGF2c-0016Ex-GT; Fri, 13 Jan 2023 08:03:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGF2C-00160y-8k
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 08:03:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id t5so15871358wrq.1
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Jan 2023 00:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4cg88Kvj07ysr7PkKeBFTLXDv0UkLAcK6N/8dHojlQ=;
        b=ygfMdWNuN2Z16VHFfsvMzsslRJmncYlx8ey16mv5SfPa6MmkB2lT66Wo4l6EBjARAB
         azqZFQ4UZzt3dX+0yqhdbmR/D8nvXcclLD9fhvSnIYXDs0aiLyyXXG3aS4yDlnk/miRG
         46xSCorwmANDOlRFh3/+GArMvqZSc38Ky6+YYWHi4W3iyXgTXYmzhP8FaC42QYZQQs3A
         WPMYAk/sFUvNQ8exZ0qIUsgbtqEsRX8sEwZgopuGbehKktSSR4jsqnlsrzcCOeJBv1UW
         GdCcPq8we34LMzE5UJYFVNOJiwejaWEXwq3De+0DxM24nzJkX1WJn9eDTgZNCPdsA10h
         n6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4cg88Kvj07ysr7PkKeBFTLXDv0UkLAcK6N/8dHojlQ=;
        b=l4kJ3FR6x6oQU6giNUT5xGsu6fuHECFxdpSoZ8qGE3HVFbcP0hLWpxCOExJR5wapMW
         +U1c4LDIMjjOlkmj3XrMAPmN3TIxnyiRBas5As513d0WF/jbVV4Ge9YT1IkQVcmB+Xmu
         AKcpJSQogwAAgnKFi0DXkX5JxNjD9F31De1sxcQ6+hXztriRnwLK5twq59iZX30jvN6n
         /LLFFQR07vNWVThD86Imn/hKRvXFPefbR5VAW6A+cKH7JMql2WWwy6j5GxTb/zSF1lMN
         zFlJNh+gUFsXMgGUE//TROn5GVvJV6qrdsRP37e4PtPdF3XuSHX7sFrdLFjRSknvuBPl
         oVeA==
X-Gm-Message-State: AFqh2kpz1M1FJCXnZOEzRov4c9y7prr/mNxj0MV2ZT7juw9s4TIJqXzY
	1fPNS0Uup/YZhQu2Dt7PQIItRQ==
X-Google-Smtp-Source: AMrXdXuDaI+YoVgx3YLGtons/nw2H6aGdJuLoH2gqOGJh5Z6O6VljoPp9a/p4NafXMumh8+IsRd77A==
X-Received: by 2002:a5d:460c:0:b0:2bd:e208:1e3e with SMTP id t12-20020a5d460c000000b002bde2081e3emr588705wrq.62.1673597007754;
        Fri, 13 Jan 2023 00:03:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm12609674wrv.11.2023.01.13.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:03:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: small .dts fixes
Message-Id: <167359700681.3617136.9064230631644160118.b4-ty@linaro.org>
Date: Fri, 13 Jan 2023 09:03:26 +0100
MIME-Version: 1.0
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_000332_822605_92B4EE44 
X-CRM114-Status: GOOD (  11.28  )
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

On Wed, 11 Jan 2023 22:13:44 +0100, Martin Blumenstingl wrote:
> This series contains a few .dts fixes which were found during review of
> [0] (which is now the first patch in this series).
> 
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20230110215926.1296650-1-martin.blumenstingl@googlemail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/6] arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC address node
      https://git.kernel.org/amlogic/c/f95acdb2b4af21caae2c76a48e565158181386ca
[2/6] arm64: dts: meson-gxl: jethub-j80: Fix Bluetooth MAC node name
      https://git.kernel.org/amlogic/c/cb199de1d3aecb02556d8a6e26393015effa0a9f
[3/6] arm64: dts: meson-axg: jethub-j1xx: Fix MAC address node names
      https://git.kernel.org/amlogic/c/2f66eeb06e3e8b1cac9e9093be3baadbac2709eb
[4/6] arm64: dts: meson-gx: Fix Ethernet MAC address unit name
      https://git.kernel.org/amlogic/c/8ed5310356bfa47cc6bb4221ae6b21258c52e3d1
[5/6] arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
      https://git.kernel.org/amlogic/c/e7303651bbc76c848007f1cfac1fbeaa65f600d1
[6/6] arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address
      https://git.kernel.org/amlogic/c/f189c869ad92787ddd753558bcbae89d75825bb6

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
