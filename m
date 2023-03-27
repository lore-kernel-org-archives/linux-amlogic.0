Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D228C761AF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ov5q+Sn0Y6jdUsFSxLB5jeF2n5EYwmbYjn06B1uS45M=; b=zjLLnM/go1G1PH
	KLQtTpBqNpyJP04d2CcOq52GGAhBkIfPXzln9ODUoPEWIGNLD1N2JuvWaTt125V9i6cQkCFIpt7ZQ
	98UEMtRzC/UbeCKMuqwGLLRJ3Fj4M2j1oiH9i+HuqRFZ103UGaIDGpsljsD6hk2aVcxCHN1WaGoe7
	JiAoROtxNmC1EUYIXOSGWphAkDQjP898g00RyPcnJTfpGyT5tMCs7JLf+ZTtY57qfuxbNHulNpQ0a
	I0TAMjgLb2mMZEJzlXFoR43q2cLBWQZtK4hgUYnf8rIjWYl3PsJAP3bLUPz9NkR1M2phyEtezjtvo
	p75T4g5c+jnWO85olfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghcY-00A6yC-2o;
	Mon, 27 Mar 2023 07:50:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghcV-00A6wn-0T
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 07:50:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so4533234wmq.3
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679903421;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2/+o3CjS5oOZ++bbODl8k+jnt9IdZ9tkak/3JMK7t0=;
        b=kET1HgTtkyGztmzPv5rYte5NwafcMxGi9Gi1UhkEZ5F2Q2AGcxrq9LIvKKfnOmgCAs
         mxq/Sh4eHz2GT+4mm2xZ2BgRgzVmQOxccxBwCK8g1qhfC6Aqpsd6QFXVvIxOFFanJCMO
         V7Pdj1wyTmsUjpEkN/uTuOte6P6OITJhvKLE8rAFNp7T+9NGW4/Ko6bsqSgEpgIr5wwc
         o2TQpMZUGC3/iY5N7cQwrX2iDmQ6e4x1L1KGv4qbJve8U29mwy4FchCjESwboVrfO+IS
         4cj8QQ8Uzl/mefqvYwCgMAnF2HKgfOykF1tH115foqpkhpu+Jr1R+QonghVB1h6tR9AF
         nswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679903421;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2/+o3CjS5oOZ++bbODl8k+jnt9IdZ9tkak/3JMK7t0=;
        b=NpqCyp3PaEqL0Jx3gdZn+10Xv4nzWjj4RCCebGJDnaDOCROoQ/WLPOh3V43dbirvgK
         FVmyiV2B+P5eaAWRg34gsJjJNw/NOZ/23JbsKzv6zttqe8/U3Ahc8Q//QOnrBHuCK+up
         77miAHaPAj4eHCkTT81aMA5CcfPYXSd9GZMFQ7MLR8XaMZpzF9ckfZJMgT0bRKQ95L2j
         wP1pDzZKt3+5fSu2+bu9LCsbXBJRZWSxDz6CN/NpWkGbNtreSoHEeJhR6okF3G61HsR6
         s5RJb0WG+AmJAXjqufaKVLTFCVXQzPLLUiOVaFEDVAlSuFanGVXNFMjIbbaZuJjGkkI3
         kAsA==
X-Gm-Message-State: AO0yUKVgvMAKfnyHg/Ya1+ofuHLlrwTWVSQjyIElW7NRx3yp8bwSiaRv
	wxvkOF2JcdXSuWsLmrqpANiovg==
X-Google-Smtp-Source: AK7set/H65ARWER2L8lAV5SPxt5sN6JG7yyU9dVo+BNava17+gn6Bz3R62wLpTmeq239RuFisYQNTA==
X-Received: by 2002:a7b:c448:0:b0:3ef:294c:de50 with SMTP id l8-20020a7bc448000000b003ef294cde50mr8538861wmi.29.1679903421304;
        Mon, 27 Mar 2023 00:50:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003ef6f87118dsm1673614wmq.42.2023.03.27.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 00:50:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ye.xingchen@zte.com.cn
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <202303241016261854322@zte.com.cn>
References: <202303241016261854322@zte.com.cn>
Subject: Re: [PATCH] soc: amlogic: meson-pwrc: Use dev_err_probe()
Message-Id: <167990342066.283186.4060194256735806968.b4-ty@linaro.org>
Date: Mon, 27 Mar 2023 09:50:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_005023_185838_93FE99FE 
X-CRM114-Status: UNSURE (   9.16  )
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

On Fri, 24 Mar 2023 10:16:26 +0800, ye.xingchen@zte.com.cn wrote:
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/drivers)

[1/1] soc: amlogic: meson-pwrc: Use dev_err_probe()
      https://git.kernel.org/amlogic/c/78e812f0406c765fc5623b1d68e3c6e86cb32e5a

These changes has been applied on the intermediate git tree [1].

The v6.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
