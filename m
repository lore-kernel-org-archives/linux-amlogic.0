Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ABACD6E4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s5v3PGDOhm4ttbZwcICo5sdnIq/+Rm2Hd8zKFXfgZXE=; b=q3DyXlpjfEg7hC
	GpRtwcwaB20ZT239UFNfqqOp7dnG/GFzeHrSoYQecvfwuFlfzmZe50lyZxS2LmKdQ1XSUUhrCIfxn
	zPQb2QDUG/p6GKghmaTB2sY4DD161brScTwIdbkPQs/NxP7vgpQWzkkOEWOWVdDkocCOtdoCyThfJ
	F5ZgiB/I0KYXzHa+HjUcbjP/yNRnkd9b2IS1j3e66/zctq3FNohwpNTYNnYaRCts+cQ0Ck1ZEgnF7
	5D9wKP5b/st7rHyj4TSTKW1+HXcjlyk9PfQzjrCy2lKF0iTNN0tzMCH3rkgC/c4jZabqtluc7dzTd
	L9u0VCe8VeyTjhxK3kaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxcu-00000007TdZ-17dr;
	Fri, 29 May 2026 13:51:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxcr-00000007TdH-3rmV
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 13:51:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49039a8851fso83475895e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 06:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780062707; x=1780667507; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aYIwFhBI2N6gKbEPX+JrvkgFgN0qr5qebRCw1iE5Tt0=;
        b=aKxJpHSEsLezDNM/9B6uShjMEY6RGRE03X1dN4WE45VvIq29e5G0JVzfWc+aq72BqV
         mociiWGLghJn0A9gMad6+ybwb0pesijJXunweVERxjwQl94XeNiu++/2x5XDxbPvtL2x
         UoRXQMCSAg6aiVri9r+9ZaIRpnLv4jncO46iZZK5rjTMdUf1HRWrImflsdF5Klz/ZQn/
         izJ+Q1iFZdHyxfbFPMUVlipnnZrW9p3PFDret4ukXXTMQGSSslITGWnWbuPyWiYXBYTm
         ZzLfnUrdvP+nIxRGH/89WbGKRQFolO+r7CUpGm5uUrP0Qn9pUhWAKITygXajlVvCeMXS
         DZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062707; x=1780667507;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYIwFhBI2N6gKbEPX+JrvkgFgN0qr5qebRCw1iE5Tt0=;
        b=b9DGAwoFg0RzmyyAy0cIbeD1yQGuE74t2fpdCHY1QE91mkcjFad2ooPSYMGLdjQHOR
         TOuZAsNNBb6jnm8c+5GXA6SGN/obARLfRney9NmJejPz3ELAqLqzk5QJRE/7sQ4O04ky
         tU1PfnttVSmwdFO3Rm7StJjVh0J3dUKF2kKCodPUOn6D5NbUjV7DQ3sTJXmGNNowKdkO
         YQ5XTSHjh59j3azaBF71CnQarU5ql2gqg9FHWBlgiL4rrf1BFcbzG9cMwii1uLleM1fZ
         ortrMztZvkhWa1CXUa8oXuDE3la15jj1Z17qui5wV+Wm1/KENJacyiskLhg/gFSEx6P9
         +ZOg==
X-Forwarded-Encrypted: i=1; AFNElJ+MdQCmgMG8RaoQkASU8CF0KbzoAZB49PbgruwL6p7WN5i4+8YgSOttdyjsVW6zckAuoX29NJUWHd70mWrV@lists.infradead.org
X-Gm-Message-State: AOJu0YxuQqxfmUNG8AU4mqOYn5C5R044r11urtXEMYrvqViX5SR8liwL
	MvVwlOeqo20BL0yS813GopAd7q1jD2ulGoT0Rl3rAzeO/9q+dFONvK7jSVoetJPLIk8=
X-Gm-Gg: Acq92OH+bnBIuSdI/giAfbHp+u31Mpemg1EKEarkccCUxUJj3cCToef76DA5zT/SsI0
	aS4467DD/8nF7e39hcShWds5ecOKsT3OEy4T+VSNJpg12J8/EAx3Npa0sMEV3frrQ0EfBO1FG5w
	mxzTuLF7tTz7ZJ7cgr+JfOOhKIgVs2IuMCl4fETYXQ7Fn6o1OFmblJAEzGXOwrDGeh5sVCz7Vdy
	4uFafydFppUAj5FCPX718x5s3B+sKWD0sMYj1rNyAHGlmgr0b8zitGe1JJxVzIS9rTxHsQPDDuy
	+jzdmWvrAh5lb9l6MUzu9gS+DXavy7mlPVbni1CFQ9PZwx3G00htCba1ozb15jGRkB6I/SpWFGl
	3tUTPr30i3gqAZIxwkrfZc+YDXZi/BT8xkoX8IfBGxGcVlsLcuvczDYANYf8Q1wORQ2mCoM2l4m
	aZGMwONkJRnhe00pR0OeplpCV5n3kqu9+U
X-Received: by 2002:a05:600c:4a11:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-4909c08b0bfmr32628635e9.13.1780062707516;
        Fri, 29 May 2026 06:51:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:79fe:7869:93f0:a6ea])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909d68b853sm43813175e9.3.2026.05.29.06.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:51:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: Amlogic clock changes for v7.2
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 29 May 2026 15:51:45 +0200
Message-ID: <1j1peu5nny.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_065149_984047_2FB0AE47 
X-CRM114-Status: UNSURE (   6.64  )
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


Hi Stephen,

Here are the Amlogic clock changes for v7.2.
There is just a couple of minor DT bindings fixups. Nothing major.

Please Pull.

Cheers
Jerome

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v7.2-1

for you to fetch changes up to ca89c88bcf69daca829044c638a8163d5ce47af0:

  dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock (2026-04-28 10:42:47 +0200)

----------------------------------------------------------------
Amlogic clock changes for v7.2

* Minor DT bindings fixes for the T7 clock controllers

----------------------------------------------------------------
Jian Hu (2):
      dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock

 .../bindings/clock/amlogic,t7-peripherals-clkc.yaml          | 12 ++++++++----
 .../devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml       |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
