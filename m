Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F5C624A4
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKMTlYOr9ao2yY5QMrwJmk6Ptda/EVEQVq8ma0ekiAc=; b=zuq8G3F0C62ac5
	sh7t1L/OCtffk/fal9LwwwnrrXZeq0GBbgahDcaIIbWLkAGnRM7CnsupjaOiU12nRouZP93RmMO/k
	okr1SALUy3OIGkuS0f9PoAeHQCauQO+5gUWeCQglK99jyK2Pp23OfjyodDktPVA+CGXCckdkRdAke
	qw+SB/MqzpwBhVtkcqv1k/LugnIy1rRA+B603PamWQ7V/5fm93ucUN0K6oxnl6DE0Rtgav9mxw1P5
	0z4v0Qw9v6uC+9ONWZkc/lOTPpYC1EUrdRwm7Za3Gaq0WuwjveUZBqb3saQYsekUjtOu+hv7PJw6l
	XKXbXmCQgCM1GCKMKLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NL-00000009K7r-1OIm;
	Mon, 31 Aug 2026 12:44:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NB-00000009K3s-2uDZ
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 12:44:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso27729195e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2026 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180264; x=1788785064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=;
        b=ntX/3ntReadywECLsx2pDY4SoGf/ZzXHsDEthupL9LYFaCCY/fVFKeAR9JwLyrnQB/
         j56rpoYWlnRReUlGLlMy3qVz+NsuQHj9FgNuOXXCCWhkel0H3z2VBzKBEvgGs2k/RY0W
         0bsvosZp2FNLy2E7Rlc0UokszvVUTyDukFZj4+4RygzKecgrk5GfJVY2bEKjZ5rPM4H0
         gje4MpJKnDNp3etLld8YNt0z9o3nbDuFjNkWxiYrxJEFCEltkcemt7fJxs6I7boNE5cT
         OI+pQefZT+/P+DsxG9GjPMsshrAwvIP7nmtNrFIGI1kDDDjG4p5J2D8eyHsb6aSmHAOu
         glhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180264; x=1788785064;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=;
        b=Vt82DCrOaiO3ru4qGuIn/vkQfSuafzq82D/9rxgfJOb6B1bhexNDSorHNrvqvqbmRo
         BfgU84vQx0PXpkF5/qOQxqRiLpdz1nP9/l+XALfCSbbJ1dJW6+mIW2qZZf+Gyfqw/i/Z
         5qBIRvTmBnu82vcWXiJmtNn/SCGxPBgjzLUQ76FDpz4h5Kq9ovDnXvjbhTcary0yGiGN
         7x2XOBQSHlfiqaoqyZ4u2Po6KD+/fAodbYp12Zb41egTQE7XWz73vWFJxQ4j9eUSLq2W
         osmYtYddJUcp8PdSXOJ1Uw2hRiCQgmUw13+zAPucoJW2u7rAMrp7bvd01KwsGh0pYIsj
         I9Aw==
X-Forwarded-Encrypted: i=1; AHgh+RoGebllq2divMTNbDCkWuvjrDbAB+MlaBRDcd4MRgObVdpi6ndqXqHUzx2ipHia3eH0BH1cmoV45kPeWEM/@lists.infradead.org
X-Gm-Message-State: AFuF++kpHhHF03bKrAfSwF/9MwsbiazcAUcnvVw3Da/iYuDBpiFPElyU
	ulIWXU1763hkcWOxA0M3cbbECVJSsBn33FA+/XZXM5y57X4MAHatXys+1dJaQkUmXhQ=
X-Gm-Gg: AR+sD112wxQfZ9MJC43tQYfWYFvmpbVGN+jyzKAJUS+ovHkdpOS1/obYmyblqfrOTFH
	+UWGpZAHfQRoxII/B1W0aGfklFTIOcZChtSeFwMKS0ho0x4XWQCklvpH/0GRtlscuHhtrmjUixi
	CltmuUKwPoC5nJ4EJwlWwTS1A0v9ldH938bCfbNpHllWkY7TN8hrmxbgBpcx7zE9Z8bijnlu5t9
	SYG2fcYlaY6584xQFzMSUr9ZgD5inF59tGhRPjHSRPcOiYsDiaOCN2vudZq0lj1//O9rfb9+Pub
	Ya/HYijA/B+QOHDLIWWkP/z6gn8XUwLG6KcbvsW6e8YeNzF9SRwfpH9877+G7yDhm9PO46SqtHN
	KXvaHP+q+LSE/2tVB4Wh6tBAJp74TO86bj+RaAWXSTKrP++gmC2F7/K3nQsDmO5uyMoAh+egWMV
	PsoU7O43klkAOI1C0tonIEN7IbnoiPDvyPPWLOD1Ebq0365s9ULbyrdaVKedqFjjlUPdj+DDBiU
	pAomHqwPA==
X-Received: by 2002:a05:600c:870f:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cd538cb5fmr140459815e9.3.1788180263680;
        Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm390196485e9.12.2026.08.31.05.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Lucas Tanure <tanure@linux.com>
Cc: Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Brian Masney <bmasney@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
Message-Id: <178818026093.2318126.3676223463693214854.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:44:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054425_763197_333BE071 
X-CRM114-Status: GOOD (  13.70  )
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

On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
> the board hangs at random, loses storage and corrupts memory, and the
> failures move around from boot to boot.
> 
> Six of the SoC's PWM outputs drive the board's voltage regulators: the
> always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
> of them were described, so Linux saw the outputs as unused and switched
> them off about a second into boot. The regulators then drifted away from
> the levels the bootloader had set, which is where the corruption and the
> random hangs came from.
> Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
> critical.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/fixes)

[2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
      https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa60842478f2ae
[3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
      https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff543cc696
[4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
      https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7e3ba3a

These changes has been applied on the intermediate git tree [1].

The v7.3/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
