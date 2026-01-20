Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23211D2ED14
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jan 2026 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3M9gilhLXICS5y9gShKLiB1EdP3fyMo//neEF0nMEvw=; b=GTpAJ8f3T7Edhv
	zuwvZoXaCTJJ7GNPejX2zCudo3X4lGtxWUwC0FpKNMhTFwau3WM1bxloPFsqc0YFW1q8lKNnYDhQ3
	qRypwy4Ses+iCnYzntSwssjFYFmppZNXjllPXsb1IUDZ1ct4P1SBpJLlYo51DyygB1t7GCy0KTLSm
	DzCPaMgW9m3REfzoRg7/oVkLf2j+/7gfGxiG4LLF8S/RP7OraDecv+Mv8z7mL8h43r9YV3qzH0LQM
	wOb39AUyrkkbHh55IOKTElTSZlvp5EuJ7Rc2aAMCzlhnF6tExuqGNPshH7jTsiMTWFol8D4PvTLM3
	VOKoSsOZ6FpXVcDFfykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U3-00000003UKt-1F3O;
	Tue, 20 Jan 2026 08:53:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U0-00000003UJF-13OG
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jan 2026 08:53:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so31988865e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jan 2026 00:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768899182; x=1769503982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/zzCLz7EhPTekTyUs9lCQwryZmkiSO5kNovzXM9TrY=;
        b=wSxD2f/JseN+yXgen6lv0PWyoRD05+eC00me69/Np3tJgsRbMFIxr6U9nnjSDmcQXb
         XnLLjFBe2jwC9VHb8A04DfcSZfi3nKhKUq4eQB0zwfsVuck1NFF5cIdnhxHmR+VKlOo5
         ttM0bLME1JVdUetuyupin/fgJsalXpJz5BJwONRKX/yb0AwI93HoVM4ACPKN3Da+f3AR
         WvI5iGsYZJ5xiY0YTkJVP6/u/bjcvp70U0VSNlPxI3uTG1QbvipUo/PTSOSQleALmG6W
         ESj95ZL9MiJsWdhyx29qACiAP8WG/VkF2Mz+wd+haIsquzpzfv/rPf2RunXaO8b/ln2U
         O1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899182; x=1769503982;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/zzCLz7EhPTekTyUs9lCQwryZmkiSO5kNovzXM9TrY=;
        b=n/wlSjpdyY2Cr+9C8ElWbN6wd6K82d7RECnzgvkyQLyveoueRZDw1Bj+uW7It4u2gw
         PbVTCaUFRgmUCBuYmPdog2bY7ZoMR6uRlpnLcKaW1jw0iZqtcB5TSBx+rNhcsa6iwPiC
         0NF/YPIwkwa/aezsy2ziQ4OJcW6ScIP+Et1/ek2zJlSv+daPNOv65JaVmXtOiCp8ZUCv
         4eJYkImFUUMYVinGNJ7CDbD+oMHAg+dTwRXUxuRDOlm5JNRGOlr77iP+0H/M59A3hSMP
         rpsIQbQtqN7TzxMzQWR6mReLChsPaGHvmFxjIQa4ETSQNCWjlLZkxWsQ1JjIocASzv55
         0s8A==
X-Forwarded-Encrypted: i=1; AJvYcCWtDFj8rkfJJQGbHtQ6dzMqMlfuPbQML1shp49520cVTxDmKrSLDPO+ifSv+vfo3VVyc0Vd5U5MGySNEaS/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6T/0kmRhXPQeriO2PL/bnSA2Ki/2kqOqlm3+Yre8x8LjUXvzA
	AzkwS4a0qn5gSSwLIA1spsL4KzxKZ05w4KuFoJQhay9PgTIxiDYfGLk39gytJ1x6YaE=
X-Gm-Gg: AY/fxX6uCyMX7pO1TBF3JdExq6BWLdjRnONIsZQ/nTQeWFexUzU8uu5rUiZ4JnSWwDf
	z4/d/w16zXY6fIb5H8LGCYWnn0lUhEJAoQn7BsXcQFVerFVgBl+f8qTJaNeUE8HZTGEAN7UvNxG
	29zmCru64Y6TN5p9Cyw1cE104KgyD9cB9cenD82JA21wAQ8fzW66VTZ9tvtC+f1PYKGrZ3tueMm
	N0xv4BQ77hM9A3AV1xMUGiXhWSAm1sjD0C+1dO8Ka83bVO35L7rcuKB+mB62vsclMtPLs70BEvN
	L/AZgs62txlwqTRSQ0W1cOr+ZIV7k6cd+xT3/nRv5ttchFRq0jBIBEvn0LnAvau7yNOdk99r45k
	GBedLV8m9qe7nBZK/ErKhxlIVr2t41o0Xh9npYHfw/lqvpJ3zX89oGPdhnhwYbp8CphC4HeLYMU
	wv0xAwp9FAxN7jrKG56rFERPxEv55ySrY=
X-Received: by 2002:a05:600d:644f:10b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-4801e2fef40mr153071285e9.16.1768899182300;
        Tue, 20 Jan 2026 00:53:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm27597335f8f.18.2026.01.20.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:53:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 xieqinick@gmail.com
In-Reply-To: <20260116023611.2033078-1-nick@khadas.com>
References: <20260116023611.2033078-1-nick@khadas.com>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable eMMC storage
Message-Id: <176889918151.1477585.16889853639398545363.b4-ty@linaro.org>
Date: Tue, 20 Jan 2026 09:53:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_005304_343506_8676205A 
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

On Fri, 16 Jan 2026 10:36:11 +0800, Nick Xie wrote:
> Enable the on-board eMMC storage for Khadas VIM1S.
> 
> The VIM1S features a 16GB eMMC 5.1 module. This patch adds the
> necessary regulators and the eMMC controller node.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable eMMC storage
      https://git.kernel.org/amlogic/c/1099b3b6ab01e481c5aaf6c74e9c8892c9636fe6

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
