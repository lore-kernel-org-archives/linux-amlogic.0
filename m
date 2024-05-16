Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4FDC25B77
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 02:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5mh0X/XuShqUsI7eW2WZMMcVJM4MfRTwNFLB+vqCzck=; b=Eb/q1nuEJR9zsN
	V7pS4TdZpEoFcYykUzBXPohfUrL6ThhWreWAYRhHyBBdd6NaXkSm3Aj0j5KDh9wbFcSObFydT3jqo
	AW1QqJCSCvWM650mT98LDUOO70x8cW92zXWhklWOqNsOQAcXQxmgPkfyYV6qVUT2clbNXI89ookmI
	EuBeeSJZQ6z8ZdUxTJ/tldnir5Xzx50xi1853nc2Q/m54rRryyAFhnuIbdPFtQT3c3OTAh5WQUrV2
	Q/biWkfQ2FSL80u96yge5yfW+TeqgobNA54ROE5MajJA9M+9nHHI1HjDuUtoubZT4h5ZfWm4y8iaI
	GRWsFAJzSLsvabgCx7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Qrt-00000003T8B-43b7;
	Thu, 16 May 2024 02:29:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Qrp-00000003T6k-1Ykg;
	Thu, 16 May 2024 02:29:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1eca195a7c8so62638505ad.2;
        Wed, 15 May 2024 19:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715826549; x=1716431349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylKzb7dfxhYrNsu4O3QTBN7Pz1PLfr8QWuGfcHzgVrY=;
        b=GhzCxPeYuVzZD1S2Fj0DEI9CBaPDKV/XI8DROs067880j6+LHte1uYQorvpdzisKaf
         BvlwYd1cBxMBqq803EN/Oig4lXUSNNvw5rBasvrN6eMYG68IxdCxadMZWMJ4YJTQBHM7
         974NWAjwQ8ci9Nm/68aKVLmyl5AzEnnQ5WZtp2UiqZQPNh6V29u1VwoHcLFTzBlm+5zi
         LfdAtSnwYkUVs3/z+YAYM7EZgOs+UcBnOiWQUROKomWiX7UNPqIcjoOuwaNMAFpXGxcj
         3QwZ31Q0OVlZCYJ7s1UBNqGxaqrRvmuj1bh/2KrE9RYyA8+d5NNRZlSPF0v78AUpSnXl
         xr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715826549; x=1716431349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylKzb7dfxhYrNsu4O3QTBN7Pz1PLfr8QWuGfcHzgVrY=;
        b=p1q3mhGquGP5nC7nTmZ5mgHO6c2CaR4yKLygwI9XTNTZ+xBXtbV2wxbgJN4+jKZWXD
         Dy9GBZguUjYcR5DUk0UExAC4gqAEmU1zr2/EA82hK1vE9Lp8pbAj5Y6E9f9+U5r8Utud
         G/RYbG2MiOsGkTj2yzsE0Jjiot3ccgp3gUPsdfyKbHG4qiewyINEkmtzIN8r6jAywyI8
         HPBcmuNvvpiasVnH+yqnDcCJc7y8PhxrMBQQ35df5vMkArh9clD3goKF35WKWe1bjt82
         Cd0prYiFi6IozmKzDck1kVpLnhmus2Mh6mvfn/lYf3mwuMVeG3vZuIihlAA0ZmGwpy00
         gI2w==
X-Forwarded-Encrypted: i=1; AJvYcCUWvYzmPNu0w2j/tZ15MW/uNsJPfL4NSzS3qKztvrnYL6QId11Y3q/hsk3oZviUfERsC2ZJW098EkWhOAtUguYWoLPkjnW5ySeX/MWlBZeuvwEUhB+3GGK3ZV8XFz4IjQxnc2REZO2dM88KSIBhaXtnoYLA1ABM7w==
X-Gm-Message-State: AOJu0Yy7VSQLqRiTGlBxB5q9Ir9LtuxGmZu9dJWceUbLrI7IkL2Fw7uM
	HZSgWZkSY8z1B5WA2l5YLuVMe2s24MvLNvnrS1BR00DTesY4zg/m
X-Google-Smtp-Source: AGHT+IFCDvih2Sq680TsFRlr89jhGuDy3ApG+kGUrzzeIRsdOeB48Bj+5o0oxG0AAySe6TyFzsu2ng==
X-Received: by 2002:a17:902:7893:b0:1e2:9ddc:f72d with SMTP id d9443c01a7336-1ef43d2af36mr168568245ad.26.1715826549066;
        Wed, 15 May 2024 19:29:09 -0700 (PDT)
Received: from mari.. ([2804:431:cfd2:fcb9:74c9:b9d1:b3ec:e1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bada405sm126405175ad.92.2024.05.15.19.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 19:29:08 -0700 (PDT)
From: MarileneGarcia <marilene.agarcia@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: MarileneGarcia <marilene.agarcia@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 linux-next] nvmem: meson-efuse: Replacing the use of of_node_put to __free
Date: Wed, 15 May 2024 23:28:38 -0300
Message-Id: <20240516022838.8609-1-marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_192913_457176_E5A405FF 
X-CRM114-Status: GOOD (  13.85  )
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

Use __free for device_node values, and thus drop calls to
of_node_put.

The goal is to reduce memory management issues by using this
scope-based of_node_put() cleanup to simplify function exit
handling. When using __free a resource is allocated within a
block, it is automatically freed at the end of the block.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: MarileneGarcia <marilene.agarcia@gmail.com>
---

Changes since v2:
The patch was updated.
It was checked and there is a blank line after the last 
variable declaration, it does not appear as an added line 
because it already existed and it is not changed by these 
changes.

Thanks

 drivers/nvmem/meson-efuse.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 33678d0af2c2..52ed9a62ca5b 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -42,20 +42,19 @@ static int meson_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct meson_sm_firmware *fw;
-	struct device_node *sm_np;
 	struct nvmem_device *nvmem;
 	struct nvmem_config *econfig;
 	struct clk *clk;
 	unsigned int size;
+	struct device_node *sm_np __free(device_node) =
+			of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
 
-	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
 	if (!sm_np) {
 		dev_err(&pdev->dev, "no secure-monitor node\n");
 		return -ENODEV;
 	}
 
 	fw = meson_sm_get(sm_np);
-	of_node_put(sm_np);
 	if (!fw)
 		return -EPROBE_DEFER;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
