Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219E7C31D97
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GCTAUfGku9EZ19vLcIB7auoJ3eYOouvPq0fbnyo3DY=; b=2oJvZ0VeFjAATU
	cKyAP0Co/1ZCru2iMLjRmPSr41tXKdG7k9q1UAPOF/6O3RpMMAOjCbUTg4eJ9dPCOQS9LhE1NNls7
	rQUWOB/wKAmc+CXuxUxjvwu3gPFsgu0pOYHUPC3U1Y5rhxIgWdwpu7SatlPGRXllqSTgu3eapqqLJ
	ParLXRMYmqDJr29Pp3Kt9At3Yvvg5t7VDDeHKFZyDRW/tA63KYBBhJvxPpM+W3Ozrxha69Wl1Ka96
	wFq893aP5XVSoveeNMaybY3ucLFUUtDhji2ftDTZODAEIRO5fqatxY41EIRP3ZmE2yEKufkvpTqa0
	m+BrfKcSt48/6x8JJPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwfD-00000009d0t-1AyD;
	Wed, 03 Jul 2024 09:52:35 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOwdN-00000009byZ-2UR5;
	Wed, 03 Jul 2024 09:50:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-57d046f4afdso1495305a12.1;
        Wed, 03 Jul 2024 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000240; x=1720605040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiCqBhqUCgc2qlo69kMyfb9Kw0XmXS+HbWPYR88AKtM=;
        b=FtKbVA/oQP5JunJQFzqusaPOKwO5CHJe2fSCS90WUZE2XyAhVTexE/Sm1Oc7fxemH/
         8dc+XsMol3akb2v3DDr2s+62AUJMrdyfcGCUfXpiQY0FRazMGLX4C0a3nnlnwcHNzqcI
         Ywhe3CCbhpKodx5ibhKUNyTbUkTCS8fI1sMweaI6lOpMsgmGKcaovTEOsGninfZQEtFJ
         sCjsfRdmsC5lB2Y4SIgboQC1Nc9HNuoex8SoAo45J3VMdc8/fF2QPbZxaxYto7zyxpO7
         YydjpmP4cJKYY3Zci2TxKkwjPBCHuxIzjp4xx1IIXUjBM4zWhWHZm2cdlv+tRSo9GP8i
         kkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000240; x=1720605040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiCqBhqUCgc2qlo69kMyfb9Kw0XmXS+HbWPYR88AKtM=;
        b=Qkm16UF2ZnLmpnjnF63x3vFb8BrtG0LhhrwDV9Y0q6zIwxmX3zPZ3IDMKbWq++D61g
         FeiT3WnkJdcKsfU/bwahy0XFyKOCRfPYQhtbcAUqEtOwdGvT/rqYYg+WPbZTecN6hBg4
         f/b0Y7mfGvDRnT6fjjhxt2D99+yzEnSb5eEhkkX+TsgAm5mOFdOz04RBs9koSWvcEuU8
         YAwg+yfC3/3PeS1D17sQ5JXev/VRMiWpJo1vUDH89fI66Xfu5gq9bl6bk87/9n8JfmqZ
         a3SMlwXWI9iyNYNy7wZpGkQDVqgh/E+G9PMMitjhjXJc9gLLBhTAIbV1CSqsQh4+zu/z
         TUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQxAZ07Bl2hdeWk1cBfL2fktzIube8XK0IY+c10ynq9Yb1c+kZWGwYRYdL1X3h3oLsga1ch0fOPo9Y+hQ07aInBrAnEqMMQsBDRdjU8V8/QDFfVDY=
X-Gm-Message-State: AOJu0Yz+p3x4M16bXwYqa+sfqbqLPh+ztc7LGNqEpokZhgEKK8twY9Hh
	bt8N1/E9qyUsDb75yoDHprbschgDqGQs32KYEyITg02oqhDILXYtict0ASi0
X-Google-Smtp-Source: AGHT+IH9+soogFDEvM3qfzATv+xM46StvZo3k4+MIXApLMLfrZb95ASnqwtlsqhaymD0ber1BdzxkQ==
X-Received: by 2002:a05:6402:1d53:b0:57c:dd3a:f399 with SMTP id 4fb4d7f45d1cf-5879f3ac31cmr10795277a12.12.1720000239972;
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b4a97b1f3sm2082130a12.18.2024.07.03.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:50:39 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 03 Jul 2024 11:50:22 +0200
Subject: [PATCH 09/10] clk: sunxi-ng r40: Constify struct regmap_config
MIME-Version: 1.0
Message-Id: <20240703-clk-const-regmap-v1-9-7d15a0671d6f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720000225; l=823;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=4FCNr5GOWcEA6y5NqdpifkLm70epZYiiKRWR1KypcjM=;
 b=hxckhw6snFQZeQGymAQKqS0eL3J2chT1g/zqB+Nq3f/23Ef5U+/1Bs6WOELhWWFbyyQW0D6hS
 pI0dG8mxc8nCvqABfGl2sjQpU8VqFqsdaygU+yFnBzBcOvEHmee/pmx
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_025041_714387_230B3F15 
X-CRM114-Status: GOOD (  11.05  )
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

`sun8i_r40_ccu_regmap_config` is not modified and can be declared as
const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 984ad3f76b18..2f51ceab8016 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1292,7 +1292,7 @@ static bool sun8i_r40_ccu_regmap_accessible_reg(struct device *dev,
 	return false;
 }
 
-static struct regmap_config sun8i_r40_ccu_regmap_config = {
+static const struct regmap_config sun8i_r40_ccu_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,

-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
