Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F2AFD5F98
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 09:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dx5ESjmjd8U5UqTsbRdjQnVilbtnKBR/8NfvMI/pBmg=; b=ZBMS04Vkb+Yx2x
	7ZblPBJsq6PVB5NIMl4qnY7sdcO/HOw5pUBwkmTWG3DsLovPwonoFDvdyTXGo5BWT8+rTvcJM2l/w
	TZFd/l5HRaIIBEu9GlsVZDk/eD7saSlKCRVMoOb5J+3GLUNaYSeWZAnPZtOusTgPNoKh0ttKoMl8O
	7Wunayhttz8HI7VP/as6pYWXH4VLQvi21t97d9WFb4pvWwiJD4R/0HFLlfmTu1RXiPAFiP/e38Duj
	OaNj9+9u2/4j6fD04KYuIx+9puYVvdIs5uV1EgrsphvhtGXz5mFBuZxSJwNKHPCd40Ybt0m87EXvk
	piCLsq7bWKvfA6ahLmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOxC-00000008aBt-3HlY;
	Wed, 08 Apr 2026 09:12:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOxA-00000008aA7-0JGG
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 09:12:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso5510146f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Apr 2026 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639522; x=1776244322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=;
        b=AW9dpm2+SuoIFSIrYXuIk4B5gayCeyXesChIHtXbrMp2Bo64bxkGeVlrkMkRheCW6O
         ZdM02lTDpC7Ji3THv2HYcE9fhnni0uvauwklHlfmAFci8CtL6vWS/9+Q/pgtXw/ubNw6
         6RirO5gE094xKIPFiuoONFc9yR3ZpSc9OrbRiBPB/Gjv70o4s50f57YnkuGqflUwxZ43
         BMlzrOvde90r2plGvMPuXR2ptvY0XMVuI5mdKOKfq1kcEhn+aI6Ezh0ZRhGyiEr7wtXT
         AQEwBBsBjweGlUFeROy2atqcmOMoUKh2T3J6OrCpJHBxS1vL4T4kyn1yd2ZCDOxTWQc1
         QDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639522; x=1776244322;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNdO7fLBeeA2neJwwyEcwruMXjRyUrprq++EjKDhP04=;
        b=A8+z991cmsM/9ypiEGDWw6UvsHHKixnUX6PElZtOc6qok08MmeltLPUBfv3rBtX2OQ
         BmT0dLO5PahUkg1Spa6gZEdIpGEdNacgkmxl4irgaIq/e0Z0MoGCBmJyALSOCEr82YWZ
         UKlJ5LpnWP7ObAo202x3ptbfm4UrJ8nXXrU0jAetEYIBHsK7Uq0cLSKi5l0V23LVMOHV
         TiuKxiGu8f5B1ILWuZqdw5oIU16qIU+XhbhiEMJXOtGoFjabj9oFp9+CUzZ/zoY/3qg8
         wNedRAjY12mOTleWUeG/2oG9Sf+gxa9pJLZNoLdQtYt3JTkYQnQhNSlqPmUWxDJry1WK
         Q/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWJVugxOobQMgUgJB+I+stF4NjcLOSF8NOz7H/6MJtgOgflQqahFwNWJyHAwnhxa6wjo8bcwHyEbxGTrE7Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1G29gp9d9lxnsRfqSKR81iv/K3GQ7UjNXHobDYkptfKa4TvXo
	EZXkPiV/VUtzxLGmm+4UxUv9/5ctYsUR2cmliHIE+MOOX53umKXUO28m1Ledh3EIuZHCzmxstX3
	IJbhQ
X-Gm-Gg: AeBDieskiPJWa4YyLk2wzrn+piJyA9Kij2EfNoZ1LpXkUG7SmtZpZN2LqQIp/QkXVmf
	CtFwbIPbCllK37r9Tl7ZRfw0E1w9MwlYd+e0q5EtFE5FfWgJnjXMVNsVriWY61OnKgI6Xb04jUl
	ow1zRsEkz7u2Kd0iWV3FheC2xBQU/dlfyEDiEfHgn82hxsJgLqOoOXWLwmA1evXSA7eUOsF/r90
	K20/OlXb/Vs1Z/T4mnEcof/pERkcINkuNtGkjBMth12kxbUUwtiU7XdXvbMC1EWmJkhZsjAnZ1a
	mEWjApHBMQ9EC8tbCwDQn92l+eeZMDCZA0U1VwNHRZE7ArHad5rAuA7NgWxv9R/9yzFCpzcbJ2d
	VjBpKnPYKNu99jSCirWvCqN26iFng8NcIj9y/3O+fnlc1PPIzWkH0NBBgTs9gP7VY4+rSQ3j1Wv
	ijcoc6YtmRNCFow4UJaqZdqEQnmMK7n5s2nO2LaU88oG+u
X-Received: by 2002:a05:6000:24c9:b0:43d:6e2:5529 with SMTP id ffacd0b85a97d-43d2927bb78mr29330089f8f.11.1775639521962;
        Wed, 08 Apr 2026 02:12:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm53516671f8f.35.2026.04.08.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:12:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com
In-Reply-To: <20260330145111.115318-1-jerrysteve1101@gmail.com>
References: <20260330145111.115318-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt
 number
Message-Id: <177563952126.3423846.18101500975539971135.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:12:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021204_122154_D482FF69 
X-CRM114-Status: GOOD (  10.74  )
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

On Mon, 30 Mar 2026 22:51:11 +0800, Jun Yan wrote:
> Correct the interrupt number assigned to the Realtek PHY in the p230
> 
> following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
> fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
> interrupt improvements [1].
> 
> [1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumenstingl@googlemail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
      https://git.kernel.org/amlogic/c/b18d1b23558114b3c64fec7b515ca80c76e58171

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
