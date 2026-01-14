Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12041D31A26
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSn5V9p5tvRdL3/k+jpwM479R9DL2DPmVDdyQXk1zrU=; b=ji9yfEN0lJ7CQL
	foGKGXnoPYI4McOkNmBuCQSs0PyzS34qYYir049gejTD+/bMh8EaOVSMjWI5IPdZvXpU6qSft2Ws5
	wAO/M6ZOfEO0m13irzw4P0lLLreCWxc8jcJDXX1VKewGUiOql0mm1ZgS2NC3TJlF6MNjiCFOwr086
	Xj7W3FGo3jn6Cvj5RLH6CiFGSLa3faEgnIHkyXqm5EzIbBNRJ83h4RacNnkJzco7sHrZ0Ssvm5kZs
	ScxvzSp4zkjJclfMzs2Xoi3cgyJPoEOUBXetN07PhGT33XqBtThxX1hZK6IGY4Jt/3RSstSyZnits
	ZT/ZDaKI31kDwuvwOyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgz-00000008Qar-01L6;
	Wed, 14 Jan 2026 08:57:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgv-00000008QYL-3huE
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso49381485e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 00:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768381044; x=1768985844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XseDb8ZHPBjuoEWbJmFo7HtvNpWYI4+BmzsvRT84Bg=;
        b=y3hwgja49h4PIE0f8hpCjCGRoACunfKPO61Xy19r8PqQf2YcjJZzgqB3sVhQKgXErN
         +Xq4H98CiY0iViUyGsMaFR23Ovq9ERt0hFKwwXIqvBLvGP01HLSWjuXhWU+B2SlPat8S
         FFxE4JB3ClZ9/2HwlOtq9MnSkknk7FYcjYe1OR/bSPUMSqDaJwaBw4PVn7nAgMkPy+eQ
         yrdHI3NV+WTCKFAFI02qMp/WfnMyxCJn8InPid0IUheQvYRE7qdwTYz1jmmcoBe3DXb9
         kHjQA7mob5W0J3Q+g+P/XkV1QWHBV3dVc7EFqdGW7x6Oin2P/8HwGSH/1D1XLzs8/1o4
         9xUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381044; x=1768985844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0XseDb8ZHPBjuoEWbJmFo7HtvNpWYI4+BmzsvRT84Bg=;
        b=eeg7tQauJacDFruOtlHuQ6LR0vxInFdcNOsa9rohsSSkswHD8ZzIhaK+AeQwrob7Pq
         tvDIjLwyo1tdKfMDMo+pMruC7bez5tAwHTqsEUx10bg4LBTIyikkNi7XkUq8M+0XAVMH
         s8Tpstels92HgdnThsraohl1GMR7o9ifA5TlXdeP8cg+ngTKU92yX8JjPV+ji8lJhap5
         erM+h2ukNZjJqbO9ypqHZUAKkdhMthKkPAjImz30E1pE4g9HEViClV8IFm4bSxlDvYJN
         7qkGKq8BlkycKxJIf4aqLvYtbLBClj7PHZvfYyThIqPTjbGwlusxdAX2HAmhBC+D/y8k
         B6hA==
X-Forwarded-Encrypted: i=1; AJvYcCV5+0VZSBsuCogJvLeR98ZIjlF1cleiMRM9ExhH+71XI/mhL+NWgcqyVl8t62E3ySVn95LIhhik0r1XEBR+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlwdv2FRZ3RZkCqnl/Wj+yPjCgyLP7F684CtngiQcqfr2tPH3e
	ql8jCr+Bjo57OwWW9HCkXHa9RDvGCMfZyHUzevQoL6MorlrwrpvddMk9bXPcH0/PlUA=
X-Gm-Gg: AY/fxX4dQIDiHtsM84B1gTVg9EUfj61+ybTMSywIDcQAhctpFGkGxXEV7WiOZb09pP3
	/yJvwn/IOJPr+2p9bJIVFDbRePI6h6tNbBVXkdOk5cldFUsgq2xV+l4CGzLfw3WDJp1Hj3xsdfk
	950wFAfrfdkl6TY+jFxtYi8sXeUC8I5ZsRsePj4+fw/osj6NwCJDnlWlzs6TPO8e8rJKZjtGBtf
	szhJkZ67EN4FR1rQGZEh2/etkAOTxgDl+x/AJPXpzlJYmbxQJqGZZo3BhI/Lc/N5+IqSVbUfYYC
	gfWPuKmvEpA7fyya9ynSp4ADzuII2J/4yrttcmQHTeWlNtumOIEdV4qje5uI1gC5qmbqymCAlvO
	/pemZOPeaBybtvIp6i98qQEkqVUL/otXEHSKDgblDwoMdvkROHoDbYF4dUDtjHpW57vpf1J4D9F
	Lcqh51T6DtkMN+MPhth+MM
X-Received: by 2002:a05:600c:8b52:b0:47e:e20e:bbbf with SMTP id 5b1f17b1804b1-47ee335646fmr21311365e9.24.1768381043978;
        Wed, 14 Jan 2026 00:57:23 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee563c8bbsm16828795e9.12.2026.01.14.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:57:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 09:56:53 +0100
Subject: [PATCH v2 1/2] arm64: dts: amlogic: s4: assign mmc b clock to
 24MHz
MIME-Version: 1.0
Message-Id: <20260114-amlogic-s4-mmc-fixup-v2-1-7e9ab5f12286@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iD8WQNBzDHgOnkPSBABm76G4IHl7jfO/G08/hDGOQ48=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ1pqfpx3+J/u6VAXTqIHhXnYBGILsIGj6hHZ2
 GgF6YplWniJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdaagAKCRDm/A8cN/La
 hW0+EACTZGM3OUj+3pT7mr8XHNiVzYYixPyBVwfOOjbaWxQEZ4ifZZe07/d2KGb4RAmGIJS5Hkg
 x0uDV4cHVpSrbCIYmzdwFYljZvuJ8wCjmn69opZO+/q71bmw6KwJkjvIXqnS5LyR7tz8AT/Kve6
 NdGRve3pqgPUeYq/g05Y2CqZuFvYILYn4oRrTVsA+B3WgrMzPZqPNvGDHOOigqxNzOP7lbQlDrf
 nfxIyNLGnyzAGo+D9N5FFJgK+x88bYvGQfpWyb4ZG6H1ROhXSRkiZp1Zhm1kYBCBzrPcyEKcvW2
 pceBzORj5S2db4ELPgC8AVtoDN3TmmFeTtrgdqHiSG/Wx2AJZJVxhZ7+qj41lF/+MEyBSpP7R2c
 I6DGZbxyln58Z9RS9Iuj5X+E6Tp3nAmqmHE8vP3ePvmmy9+sleiJR1LmbSuDreA96uKR5iHpWc8
 xHrmDNCfyw8XQZe3yCDlzi5AHHrYr/mJGzkD1fcwLJxLCv1dm4bLNyu5xcTzVn0W3ZvuOkVr9LY
 FzMc3JfgM20WQcAIMzRz6vBRBdiOl+cbPK4i0hWonzhQ4//Kc6Ilzg1giecRFx8ZHWzmdpDnwgK
 NrlGydXIK/e8GG47fl3OAUlApjMIBejXDm3npc5P9K3MQeergyqqGiwygfJTflppJ87jOQRs4TS
 +XgthRsHN1vVSgw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005725_968816_1AF1F6B4 
X-CRM114-Status: GOOD (  11.13  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

This assumption did hold true until but it now, but it is apparently
not the case with s4. The clock has been reported to provide 1GHz
instead. This is most likely due to how the bootloader is using the MMC
clock on this platform.

Regardless of why the MMC clock rate is 1GHz, if the MMC driver expects
24MHz, the clock should be properly assigned, so assign it.

Reported-by: Nick Xie <nick@khadas.com>
Closes: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/
Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..62538fd9db6b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -838,6 +838,10 @@ sd: mmc@fe08a000 {
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_B>;
+			assigned-clock-parents = <0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		emmc: mmc@fe08c000 {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
