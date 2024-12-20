Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881A1E77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHmruRXbBd1M7MQs3vPgnCMn1kCojPDfpx/h6wcmqUM=; b=1esnc4kQjpA84X
	6bueF1DKMU7VPVBP6lYI4XydfiYoXBjVB1lY84yHBj9oGOvhJD168hQKZgwZ46m9CodrPqiQjoday
	sU4B+N4da55DL/mtt0SJRLzpFOcFHIO2RCqah2u592vVCgp/D9Rl3DR98aJSnXmCBBWS/DwWNVIfJ
	54rrRI88LDCcW27qmfP7wcdwsnLmHdxrJm8DfTc8Ds8X0rRZYgC9KlLMA2f59cGaEnLnLvqGeN5lK
	0nSvU9OGccYTYR8XA3d2fmunVjSQYLByn6nRXRCTPlrYMgZ4shft+I+u2i30uqPbXWQUikc2ACELB
	qkGkYN+YPMgVuNWDplig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavb-00000004g4D-22Bb;
	Fri, 20 Dec 2024 11:12:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaCb-00000004aHj-0twd
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 10:25:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so16746595e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734690347; x=1735295147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB5LnFpvLXXFDiGc0aX0SzrXmBsCEEf198BzA0TMrQM=;
        b=BK00IX91zfcLepjDabUqeem9tqSZ6sYY+XUpqT4ahxyfy4mX/6tMn/H5kDITGBWiOR
         o39TDqJVj83LMqIleOe0DmhkUtSEFRhW2JgFzxpuF/rPzYrzGm5+ojiS7r+oP/6xxz74
         wQqANkQZazfSKAex12hqzqAKv+IXVpnLXJoUYHri1Khy7CAfZr+RNk5FonRwPHRECwsm
         vduOSLPisSodPbHMrSrJo0lvSyJeJyItbY/Js5tEPdlouaNByT23FpNP/Bo7iPsZdJd7
         7BwyW4nAgrwqdJHiRrCECFC+G5a+GWbxlfGYq0QE7bXar3BHfX6Sxd3IlmLK7uFIe07K
         bAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734690347; x=1735295147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB5LnFpvLXXFDiGc0aX0SzrXmBsCEEf198BzA0TMrQM=;
        b=QiqYBlkB97UnDHQ5JMojx3tLB6Hx/yeBJFPaoz00//oBBYrQZghT7SSiSDpnlD8/cX
         q9K5lpCvz1QGJ277L6ESRkSoAsxAgFVqRKPw0K0nlpYKPyJmwz/CZOk15BUec8SH91qE
         47mK7Sew0dxQRoapC6bf19Qq0633Z3/C38w9TZ4zLY1KQcaqO8UTvS/ppjrbo9CsFPVx
         8IiV5syppKy4hnjQ2tnzcpfBZk1GXonHxJ22kq65PKxkblOD4uc886C2l5NvLCqLC8B4
         hD11pt9H1wX/sagrG/Hxj0uVtCATT/ttJbMt9+DZnBqnF0g/JWkjwOZFxKZ7WsmI7YeQ
         SXdw==
X-Gm-Message-State: AOJu0Yza5lxQx41QFtdBaIlVlnCmc+69JvMeY+bJQuoqlf0O8OmEXjg1
	KAcb/p3DowEpcbf7RrHavU3PCuC2EuWAgT+YqdMr9g33n8QfVI2n6Lq2yfMCN+Q=
X-Gm-Gg: ASbGncuqhTc8PY8wzPDA630PrJXnBI/KDSAaQopzT5ftj2+ydTzCTAUXdEqXGJDxGf/
	CS/7BLG6GTTgIC21u0qJlHpikVpV8aa9XtUub4tVKyGoJSnm2zFKGq1GrlAv4iRWgkPMY7Gjyq5
	2a5uWCdXpd8tYmrSlUGeMYw5GaIbUPWdbKinKI8G03Err29FFIZs15yT95uOZVhc5WcKfsd+lK4
	DWcfMoLMVgcK1fwBz/xX8pc5ZdZwIUQ0mYsIEnbDQMZPNntF6Aay9Wcigt776tleThamLY=
X-Google-Smtp-Source: AGHT+IExJcj7R6Fj2hV3B78SaEFs9sQdEDmlwmWEUeExDxy3OaKLM9OJhZYp5CvU0W0mDQYhl3y1rQ==
X-Received: by 2002:a05:6000:144b:b0:385:efc7:932d with SMTP id ffacd0b85a97d-38a223ffb44mr2188704f8f.46.1734690347320;
        Fri, 20 Dec 2024 02:25:47 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2b0sm3752071f8f.82.2024.12.20.02.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 02:25:46 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 11:25:36 +0100
Subject: [PATCH 1/2] clk: amlogic: gxbb: drop incorrect flag on 32k clock
MIME-Version: 1.0
Message-Id: <20241220-amlogic-clk-gxbb-32k-fixes-v1-1-baca56ecf2db@baylibre.com>
References: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-gxbb-32k-fixes-v1-0-baca56ecf2db@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=iUeX9wdAi43FUJsW47StJGB1Hl6nYX69ImjfhxaI5e0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZUYnKbGrf4tfndrwYB812r9wmrvzkUkC69KFa
 clu7oxTHt2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2VGJwAKCRDm/A8cN/La
 hVIlEACtOj35dKmDN1tybjFaCIu4xF8Khx/59xxrLcZ72LPQZmEwhe9n44Z+Zgbcz21Qjv6RYce
 1FlxtnC9JYdihIzlyM2MHbCXqMyrSfUBYRafhADTATpnFTdI5k5HzWwBYg7QXJ4qIJe/CSB/+3H
 g9Nse6kuiK1pK7zjP3GoXu5Ww7XMuB86jyt/dS7dGcOOv3sQ3qLfM3Lq3PqhHbRZ9GTKg/JFn5X
 UkstNlz4uaIFR3gjt0lapkfGSslp8gaL/OoSoHmHAf6RGQz+RMN76q8LKuWTBAbxLsz76I/tF1E
 DE2FDf06nUWYCp1HHMizs0lGKg5uf+smor4HJRWkP3VStyA3Da75n/U34n3yPrx8iL/2x6sJshS
 TLuAcyzPcG6gk+Udj2fv2CfJc3zkvAR0eaKcvsNP3Kzz4t1s26Etw8O9jqBXevyn/VAxQUBui5u
 yEMccu9HVuQf17KUlkYQrY6F7E+2I/phtVcZwk03sOv7Hp18WoTccErkfBYolxHmgkxpttLiPe4
 DDAaOxi48lCpeN9m9Bmzv7XZ5p0093WdMBpysY0lKXzBiGHEoKtTcqtDnt5bv3FQ1MmfkaVAODO
 S+mv26036FYLE0/zjNRwCwYc6IQIs6utX2rVxiJ1liYEeMeQ0BTq3CT3biKOcazUJ/PcOaB0p6Y
 dYS29VoIqx86J7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_022549_269544_314DB788 
X-CRM114-Status: GOOD (  11.56  )
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

gxbb_32k_clk_div sets CLK_DIVIDER_ROUND_CLOSEST in the init_data flag which
is incorrect. This is field is not where the divider flags belong.

Thankfully, CLK_DIVIDER_ROUND_CLOSEST maps to bit 4 which is an unused
clock flag, so there is no unintended consequence to this error.

Effectively, the clock has been used without CLK_DIVIDER_ROUND_CLOSEST
so far, so just drop it.

Fixes: 14c735c8e308 ("clk: meson-gxbb: Add EE 32K Clock for CEC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 262c318edbd512239b79e5ad26643ae6c7b0173b..62494cf06e7d775bdb18b2242c3d45bf246bdd0e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1306,7 +1306,7 @@ static struct clk_regmap gxbb_32k_clk_div = {
 			&gxbb_32k_clk_sel.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_DIVIDER_ROUND_CLOSEST,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
