Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58983C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fINiA9E6gWoOQYcCT0Jo6oTiapOqpJmrDlcJdva+xvI=; b=G4tcRSehN9Vm1M
	3UcANbJ7PMl+rgGTARVcTJAWxo0fnMUy8sWncvQ0WCmo6VErU6v3lMNRQdBBoEsDXksCWk3aaiQ5Y
	+tMgZZ7kZVyqz8TMIYknhcwSmAVRCd0VIC0BhnYEIcOL93dcZaYWQez+Hu7L1aIqIB+I3WdGLXHQr
	Q9+pZkOyXv7u4TiucyQTfxUxTaFVDIMlsORs2s1Hv48gJBo9LyltXLdrwv6SA1bsJRNDkwMRTNTRL
	u3BkSwsdeDENFzwS6iGUdKVynFKRwpdRR2yNyi7tG8YqFi6LOlPcq7DUlfh52hujYxMW5rF3daQTp
	WJcN0Yl/CllPojYRqFUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8oA-00000008v2a-1DYW;
	Thu, 06 Jun 2024 08:49:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nK-00000008uMH-2cPF
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42160f2dc32so120915e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663705; x=1718268505; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdxVYMQSwsBjETYXUb/TiJR6/kX0EA1fzEmOgzqhPuQ=;
        b=JYU8T06mgbGOsIppW/FRSTcH/IHGJHbUkb4Rj2cG4piMnRPaaZbnfjnOGBqZZAYef0
         yJ0/0M4oJBHOlZrrDQpdpixa/CgTYj/mv9HLu2yzqMv9Y0sbRLbUVed2EkHlg7Vbnfmi
         z51eVI6s5/gDFkvSeRBt/SrpPBWAbKAkHUmwa5V8HMODYZDe4VGss9nBniRD2Qr3mxg/
         tMCA7AjtOAsqhhOSbxDUY1p+h4m7QhvZw2SNAv+bVpdXtbVrCYTf9Q0HUvcfjleE9X2T
         6jpXp3Giex3cb4EMifnuwPsmJTHqNiaC+xw4/gGTECSu3hgbU++Rv9e2PYS/E1mlcb1j
         OoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663705; x=1718268505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdxVYMQSwsBjETYXUb/TiJR6/kX0EA1fzEmOgzqhPuQ=;
        b=YLDBkOO8jCPme2V8CkVMJhuakZYMGkjePeSGoam4LTZthHssmlqiA1QYE0VqNSNdDM
         pXyQsLbZv4Ui7KMZh6Zlj7nDHShtUtBOVZ/8FqhaCQXedUPneJaydegNN/q3fMWY25Z1
         SVaVf8pDcWyCNdDiGmxsXh2x9Dv9cjuuChhXqcNL/8NtRYFb3liq7lI5Ff5B2h5/kEc9
         8M8crwg+/87A7dBEsy5ooBFfVD3gr61dAqqaTQ1KXTXEFTMFnDo55wkmegL4kYuhNrxq
         boSHzfh0cUflHDPeayGhSmzOOCaR5SmlP5dvfcKGHFPzT74AUeRnAyAX15te+b4M/e3p
         nPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOCTRvrW1cNhhijVdsi6L1OHhq/pYrmwhOTjrAwysdctZAKOkxVLFLmTwnwrVZfLANMHxj6s+qkHeGNGY+UczNgcdeW7sWIe6LOJNB2f0GkzQ=
X-Gm-Message-State: AOJu0YxTabpBPK2GVvebXnxwl7zTqkcQrwA1e/8w6wwOS0PUU1mAqcS4
	DX6kIz7iF9+8SyFXSrPT7E2mBnEKigS9Z/C2HV7zfy4u11kJumMY4GXdCY7Xip8=
X-Google-Smtp-Source: AGHT+IFgBJznRwWmXlhoTzwqKs7ghgTMjkOwyXK3mR+0BcfvkTEQacyLBQZBl3X+FE+uIo7F0zE8eg==
X-Received: by 2002:a05:600c:19cf:b0:41b:e406:5ae6 with SMTP id 5b1f17b1804b1-421562cf319mr39231825e9.9.1717663705084;
        Thu, 06 Jun 2024 01:48:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:18 +0200
Subject: [PATCH 11/12] arm64: dts: amlogic: a1: drop the invalid reset-name
 for usb@fe004400
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-11-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zlmLcdUmYl0S4n0pRhWJV5tV26JKeT3szLzZNHMzvlI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfOhMzyc+h9+JVkIjeLiJwkC5RIgnBGzlwVjY/q
 6rUuKkiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zgAKCRB33NvayMhJ0RrOD/
 4hoFGbYDtDrSzDp/8RkgMNtJHyHQbgjQoe8bid5k3WIoTSIs2HT4OsTd+NVWYzoHxpcwiO9dKp6hRG
 DxZHkkv2qdyh0FGFAqP2tqInuS7ZzCmC0+7YMKNPbZRiBtMSomUfS0g0jFmVaE74GoYS+FT+sL18BH
 YeTOeDcsggbJFR/wpTLGj7bcNobfkWSrmN0RGgpVYWmbUcX4+Gfsj8JpKggUOa/QzBHeaDT4qD4qUh
 q3sJjsxEaM6jK79ATjh+HOf38oWIM+xg5LwghNEvUT2L+awNu7Uwo2CwLhGJucU9BPLB4y1MX7HuMV
 tSZOI4gre04jo8nRU8YSal5o/q093SVDfa8u+SRApA29LbBLjEx45jXOQ+FrsnV4YAAIY7A7fuomCV
 X6GurODT2X33NcdkQzt4zonX/5rZ7deD4zy0qpFnU7fH0/zcoTrwshlXyRKyLaKDqYHp9flB6pTCOd
 OLN5DVQt8VfKLSvk1pzTetHpxToRpIjg4sEeJ9aRpR1Rj5uO/6yfX5p3K0I16sWWGK6ima5ZLHjJRO
 /8/P06M6sYEt++JkHo99VuSxDkDF0eZL2BT9LBrwNrN7clHqHLHonTMoDhGEaGrWNTRCcBvqUF1wds
 vxJlrpMzP1MrD7ek0tmVFKItmHGE/k0mgg32p9F+FdARyNPthG+VCNw1hG/w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014826_833291_1C601811 
X-CRM114-Status: UNSURE (   8.66  )
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

This fixes the following:
usb@fe004400: 'reset-name' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 4be801d12c4b..ade3a51ce89d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -453,7 +453,6 @@ usb: usb@fe004400 {
 			assigned-clocks = <&clkc_periphs CLKID_USB_BUS>;
 			assigned-clock-rates = <64000000>;
 			resets = <&reset RESET_USBCTRL>;
-			reset-name = "usb_ctrl";
 
 			dr_mode = "otg";
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
