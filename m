Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C7CCCD184
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 12:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOBoRM9UlAyjxaccyEhL667SVn9bt4SdsgXI6EZJgso=; b=afZTEtNdwGqPQt
	UssrHBngNWy40dy3NfzPi6xJmp6YqLfo5XQL89xuXk0Ypy78wfM0snC1do+dgz6mv1pgsdhdJCnYc
	CSDRYqaxfHEwq15tns2FZBKfdxqbwCCfo0Eal+A4RHKpRAtRjNr9RvIszYWlU3JkndzR5fw+2PSd3
	67rDgdZgQkWJM5rTmLmXw7HZdijV3vXKUGgOsXO/D0jmyvRFrfoi5qi62hIypDpbXa0eNEt/b+Myu
	Tye9FOker+7ICSyPvIe6fuv28tbcZRYsv01XMGDFM4lUVlPYD0RD8rArVnbe9X9pCKyVsvbeIk/FK
	wgfCq0lLk2zjQQsaT9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUg-0000000GyRu-2Mm3;
	Tue, 21 Oct 2025 12:29:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUe-0000000GyRZ-0vrO
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 12:29:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-427084a641aso2613755f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Oct 2025 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049774; x=1761654574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxKZQ1jSq5XmEMDD7h85b87KnFfLeeynwokLsqHcE8c=;
        b=SCwDwlSSVjGjfaGzMw0Yw1Xop0BAUUpzrpRkDPcLM/khNBvLE1lXrlCELk45jZCQPr
         AupJ/+n1bXhTiHg5ahlLs28LGTt85oo6rH/xgxfgTPiIAwhGvEEL8gUK+hC/hx80pLUy
         /Hgj4akbki+EGKgx2pVWy9cQzW4wrT6K+TiIeYPSO6T7YDDEmHroJfanVi15N/NkRneI
         4y8mSD9JK/WU/nvUp+h2H9dzBq5YNxkvEpUnaaja7XLkls1Fc1bYJkrGwn/dNFL1+PJz
         Ha7TUj4KzwgKpW9/T4iJUS77i+Rkat5RaQ8TDm6stnU3/z9xfezh819rLnJZ2x1Bc2Lo
         PHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049774; x=1761654574;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxKZQ1jSq5XmEMDD7h85b87KnFfLeeynwokLsqHcE8c=;
        b=ZBs077s0qJwoHBPBzzHtSZwCQAiaJDo7YuBFG3WWdROGiMx8oZiHxTa8XyDfxW8yQj
         eSaiwHeySSV77g4qLVefg3XyYRtOKLgQoK5YE73woEh3kKdHeQcZa9tB9Z7ktujkt3vm
         odCrIdkhF5Am/mDxaJyzQqBDdLbvWGWn9vcOo/XgJH5jtS3Oh5oLwWWusk9DDyCrCyS+
         GImSQsdMhxV/AmUO6IqZ2QgAqo3P86+SXc7wfZHSvwPsN4q1h4i9iEowoXTQIPvhJqYN
         CXbNmX7Rz4yjTgiIzexxe1AkPpaFZtc3Ra2hy/IMJZatdgXQWYhDAtGNo/Xl8MNnjeWq
         rq+w==
X-Forwarded-Encrypted: i=1; AJvYcCXnL+9p5IbMyZ/Kr+lifsEJsz++VFh0W+37Fzt99YU8ZrFuHe4gVzGqe0eIJFjJg1C9bTvA0oyy6Xe86sso@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5GWjEeZ4gCIsCFmBAzR2xWvTzw3k2rk9EXFAkArivwXnFFGBS
	VgbQdj5zrhFy7pXQQnVqUaJz3oDBuj2ww9sgHzSrXhKAyYm/YmVZll4XmHVuyCll2i0=
X-Gm-Gg: ASbGncvLmWOw1tUgjXIP0BHulMzaQbBCCZ77Oa0B5a6PMdOZjl4ViwXs6d9aQfk7F25
	BjNdpvNurzWza6gIfZS1/G7TBDMM9IwE2romR66rwKMJe16EdoQPFvXC8q/9Ff0xOvCNzSgvvE/
	oPHZ4O/2AWCqaiwQdl9pAkC4C1pEYuO5TnLDQWulvokyyA8SkCvxazhRwMCUmy3Ud0phLyPhL6E
	eJYuqWnGvcpvFuFOHGZ6yHx81Q5SkhkQgCpSEsg56BMVf5rYPO00wK6bWIjuZxkjWLJnSuaF7XP
	Q5bowQ6BUkDugXtcRPpL1MuuYp/b7qHc8uIV/31a7tU9EE5hPdrnc9cEXAk9JsB07zbzl74VQhr
	z5VJGbWBTkTg63oxwK2t0+/nS0peCh3CvgGXGw1+VtKiiJPtPW2w+ORkB4aGrARu1t+IrYHeY1E
	6kTWocxDiANlVy6ntiKDog
X-Google-Smtp-Source: AGHT+IHoXeRtqP5YKqx5fTjYny6JdBkpBMtbvIMA0MFHpcS+8/Jc5PjJmN78n+JJQ4ygw5kfvtGo5w==
X-Received: by 2002:a5d:5d0a:0:b0:3de:78c8:120e with SMTP id ffacd0b85a97d-42704d43e7fmr9940846f8f.6.1761049774263;
        Tue, 21 Oct 2025 05:29:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b988dsm20550960f8f.35.2025.10.21.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:29:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250926142454.5929-1-johan@kernel.org>
References: <20250926142454.5929-1-johan@kernel.org>
Subject: Re: [PATCH 0/2] soc: amlogic: canvas: fix device leak on lookup
Message-Id: <176104977371.3063512.7347854086347476606.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 14:29:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052936_303703_42B215C5 
X-CRM114-Status: UNSURE (   9.62  )
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

On Fri, 26 Sep 2025 16:24:52 +0200, Johan Hovold wrote:
> This series fixes a device leak in the canvas lookup helper and
> simplifies the lookup error handling somewhat.
> 
> Johan
> 
> 
> Johan Hovold (2):
>   soc: amlogic: canvas: fix device leak on lookup
>   soc: amlogic: canvas: simplify lookup error handling
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/drivers)

[1/2] soc: amlogic: canvas: fix device leak on lookup
      https://git.kernel.org/amlogic/c/32200f4828de9d7e6db379909898e718747f4e18
[2/2] soc: amlogic: canvas: simplify lookup error handling
      https://git.kernel.org/amlogic/c/075daf22641870e435a16ec2129bfd3b3134c487

These changes has been applied on the intermediate git tree [1].

The v6.19/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
