Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5FDC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo5OOabmDO7WEGTVwQaOviaRle4+KtgvXvwthwkHT80=; b=G3Ugim7q/7WkRS
	Rs79JRKBcNVcIvePXAiIeYFgncX2BASOLRhbCm2W3t1x6HrJyV3EeQ2OmxzOsNv2vQKCIrOCEZItM
	dfJ7Ymvj3zP3cbjpYMLgtRm5DIDU/J1FtU0DM8fs0tdy1ZhuAUNNW8UDr6EiO5CbVUDyus48T0z1w
	a5maNEgqzisEX3jjSb2xa6WVXSKHjOM5RHtDfMN7tGidMCACRGeR08x9lzb15q0vjtb0a9bv+gbml
	TqjFcB+WIKQXRcqfFwJ5HAqjwpdWgF2oSVOZZeJXH4oi/XLddjzuhezNgEMlol40Sdf3nqfMamIed
	V2B9KqQ0QQjH7z5ScC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Mw-0000000EAny-3VMi;
	Mon, 29 Jun 2026 09:33:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Mu-0000000EAmi-0xES
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 09:33:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4745492ed3aso295655f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782725610; x=1783330410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=;
        b=KwXOfCYok09vFtrYtXkqWuBqtpcQJ+Eqji6f0tyfPRCcNBYiyoqzJT8INIJijNyYma
         8BJW7fcefSRuLxVMTKjDti6dLg3DFV78Cqz1660XWREV/e4bWB8sc3632BcVJeZu5077
         WnLc0OkvbPBrX495pLD6mS11rBFCsu80nKanHy2409La5YXwHAt2kiFTo4s2zpIH3ZQ/
         P3tG5TPqvNLlRkidNdkoJL8dT/hORwPePW124pJSZfC2PXrmb8NxaPQq2bDrPsNHvAYM
         /Ic5DYBigjwbu4UbIDszZU5s4wU+5F/VhrCClztxCu2czcry/YuK8pirRrJeOj5QI9WY
         LrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725610; x=1783330410;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vv3/bI7mQQBzw4o7vxFb5GrHgzhC/QfD51paBaJ+fHA=;
        b=W6S4Mmj4zu8gW1D1ituSBtt/iv8OoOtbV3OxRuICO7FremKwxO8Fa5fVy6WQPTyQep
         agZUMZAxmC5Nf4DF+3npPUAB0uVDBgwCPGnxBwFWqXAY7ZwYLPtVOLgHImukxZCEh88Q
         SQ2qcm/B1t+LT7JwXBHV3rHUR2JGgKzc6KajeFGCwGeiut38oM8m7+nkFZbMyXpAFQfw
         Fsk0s1IIPlAyD3KIAYcIyJEFVjiQFcmvesinrreptpfeMoECOSoWszXxwZcbER5IFQF4
         S2Cx8rx9X37/FLiKBCUB/QhgbO89AbWjwSLMFucNInLJAjPp8Gehj7rQvEPlP9IfbyHr
         VbsQ==
X-Gm-Message-State: AOJu0YyewiVSKjo8rshc5RGKMHGDeLEV55wTvwjDvLw2kaeBuXO0C63+
	ELLlA98glpwtqj7ukq64Dl0voCO22wxbLiQWP93gLMvoFKqm+EXzonZsDF9V+Z1K/CI=
X-Gm-Gg: AfdE7cnG1q6bOv4EWMbjr3z89WN8y8yURdZDUlPLbqM7drgcZHSBxr44MZ3IiJuqfFI
	6hUnEXGG6KWq4l6fMECkw3HQ3/QwuDFzXYn4kV6u/8Cz6iyaMj+Q/aYUWMsYlVIGKUVscREFIrb
	nXNnd++eI6HAceDEjtmgeQeQEqenAtPLDaN7BJmYOfe7NqX6xZeuIGrruHsvU6xh3N8qolFoq2s
	vPJkVD2wJjM5hSukd1MntJoX5fw6D0ZbE1P0/55XLglLuraAAAaUsilV7KLo2HW4CRSUILyK0Ux
	A8LbaN4CnVUmREsSbtDOlYyKjjoYLJBzf0xGY1utS2pK3ks8doL4Kq4LeoNUrLQcZu/sbHGTlMT
	5mTk4BWaitY2sMnayIX0IhV7+jMVud7Pe0u87iJe9gchua5FpWCmn0nzuWDjJRC0Dz8a5J8DD7N
	7u1EjkE8Itycg=
X-Received: by 2002:a05:6000:46c7:b0:46e:5c5d:b2cc with SMTP id ffacd0b85a97d-46e5c5db779mr19780582f8f.23.1782725609875;
        Mon, 29 Jun 2026 02:33:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46cf775a4f0sm39251229f8f.17.2026.06.29.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:33:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
In-Reply-To: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
References: <20260623201956.1324992-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] clk: meson: align gxbb_32k_clk_sel number of
 parents with actual count
Message-Id: <178272560746.2490611.124390800107278004.b4-ty@b4>
Date: Mon, 29 Jun 2026 11:33:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023332_276162_BF5C171E 
X-CRM114-Status: UNSURE (   3.51  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, bmasney@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
      https://github.com/BayLibre/clk-meson/commit/628b6fee9fca

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
