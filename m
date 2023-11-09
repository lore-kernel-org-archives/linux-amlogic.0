Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1EFC04FDE
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPoFx835gCj7eN3YSRQ7mSSf1RLGDuJ7eouH8nhdQwk=; b=Wkrdbud7JIlOd7
	SkkX27I8/DoYSt+Jz8kGkZXNIbL22c6Yl5krTBHO8SqHoM4ZNY4lnZGu//2MexUcYfbI0V4erDcx/
	gWyo1pII1d8M39USFjel8aUmzi9zCncrsNwNH9eo3QhmiXWoCTGchovFIyzo+n0bBf7Bl/q+eNlv+
	S0UY4/zwAO6LgV3bZ++z/w1yUfL4GAXp28ZjlAO/IXYMSkolQmqPUTp6bK5fdwQ7kHB2oIh9emV9J
	PGKqzATGfq0yobE+N1AMfab+Pzcea5Ql+NptxTHGDqDEIKSIINqD/kvG2CzET9CBZCE7KgVZjfHer
	Es5CnJLNqEPHXENqesCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10u3-005h37-3D;
	Thu, 09 Nov 2023 09:00:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10to-005gjp-2g
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:32 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50970c2115eso736901e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520425; x=1700125225; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
        b=V3TSqrdUP0cvtC0aySQbpve/ivpgY5R3dedRXFra7PLg0OBMuRIqOaDAuCG+uk7vAE
         7UA5q6+LZkg+Y5YfL/bnhycyGHXgqwHt3OvIHFzWlBzddFDd6eIL/L38FgkmP43Abows
         tRcBsOaLI5Wc8v0l4TnSqzYI2dkO01sNEsPY3BxK14QL8SRABeqV80ICeoD6PYzKF+jE
         sN3/BjO2j2AY5gavviin/oHDeZFX4aF1SqMUUnGNDwQZgaBbw+il6RhTm0MQp0nehalu
         1CwCv2eQbcwQzS/5gjb5qtLmQqMNC04rLFOhsnDvX1EDoJ2wLNIQ+vE4+yq5PDcrz52G
         RbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520425; x=1700125225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvmOEb1ckbbB9zBBB0o82fMDjd1uz7C5pNwKHHdJSYY=;
        b=gkRRLKdD/ZNv6Od1EFv8ZkZ2IqPLsRw0Om66YlzmLLf+nLAqc/7cJmrJWZ8wBEPBCE
         YyybIS1SZeDQAUHs/nyN42AlLkkcE/caYTxaBwJMQgmsh+dTMEFTX6U4vkD14cwDvxd2
         57aXGkP4NW/eDsgrKKl+cwpw25G5fZPdqBsOl30SNiccNEHgT7Z3YQnzKtvoVRot/zm6
         nqvNAQIjKA6w6E/X9IOczyQFBXWtoNxrAOb0M4kFdgs7Hct8qXaoPRcvJGmrhOtebbeU
         lGH3JmrBc0CeDxGRKBgr4TwIuZpRnqS90RyaZKKO3w9BqUEBZrqeuBrkcuRiVh3E8WIV
         T9AA==
X-Gm-Message-State: AOJu0YwRrYrFDA+BTZKkKJk+3iUcUhI2DZkqeGo9RQG6qxvgEoDWnRHE
	Yg/SHoPflWx8Yctbfpv9VebENA==
X-Google-Smtp-Source: AGHT+IGXqF7rsRdCM+jnVRiAOt/RFNLh/BPKYViJgYib8D+5TeLhy81KbMIITHU+3iLnWSKCwHBgfg==
X-Received: by 2002:a19:7908:0:b0:509:4b04:6331 with SMTP id u8-20020a197908000000b005094b046331mr865761lfc.55.1699520424824;
        Thu, 09 Nov 2023 01:00:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:10 +0100
Subject: [PATCH v8 09/12] drm/meson: gate px_clk when setting rate
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-9-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6wj78w5SzMRVYfTnHYpi/keB3/pw6jAwnhprIG9LUDw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+Z5DW4LqZNMoa3WMtTQHFwXqgZtKvOnapnqjBc
 XjY70PqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmQAKCRB33NvayMhJ0b8BD/
 4qh7M6HzQXLHJtRURxnlOaG9F4oa8yHB8C3zne8wFXHXAzpEyuOgUsfQbYZdJ/W6aLUUqtjz2U69ln
 Y/l2+MK15fZaKRgdI7irQPXCvywUoXrilkjUAMJs/tRxO22tPDTfZz85GYpP5+cZps9ktRitls6wYq
 7JpWIRjMgijfbYm+J9YYYgTkjuqdyrm04HY2Kq5X8JURjowxDXuuZZ+OsPOfZVKgimlwLg9dGJhSbG
 7n29v/jdbcNnP9CK797lllMU9n9ynTMVXfGx8x0rXniM+qEjosu9w/TGJLy1TfcuY54BzVSQ/amfP6
 1pzZa/mqNKpGUmD4ehEkFAQ5RaUEtuPGvK3mrT2p2PW5PM2VPjYXVI3bUpOfDh5RbeWKK1Y7s4KK02
 03UXzUWRmzXoiUj9wN+MM99wBbF+BYndZvG7mWID3eD2Nlozxn8IqsFdFCPaNNLpQk6wmujhMtAvEK
 dHpHXrGJFfU9Pkrdasyt6L3mJu8elLjk7U9OrLJn8eHpFiTMcWpeexwqh4Scs3e3xpK5vCoC2nWQz/
 ZJqyJowaiDk04eQVFscV8y16xXAOt1Qz4RpalktRwQvCXfxHehWn6gLxNLzfhuAFtzcJWCrsd1Ag8b
 IAbS1A23BtxkuI3+WDf6pelXXBZwIqo3bvutoZVwON8abaKmoZIId0hHg3LA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010028_878624_C5A825E1 
X-CRM114-Status: UNSURE (   9.88  )
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

Disable the px_clk when setting the rate to recover a fully
configured and correctly reset VCLK clock tree after the rate
is set.

Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
index e5fe4e994f43..72abe2057ec3 100644
--- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
+++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
@@ -95,6 +95,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	clk_disable_unprepare(mipi_dsi->px_clk);
 	ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
 
 	if (ret) {
@@ -103,6 +104,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(mipi_dsi->px_clk);
+	if (ret) {
+		dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
+		return ret;
+	}
+
 	switch (mipi_dsi->dsi_device->format) {
 	case MIPI_DSI_FMT_RGB888:
 		dpi_data_format = DPI_COLOR_24BIT;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
