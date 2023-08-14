Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3336C04A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Aug 2023 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=650ZUYCHfd1MOZZje/wKEQ46WKkYb836J+2higoAm68=; b=QyrglBvDIM28hA
	wkELNd+eXnIAanUAchaGzpSuiK5Wo+bWl8XDsYMs7M6USxAWNjKS62PrVQT+4GIT5JbUMw0BVRhY0
	ZlBKlEErGl5V18Jb1mucwg2/wmWJ3105prqppSmSl/Udu2IsqwQ/YiyOJIac2ZkJGNnDFcEikAoTJ
	beCYnMmpPz+hhSCH03q3XiqO9CGXnCRCDXGsSU8bzgQ+mdLW9sYgTnwV8TvxtPRl8/Tqy3WVvnpQE
	WqlkrgeiyVN1eoV3jcmzhCThp93nUOYsRl4DbZa6cavZUFR5ewlxcit9sKxfI4upp65IdAQ3wa8LS
	/EFNG2F77RobCyWxxb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSWQ-00GQTM-0M;
	Mon, 14 Aug 2023 08:01:54 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSWM-00GQSU-1m;
	Mon, 14 Aug 2023 08:01:51 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so8396107a12.0;
        Mon, 14 Aug 2023 01:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000108; x=1692604908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMTTRR25R89hKbOO/W0HzP5By9l6RSmOyGZbfso3dPE=;
        b=b5ERubpcPRC+CVsJKtlpRhbhim9KrUnPb3DJF5RfmoWunlXyTWcBjg9vLv29SS4qyI
         VEeBVYGwxkG9Ni7uFOwGEoZj57R7MRjmGn6WBzQ1rQAomlEJxFHIvz7FDosWWuTUlYw+
         WdNauQC7bNY33JjSMAX328kHpRDir/m4hzmlO93CG3fUV27SktVp00OR/jnfYqrCMhvv
         +5cSflxwjJZh5x9OVHOJBPjcZ5esq27K2ehfF14WoGEQKGAhscd5513gymy3pd7giKeZ
         CvbIX/d34nRyJWIFIKxrzQKtC3AEfYC3IyNbktUh9qkGu36LlFVIb3cNf8kRNojZ83Gv
         iwDQ==
X-Gm-Message-State: AOJu0Yzqfg4Y+eD2MBBbmigeQAei2vYEYzTTYqKvSKLUUXoI666VK/8b
	1bM1Z3EgC0zYZ5btgkvOghE=
X-Google-Smtp-Source: AGHT+IG9fmf+oLcXRU5lXPTS7InX83yaVfnPLLxfI8jNNzmLI02HPG3m3YGJqjVm0m5XaHVFv0q0lA==
X-Received: by 2002:a05:6402:40cf:b0:51e:5898:a23d with SMTP id z15-20020a05640240cf00b0051e5898a23dmr12673976edb.5.1692000107737;
        Mon, 14 Aug 2023 01:01:47 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s25-20020a056402165900b0052568bf9411sm678074edx.68.2023.08.14.01.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 01:01:47 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v9 2/2] tty: serial: meson: Add a earlycon for the T7 SoC
Date: Mon, 14 Aug 2023 09:01:28 +0100
Message-ID: <20230814080128.143613-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814080128.143613-1-tanure@linux.com>
References: <20230814080128.143613-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_010150_604803_6AE32E95 
X-CRM114-Status: UNSURE (   9.95  )
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
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Since v8:
 - Fix issues with git send-mail command line
Since v7:
 - Send to the correct maintainers

 drivers/tty/serial/meson_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 790d910dafa5..c4f61d82fb72 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -648,6 +648,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 
 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
+OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
+		    meson_serial_early_console_setup);
 
 #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
 #else
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
