Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C145C3600C
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Mar 2025 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSZ/r/Kqc9Xf776ktYY1OErulQW884YHrMcZ6BkoALo=; b=V4SE49W3g6jMhc
	vnIPwi1NHcae0L5OV1sk5Frjb2nWpc9m0xPoBQf6xtrqp5JgUEzvpGQYlr1NvsM5EQ351ID+IgBWD
	yr7m9ylmflbbTwVE0ewl3zf2vR7xooFq7MZuR1q8XJPU/9jSFc53b8bUrJBPCZH8zZ+brcv4HilUL
	yumCQYqqfH2Abx6VPm683A1Pu6Wlxz7SvGacXxOA82m7HoAXPqo/PK6WdqMd6YcpThdxIZCgM2/jB
	GTrAo/JY9Ux6KihSBDoV8zl+asMo+UtWNlFWjS9Fx9xay6WWq61lYXEigIMJkFBYZOL9iZU6L3rbu
	Tl8oXQMM4DzHF7zzKKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkGI-0000000Ag8z-43rm;
	Thu, 27 Mar 2025 10:14:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txkEY-0000000Afwm-2jGm
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Mar 2025 10:13:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4724955e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Mar 2025 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743070389; x=1743675189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=;
        b=tAny2RE8Gu5E4fu4y87bv1UyvQoJwE3XM2jZOGyTt7Vt+xHPQH8TQSzl4qOOoEhNrk
         CR+XlHVDxnxjT4hXM92mquK6QsOa/9xHvmfAH0ANueBG9NQi+u8WWEb9OjqQ+1ed5Ncz
         xtenA0iDxSbiUK+fzuumdmpWVfCReuf9LM21dzMQY4ms0uUWC3Lf49HYT1UmrIRVjPva
         /Il1buIHr3CCjUcG1GfYFM7wvRI/s5/nWc7fAukbNDeIkSjQqhNIFT5hNqfzLH0XQTT7
         7UAO9qGDQJKwHSvxltpEYX4BvVAq2brQpphXB68jQi8RN7wA9govPrbSDqpWoxf15tYR
         zo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070389; x=1743675189;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xo7iAv+9nI2kaufsKds/53FFNGXfbLXPYtYZ+pjxKuE=;
        b=hCQ5Z8rXdjdZF5Y/w524QdsA0J0jy06RdpcfxaAsZKXSTiA8AsOqOum1zoG3gJiBga
         I81I0/GglTK/dDr2bvkhmVfUN0HGKBcUKkRrmbbKdrEz18cqlqS3gPlpGGEar71QmXR5
         ikIj9FNTuSlGoiZxonblLTnm5cBU/BRNFO5KwLcPPgUcDRgJ5aoE6x1kBJoPEOplXvgh
         SwIHZaa6Qb9VufT5VySB8RIeS6sPjYEebjiRS2xY71+BqrDc41w2H3eF+Oq3J5zcug3N
         VjZ7FOo/sP4SEwrgsOE9Mf/t4oXbABjaaVK3HJovJEiitGKybtku5Izrtkc3xPFFpE7t
         Bojg==
X-Forwarded-Encrypted: i=1; AJvYcCX83PQNj1PATtBUPklnATZSz7hwkoXKbe8UFFvoU5wEw7bZlYabz3Vtcn2JIAcF5g3n1lq2uPJDKB1gALVa@lists.infradead.org
X-Gm-Message-State: AOJu0YybTxVKPbFJC89apJSr2KluJOcZqGy/cw8Y9AaM8g8rTUutW6us
	ad6kNYEJVvJqTCgIyV3HgkNB59ca4IukTGELYk3cUCFsgaMSp8h/7DPAPoSJfWc=
X-Gm-Gg: ASbGncuyzTd0nqAz5Y493M4or329b5gltPPEkL8ec+tI5HB3LZbp0JF7o6zqbRtKk87
	OZWrQ8b8Zqj9Adv3XZfhEc3+CBxMvtbIZFDrPvxFc++r7vqJxkdPJYLqUSLOh1PNq7j3Vw6crm5
	HpDJ5+GBlji27N0r7JHWcyR5Hbawkp6k7KW4fMnPGMx6wrhPUogMmrBoYa8d/Hx1bbREJj5Elsy
	pJZGKD6cftrTToMH2JP6HCF1aholDm/k7My58EewJyT3/iQM4hcs8P6kZVP1q54N+xrtoEOSaS0
	uxE6sTBovEk7fPGKJIzflcMUiyDIL6wXPD2MvGAKXsY2bR3YQBUFma3E+GbRyZ/vIA==
X-Google-Smtp-Source: AGHT+IFz+YPLrvTgN7jlfBOiq8HZmmXGzvYjXvGO0VPFIOTzfMvVnsPizrlTsSXhwRlZyW4HwIgm6A==
X-Received: by 2002:a05:600c:4f0e:b0:43d:1bf6:15e1 with SMTP id 5b1f17b1804b1-43d8465f999mr27131955e9.1.1743070388941;
        Thu, 27 Mar 2025 03:13:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efebc2sm32345205e9.21.2025.03.27.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:13:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
References: <20250326-pinctrl-node-a4-v1-1-8c30639480f6@amlogic.com>
Subject: Re: [PATCH] arm64: dts: amlogic: a4: add pinctrl node
Message-Id: <174307038828.3221991.15446720184220513001.b4-ty@linaro.org>
Date: Thu, 27 Mar 2025 11:13:08 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_031310_696801_D7946FAD 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, 26 Mar 2025 13:17:16 +0800, Xianwei Zhao wrote:
> Add pinctrl device to support Amlogic A4 and add uart pinconf.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[1/1] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/77fd52e77d325aac301601a18f7cf06de1565a72

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
