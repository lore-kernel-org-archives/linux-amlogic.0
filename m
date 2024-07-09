Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DD5C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/K6/XfvUO9CDAlz4udlcTkjoXUsSWA1vm/V4xD59iI=; b=idesowYdIhGgrZ
	mwleZDgy/SodQSK6pk5e5wq0wIhXx/86FTZAp2GeOU41okU+xGfC96U2z8/zpYHmDJuVxdFkmh61s
	7RMX4KkypUGNIcaIaC8TSOeToDWfRm52gbBLlkSfaX7TbOi+9FSVltgSUMdZS8XOUroSfm02W+c+Q
	XlBcMJukVhO6hey+GcitJgxt01Jg8/xj+novoQTa8TlmTRh1bBApPeBqXS5KG353dK0SxEhAxLuzT
	hhp+G5TTXnsMdlcQzBVPGSxIDF2LAYc4ninfe+KC6tx6BDGOLtnzsBrSk4AMhoe1itsK7fWBkaK6S
	4V+4Htg/swJkAaiNB4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCmN-00000007k8X-0Jn2;
	Tue, 09 Jul 2024 15:29:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRClx-00000007jy2-19j1
	for linux-amlogic@bombadil.infradead.org;
	Tue, 09 Jul 2024 15:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=4NePdy+sqgvYcgq7vKT1dOt3fvbuIs0FsUv1Bhxyjpo=; b=ALxrRlVpkK4xjufyV6CPes8wRM
	jrXEOF5dem/I3YIqNSKsXQWHOjih+jV6g8cVy21WC6Jaf48Cnkrn/48kMRODwnznoZnipQNzRx88e
	vjECvte3Kn1K2lQ+C+5qz41I9VZ82yBQG4UZAlklSt/uORHXpPPABlgoX7YKQQ8FBadk1F5dvJ+Z1
	fcJ1R56L9ZJTXjpYWRW9gCcWQ7/q+5n1kdu8HyK99EhO65ebd9ZE1Nt3C/g6nvg3Db+M6Uj34CoSf
	GX83OsL3Xu6QPA5Ypgtq0FfSd71vy+eVECmd9RTLZZj/soygPgOJiZYEDZgsKci3+592qUnagHy9a
	Bc4eqNqw==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRClt-0000000810M-3hHK
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 15:28:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so4700424e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720538926; x=1721143726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NePdy+sqgvYcgq7vKT1dOt3fvbuIs0FsUv1Bhxyjpo=;
        b=IQAsPnhZFBLcsD82QLwiNLWg5g0X+FIENXxJQp/9aY7p+5MlvNWDqUuw4FLJTyBwxn
         HM2dlh/rVOHoi2fJ7UY0gZL+b/uZ8E1LPfWAONl63yPi8oj+Qq4Exw3Illc2KNI54h0P
         1vibP2qCPu/EVgS71r2k5gegbOp52/Yz2GIPy+xPi+/Y2iGONBaKZxdSRoBCgD3BBLId
         l/BGNQ5V+4NCX8AYFlCer/9+5gvoPYqmNZ0kMRowWP7VgkyELbTRTorZIarFjp1ktALx
         6HgDpWxrpjSeiH/+QXcTSiBwkYb6uQxXwY/IHz2UHpZnDum7IAPtjHOT5o/RU711nNQl
         CGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538926; x=1721143726;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NePdy+sqgvYcgq7vKT1dOt3fvbuIs0FsUv1Bhxyjpo=;
        b=i9gMm66Z8Adan8g8RYXBKJomDCUOHfPvIGZexKAw+KBfEgKzMfKgbTsYS3wNClPbXj
         JBTIKQ5/P4gIvBcI+X0ghfaCza/1L3cznuBvOnscIU3NsG0WA/OB+SXXol5sRFLknAmh
         mfQ7IAboV64ybq5r3Fyy0XA2QqU74v1ec4AncrUkxkVvaG2v4NQsMmM6cb0Mb8JDx00P
         J16wTlvM6R8zLfIcegE39SqsEoPQQJPtcJAxHPU8/m1eq0QlSub2+eWqf0yakJ5Ljw9t
         PungkAjzO6OEXZRMHPGrS9l+7NC6eXxZoy/X2S4YM6IjEyzhT3rH5Q/ODXt19nj8q8s6
         tNcA==
X-Forwarded-Encrypted: i=1; AJvYcCXY/QNM3S0Ch+MhKwRwCFNtoxTkuWLlZREClghfD+hD2//8SybSikQOi8ttGqVrEqoXXeVS6SWjx3V/IyrdYh9oOy7ZnAn5txMIXnY1TPZDbow=
X-Gm-Message-State: AOJu0Yztj4Vzd3p3711Ypoy8ckVh0QBPAfr0meU1HnvCDRu5hxxLCwUr
	YD5CLB7v1pCI01HiZ+zlqCESThbBU8A+67OIu6XSUH3uSMM49wNrbKunCPs9Vxg=
X-Google-Smtp-Source: AGHT+IFP2dwZSg+oxisyaGCs/E6PHJKfQeB46et4kmXu8bV/igVFqGZpfvG8esLFZnNZsAe6qemJxA==
X-Received: by 2002:a05:6512:3e0c:b0:52e:9c0a:3522 with SMTP id 2adb3069b0e04-52eb99d1694mr2058719e87.44.1720538926338;
        Tue, 09 Jul 2024 08:28:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab748sm2849119f8f.111.2024.07.09.08.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 08:28:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240709-s4_node-v2-1-b9a218603c31@amlogic.com>
References: <20240709-s4_node-v2-1-b9a218603c31@amlogic.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: enable some device nodes for
 S4
Message-Id: <172053892547.1166789.11882834446987648780.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 17:28:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_162849_951256_7DF0A64D 
X-CRM114-Status: UNSURE (   8.75  )
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

On Tue, 09 Jul 2024 17:32:03 +0800, Xianwei Zhao wrote:
> Enable more device nodes for AQ222 base S4, including
> SD, regulator and ethnernet node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: enable some device nodes for S4
      https://git.kernel.org/amlogic/c/d3cc1daf38aaa0dd6546dd915ce5d536c250f3eb

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
