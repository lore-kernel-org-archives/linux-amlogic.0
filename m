Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB90DC2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3OZa2SIeDzEhuKljvIKM9O4yYRZrkErvRm8vOKzo3k=; b=d5JxebV+kKSghE
	Dmpl1Hw7yF+MJs24jUtNrsNCEpuRAr17c0guZHZz9K3APJc/oDs0GRwwxKTh00R58OwQCZcn2Zh59
	AHMNn94bKo2xnKcnrtq6row8Wb2rZPbhjLoIJc9/bom+G1nRFHRFJbTkFKRLfBV57OfGrK7g+x+Gg
	1iY9uS1O+DxPbrVuuVLepZRqcM4m5Nwu1BVKsHfeMhggWTnJtt+DAnMiwbK4paosctxp3PWxaYbRk
	ygCwvC8Qh9VbG5FZ6/7ajBC3e2JyyJAQZOLThSlJ9TCABbB17NjQV/KFxz8bnnLl8XT0i5g1U8Oqe
	sXAQ5E3IzljJVsN4s55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdm-00000009cCw-2Ej2;
	Wed, 03 Jul 2024 09:51:06 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdE-00000009bsh-3OJD;
	Wed, 03 Jul 2024 09:50:34 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-57ccd1111aeso3563547a12.0;
        Wed, 03 Jul 2024 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000231; x=1720605031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvMEinijEwgsKZDsBmGm/iKxTFLThMpGobnSIWlzUFc=;
        b=A/b1zclDDfk3hRQRUKayOPbevb82NYdMRdZttKs9r37Xyh2ZwyLxagUA72+dWQKeWL
         1TKJTcP3xxKPPSt9Ed+kwXwvPx/0uFvCGumRqyn5mzuvvO8Ae02S84EItKybzYwLFyMX
         o2CDjI3AjDGzyXrqXCrbstjd36YrK1Kvxjeu/Z+Jhfy/fTUvCpb6aEqOHkTB+clW3deA
         xu28oKDKDRQFZOHIl/5Wc14RbmAWArz8Fc7vxCZK2GJ+bXG4LOIUshIIDY2sancgYSrL
         dkBKGb6k6NwfLq0niuaB85cdWCS0zakYnLIDD1i0ig7r1c/7CYV7DlNxnvmlJ0d/NrhN
         AR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000231; x=1720605031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvMEinijEwgsKZDsBmGm/iKxTFLThMpGobnSIWlzUFc=;
        b=UfEf+bkw6YQKpii+bToLG+jTvZfnB1nCFckdh5po2nEIveKn4DOciylHof/Ek4N4XV
         q115d9oE9eDTUKFko0OVtFyNcFkcy3CSxF9qDqrhs1XsM3mVQ7PqgzCONReYGtujcUH9
         AR65vrc7EiWhWGq7QIe2RKwvifhY3GiE58AP8TuU/UaEOCAoB1JP7VJeXe9p2L8BxoBT
         RiJp6h72Yt7Y9zK8fEDfZ79P/406XCUHwz67ohDLPx53eUtKY3VoZ8ZQYVLbDB+FcGPM
         BFhN1kz7BaV5g1P5CeYjLxbWLb7EJo7MdjuFdWIFSh8c9HaGQlCkFDSHIPFnCPUhr0t+
         a4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVBUY3dQ/zsZX5JMHfvBpqES6FN4M2W8MHGjpJPPxr8Xg/bCnMrnTpCnlt+7M7AfK6/27fhTtjWfzvdNzO5QS5Rdr7FQt54Q+Pb+1H18h5SG8E3jII=
X-Gm-Message-State: AOJu0YxznLjxkSKlTbIfkAaqNicP4dzb0kUbPYa2Mo/vPw6hViZVLuMo
	QhjzppOVC6baaCBMJGgpVnnsNJyfx5m8YlVl7zopgM8MiOU1X//1
X-Google-Smtp-Source: AGHT+IHqO0NeW0hYgOS++CrB+maws1bAp/Jb+zrdkccIaJUBHpnIHgiVuw0F79kfyt8XXwzzdBrjHg==
X-Received: by 2002:a05:6402:90e:b0:57c:abf9:e6ab with SMTP id 4fb4d7f45d1cf-587a0bfc706mr8446988a12.31.1720000231004;
        Wed, 03 Jul 2024 02:50:31 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:30 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:16 +0200
Subject: [PATCH 03/10] clk: meson: c3: peripherals: Constify struct
 regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-3-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=790;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TxADEvEEBX/TothZVxPgAJ7RkXfQpn93WbFswKz2wf8=;
 b=ZRDeYsd4qQkFOSJF/zfGi7N72RpeUf69oTYxSsNrKIIUNBXaLyo9mTarnDmlHNHfjp8M5XoMO
 P5IZN9S7rqXB/deiDxd3FbCvxgerParLlTFa3YYJek2EV5ur4YeuUNQ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025033_043089_05907965 
X-CRM114-Status: GOOD (  11.74  )
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

`clkc_regmap_config` is not modified and can be declared as const to
 move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/meson/c3-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 56b33d23c317..cfa573262bf1 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2296,7 +2296,7 @@ static struct clk_regmap *const c3_periphs_clk_regmaps[] = {
 	&vapb,
 };
 
-static struct regmap_config clkc_regmap_config = {
+static const struct regmap_config clkc_regmap_config = {
 	.reg_bits       = 32,
 	.val_bits       = 32,
 	.reg_stride     = 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
