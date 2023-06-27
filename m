Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBBEEB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WkSqqAmyBPkvX3rmwzGXyLRWyFweNlx1DcSbNn+nVY=; b=3Lc6oICprvS3Zi
	OW5phIh72ClS/w8XLCNr7qwwzu72YCbkoJgZauJ+ZtiEiNAnhfKL7CahYIrXHeyUyG2L8oKdmGocz
	PDs0cezYsfMFKBmm8xnjpwjOUrwGb5hgTWLjT+0qYR7a9VkShvh78YM4JGquWbLThEGszU9NW3S78
	U3oyUwsRlvj3ryFlPKKl5OJ5/A6Fsa/+QHv9Dy0epTVIF/P+3rfnE4+lMD89ea9V3x1o9hsga4T+T
	xqO/iuTteTc2BoXhE2zX1yWb7907MgORi8ynIu2usbuVTunhnXPD7h8BWjoxKgXbTN9Ee+QdZB6ne
	M30diEnJZ+XemXx8IAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iR-00CeWE-0E;
	Tue, 27 Jun 2023 09:10:27 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iG-00CePk-02;
	Tue, 27 Jun 2023 09:10:17 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fa96fd79feso22764425e9.2;
        Tue, 27 Jun 2023 02:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857014; x=1690449014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4zAJ9Fvhu5nWIa1wd1+G4v+5opDCU+KXPZNXrryFuI=;
        b=WfWD76dYGTl30eIpYBjXNstpZ++y0gewPa1ukOF73/30yJcUwt5O9nIJP5X022B838
         2CRY68Azj7HvypJ9cOSZWQMC5Y18VdxZRR3j6LhcchcIuFRwHaKbuMMagSYc3521AP/i
         FR/rFAkw0pBBjiZ3Eb85H42WQjS6kc7ENG9Uo2MH9SaoXKRE4FnvMpB5i/uALGk33hEz
         vS39gtuXOXnLhG0nzuLSJcshsCOEMSz2Veg+6AhaNaN6DeownBoFLBNKYcsAQQTNqtFi
         2ekK7E8j9jZaT70MAWx4Zf+G+RF6MBjHSe0qGMVcYd2B+oRkgdEgrujfEgo4RArOHL3l
         VOPw==
X-Gm-Message-State: AC+VfDz+xb+e6G7f3+7qe7ppJ3V1RsEroS8LLvya5PBb8p5FCXcAjrZZ
	Aeuw8wET2/3j32JuqwcwJG8=
X-Google-Smtp-Source: ACHHUZ4+nIz9PePMmf0jMSCKrOYy3j4NoC8eln4/j0Dq2hIJQ4EFvcMz0M0dDlQTVSFzPCrD1cOwnQ==
X-Received: by 2002:a5d:63cd:0:b0:2f0:2dfe:e903 with SMTP id c13-20020a5d63cd000000b002f02dfee903mr21368230wrw.69.1687857013952;
        Tue, 27 Jun 2023 02:10:13 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm8880122wrs.55.2023.06.27.02.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:10:13 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v6 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
Date: Tue, 27 Jun 2023 10:10:06 +0100
Message-ID: <20230627091007.190958-4-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627091007.190958-1-tanure@linux.com>
References: <20230627091007.190958-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_021016_059355_BD4B27AA 
X-CRM114-Status: UNSURE (   9.38  )
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

The new Amlogic T7 SoC does not have a always-on uart,
so add OF_EARLYCON_DECLARE for it.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/tty/serial/meson_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2501db5a7aaf..c24e105a98c5 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -649,6 +649,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 
 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
+OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
+		    meson_serial_early_console_setup);
 
 #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
 #else
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
