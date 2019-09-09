Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3ADC4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4472086D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqIIB3i8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYLKHoHw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4472086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rn+YYnUt6BzFUsDUzbhEiELlUVAn+FNt1vZEaDEcOUg=; b=eqI
	IB3i8mcRLmHTeUPeuWVcAy3N26mcPliwnZSQeDBr+P83X84/QUh7BNa6GoHi3i7R+6WFIwaoLQMQd
	J18ykVKCju7TI5uSWJA/heId9yfzZ6+QK2G0uEywKwaxywS8ybfv7f+eJ7VIyNEilswSIwQYzW71L
	5IVqSghR0UlTQBj9Hs8vOKmiVIuR1rJVK0Ht0OYA3EM9lCOzH6MalNMAyhwlcQxW5ZZ8Kog9pFETX
	qwQC9Vc6E2aJqGg2BJY9E6ZN/i+Tsh7Flawtv2r11YszjVLVjErXTfr+hOLbJZ9IPTmICYkRKlWzH
	rMXQqsET4O9QwIQ0n7mMC7UXvaKAGzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7LBw-0001Qo-QH; Mon, 09 Sep 2019 15:02:56 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7LBQ-0000xS-4Q; Mon, 09 Sep 2019 15:02:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id o184so15087458wme.3;
 Mon, 09 Sep 2019 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hz2LLAs1cNin8+Ffsd99n/VCZu9MKmEH6kess00jubE=;
 b=kYLKHoHw1+FdpSAoZzgikfbFo4aHSD51QuWxTqCKhwqj3oiheEFX+WJYtWCKXssu02
 hgshnQvzqDW6oYrgdphx07wtfGM8lDdRbRvsPsExSMMNYRdVOpVxjx6VtYTdIQvH6PN3
 98yBv7dEucrqRlXp+ndBEpQelQyanNmQza5dRg6BDmMSI0Mxory2upSb10YDzOdXYOtl
 CF3/rOTbY/8MQb5xEJjRkR2JFAMtv8lOL1LFmY+HDPss6uk+qekUOa/Yi1jL1aZ3YGqP
 Lglhg0dARlwzBtOnieW7qwhqKhDoIlwCTAh9DojPChQ+HReemA5EMLoJZSWJDnkudBsn
 px8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hz2LLAs1cNin8+Ffsd99n/VCZu9MKmEH6kess00jubE=;
 b=MiNaOhYkqHrtqc1or3RSDRy1LE32VZCVgdnkiNPf4Qj+YPOpJXA4W3dUwyyZBjVsBZ
 AiO8U+69crJZFNSfgqHJ1IeJtxeqkLpPXSslxeJy4mbv6u9SOE9NOyQNpEQSAe7jtadE
 8OZH9/i05v3rjO30x5yowwITMXUdbtb/hmbPJEY4a/FTDh84qRPoz2HfZBFciA7EJeaO
 fKmQwbm3CPyBaXE0fPtU3ZhkcqvxMrKbA8lVn3LycKpf71pOJj29t/geIjLbF3CJ9g+h
 BbUgAGwuChgRMsbsCyPjZT+f7KvwUGqOwZM8SnBdbqNQTnxNgT4aMHwH+h6nVc0/oJRv
 7vcQ==
X-Gm-Message-State: APjAAAWDpktLhRbLXWL+tBV/vxc70cxjmQenGx31SjBUwzkFQFj26cfQ
 R54VHq7XIqbxG0xAkd7isVohwxKknChZ/A==
X-Google-Smtp-Source: APXvYqxuVkRXu5Dx4fweA5WFPPS8e3xjqSXDcwP0Si25TxUEBUwQkdppodEEW3Bh9ipx6K8IG31EeA==
X-Received: by 2002:a05:600c:259:: with SMTP id
 25mr18717914wmj.158.1568041337964; 
 Mon, 09 Sep 2019 08:02:17 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id s26sm27755397wrs.63.2019.09.09.08.02.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Sep 2019 08:02:17 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64: meson-gx: misc fixes and updates
Date: Mon,  9 Sep 2019 19:01:21 +0400
Message-Id: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_080224_177151_F093716E 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset:

- Fixes bluetooth on Khadas VIM2
- Fixes bluetooth on Khadas VIM
- Fixes GPIO key dt on Khadas VIM
- Updates model for AML-S805X-CC
- Updates model/compatible for AML-S905X-CC

Christian Hewitt (6):
  arm64: dts: meson-gxl-s905x-khadas-vim: fix gpio-keys-polled node
  arm64: dts: meson-gxl-s905x-khadas-vim: fix uart_A bluetooth node
  arm64: dts: meson-gxm-khadas-vim2: fix uart_A bluetooth node
  arm64: dts: meson: libretech-ac: update model description
  dt-bindings: arm: amlogic: update libretech-cc compatible
  arm64: dts: meson: libretech-cc: update model and compatible

 Documentation/devicetree/bindings/arm/amlogic.yaml           | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   | 7 ++++---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        | 3 +++
 5 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
