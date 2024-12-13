Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534A9E7717F
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2024 10:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dwcv8xHOnIAvdWFuaBmcectka9Mk/LlnJwS27Ft/8f4=; b=e5H6BolVOY5xz+
	jVPdx/U+h4mJhf4YhqeIgnG0L8u/4Kj5x/0e+gIJenBVS0Mqzf7BWDWCAZRUAj5bn1vDZfB0IFJb2
	AmgfvIXYMFBUyMqeecjFU8rfnA45K+KxOxWFMGJb3UVv57OLsfueImWpovATNnkk/FWAZaWFdHhG6
	sWoC46Zfg6xFMObgSqbbHbb7TcAl+ZtnXOfgcdwDfjC88x6gRUERLwa9sv94Fcqa8yYTypSamZ1eA
	87pFd855DxPfh6IrgWJrzJ9zsVnljAHAcKiN1UMmIOVBO+c8fSSCC1yC2jeZcdaSu9D0qxPw++dco
	PEYsyqjYfOTShH8cvt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2WB-00000003Mjg-06mR;
	Fri, 13 Dec 2024 10:03:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2W7-00000003Mif-2lOi
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Dec 2024 10:03:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1737171f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Dec 2024 02:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734084205; x=1734689005; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFI9i4ok0V47vvvqEZzi7w3lJlZg6r1OCY/7ewYTXag=;
        b=T/J9o1SuimW4M3jLdAm4zH1fzm8ajigo82X0jji+HNAaGoGTTnGDXjFenb3a8DuCP8
         rKXII5yvr0x8u7FEfYuf4y/Fmhen4e6FTPsYDSPl7Og5efrY7yUL7drBspj8b2JHdS1S
         MpCL7mTI4yd253DgR8fJNV5cma0fitvpXbzVCRR2k1tq7yEpVmqQDyQhvY25c1RRPu26
         sJiU3udEQox9nPcRk2yvWBGZ32sONU8if78ByJRkqnlxniNe6UfJ2LQah2UdvFNJqeP4
         ELDPQRriVLVm74QF/0DFvAqGVaJ0WCdwLLkIEDdN/CGmv3EquQLzrNby0EGk+WuE3NXd
         t/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734084205; x=1734689005;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFI9i4ok0V47vvvqEZzi7w3lJlZg6r1OCY/7ewYTXag=;
        b=nBh52EF3SRVm9hk1UupmkTCgOwRsPdSYdXGuKCblWiuogafeo7DY2BvWqDxHe8d92l
         wtqXdturcenodbe1DpRulX4HHWuqIiB/xQtnjGucbxw47NYhYL7UBB7s7MXsg9rS06MX
         LYPu8Pd9053yxtjB0LkfMhgG2A8s1Rq9p3IfjaJgkoECFNx5/hzIvIKWNrjAp/UsznLD
         MqaQqz/RBj/+KxEsO60x2x8qmU+CphzYk5tTNYKUuvEaSb/4S9V1hI/9v3mlg/m3rf2h
         NqcgOE6kvsD7vBz7LkLzZxfm/PpL0q7YWnRS1tEewA2E5AUjmxir94ShG7wSlPEv28up
         68gQ==
X-Gm-Message-State: AOJu0Yyj25T5c4G1t992Be/k+KTelSKCYGHZVSH1+YUlBjHsOYOliPNc
	qVwHltA0x+rFXaQNp/+7I+PNMOcoXITgdeiLHVgFd82xhFt18P+EtZen52jIbEs=
X-Gm-Gg: ASbGncsqEFQ9juVnpcxodb+gvqY6vu6eAQVqt4FpMc3ZvbT+pKUJSPAcIllLyaPoWzE
	mxPumwbAtNkDKgCVX2FRvF+QWp+/m85+1JRQvTk030BnPJPoLqhE+4lL1u9fB2Avyao49WvOctr
	6UCsMFTsGWcsv9i5BuzZLCKvL2XAnZjeim3gnTBj4kN1hfnPg81r1PlRZ1TxfUDDNZSbpmXGAfq
	VHYbAmqVhJjSR547L9DRSfNTSlxNfIDc56/93EASTVfaA4t9QWWrvcPwpTFFDVt0XY=
X-Google-Smtp-Source: AGHT+IGWMsKDo1RGySfTJ3+dMT498NxRdjvPBH6a71w42cCCbzdBrjO8TlN1ev5zP81xAaiujA6C1Q==
X-Received: by 2002:a5d:47c6:0:b0:386:37bb:ddf8 with SMTP id ffacd0b85a97d-387887b8642mr5284456f8f.6.1734084205560;
        Fri, 13 Dec 2024 02:03:25 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3da8:c88:4a1:9b7])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3878251dbbfsm6531759f8f.97.2024.12.13.02.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 02:03:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 13 Dec 2024 11:03:23 +0100
Subject: [PATCH] clk: amlogic: g12a: fix mmc A peripheral clock
MIME-Version: 1.0
Message-Id: <20241213-amlogic-clk-g12a-mmca-fix-v1-1-5af421f58b64@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAGoGXGcC/x2MQQqAMAzAviI9W3DTy/yKeKi1zqJT2UAE2d8dH
 hNIXkgSVRL01QtRbk16HgVMXQGvdHhBnQuDbWxnrGmRwn56ZeR9Q28sYQhMuOiD7GQiXtpudgy
 lv6IU/b+HMecP4zYA92sAAAA=
X-Change-ID: 20241213-amlogic-clk-g12a-mmca-fix-c9ebacf34d9c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=n4zlrLsVQUGa5+NUAanIaq9aZoPbWfTfoCH89MaS3JM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnXAZrMpC1y+J/u2peikLthve2ae+c+aoWUB6+f
 ii30C1SL9CJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1wGawAKCRDm/A8cN/La
 hdoVD/9ogoG46YZegGOTeTQRSPngGmTelmUFx85r5qO/DwY1ZIUFp/DFjiC0cz9pk1H5IYyLh1T
 M1Ne61pUqt43/j4zwkym8YOj3jEvKM4/SBeBuKB0Dpt4zeLeyZQfRtad/ny4Yxy1RdnquxihrHU
 tm7gW/py5Bq2jCMj09beHKQxTzyW7IcvJtHvAU8hicAH3vKGKpK1/EN2APw67jgbjKbWGglaDFx
 oGK319P1tQ39jBGTzOrtK4b3ePOzPa9znAslAi5Fx+nd8Cu2+aCMyw4mpGiQ0f+fWOGCWB7kKrO
 zc9pbED8gPXELWl3ETAwwZhTHLpjSceNBkYR3CXKddaoe2U3NhqE2W1JLnz8ThDNzb1T1//gB//
 OZ33zmyUli0cRl92iVMMrbRWbriFprxf7j0vruOH7fx4NMzCeDM6wj8ygCPtzDDzYdDGmQgtE3Z
 Ux8doX8e6wakG0c22BPeXTstDUtGJFkdyxpoF4/2TbdjSimBHUV3aLVnrdb8YkS6jAL7PEsRjLA
 oRknwYxMcVYSlB6S2T3G67wWXlauLspQet3Z5DjtS+9rF+LAfgrJagf3htfHokddSxMwV7fq8cx
 IFpRJkr6D1rXbN5bxlySlvlGB57g7U0w6icE3WB7Rjx+67cIlzd3BaH0MzcM+8tDvax8hTY+lCG
 TEifzLYOsJM5nbg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_020327_965247_1C113835 
X-CRM114-Status: GOOD (  11.83  )
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

The bit index of the peripheral clock for mmc A is wrong
This was probably not a problem for mmc A as the peripheral is likely left
enabled by the bootloader.

No issues has been reported so far but it could be a problem, most likely
some form of conflict between the ethernet and mmc A clock, breaking
ethernet on init.

Use the value provided by the documentation for mmc A before this
becomes an actual problem.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d3539fe9f7af5538201a78ce560f662ddb3935f2..20be7b037c07535bd2115f6e70404a95a7832756 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4311,7 +4311,7 @@ static MESON_GATE(g12a_spicc_1,			HHI_GCLK_MPEG0,	14);
 static MESON_GATE(g12a_hiu_reg,			HHI_GCLK_MPEG0,	19);
 static MESON_GATE(g12a_mipi_dsi_phy,		HHI_GCLK_MPEG0,	20);
 static MESON_GATE(g12a_assist_misc,		HHI_GCLK_MPEG0,	23);
-static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	4);
+static MESON_GATE(g12a_emmc_a,			HHI_GCLK_MPEG0,	24);
 static MESON_GATE(g12a_emmc_b,			HHI_GCLK_MPEG0,	25);
 static MESON_GATE(g12a_emmc_c,			HHI_GCLK_MPEG0,	26);
 static MESON_GATE(g12a_audio_codec,		HHI_GCLK_MPEG0,	28);

---
base-commit: 52fd1709e41d3a85b48bcfe2404a024ebaf30c3b
change-id: 20241213-amlogic-clk-g12a-mmca-fix-c9ebacf34d9c

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
