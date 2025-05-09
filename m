Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A04C3ABBC
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ozbZvABbaPqT0HrNsDlMNWY8pZa0vkqmRiqbYmVM/b8=; b=SVvj8UELQlYZ0E
	lDQi+mRAmJO/51c60oulWVOiiRRNUfTdu41MV7KYlkm/mcyym8mnFP+rjnicC2MiTucfJepZywwOu
	wNZU35Zj6SEaGU62VlHJndEE9SzNVjry3si7JPmlfHYLaT3kx2+6L6+KbQEiEWzusGDUR/cUJpB/D
	RLSv0RNzle5MIPoB/xpNO1hyDLZIE1/xu2wZg9dEiXKDHNMsdyxYXdZgH324hvJR4LE0yqEr4TAmr
	bwf+Eog3LQRscI6Z9YWR1+VpL5zsK2AsM3ou5vycFWk+RADNVh2YQSvVvpHIAh8xdj2e/oaKgEDUg
	K3iKqRd+pJwMr+rHnvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRN2-00000004Pyj-0v5j;
	Fri, 09 May 2025 17:18:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPE1-0000000410w-1m4g
	for linux-amlogic@lists.infradead.org;
	Fri, 09 May 2025 15:01:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so1086815e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 May 2025 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746802880; x=1747407680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=UZSAIQ8Q97s/IjlUZbngSjI0vvi9LJnr3hgGxxAUVXvx8lsGK4hPEYhOe+BtfHjQSS
         B3EP9j3iNGrMmfc6nRZ81SCd8PB+BHVxH84OrTbtvJf9iAzIHQMNtB+X2q6aJ0BuvxOn
         0KOqh6a8HshZDOUYCrRGjQ307aQZRru+e/jTwbgAhgoAtLkaAimdNc31MHEGwSLCLEZQ
         w9v6gEgaqNzLDPJWpIsSxfMqbkYyoVA4nannpPh0ICPBOe2W3sKDWzWoCQZ+t8++fQdP
         sJjX5VLhr4ORrl3FEoNquXIgIY8+BgM53W32Jdz7O8hrX7pJA9XcOwFLGvoorT/QVit1
         wAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802880; x=1747407680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTkbpvRCkCNDRgtaNpdtouZmnsaUStr5DjZh4PVUoxA=;
        b=eYIX795V2MS/OrzivMWsVHT+wAn6ab0tjODUnpJoticstnVVsQTQLwOW8nio5BE82A
         G148Nt4wPwpFn8u7xdNxmQA+eu9HqzIw+FuIrirx+FSLOuomzBm5yyOmPMuFVShujJAm
         e5xmfag4o1An2MCta+F0JsyXY5DevMrftWGYIZhzSawd9fH03luP+kqRjyKKuCC6Gj07
         k6/ViwFZxEp/TvfD87IXkoCia2mLRC6HQA/qFgivSIJXI/7VLzQShzlxKSHg48koGLiW
         /2PsD6npvUXhr4Dt+/Z1sdDaCvz/WKW9ka7aR8Q22R6HMyOXOqvj+Xn/Ge1M1KLKqO71
         LIWg==
X-Forwarded-Encrypted: i=1; AJvYcCVwfRMe+ZCngyewh6Wmhurevo4Xk5DufoLDQqTC13f90dKRIChGMiRBcyXWNxFyCREIprVGOzmGMqR24UFA@lists.infradead.org
X-Gm-Message-State: AOJu0YwQIVeDvKxlLuHKF3ijvGbYbL+AjMv3de7d5oMBR80oG2nhsdCK
	i2UMfZPIOBzgbaIdd6xwpsEyvK4KYFKPFTsDvOwTJE+etLC2kr/kY90RUcZ+NMU=
X-Gm-Gg: ASbGncvOjs8JxNRm3wUD9njVa0h6Kqd/ip1hZLE2mzt5b5LIFF8ZDb4Yx+Tdm7sTMvx
	3UpJjMcwbj2RezHyzbFswmj6Vq/3YFIyb3X/OTB5jT2bTUcpNZ5eJrL4MToo3eTxMoVQ604JMOU
	O7/NxsnATbU/aSKAVOn8PFvf3CkUkYYWxJbtdmMEGmirYZBVicNcJ3uR+StkCBvInwLEmCe+EoK
	zc2M68m5gHRJlbmFB8a4Ufmqycodrb8pS1TM41KmekGaQsIHfKSQUf+Gdf0OHtyZH8P7lLZpK/I
	upgeckJttCOcrBWJsUpLZClSIAmX3v8S9i9ii+EXN5TCrf8ESw==
X-Google-Smtp-Source: AGHT+IHkBCNBnWPS/LtBg9S6XT9b0O28ZZRzf7nzBT0Cq35AQorOtZe7qvsosSmWPjFrnfFCw+NYnA==
X-Received: by 2002:a05:600c:8207:b0:43b:bbb9:e25f with SMTP id 5b1f17b1804b1-442d6ddcedcmr10827805e9.6.1746802879590;
        Fri, 09 May 2025 08:01:19 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67e138asm32063275e9.10.2025.05.09.08.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:01:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
Date: Fri,  9 May 2025 17:01:15 +0200
Message-ID: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OrJwae8l2jh9g4trffYYEvr/eZCG11Gv7r3R6UTzxSY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhi6pu+duuCQJsD1u7676gujslrvVm4Iw27Cv
 36hI4QfwzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4YugAKCRDBN2bmhouD
 186yEACA393kMv+ucbdEL6lZb/ug65wE7C5fY0na+UddUEAqfbdRTMW/MQNb98gck2H4JelcSfd
 OqvvlLQeKFMdWfdUO18CHwvvC6jx66XVCegvI4JxuvyksOrbdym5bdkndEtsvJU65+czjW31aQC
 bHRORJ2LIBPhhHFt3ciNC419Qf2mqrIbuTdCqXzPCYIAG8lyODGPRBf0LOzsou2eHbNKoe/9Y+R
 23eU21dwJrXTGQTdhZ4qfRdprxXwba89LAlR8QDQCVmK16b1qGaazYtoO91pGXtUR8rzkk2i48H
 Wq9kS0QV3rawviyRjAMKi85wG92NalX7ZfaI2Q5QuOdw7JC0O+0Q0AgxcwAxwRboQ39ip4LqGDk
 tvjnS4C68OSHUa3PX6JTLE+UXdCZe30u4UYdsIcmTTT3FgpzrXkJbKTXqGkK6uF0+3HYoijtD9g
 s+SAVZIrOX7WT9EelETCp43Y3cuWalfUBl6VVgIGPY1QmUU0ATKC65qnVOvh4fXdUuH16PWtHXV
 7Al9PQ3UL07lYL8o45wc9N4eZf11k0Jrxz/Y47WdnpUfH7JQ7PjUOs2+s+zD0+/QCmae9q45mJP
 YO9URaV6sm2hA0MKrtqU5s740gHW4t8rdh2BT/QLHRUNFxURM2zBsHQbIpt/eXKgkE5r6+FATnw Lzhd+0AQCGwUKJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_080121_470474_CB08861F 
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

aml_pctl_find_group_by_name() is not used anywhere, as reported by W=1
clang build:

  pinctrl-amlogic-a4.c:600:2: error: unused function 'aml_pctl_find_group_by_name' [-Werror,-Wunused-function]

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a76f266b4b94..385cc619df13 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -596,20 +596,6 @@ static int aml_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static inline const struct aml_pctl_group *
-	aml_pctl_find_group_by_name(const struct aml_pinctrl *info,
-				    const char *name)
-{
-	int i;
-
-	for (i = 0; i < info->ngroups; i++) {
-		if (!strcmp(info->groups[i].name, name))
-			return &info->groups[i];
-	}
-
-	return NULL;
-}
-
 static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
 			     unsigned int offset)
 {
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
