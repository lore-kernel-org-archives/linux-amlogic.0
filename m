Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0480CC4828D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 09:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tvkc1DhhpgqoW3hoChwq1gIyripU7cGkBwLROfLL3wM=; b=tVLVdmX7TFj5bo
	jXwbDJw8xd3Cphosf1KaUuUdJRnwutYO4P+Alb7ojVLkpCXtcVTWzjbcz9S7biMZPYqwXAYhsLwGQ
	unfwf4SLKJH5+E7wrwoCH+RKvk1iPHA3fO/NACJm2JoLaFLyEBAQPeYely7zbZV/8rx/FFdxRFH8/
	tisr80IqpGerD2tHKbFi9WS5cSh+zbuCyluLxfD88xd7X/KXo5ISYGFKlhf2Q8p4zl5HRRYEFiS7C
	Kp86KImS74apAcJRAc7T4I/dXUIYiNZgRJ/q92slpDh0Ruk6/6PuZlFmSf5E9/V5ctHojV9LDmC/J
	Lywn1UwTeZZZSMDgp+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv2l-00000002ZVZ-3gzo;
	Mon, 05 Feb 2024 09:13:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv2h-00000002ZTQ-3vLC
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 09:13:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33b1a51743fso3034897f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707124409; x=1707729209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIlBCGAlAOP/xnINBhUIazc/5EX/rAUDsP4Mt1wIx3c=;
        b=H/1wfG8QVh6+r8Omp7M7sXjL5cjBXlnVeFLIyaEFMyLZIRVMUdUGD9A3W8+rG2buDE
         2r9fQqzoPkKVbdlHsDLJKe3S6GDAhmOgSEjAKCOAqFvfesS+PnfOXpdsdWsYgCav1O+3
         23XGHsf0oTVOBpUi5t/BJiZr9Gk3uDuINlsxaduzx5+A+PCDdOKBGJ2nQHN+JG2GcQvG
         ldUWG358Ik7Nj1Ind13ADXWQrG4TRDNJK77xLpIDKqaYmuqufEOiYavXHAO9lguahBHv
         qyYxVdxndntfXambHmSNTWpR4RBN4e7V66ggPbu1gq/fqcExUT2n+ZqAN6ZSHjnl7Llz
         kBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707124409; x=1707729209;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIlBCGAlAOP/xnINBhUIazc/5EX/rAUDsP4Mt1wIx3c=;
        b=CYcagwWi5RiRJcKRRi4qMYqIdI1WVCx+KRcP7XlaHiMXYZz7/ZL+W4tKhhtJd1Tqyk
         ho66LZrTWY72VaC34M/IswCleJNvArwIOgpi5nUATfDXDUVuDGFWTzCYLpN82bOh9DTx
         8nS96BvOhPHzj5qFEA8s9RJLKH6TtMym27HK9nuyMnU4DBcZwvj85GfH/ZZBnEkCMUfx
         RwuL9YoZBYMU7a5423RmjedgDKECliGhE5kSla0uJIRoxWmXz6ROufba9jZGBY3DMPm3
         bmQZ4kJmY1+23TtPz9gcsvRh0mA5gSafuBWaw55pH7jA+cI2u2AZFW8YuaA59KRvpg2T
         is/w==
X-Gm-Message-State: AOJu0YwThyHsGxmzdV5SGFIiCtpbUCkE694hKOWZNevlBQ7XGLbgwqOp
	hoTBzPNqpVguOUGRvxz69NHKF5GI9l8lYenWxnc2iD9sJu/7lovaEr+yjVjzAOE=
X-Google-Smtp-Source: AGHT+IE7cboWWkouWaojklpHcDELlxQ+5B75F5Fr5svEn+rxuGcVzMQrua+ZWs7f/9hdxCV8eGsXUA==
X-Received: by 2002:adf:a399:0:b0:33b:3774:ed0 with SMTP id l25-20020adfa399000000b0033b37740ed0mr2754187wrb.2.1707124409402;
        Mon, 05 Feb 2024 01:13:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXquMu+7rRjRo9xuJDvLq9JoqQf/DoHAKt/zk25ZB+5A+y0DrzSLFNbAAODEmVEe2wvVG/kCkGsEW+etLt+zyd7NU/KhnEXhApgEsNw5tQpDF5T/qWdHIPebgY7gNNvkIXSUMLamc5GeTN5H8KZx5UiyBNC38XBNBYlbA6d+igsDHpHrOndEVmv/+LaGjDyOIpT/k72In8n0Mg+7xnhOSIIwbbj5kLZOkkt82G9mqUeIByZfN7CYxo9xetJDOp/kN29GjCtuwSaEW+VboPYjuBs7S7YRrcOZ4/Kgfmmv1oSq9avjA1Qw4AgNNcO1AfhzyDDomcrc4qY5FQVnAka92dO5+hn9zeOPxR9NpEY07JDe6VhqeSPuDH0/vVclMJ8J7BsTnkSKGwmZIIDSOMLR5xqwx9YdXjOtHijk6657B29TlwSAW9NvnY=
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:455:1a2b:40a2:1766])
        by smtp.googlemail.com with ESMTPSA id t18-20020adfa2d2000000b0033b1a4cc2a1sm7711368wra.7.2024.02.05.01.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:13:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: neil.armstrong@linaro.org, Igor Prusov <ivprusov@salutedevices.com>
Cc: kernel@salutedevices.com, prusovigor@gmail.com, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
References: <20240202172537.1.I64656c75d84284bc91e6126b50b33c502be7c42a@changeid>
Subject: Re: [PATCH] clk: meson: Add missing clocks to axg_clk_regmaps
Message-Id: <170712440863.617794.2380345437565943814.b4-ty@baylibre.com>
Date: Mon, 05 Feb 2024 10:13:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_011332_033844_28ABFCFC 
X-CRM114-Status: UNSURE (   3.70  )
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

Applied to clk-meson (v6.9/drivers), thanks!

[1/1] clk: meson: Add missing clocks to axg_clk_regmaps
      https://github.com/BayLibre/clk-meson/commit/ba535bce57e7

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
