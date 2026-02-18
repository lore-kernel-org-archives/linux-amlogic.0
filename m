Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5736FE9A04E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 16:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fMDBGF9zoaCv0gGvBpZoun156+VH8BPL7LbUUBcuJdA=; b=PglArw5HFKMvqk
	D0cUmjZEbMEEG3FJTrQDSg5diDJbf+qdUiECuOU2v4y+HrcvqkFEOhaGDTPkEJKnA7mDInSbkt4g2
	dySGZFt6wsbZDII7OoIHoxeEGDAr22HjA7TAVhstu6fd530MGPqrzHRLpMiI6OvTaX5VPqpqtwEaX
	NC1PjojUtX+9eyeCBgnRfd96dvT1tt3Ny2aCTSeoCPKO0SryWtPtOB9ATnKXjRSKuq6K0NZgHRpdT
	Yb5IQCTywkuMEPZimAi8gIkjQC9xsAXROhyJpstfFqQIp2/DSwMiQnPSdjF2svAsAB4ePtT0Qf1hl
	/fu70ZtK50ckFunf6aPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsklx-0000000A7JI-01o3;
	Wed, 18 Feb 2026 16:51:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsklu-0000000A7IM-1quF
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 16:51:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a95de4b5cbso51021305ad.1
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Feb 2026 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771433489; x=1772038289; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=;
        b=IUD202WpZE9h8n1CPvGr4KxoHrrOtPrhhUE3TiLTiEuxQ6vw0/s2DFuYmxTlhzjqRJ
         YnYaxm/IZAE72BAIbCQSO3wCmRqkGBWilPDOR5Z+pRR1dL5yzBadOUnxFYvhmib91vDz
         RHvEnhvclrJXLfftrAKovuoS8m2rfFdxhLD00SSWxYHp99Z3kM2rWCIyrT27+PgSaS/N
         mjrctHQQlMilEzNNb1xdhsBu8UlIEcN1CbIVGAtJFq3AN9aDqcRCFDJWT7K0xJAUBXLH
         S+VHNwlpVbp+fN7O17Fkpcyng2AlPlWdZu/ENzx6xeGZrTqY5UiPUK7UDYMY8Upr1R3P
         jnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771433489; x=1772038289;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxHzVkbJVuUf9PPiRw/JbF+frY9YqFQFTwH6XtexsFQ=;
        b=gxaairOWnLX2sSyexaHliU65pe52NfRPf4vUZHRWgW6/TspWDhv2OQz4JshCR2mXKO
         8qxVQh95Hvt4rEJo8jvuzPKUTFaAWecV8Ta+ImAhEaa2/okOZiH8NYFatX8EryrJ9wpk
         B2o0xaDSYqnvZfntHcexpV050MxJR2O4NTaHaD9nOrS0eUfqrXxKFxGelDGquFjG+vTY
         ynk0mRBR1oJxQ8GG1rznJfvq9jBuy2M7Xm+XTd1OEhJOPnh9OfOfgq+iHPA33VK89ER5
         DB6FzcvtaaatqIPsDUH+3jhzQs+TJVRmIETv4euQnrk/cKh5gIyxp4NqiimcT7I2wCvm
         SLow==
X-Gm-Message-State: AOJu0YwE8l8gS2GetIUdRroGIwzS7ntEvPpkm8aKU7jTE/YtFEQOwCLG
	FrN9bGiV/B+auUpUP4syA3cCJ+QsHKnvZlTfqPmo4jk6mjpdQLKfnfUOoDNMdYMr
X-Gm-Gg: AZuq6aKEwcsbkW/xkOnVJzh3BCzHxiETtWLaXKCkJR7cYg5+T91FtkutAa7kudQgzf0
	laxipp2C/blpt2BYSqnCgVTf7XXmSFFp8v0JgfefFHXW0I2dswPZg67OLKU5ZWYHSW6lsgb42Ll
	pMUWLBjU2HnOdHdrA9QmlaqqXIZIslac4yM4TWb1RfCdDTNBm3KTkT0CPeLhsRqI5SSPRZXi1cb
	4LiIDbgC4QoukSHoJkKZ3oNV51u8MDBlbvfLxXV1b1/s/glMnE8NBHQI/OYmmS7SuC8PqIGBC+j
	pwYCbLIaXtIMjV7casSWlMKeOXa9NgaypoWFyzk8XSNLxLcwcLHDidhH8ROMWi2s53/w7Qy37RC
	Cqgrfwh/uUW6MOmNBW/K5260wjeQ1x0z/MvsyMdjk2A52NqaJRSGlNk5HQ8vbKMd3eH7QrXaKFC
	lrQTT8Lqp2jEJ8BPbSpsOz9A24D9K9UT0ldHv+
X-Received: by 2002:a17:903:244a:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2ab4d06157dmr192384245ad.46.1771433489047;
        Wed, 18 Feb 2026 08:51:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:403:e988:3f54:236b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa5cbsm176996885ad.9.2026.02.18.08.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:51:28 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 19 Feb 2026 00:51:22 +0800
Subject: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference leak
 in aml_dt_node_to_map_pinmux()
MIME-Version: 1.0
Message-Id: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAnulWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0ML3UQTXWNzC6MUsyQDS5NkUyWgwoKi1LTMCrAh0bG1tQBDzA8VVAA
 AAA==
X-Change-ID: 20260218-a4-3782d6b094c5
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771433485; l=1449;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=T+ddj9uth8B1FutWkYbruKcbeWNS950unthpcpOU8Mc=;
 b=j/cNO7oUv8KJAFH9hBKE9Q7aZLY1Mc9Wed+OTyOZmsNOTm2f+C274WzqExLijzSUROkMgdDav
 o4mMxRI63ByAnFOh6LcG2J0gZRy7RUaJv0GeXAc9vcUSRSY7hbUR4BM
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_085130_480798_B4225BF2 
X-CRM114-Status: GOOD (  11.30  )
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

The of_get_parent() function returns a device_node with an incremented
reference count.

Use the __free(device_node) cleanup attribute to ensure of_node_put()
is automatically called when pnode goes out of scope, fixing a
reference leak.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index dfa32b11555c..e2293a872dcb 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -679,7 +679,6 @@ static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
 				     unsigned int *num_maps)
 {
 	struct device *dev = pctldev->dev;
-	struct device_node *pnode;
 	unsigned long *configs = NULL;
 	unsigned int num_configs = 0;
 	struct property *prop;
@@ -693,7 +692,7 @@ static int aml_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
 		return -ENOENT;
 	}
 
-	pnode = of_get_parent(np);
+	struct device_node *pnode __free(device_node) = of_get_parent(np);
 	if (!pnode) {
 		dev_info(dev, "Missing function node\n");
 		return -EINVAL;

---
base-commit: fe9e3edb6a215515d1148d32a5c445c5bdd7916f
change-id: 20260218-a4-3782d6b094c5

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
