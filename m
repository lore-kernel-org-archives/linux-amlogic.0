Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E4D69115
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Nov 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/SJYMR0mh4qlVtpeNXsrZ80BxkXp9BMp9rZlI5M0PA=; b=Yw4boBHD9dfmKn
	zcQkZu5VDqKlJhDuP6TYR2vdDXU/6BHXP8T4J4zJmtkUZp+4pLbWQbSzUZLkKAmqak0qhmT1LSWTp
	W2mQjrbxHWGKfK0BSX6pl3E2aXsfLbtq0x6kcVoPi5fR+ZgyJ9EobN/+T6/i61emRJx8808Dn1dDW
	tcfqTqz/Q92seWivZNjiyqbOO6p7yLZl0juIDn4UCbSpYtr1v2QJ7X5rHJqtkx/rIyNaimEVxbPGs
	/3J6sg1XJu/ML1RvEA3iInbwdLnI8ZCGwoHbXaUrbWk76zqbvd0/TJIYqH4zvBStDM1HYscZXOgVQ
	DN2uvPdZ5CqK3zQCIUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgK5-0000000FryF-2r6Z;
	Thu, 28 Nov 2024 15:20:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgG9-0000000Fr3y-0khr
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385d6e36de7so273855f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Nov 2024 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807007; x=1733411807; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aomBrOkJJqCFmjpN0sU1576SH9xMwR2JgmGtI6ewTOM=;
        b=Yad1CDvNO3z7Gs5rHoT5yO+K57UdRnvNLEGsv0tnAnj5mNJv5NmFRVrjx9QVxjK62o
         qIySQnJA9yo1e7vRDugWeG3geO6bpqmvzW3ktViEoZU7XB4ezfEVdzh3jWI11MmavQPJ
         w6VQuLbn0mou4/qTqBJ1CYqUgtoIBVYf3at94uOXA+unfS/4PKBUQgvXOUYm4NmDW50B
         Em+L9m5BYMaOg4OZn2rDQ6F7fjercaeREKZXnE2wXmZ7S5zXxqS7kWwpmgONBBYQUFMY
         30LXw1bnuZke5kGdjEAqanKvgbZ27Ah7BGB+3V+r+x8nAFjIQx5lfYogytu9uWn4+lP9
         A6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807007; x=1733411807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aomBrOkJJqCFmjpN0sU1576SH9xMwR2JgmGtI6ewTOM=;
        b=CXX6e2jqbF0jpfhctAlVm+51zP55kSL01of4xMCO7TL9HPeu87cFaUNi+F0yjquGHv
         nLvvAm0zVXtsrxdTlwucUjykKCygFlZHDYUELrKy64Egia99lAukoGq1XqibA03a4XKx
         wGLG9b198Gxyrvzl2NGGyw+PcYUo4AgQKhDHL+5F8QZOaFxjKcZaCGDBNW3mD656YID3
         jNeY3nF+2lwhb5Rdz0ZroxiOKgYNd65GmGHDtu4QrXfKgrQPaTha4CjWA4CKNTVVNXi0
         V6734qDAWUkcKfqqvTiHv/Ng+PseznPL52PFIEk/lWFKuTXqSFDa46BSnznUg4scWFOv
         VbkA==
X-Forwarded-Encrypted: i=1; AJvYcCW9nRn6trcjJvY/fXxzE4mSIpkTaCU/xbPVYD/LuYfzkJPoozSr9pfrp2KIhPWRJoTWm851bohEH0OOrDxC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo4fngDQQB/lFqKP53eObKMaeqYeNLuaCpX03udGGI/0pUxHFe
	bDg9N37wpuwHAPXUvuCddcXeWykdNFi0XIcp1HiDiasSpW2iLkcRWLXtXHIvI1U=
X-Gm-Gg: ASbGncvoOU1SJjw72RtzW8Iet/7vEvN588v8zm5ywjJ6h4yCLiwSy27m6OxV/rijgtp
	GgNG8seaE3tTYLmyKX7Ldk2W/GSp+oIXBxfsKl8kHeVdFIAVLvEB+TI0SsSXjIKSL9dHaTD18KF
	PsTs4Yg3lpPMGKVH0fvAUsIYmL8Y8AjdBQpEQtXf1Hlcj290APZg17DlHyctaQ4usQPDD68/+qG
	KqJELPXhjLkz9AFmdnMJsyr2nQTGvMEwvE2vbDM8rVqafj1imH2xIq6RaY6xfktcS7j0m0=
X-Google-Smtp-Source: AGHT+IF7qgUNEDq9uAPoX7zFnn8oEdvAgf35U5UKLpooE3ExKagukoVva5liFqR9fUXeHbx01NFzAw==
X-Received: by 2002:a05:6000:156f:b0:382:495c:dee5 with SMTP id ffacd0b85a97d-385c6ed9398mr6786903f8f.37.1732807007345;
        Thu, 28 Nov 2024 07:16:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 28 Nov 2024 16:16:41 +0100
Subject: [PATCH v4 1/5] dt-bindings: mmc: controller: clarify the
 address-cells description
MIME-Version: 1.0
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-1-11d9f9200a59@linaro.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bPKXnWow3ydwEe/IecPN0lHWVn4gH4zGjIg/TjrNdgU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlbr6WRJYLRcaNMGR1ncbaIe+itmYl/XMH5M90Z
 joIxdeKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJWwAKCRB33NvayMhJ0feZEA
 C9LEvNiEfDbR3jqabZ4gFHy7ZUW5EbzWJ0W26BSURiQQ48SZHz7YI+BAzYI4t8Ye1WSEZzdb3YpouL
 JhELBxJ1zoatxGPGqUxZWHIIRKyCJXgqFpjXC0tnDNesryqz8UyNaPODROlGOzKDKpywGED2Hpg0Kz
 rGpSyPcPyIoq9sylyeBDBzScquM8WbvPq7bM5/YrfwTAw9fUOra17+VP0zlpzdqdbUVvvsVKd/Syhi
 d4oH3lS049viIYLcKsLuZDF7UeuSFuCl8gnvWbsIU67zuqv3QvAILVR2MbP/7e4TokZkRSjZ8IXj5Z
 KHPNpa5BTis3Z0x+AoGjxaypO5mrtfPtyuMV4wyqTQn93xcFuNfV0b7Ub+qwKumJHFsxvLsRc4WxRA
 6aLtOVnqY/TUdk4eYQfEkDaU91Nk7YaoBXlDESUIwxjVL0i9DgL3/7m1ILk6kxCz2Zg3XS7BbzGa5y
 8hR3nPrgySefND8BTe18tcLV0NBHqO0fZWwwB19uxyhc+666aMWlWDGG6BrmefXzRLrg+bXoHKJOk6
 TrZa1t6qa6SUGuosce+rl/yEKumvdIAT33DV0miPxOKxK/e/aNYBSP5VroHnw/jdWJbMrTfVrqy7aQ
 8b6YTQxECEAJdUi49Psc/p95vh08kV7R+decpmDNi+7nq3N5UzFCLo/x8rEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071649_218594_E3138C7D 
X-CRM114-Status: GOOD (  11.48  )
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

The term "slot ID" has nothing to do with the SDIO function number
which is specified in the reg property of the subnodes, rephrase
the description to be more accurate.

Fixes: f9b7989859dd ("dt-bindings: mmc: Add YAML schemas for the generic MMC options")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 58ae298cd2fcf4e03b5b10a4be718c7b77552a7f..23884b8184a9df2da3bda5f86916f2e0a5d502bf 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -25,7 +25,7 @@ properties:
   "#address-cells":
     const: 1
     description: |
-      The cell is the slot ID if a function subnode is used.
+      The cell is the SDIO function number if a function subnode is used.
 
   "#size-cells":
     const: 0

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
