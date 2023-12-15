Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A77C35274
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJyIOQkOU3G985Qt1vw0NIrPQCg3T1buUAT+dCD+7TQ=; b=bgi7aeC72Ok7+H
	Eo8vQVLzSj+w1fcdxdfiQtpAZTeer9endyjuNcwpGEchVHKveQkBZOcfv6sv3zCw44r58E8ae0nrI
	aCwZ5iC8NFWfz23i67KqrxlDqQZ3oKSn7R1IQXpFUup/oHF3rG/6mtA72VBQyvg0CHvubUP5eWWjP
	jP7xId5nnCB0kIzlQY0ZuR/qpDfMARTkYaynztCIP8ABY9un8FY47sn9AVtwYCeTEI4OQrgBDRsaO
	XBfVb3wyeqPoVxcGse6+HBf/+yAtIv7UvzjZfngHCRzagja78MzFNB8yvxOu9Ie4Z11aw7LjXBPPH
	SiRHHmtQGXHeGr0eu3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE99j-003Yhx-1q;
	Fri, 15 Dec 2023 14:27:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE99g-003YhG-0n
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 14:27:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c580ba223so8788495e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Dec 2023 06:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702650426; x=1703255226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ULcrY3kIS+SQU2mVVxzzl29mcLOvRWX6tiA+fzMsL4=;
        b=s9xMF5lzW65xRLjPg4+0wlXmh9qUAXU4GbqHZvBTrFR0X6KgBB8KdRrfVtDPatBO8p
         NUxxVIEeDXcLoriAi1sClQGYj8ChB6osSsgkga/l6WRux6+UxKdyGlfrpcmgFdk0WQZd
         3VcFMbwHvZEx/dBPXqJMvcNiySl/NdftfbzjMBfyVxcUPfPG918koGun93YLIAxDjgfC
         U+HQeGcMzkK2qyE2SeqtO7A0tR0xmGFjVHgAna7XXU91NGWql9YH8ipAwvWGtxYGYmTT
         ebwMl1WXmLaFK6MT85nqs336mTiLetxehsVeh9TlcZ4y7dDQNOB2myyccM1/IMF7+AGm
         8FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702650426; x=1703255226;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ULcrY3kIS+SQU2mVVxzzl29mcLOvRWX6tiA+fzMsL4=;
        b=bUWiZ02rH0+H9QJozKuKYL186BPf1ocSWnKUZ8RA8jRVtq+lBeK/VuxW/AzWtfpVOd
         l89TTA3Nzh9V+6tWdPR2Lpf3X1Efzy8nfQSPlwJ4/sI6ZmCmP0eTwQoOwLlPhYy4gaGI
         GX/bHKXJPgErWv+QNuSUR4ihnBgG00YFDcTtJGp3/AAgtfo/QPhk2SznPARqR06VhLTA
         QIfg/VWcLwnHlQAsPOynNO2w4T89BOj+JnELa1DrUl02ePZz3eU7HNiM3UDD2uQQUG1y
         /Or5pvmSUVrxMT+5l30zr4FOdMZu+v7uhDPqD+AiFcYirt94NSikv0ChNpe8XnZDkNCM
         zy9w==
X-Gm-Message-State: AOJu0YybSpzB2DnswCNmALPtx3wIrczk/V2zTWVkxyw3lHMzg3rVEnA7
	Bo/nJgKndCUu3xrwF+xeZsFS4A==
X-Google-Smtp-Source: AGHT+IG9wf3SYeMcofeEHL7KS2b9aU+fXLb7V7ILTLAzv7W8hMu9mJz+xFNugNdx/mptsH4eZrmAVg==
X-Received: by 2002:a7b:ce8a:0:b0:40c:61f1:7fcd with SMTP id q10-20020a7bce8a000000b0040c61f17fcdmr1715937wmj.155.1702650426028;
        Fri, 15 Dec 2023 06:27:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm32158835wmb.9.2023.12.15.06.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:27:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231215-s4-dts-v1-1-7831ab6972be@amlogic.com>
References: <20231215-s4-dts-v1-1-7831ab6972be@amlogic.com>
Subject: Re: [PATCH] arm64: dts: amlogic: fix format for s4 uart node
Message-Id: <170265042524.3306004.7156643290374411600.b4-ty@linaro.org>
Date: Fri, 15 Dec 2023 15:27:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_062708_293970_E4974AD8 
X-CRM114-Status: UNSURE (   9.60  )
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

On Fri, 15 Dec 2023 16:28:00 +0800, Xianwei Zhao wrote:
> Aliases use lowercase letters and place status in end.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[1/1] arm64: dts: amlogic: fix format for s4 uart node
      https://git.kernel.org/amlogic/c/f1e2e85bb06b942db86992a8a3187ffe9807939c

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
