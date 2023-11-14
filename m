Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F58AC4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EQAMnFmu3t4YgE6U/N1/QrGzcvctIabkcH/voLXVzU=; b=r60M8UsLOS6VvQ
	z9sZ8plL4jdmPm2LW8SXMXPnHRlRV0AqCBV3hL9K0/GAmKFQyjI81xOdvWXqraZ+HuKY9lUP3e20t
	AkoW9zlDf795T97NnjvKuboATIkbsAmHlpFjkGHT410kwLAx5H3cRhNaYcrl/yswYJ2lp3bpx0GsK
	NzH0F7EQ6mmxkUl2F3Wj85OBP9Y7u+VcOrHTX9ZQhw8Uuhc8PgwOEE4YcrtshaZrWhh9XZXUYUnTd
	GqQoTvGgr01kbupALxpMaGI8B672OF5HH5bFk8aEJLidnj4sI6uPPj5ILqYKZcHKsazUmvilOPZeS
	6DhrcTDxhLXolnxRHFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qWc-00FZPb-2j;
	Tue, 14 Nov 2023 10:20:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qWV-00FZLG-1O
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:20:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32daeed7771so3088516f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699957196; x=1700561996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEIBIUZc6uePJfntJdIEYKl8kqhtvCCVMaiOaHpDyfM=;
        b=Xu3o1m80pmATMXTS7cCws6UeTpyGhLk7VdgKTKWJaUGoYTYwCW9ZC1HtEefsofVECv
         eckY1dl5KRioydzjCCknHGQPqIrZtYDPXovfAxd/2V8rw0jFEPtUdDrthwwgFBMEfV7U
         c1qHPqzPKWzVb1Efv2wkDHDl96CCstGxkDnrR6Wj8N2msmBwnp60XX7Sai+l1l7DipVe
         wn4PHyrOiSOXZqRq3kpzUyPguugaLGSWtAxOkjvDgNNu0xRaT2WqVLHAZ6Mk8tckz5HP
         XH2WzjENw3WbiSjWCGV4hOvpeiUi0zS1DwCY2g6mX5+kpIc+4e5liaptILZJRTJGRyEx
         fMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699957196; x=1700561996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEIBIUZc6uePJfntJdIEYKl8kqhtvCCVMaiOaHpDyfM=;
        b=R9zhvWM2P5NlFYPIMbe4xuNeatJUsuSP9CDM/aFX2R8auoSOnbDPi7jlxvoLBe4u8N
         rCHZUmcoi6XyFEjFwHPTthni3pFg/3RI21WT5NNEoAsHnmXfxoc1FNtX/oOnx+KC6yeS
         FiSmToFAyiifpSvCxN5m8X8EwlYCVH/3MntOs4uPI1SS1eIOuq53cqXQSuqtFDEra5hM
         WfnQBShYz8wHKWTvLv2R4szdGujnBI73frW1LcVEM6lY0JbVMKi21zpStRgYqV9dYb8P
         A5lwbJWvqBlZmn7ohf0rhMFPNy4kcugsL+fhM+vTfQFXlxfW0eB9e/QPFaw4KfPFSJKt
         69wg==
X-Gm-Message-State: AOJu0YzZG44pGb2Yl/y7qNwFCbJ7hSLw777tX9GC7k7rKojbMtORoIZd
	NLkqM/kAAg+0Mep9uHCjl1RENQ==
X-Google-Smtp-Source: AGHT+IFNvpoPpsHx2p5m3MMv9VHHwSghZIW3y1edhUbi+6SVcRkn4CBysD08DhvHC8uZ2rPXGDk8rw==
X-Received: by 2002:a5d:4e85:0:b0:32f:7967:aa4d with SMTP id e5-20020a5d4e85000000b0032f7967aa4dmr6050646wru.68.1699957196533;
        Tue, 14 Nov 2023 02:19:56 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d43c9000000b0032da022855fsm7419675wrr.111.2023.11.14.02.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:19:56 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Nov 2023 11:19:51 +0100
Subject: [PATCH 2/2] pmdomain: amlogic: meson-ee-pwrc: add support for G12A
 ISP power domain
MIME-Version: 1.0
Message-Id: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-2-f01e6fca67a0@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=aQxr32do09NNbq0amsdwX/uvKdT6sjjcfu6Gh0FrHoI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0nJG2mljBw/0T6F93TKPKViSSLGHPI+v240fNwU
 6mi3DumJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNJyQAKCRB33NvayMhJ0XjED/
 9KRANEUmUjaRu1euBCtDmLf/JYF1uTV/2Zv2jc7KgMIDYp88B7esJ6pba+UtJ3jN3oj/xO2oRkRPWA
 gn3mgr1zCNWeFchLMDHwrE9AOwUQlesIWdh2PZSwSxZ9M+4IyyWY8shQkUVKf4U6/2hD4tujoQ8HaX
 C37kWyzbxzLZ2oWFl3DxsGAFk5doAr6Uh4q523pFst1oS0fs3WU6Ms5UgAf+6McUPwaPWSth3JRvG1
 V6ybYoD8aQmPjlvO+0TcsfemJ9U8OzU76SlgENyFxTHMSi/O0080wR2dGQAYfrRYyiRJDGa5IuNgLX
 Gf2/hs48OniwJBKhpc0FJQ2fQWOW2LKyoDw00w7CSoBujUqwHTR8GOupyHqqOodBrsXXmfyrucu0Au
 qINla3qD8EYH/br77LI4Zlt9F4KpKR7bI7DnznwBtRTsg9AUK0tIwSVgapO9vDCirhQML0m3sksavo
 wSmFDAqgSV1foZkzxtKndM/yM7G/g2bf3fpsY4QoGy40QnKfHCWZgNdvKp/yycTpTR+AtqhWgY8Qd2
 o1cskcw0iSfh+R5Mle6a071YtCqQ5mSUCMsFn9v/2nTKAnrh1+82YcrdHiGYHO2neof5AUxNK9aV1y
 bPYUBc1t9KJPXT35IEmzS9XP9L8AOOYy42+RD4smlOdstkhbboEWekFvpG8A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021959_486682_24CBB352 
X-CRM114-Status: GOOD (  10.81  )
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

Add entries for the ISP power domain found in the Amlogic G12B SoC

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pmdomain/amlogic/meson-ee-pwrc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
index 0dd71cd814c5..cba216a2175e 100644
--- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
@@ -47,6 +47,8 @@
 
 #define G12A_HHI_NANOQ_MEM_PD_REG0	(0x43 << 2)
 #define G12A_HHI_NANOQ_MEM_PD_REG1	(0x44 << 2)
+#define G12A_HHI_ISP_MEM_PD_REG0	(0x45 << 2)
+#define G12A_HHI_ISP_MEM_PD_REG1	(0x46 << 2)
 
 struct meson_ee_pwrc;
 struct meson_ee_pwrc_domain;
@@ -115,6 +117,13 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
 	.iso_mask = BIT(16) | BIT(17),
 };
 
+static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
+	.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
+	.sleep_mask = BIT(18) | BIT(19),
+	.iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
+	.iso_mask = BIT(18) | BIT(19),
+};
+
 /* Memory PD Domains */
 
 #define VPU_MEMPD(__reg)					\
@@ -231,6 +240,11 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
 	{ G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
 };
 
+static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
+	{ G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
+	{ G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
+};
+
 #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)	\
 	{								\
 		.name = __name,						\
@@ -269,6 +283,8 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 	[PWRC_G12A_NNA_ID] = TOP_PD("NNA", &g12a_pwrc_nna, g12a_pwrc_mem_nna,
 				    pwrc_ee_is_powered_off),
+	[PWRC_G12A_ISP_ID] = TOP_PD("ISP", &g12a_pwrc_isp, g12a_pwrc_mem_isp,
+				    pwrc_ee_is_powered_off),
 };
 
 static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
