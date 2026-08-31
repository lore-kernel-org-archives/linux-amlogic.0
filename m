Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E3EC61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6zJcwlqdX92uStMSwrwni9rAQtxDM8K4bdOyewH1/Q=; b=sSmA3xBhPdUsXW
	8vVCi9qaynQ4//skFaBebrneeNTqyLwaspaL+mGGGlRmwPotsDF1nPiCcS0tD5PGSSnJ6HeHxDVum
	JqOR7Jhx5LmvR4lL7JwvbBcfiqh6HT7Uff2+7HaponuvPnPBsBP0LqzdVcczGv9e05ORQ5e0wn5iN
	fvm/TLFr8+mEDMFk3IFmg1uHyfUCNRPIsCzIUy+OpGxrDKFZD3Rwm3qjuFgMtM2YerrhJUv367ct/
	nLXC1eQC/f9moLhFys4aqmkb34AgfV4BHCiajMxzX5apVoO+SMiPsVXuDMPa5OTxt9vYioOhXl2hv
	0UelVtXvK+Tt2bY6Z3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11SH-00000009Kh2-1H9B;
	Mon, 31 Aug 2026 12:49:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11SE-00000009Kfg-0mCy
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 12:49:40 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso39239505e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180576; x=1788785376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=I1vyQiPHWoztLpwZmWRJrdjjwEg0eo/9zR//QcD0noihLfufC1V1+G+HDxE1x9yxNd
         rZyhGK+nC1X//SQteuWy5P938u+mzZZqQCcMANrc02iyiwUzvbylZ2KQCvQ2dL2/WgMW
         DXRJk/aWpgAysGaWq7qaBWRqbCVEYEmgyzeAGMKCNaQwqD9sz6/9/AXQMRf39Cc1ouEb
         XmJ4NonyQ6rivSbQp5MNxFBGScls+7h02/fZFPEI+wjbA5rOq+1iGwxfkzD3pxPAorho
         g/hwKqnMOdF1b7RZ8o44JGEmirVwvmM5BgUuFw2iKjxs61f6FruyM/YXEm1fGrpBi13b
         LqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180576; x=1788785376;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Yumoe7FZSNCoT/Inpg12IKhKN/8sBU4yATdWXPVHv8=;
        b=JMvlECpenCTTL/5kD/fiosOclZO3CQxknzfPGOSAdGBjsiFVF5WInmW9BPcOCP/ahv
         Wd1Cpko8397qsqfIPh2dQrID30ybTz7/zkZMah7T2Kk+IgzIK5Srdcexwa4B6HX0Um6+
         z2MkasDWEh1IqnmVWZL+siUFhcnosBrKaRhICv09YYvTWoBYklQUQxDT/v23WBGNpdms
         cM7gj3ve9s1DbY5RFWRqH0Bt8LhahsJRd6CVcpzIkiesNEiwJ2A0IqJGT1+wJ7nf0Cuw
         csDT/9S+aDLhwkTyodomvCoKl9Gi08wtOyFqwmwxONfwbN535fTueGXhN2dfWVNz7jPm
         Ce7g==
X-Forwarded-Encrypted: i=1; AHgh+RomiJrLsG25xio3+SKp6V4kBzhhrvAb/ixfdbeRxj42QXiF80iQZM+zVl8BZAyIF9qSLOBu87R3S8+qNrmN@lists.infradead.org
X-Gm-Message-State: AFuF++n8mCzS/NZuSP4mZvRU7MVa9+MX+nGwVsRgt1n20HWyfiw0x60m
	scwyawRlsYPJF/DbewnmdS7mvaGsEMp+t1FxJUig74240pcIzuMsnPZzkDdcn01qSjQ=
X-Gm-Gg: AR+sD1123PTQIy3YTuqWoPPzNc3wz94DmHx/msvdGQzRGPAfC6RP44DyiF5byj1bkyW
	FH5lTUSZZm271ioYsRBW3IJXQ+auMYnmdjQMyVFngY83+X4T9Jkt3yr+J5bcOiqlZb0yPK4M3Mn
	WvCbEr/C5NR1F/HkgSiG0UuwgOS8KiSxI9uvsWgjfERvT1SzINe8tfsWqBeNfvkz9Mo/GoZrhr2
	B4h7ABDc6nVa5sSnqiTeHRBduD1Z2bew8uOw1mV6CQ01fJ6NoBy709pOUBsDXVInZoUBP9JpSWP
	s10Qd1iExcHqsouYGtFIITc4SmQ5mCAPR9fBFQm9BJyxQGTqBDpMjGSCzM3yLGeQDWqJ6h3Qt7t
	O45s64zBcBr0kZYme25dE26l2xJ4K2JBpNEz1J9iA297xdzdyONMm1N1NZUhcYJ9htt0mYqvqwR
	FOQSXqWSB3cjYz78ZVPyvlU2u9VH+nOC6hbx1GQaFTqsCq5w233T3vvJA4RIw10+Kdx2ejxALu+
	djb72trkA==
X-Received: by 2002:a05:600c:19ca:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-49ccee0f3cdmr203606555e9.16.1788180576048;
        Mon, 31 Aug 2026 05:49:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2922ebdsm164736385e9.3.2026.08.31.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:49:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193939.107564-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Replace spaces indentation with
 tabs
Message-Id: <178818057398.2326859.6686364977974372286.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:49:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054938_296150_2F4ABCB1 
X-CRM114-Status: UNSURE (   9.57  )
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

On Sat, 29 Aug 2026 21:39:40 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[1/1] arm64: dts: amlogic: Replace spaces indentation with tabs
      https://git.kernel.org/amlogic/c/6b59171d0fe541438da68c19541cd2f31c60ac04

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
