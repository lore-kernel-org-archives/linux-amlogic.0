Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D303C106F309
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrYUJksV/xxYmlYHCYtP3M/LQzAtJ9850ToBKqlKF6w=; b=pOfqfrbdaMnJij
	LSupof8baIJjgOQtvdAdFUxI5DX+wMgIURGc2l+CqnzLVlIemRYtn8IYxTbDdZZATbIC9cSG4PkFi
	AnEXr0/QkbD/4l3MXhPbCbIaYqkV858qN15ZDpH9ozHb9nYbWgQbLnbpwYcuTy3cxv6ZbJW2ur3HH
	TuE5mY1huPZs679wjd9QglkcV6mU5mkhaWGEfAQ1oiaVljPSlVNjHgjcT+o5m2bBKB+bQ1dEXlNly
	Zn1j+ObNS7BcCy7olray2PIFG8KmNVZniJ99XQQgAudBwh8SWtYDTc9iVESlPo/UUflzsvW1+VFB+
	/BZ8lctYLc89nfjEAoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfn-000000056Ec-3nX8;
	Thu, 26 Mar 2026 09:06:39 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfl-000000056Cn-3Ndm
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:39 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so5430495e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515995; x=1775120795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=;
        b=ARlcuPz9WHRbdMTKtf50UNqWeeVxMx95RhNMIU2Jyo7/cX+hTX3zdOZkW65H3K0sH2
         11agG0DdhABBTac+t2OwK3IFZzgWmTbfMiZiiv8eK3GP1Cf/OXrLpmvcc64N+qHyoK/j
         z1zL+EGxHj8ovwY206j1TtEatbGM2fnLm6oSZKVCQAFT1YS3NT/3s0iwUHYPDiDEmmsv
         2NWdLQP86LSgEvv7texcbqH3HwW3rt4J3HEDA9ZbU21zgpUfSjBrFMZMaNmgc3DRjvea
         glgbNqh0NZHMw4/L0hT4CjA9j44oZrxgJYLBF59cU/AFXCoGTSAb2CWHPCfLTDd5X0kP
         CkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515995; x=1775120795;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sq2P0HkEGVyLD86Q+rD29RmS9E+DZcdoWjOdX4Q/j0=;
        b=nfvcsGkdGpJD6dhHU3rc7HJWhk6cMhV+6K/QEQxDEi5FeJdY29vOClVR44cBsYcNH8
         4QZoUzWeN4WTnG4twhJbYswL0LjXVR9W8JytwvKNmczhqsep+Bf8FYtlnnE6rcORvFXD
         3CBdwIhqnEaN6dQYiryfEqL8TFJH2UCfvzJnXOaWnggpw2kKB/dbKiy2+7MWx5hiVeuC
         WmIk8r7eUYQT1eYeDUCWpsunJQL38hW2rSV8e0vpdFPLeVycb1Np2iTa690rfjqASiZ6
         2QcL4EsaqfO0fQl9oyNjtcc4PTY1W4Tpa9bWdTQkrqEzI5/OVlpne2rUvi40OhVmWuDp
         n/6A==
X-Forwarded-Encrypted: i=1; AJvYcCXEEhq9uB+FLZrDBntVV5LLizpl1d+CPvTmFXibURyi95ytDJk0b8nl29uYc/TXlTbrmwB/UE0mE7pT8No0@lists.infradead.org
X-Gm-Message-State: AOJu0YwoPAblsXUEcJCS3pXKy/+91v5J+dGIBf4FINaRpyQo0pzMHQA1
	fLHLv+OoTi/KtQSlyRbW/62QRTQyIehfZE12GthQA2a9l07F5naANNy5sbYUobAKTzc=
X-Gm-Gg: ATEYQzw890FJEbiCt+LY8vkLRg09EvQWwfBjqveenmsoqlwhESqOukUfGtT105HsbhM
	aDwg3+gp3+29CCNY8Z7BXA6MnutcaYgKVgDcsoIupmzKXFUDkS9RZMe/4Z2MG6zKC9PXmWvDe5l
	S5ecWTU+hnPk9H6b4tM/oWMFdy/fX6/IAk5xne4jKKaZJ2/OFjMB/geL2l+LFPc1BwmGfjtmy74
	uGr4vUZGND4hZuoX0q3I4eFZxG/QRVZBAN/mVedJxCOUwhoE6AexQ6HATJ3CwY3RkpvT0FKrr5U
	gjlp4hLrYtzMkJlk+HV1oVrGFalLnWJVz9ue5RRmAOYh2ZAs+xZFSa7jox446y+PsGazruqdUEV
	gajD65TEbYuJcCr2HsuxppCr5Mq5wzNVF3HDHyhC3zWHM/ovbyGtewc5kl6AX5srmnmNJ2g0jLS
	hRhodPl+EtGbW+L8wOF8GtRWuxWHb3J3tIueq+4ou2ret1
X-Received: by 2002:a05:600c:3b12:b0:485:3f1c:d887 with SMTP id 5b1f17b1804b1-4871606dc4fmr98188405e9.26.1774515994012;
        Thu, 26 Mar 2026 02:06:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
References: <20260305-fix-amlt7-gic-dts-v1-1-5944415c74bf@aliel.fr>
Subject: Re: [PATCH] arm64: dts: amlogic: Fix GIC register ranges for
 Amlogic T7
Message-Id: <177451599311.122020.5478331004952016731.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020637_862898_C6427DC1 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, 05 Mar 2026 23:11:25 +0100, Ronald Claveau wrote:
> This patch aims to fix the GIC register ranges for Amlogic T7 SoC family.
> 
> - Context
> Kernel log shows a warning about GIC
> [    0.000000] GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set
> 
> Using cat /proc/interrupts command shows GIC as GIC-0
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: Fix GIC register ranges for Amlogic T7
      https://git.kernel.org/amlogic/c/dbb92c6f1ecd0dcd76a3d1002141f340737f55f2

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
