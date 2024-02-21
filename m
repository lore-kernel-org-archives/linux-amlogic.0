Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8FAC48BF6
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibdfF2zcVgQzkJAF1+SiZefyxrRo9R1dUXKxSlgRNO4=; b=kxnnh5+RuoZXaS
	kchr0nGHNkcZ/FCJk7k6L3FYmE+SXIS5bYtqirveVGxCkM1NhGzhzHN0cnx8fI6nr/AklaWRiaIhj
	z0hS92Ng2LJppQiXnQQuciiuJhtmUt3ZBSAHft7Eh5SNf9de1zsoorOCqA28rkBUqlgZhN4KFdk/8
	2e7FRn9kTEPArh2FEkmmgcEn44InSVE+VKhuMCGDgkPsAdRJ0tjYqt39O5tmt+C1breQq/POdnxBQ
	B/HFQOGS9cFVqFXfM5OPu64g4R5UEHeUoByDiQ6D56JZmDSkdIXfIeQDYtykvbNbQE0ndyAQWxS2v
	CVUqrySTzQSVF9P+JnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcgrP-0000000HRQs-2rvg;
	Wed, 21 Feb 2024 07:17:43 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcgrM-0000000HRPr-2tdp
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 07:17:42 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-512c4442095so2195360e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Feb 2024 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499857; x=1709104657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDwdGzlFA6tuZPbulz/VQAvLOcdCb4uMPbhP3kDR05Q=;
        b=gFQB++DQEiVHxJCi1ZnkOsm2pjX6KSvf/KDtBsXzhradAiJnvQxT7jDJ1YOpkzKRip
         KBs0dqRICCIED8ZBF4HVJbiD8IzkBoZ8eA6q5qmxeupeMm8kpyWRm6cQCqwn8umb0+YL
         dJGp4HPDPStYSPbd/ydzvD8j2kh0jx0v0BR+UFjyyYLN9niHrkxWdzcemtkFo36NiEr+
         oJtwjx/qHh7rhzTXfehaBcDE+QYorjlmi+vBLqXxeOWos8vMmOhwqLRBBjX4nd+XCML/
         qNR/JAewDUHU4NbsVNpDUm5fgPKWmn1rkMavwsyz7nprd+HybeBxzSjkxLJYhQx9dfmo
         mk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499857; x=1709104657;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDwdGzlFA6tuZPbulz/VQAvLOcdCb4uMPbhP3kDR05Q=;
        b=tvV7KtcXRazynag0C7hHUS/4Psu0qqhU+Yx/YO+48ZWWEX0rHM/mWUkshJDJ1zdfJv
         s+UIFW+slUJprHhZGDyVOTONaU+KITmSqlzPaoBkAzr7fGazaqXRmdquYP2cCv2yWN9o
         MGxHQf/LB9ZwUgxjyswv4X2GcYUAtZ5O87gtZa4Q9abou/RvzzCwyZ8gyH+VynMNqLJp
         2+DwJ5wtB5OwaxXC9M1N0LrTbFq365ikxBQQBtHc6qL4nc9tljuALFYxfAkONY0itRJj
         +dTx6Jo+6demDuQ6Sy8UAF7uuuR6h0KHxkcbUyoUY3nAxCMu/pQyAXf3vpHp4ySPOcYl
         gdCw==
X-Forwarded-Encrypted: i=1; AJvYcCU6qg8X+Hu4eUMsl8SzDgwj8HVK9JsbqAwu4xmokKTg2LZuBx0pqcG1oca2F6JG/T5+ouROXkZ4rfIvCh2m9XAxdiHwFyMrINszphoJVlIZUlM=
X-Gm-Message-State: AOJu0YzF8YF1MeZ7LSXU7l2BDTZstjnGhpeAqnpZPLR8sZ3RCS1k0MOV
	lvaFOSGwXmNNKiXunHuhtOYOm3wHiAYmcw7QUkEB9lyrZs8vqkMxWscIPg3j8go=
X-Google-Smtp-Source: AGHT+IGqkGtQA0L2uq9EpwXq/4XZe8OGGMFaJYlXvE9PH1RKEoAlc2YmPJMRPCXfm76f6tpYvUvrKA==
X-Received: by 2002:a05:6512:3f06:b0:512:8d30:6dce with SMTP id y6-20020a0565123f0600b005128d306dcemr12181479lfa.52.1708499857438;
        Tue, 20 Feb 2024 23:17:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c248100b0041061f094a2sm1459212wms.11.2024.02.20.23.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:17:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20240213142831.3069049-1-jbrunet@baylibre.com>
References: <20240213142831.3069049-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2] nvmem: meson-efuse: fix function pointer type
 mismatch
Message-Id: <170849985550.23383.15344631998215438769.b4-ty@linaro.org>
Date: Wed, 21 Feb 2024 07:17:35 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_231740_771059_257DBC1A 
X-CRM114-Status: UNSURE (   8.09  )
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


On Tue, 13 Feb 2024 15:28:28 +0100, Jerome Brunet wrote:
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
> 
> drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    78 |                                        (void(*)(void *))clk_disable_unprepare,
> 
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
> 
> [...]

Applied, thanks!

[1/1] nvmem: meson-efuse: fix function pointer type mismatch
      commit: 6b475e23544a560b4bf2acfab8dc54c4e7b1749e

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
