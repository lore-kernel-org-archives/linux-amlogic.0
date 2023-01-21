Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4A2C004D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDF/bVkm4xVNL9ZyY/hiXPOy46kJs4Zzi3cd/LRjB9Y=; b=uFVvvuSZD4SqL4
	/XuYHBsKS8jzALgEeddCdiSZwEVGtrhY8UaJY1j7W87QOxPApRWwtMboMIMe5XtU83ky86EzKfSD0
	5cWzP1wcnw5uSutdDF+WpQJDmaGUw/X0v6zdBuo6FDYfwswxzd8+HIP5LzWPzHA8sVOxqX8PO3Ub7
	6yiVwh+QtEn2EIEQggCBJ5C+wcrDhNP2y2GWgO3M85B74Nb4x9k+3mEIdI4JXxRgYf0qTVZzt7DEo
	dPuTgUdS29eNf8C/Wmm8F8N+fFieX5D4/V5uX/AHVRYcY+XSx5upkPMhVE2cQ5SeyNn6IN1WkoHq8
	OtqUO6p38P7HCqPA8tsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7s-00EERj-Ej; Sat, 21 Jan 2023 17:58:00 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJI7k-00EEF2-VX; Sat, 21 Jan 2023 17:57:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id 5so2662532plo.3;
        Sat, 21 Jan 2023 09:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AxWed3glpCmJJFQzDC2lmsR0X3SYh0baoNWzeGiA8c=;
        b=FHUv3ytZ3dBXrU1hpnFUzfg9Bg6/6D8bJR5hlUGkzuX2Ty1zYInFQ4XzMSszLeUxBr
         hfDSjcZ3gq+VGkxXGfRzNtcEupWnzneu/Ewe6OkVZkI3VEACcyTWzymEaZjjAyZ5bESy
         dvWz0Dc+nzr8u40UWtWQbjwenrCEAgOOcOEbxbTuphleTvpSSUEds5tLMIhdpoJhYorx
         25258R8Hv+UGniVH60wW3eJlqCSkVrHcUss8pxQrJ8ftVNpQhjQXXgK2NvKU3J9jeC/m
         FVOKDZ7AyTjCW0nj4Za7LQCdWBC27LSUF+B0XfBfW9JK9i5WtpXgR1g0PqWhSAgidGWF
         Fesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AxWed3glpCmJJFQzDC2lmsR0X3SYh0baoNWzeGiA8c=;
        b=ZOo5WOOGgVmETUNxKyjf09nc5hUfN98I+89362vrD4Urs9OIRY3F9qV5XZXLkwMZI0
         ONVKIYupxoa3JhqKeFzLAZGEj4Vh2h/gSIsH/qIJOuB1O1nHphFBYq8CwgTUww6qvCW+
         IgtVGQOw60YU8LQZMpkl8oSB1pZpsYv1FCg0r8L+Wk4ELm5hjqlzZY2w7nTELjSgIY7K
         hvZfwqK2F73PSQ0vtc1tVYM9IjjpyH0D7MkP/3mqaH7enj3nv4inRunP4P7CtZLkOVW9
         JJidtTE7zarnYIao8rbAjX+Rlvlrj1zcKXIbBFvaZ2jNi2JT7Vej/M1rbI/bfnBBEoHI
         5tGg==
X-Gm-Message-State: AFqh2kqhjR99f42PBOwEdPUgJQOwngq/OVUGlcfhd5dPiil5lNhgOo14
	Sc0xcZU0Zc72q/O0xeSFKuc=
X-Google-Smtp-Source: AMrXdXsf4SVRTT/ubc3h7M/MP255AO6thHeBSiOMtH0zWpbDTLmZcqnmOpTG2PC1+frJKV42uTpzSg==
X-Received: by 2002:a05:6a21:3a48:b0:ad:4be8:5984 with SMTP id zu8-20020a056a213a4800b000ad4be85984mr21508452pzb.27.1674323872673;
        Sat, 21 Jan 2023 09:57:52 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id r3-20020a632b03000000b00478e14e6e76sm24857374pgr.32.2023.01.21.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 09:57:52 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
	Matthias Kaehlcke <mka@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] arm64: defconfig: Enable USB onboard HUB driver
Date: Sat, 21 Jan 2023 17:56:37 +0000
Message-Id: <20230121175639.12818-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_095753_049773_F1819977 
X-CRM114-Status: UNSURE (   9.70  )
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

Enable the USB onboard HUB driver, used on Amlogic boards.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: add rev Neil
v2: none
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 851e8f9be06d..42c3528a2473 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -923,6 +923,7 @@ CONFIG_USB_SERIAL_CP210X=m
 CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_HSIC_USB3503=y
+CONFIG_USB_ONBOARD_HUB=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
