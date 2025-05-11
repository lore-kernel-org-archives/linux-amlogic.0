Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6055FC3ABCB
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 May 2025 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4H60z/6f+zDu+IFLQiQRH9DP5FTBR7RDTmbhTPSOLQ=; b=CTyizemn9Vn+cL
	PrjqlSMzG8j1SRqPjs8TFU5ThZrarFuT4exoFLF/3zGdCRISWgrEKp/1rZukhLgDeLe3xiUyF+bRw
	V+R3Pt+5sD7Idu3GYE2yAUmBsiS8gQ/HLLZ/mQSb7K3quccd8e+LcQAHKdFBk1CiTLykDoHje91l0
	Hm8mQTBpBH75MBFKdXL7vAQ94se74IS2vH9a3E/3AQUNbhfIB2uPz9le9WU0YJkIoLFPbbmtrF5Ja
	+BscllmtiTnx5k7WA31G8hxpRAw6jmU74kJErWJqYSlmWg8gaN1gC8PjG+PleREbnPMhsyDEwkSFM
	3X4Ypgf+ihLWz3wWJrKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAfL-00000007cak-2P3v;
	Sun, 11 May 2025 17:40:43 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEAeG-00000007cSc-3xMU
	for linux-amlogic@lists.infradead.org;
	Sun, 11 May 2025 17:39:38 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4775ccf3e56so58620781cf.0
        for <linux-amlogic@lists.infradead.org>; Sun, 11 May 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1746985176; x=1747589976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=;
        b=K0gK8pph0mS4AAO17mwpdWfa/zxuPlYW5s72d34M4fbgf/BBUMJbLgp4ZAzbwxLScu
         41VdkotiXBpx0EPMGMRrRXUPbWnxMeIS1H86hQumxNaNjdjUldDvqnbRkJsZqM100Ias
         xoUVR34sK4PGqyPssJyxMhuhm3DvZznHXGM7T+sPeNbb1ME8maVb8pWeSYC75cB4QzpC
         RQ+J67yCXGX2jls1GW/UQNZAafPiSUAxu6QqWN5AO0Lt/UsneXC8ovkY01U7qjtn9RRC
         hHYBHUjxMxZf7sI3KSoKsnRCRfzBuPGRQftUUct14sC8eV0noFlmiJ+gVoG89RqVXQBJ
         0BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746985176; x=1747589976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLoioQfYdPBgm49bPKitfsKJOSsTnQU6DqnNOtLxcjQ=;
        b=Bbxj6y/McJf9jJVK4Sc1I0LTIYV3tWdL26f8CFdZvSplFg7Ec7ddonwwmQwdZbe9E5
         izmrVtnikN8U6kt1bNUITCsGLuwhq/7UqE7kwEiaYba3X0D18bUOv03A5TJG9F8Ku5dY
         sUnrmuAQVwsWnF8FFkld3kynjK8w0k6Qpml+TPN7ifv22eh1u1vZa7qzsqszvb/UjxOy
         9xjQOTbEE2/3X5SsxY6qWSEtG9YmnD2aYwhOCr5YBMu9S1Shg8V6mT0qGKL9aoJIdhHL
         u6tuuvnI3x2PXu/fdIPk154phf+BPywFVU37Q7+DShRcnXlIpJWLJ/RMlq/et4MgwTNP
         sShA==
X-Forwarded-Encrypted: i=1; AJvYcCWRhahEZjGNu3QTeIM6bJw3trL1ycy0kc4NeVWhuMHDnyJ+XL48jOIuwME3PcbBmrZcK4YqOR2bguh9wCWe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfa39vg9HR8oHOYW0oCUyPvAElyAtsYEFywkCsvJ15CMfa2L1G
	NwMpphfYyqJq+gbAmjigVcUCoI4cuwdgDQRUkouyK8eJFj2wiRapb75I6g355A==
X-Gm-Gg: ASbGncs1uWwZDsoN7uG/XCVQ94pdWfg6LRuwzfiosUaIkvDRdA3PIToGGHF9BtRfu+y
	ZRR7tQU3hAXetQTleQXqRsdnrWhy7JsmF4Ta9DqQu1jBWKmWqnUMErFu0VgWKCt+8VIVWHWeuPR
	4pup3pqJaCDF8M8ko01YE1SoITm4z86+dKe0WYgD89EE8k8nnY+UWenKjR/AHbrMgfjOcRdsF7i
	Q1b9aMQpiSS617NmOs+zF58jLmQj6f7eDxnkHps63sPfCWUrHxgF7QrtqBWvgCayyZEwie03gX/
	LshM+Ex5zozqDYo921BrEWXm5cJmwHRYeSbE/W7I40GHpEE=
X-Google-Smtp-Source: AGHT+IGbtN6p73kbilpYBJERKanPWex1vuDrJr9UjFDjOEDztJIOHD7xUAEl7SH4fqjj9AVcDWDKXw==
X-Received: by 2002:ac8:5d0d:0:b0:477:6e32:aae2 with SMTP id d75a77b69052e-4945285d6b1mr173557071cf.0.1746985175732;
        Sun, 11 May 2025 10:39:35 -0700 (PDT)
Received: from localhost ([2607:fb91:eb2:c0a0:10e4:4464:87db:3a66])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452588d92sm38259301cf.59.2025.05.11.10.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 10:39:35 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>,
	stable@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: meson-g12a: fix missing spicc clks to clk_sel
Date: Sun, 11 May 2025 13:39:26 -0400
Message-Id: <20250511173926.1468374-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_103937_001974_D643D3A4 
X-CRM114-Status: GOOD (  10.58  )
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

HHI_SPICC_CLK_CNTL bits 25:23 controls spicc clk_sel.

It is missing fclk_div 2 and gp0_pll which causes the spicc module to
output the incorrect clocks for spicc sclk at 2.5x the expected rate.

Add the missing clocks resolves this.

Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Da Xue <da@libre.computer>
---
Changelog:

v1 -> v2: add Fixes as an older version of the patch was incorrectly sent as v1
---
 drivers/clk/meson/g12a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 4f92b83965d5a..892862bf39996 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4099,8 +4099,10 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
 	{ .hw = &g12a_clk81.hw },
 	{ .hw = &g12a_fclk_div4.hw },
 	{ .hw = &g12a_fclk_div3.hw },
+	{ .hw = &g12a_fclk_div2.hw },
 	{ .hw = &g12a_fclk_div5.hw },
 	{ .hw = &g12a_fclk_div7.hw },
+	{ .hw = &g12a_gp0_pll.hw, },
 };
 
 static struct clk_regmap g12a_spicc0_sclk_sel = {
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
