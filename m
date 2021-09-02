Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDE6C432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F16660525
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F16660525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WttvJjw7dKzSePnOPHvERdBGKxTKLNcvnjrCuMnbVc0=; b=ljQkZI6iDvPOeR
	KY5dmFQsRHjhYDegoLlpCb2MT6D5G6E8IQ2EL6awHgvWeYDc/mgYvQZ/u/0HfnopxbgJtJx2uWec0
	yDmrZSnqX+nSaqV3zGU+lcnzJXlIPEtiIhNKEFYCxxlURQRAYVaK8gZh/BaksocxyfSN9+fBs4bBg
	JyIDps3yeF+WPuV/z6hZ1fadc/cudhSDw4qroJKsiWxmGJhu0x/gH+rTc7sgSkAUi24kYZnuSiT82
	0XcB6SToe2LW7q36GP1FDK/WslArFl74soDbGxqlyDdqz0YccqlAIsuGxVBMGjfLLEI8oPBLdWPq6
	BD7UYajZFzBmM4E0gleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLn61-009l7f-Dy; Thu, 02 Sep 2021 13:49:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLn5m-009l2s-4Z
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 13:49:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so1503494wmn.4
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRJTxe9GCh77SaDlbDB+FZbUegUlnF22LpoVaorZJQg=;
 b=ON6FYE6MBGgnZsLeTynL84+Wj2xJPLchEu1olpR+97ROZ9Rb4TA0BI7xFmGKdefn/z
 fivNNCVH19nHn1+ta7RiF8hYUB+zVOpaEV/aqSzUpM/7zLDYM733GLkgc13+XcbZInRU
 6pgCIHuAebI9Ez2uuOkfktlaM48gXtSIn5lb4bKznV9o94yn88ac491KcBVIUPFVUrDe
 jOKFwK5zTI9e127t4pNIyEzYHvoqZkH1t9WbVSFhk6Jph+mPjEL4c4U4kY1BVAvchyrU
 fXFg5eChpNlhdyOUxnocAuYEei3velVVClYOo3zA1krjCBodrEmTyY+LlaxFagDmw6ny
 evlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRJTxe9GCh77SaDlbDB+FZbUegUlnF22LpoVaorZJQg=;
 b=AbERsNIsiJrjrDuGahEv+iCHD8X3K8PsuSqTeilRJW8d/+SsC12L4qESd0FHP5i7rW
 1GU2sYvEIQGt5IAeCfnpUwj5FQz6wyy8Ud0mzoUNW9eH6EZwDJhhGqEHsY/4YdGfcWTK
 /wQqJbjkxg6W9hqwMvmTgXF50829puiAuQA7hT+sH1/It3c4tLtc9WGLNnp0dFhutxAd
 aRFVa5LRVSozWqISsqVsBI/YMcwuLBb5WbzDFBNjvfEiPoxDEkyhjI6lGuc9XAoiW75e
 vF7Y+YAXLFf8ERm3c4Mjp2CTQOUXcsa8Ll4on3SN9kZNuGXpUL/dNRkRj0o4uQQ8B9XK
 dQ+w==
X-Gm-Message-State: AOAM531taGTJTGQEt2LsUHFhnh5beu/qjwvej8Zde067r7CBURh2g2hu
 3XMbu44aWPm0DZu8JAmh/V2GJw==
X-Google-Smtp-Source: ABdhPJzf5O7l8jUYGeFWytspijFJtS612FyDJIWxp2MEZBk4cIvPg6hkWZTsI1xLbe9vUrTrpWN5tA==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr3236020wma.57.1630590560220; 
 Thu, 02 Sep 2021 06:49:20 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id z5sm1710162wmp.26.2021.09.02.06.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 06:49:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maz@kernel.org,
	tglx@linutronix.de,
	jbrunet@baylibre.com
Cc: khilman@baylibre.com, lee.jones@linaro.org, saravanak@google.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] irq-meson-gpio: make it possible to build as a module
Date: Thu,  2 Sep 2021 15:49:12 +0200
Message-Id: <20210902134914.176986-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=741; h=from:subject;
 bh=BJ0wKgM/sh8qVeWw6Ci5X3TYYqzyBgAeXkMIaAo3sXE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhMNYSLQmqINVZJsypWOhkIEXc27P7zUuNOY19OoG4
 ywFgk3OJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYTDWEgAKCRB33NvayMhJ0TzPEA
 Czhm88XDsKBhKVWoSM6QDNAFAe8mHAM+qjLKIwZhe/JNTfuqiHEXd3sM4aYtO6otxUqXNVvJnr/pNl
 65kYbgZ0kdmD7jNfzt0LXd329sFTDxI/FSBLV/X6sqrMzXnsvZNlRW2wQqNvoxzr2wA6LvVjHEidDD
 BLBe99IFGyQuYNNx0SaoSKlzON/6hGeak6qeQN//44rwxFEz5vh54co6N1tDZ41XHdjs/FE4KI5c12
 Hm3IMvFFc4YZX3kdhP4qpmy3avxICZA2jKUIj8tOjDhewCyzu98q5s7ClIr23WF973bizrGz/JYYYv
 nprgc1tnoXiNU1GQ292NRDxCgcNSWzrSR/hGkfKutdKaNdm7asnS/+8WEZr7i4Ez+5MTP+5ezKQFQU
 /BZgS+UuMmdjfMADlceIqekVRIUDdWSJepaXAu28miAviPzpxO7Yo8JA635xAnzWLVRMPkks+uC/3n
 urX5YPI86E4TPJ03oN6HFjbk5pc+IDq+qkJaH7f1Gd2z5PaUZlu92G5pgOyI+UNRjDylIFWV3ZQDb2
 nW4FOYOGMNuKEjHz0lmtUASfClAxSbcmXXuDmPbryCerI+1eniQ+vOSe4cbMT1v7+qwOreZvZRNMgo
 mqojFCXcVd1OhM9IzgiOs7CruZbM9sYDCLfb52VpPC+Waq82WiNl6nR+bKkw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_064922_211801_9258B518 
X-CRM114-Status: UNSURE (   8.99  )
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

In order to reduce the kernel Image size on multi-platform distributions,
make it possible to build the Amlogic GPIO IRQ controller as a module
by switching it to a platform driver.

The second patch removes MESON_IRQ_GPIO selection from ARCH_MESON to allow
building the driver as module.

Changes since v1:
- makes usage of IRQCHIP_PLATFORM_DRIVER_BEGIN/MATCH/PLATFORM_DRIVER_END

Neil Armstrong (2):
  irqchip: irq-meson-gpio: make it possible to build as a module
  arm64: meson: remove MESON_IRQ_GPIO selection

 arch/arm64/Kconfig.platforms     |  1 -
 drivers/irqchip/Kconfig          |  5 +++--
 drivers/irqchip/irq-meson-gpio.c | 15 +++++++++------
 3 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
