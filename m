Return-Path: <SRS0=RQ4l=OS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88123C65BAF
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:51:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5164220672
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Dec 2018 19:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDu2deZG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sV4cwZpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5164220672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GmaRG70M3dUhURWh3ODOK814TUWZGKQqYAfnHRI0GgQ=; b=UDu2deZGYlUI+G
	86aX1YWmn0JrjGurKEWWKs2BhAL+c0JEk0MtMEb+bQcYIqbGUQbLY255bR7Wnawtmsvjqd4A4u+F1
	uULnTzZX1vEWTZn/Q3ch/bZpUaWBgZqO46pGM5MHj7K6XqElF8zwCHmipdVpM26FZmSsz7tagtBD8
	iU3Kw1vnMvDNE07dLUu5ZX1E7pAP1Nmhcb33N1VTv8jrb3YikAzDNa2MPGFPWdNOG7F8AWOdIAeDL
	X+L8HJtHiGs/UA7vglNq2UV5E/jzetOLkQhbKXV9C7/1CHxqpzwVoqfhR9Un+X9qjcGE8IiaHYmzM
	0Qhh0YwqPqtoGtlQxofQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gW56k-00066x-Fi; Sun, 09 Dec 2018 19:51:18 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gW56g-000648-Qa; Sun, 09 Dec 2018 19:51:16 +0000
Received: by mail-wm1-x342.google.com with SMTP id a62so1467910wmh.4;
 Sun, 09 Dec 2018 11:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ICGDzLqEpkhiImNRb5ODmYoWmwur6feiS2st0RYKN4=;
 b=sV4cwZpxGfEm9ef0uH4t74pSJ4JgggIPJCfw9hUmWFgbVHar4uVxQ7WTQdS+AQW1on
 1iCZUAYfgCqXsYdmCdR5fw1P33WSEqharj27x8uT/dulBT+CYDFaEm4ZICDMmFTkmgQn
 8SJVA6SsmFq2LSIe5Mv6mnDnQVshJjhz3+P6zXne+OXFbWHueZR45wf9dedPMuG/8qyX
 v2KPvzXqLTLIXVP28Jnaq7QvEBAEKGfYlgX15P/fcGs5EzgvOc+SilOr0IH7gYD8xwbA
 UQM7NERhLk0QI1iB8MZKA1W64BRpU9UqdClCeHCwYp16StVfyZ3Br76GPM6Xdv93vnzD
 yMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2ICGDzLqEpkhiImNRb5ODmYoWmwur6feiS2st0RYKN4=;
 b=t70orKyz6PUNnY2MV+SGO7cRNMJjstnmwLosUPh/jvXjdCyJWm03F1xHh+aonkzdUC
 gozbYhHD7HZxxLyygY4cfP2FpNkvi0G4wVCNIcsHi1d55UrlQTnwlDtkySnBweUJ+GAu
 C621QIIAG4JhrJIojflr4BoDUycUJSkrc91iCwhbQvgAPpjYZYtafKmZ6HotkTEo5iH7
 qdVvclb0yxc5XTYemRT5vqCF1K5AFYePfy31B6SuFXDXPuOq0dFjiddWN6G1gYXZksWM
 vk56u0gjhDSHLXKInKrSHbYPDoE/PlqwUP/eoXrQwmQfBC4ruAFI6ZsSuyOr/e49cLX0
 5zLA==
X-Gm-Message-State: AA+aEWYqKvluXL1ahdSRKkPex/XUT21E8HgvORVKrsEU3K/50FdP/mPS
 yrOf14HTPCj8ON6qE7CaYg4/6X4O
X-Google-Smtp-Source: AFSGD/U21nsjBbR+piJXAvWxSa0Gibh6TcxhY1nY+lPbTw7cOPODyyi5tqpxQlK8uUBsavF1KfI/ow==
X-Received: by 2002:a1c:b687:: with SMTP id g129mr8247611wmf.59.1544385062507; 
 Sun, 09 Dec 2018 11:51:02 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73FBA00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d73f:ba00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x20sm20270941wme.6.2018.12.09.11.51.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Dec 2018 11:51:01 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org
Subject: [PATCH 0/6] pinctrl: various fixes for Meson8 and Meson8b SoCs
Date: Sun,  9 Dec 2018 20:50:49 +0100
Message-Id: <20181209195055.26813-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_115114_861751_F226D8BB 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: carlo@caione.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While debugging an USB issue on my Odroid-C1 I found a few issues with
the pinctrl driver for the Meson8 and Meson8b SoCs:
- GPIOAO pins cannot be specified as GPIO group in device-tree
- (not a bugfix bug an improvement) make the gpio_periphs group naming
  consistent with drivers for newer SoCs
- add missing GPIO_GROUP definitions for the pins in the BOOT and CARD
  banks

I added the correct "Fixes" tag to all commits where applicable. These
fixes don't affect any existing boards or functionality. Thus I suggest
to apply them for next (v4.21) instead of sending them to mainline.


Martin Blumenstingl (6):
  pinctrl: meson: meson8: fix the GPIO function for the GPIOAO pins
  pinctrl: meson: meson8b: fix the GPIO function for the GPIOAO pins
  pinctrl: meson: meson8: rename the "gpio" function to "gpio_periphs"
  pinctrl: meson: meson8: rename the "gpio" function to "gpio_periphs"
  pinctrl: meson: meson8: add the missing GPIO_GROUPs for BOOT and CARD
  pinctrl: meson: meson8b: add the missing GPIO_GROUPs for BOOT and CARD

 drivers/pinctrl/meson/pinctrl-meson8.c  | 33 ++++++++++++++++--
 drivers/pinctrl/meson/pinctrl-meson8b.c | 45 +++++++++++++++++++++----
 2 files changed, 69 insertions(+), 9 deletions(-)

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
