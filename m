Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A783DE7719C
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 04:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ww3+IMwzedOW2slFv+YJIdIknWd0MjRSrGeIAfWTbP0=; b=JMVePs1XODlKkh
	xTomoBWXoVR+eIV/fY6meZer4B3+snd65uZb9YLOFBdJgOt44K4XaVt71XY3SMW4E+G2SowjMCt9S
	DnaXcJiQy/Q+Y03DwLEU7nMRnLB3xAWElvcjt7Xatr5Wgz9PNDeHpftLpEUFsGDNqgqVcg620jUOI
	7elfjNGwzFogtwtsTZxc+1k/r8/8K4OQU1sSnDOIKQ+hrLToWqW6a5pV1zSn7mm+047yStvoNqGHh
	3RiEFPgZ980POB3J1FM3uivmASi43uAmsTR3l24zQQ/f3x83lcFcT0rI1PcfKYYZiLbNWrb/3hS9F
	e8uBv/MNBzjlOhh2Bkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW6Fd-0000000Dx20-3g1U;
	Fri, 10 Jan 2025 04:04:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW6Fb-0000000Dx1W-0N4l
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jan 2025 04:04:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43690d4605dso12188725e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2025 20:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736481837; x=1737086637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9Bo1wufBfvDp17xEGdBsgVq8YY1KmqG+B+4M+rmsTk=;
        b=PoFVx7Fgopy39yhPGV3c8xKJ9q3LRuc2B6g++zSTsYqrE6solt3n8qIBrrz+qjez3K
         gNb1r8tfzXNkSQi7yqxVM5WuF3/32l1XwFMxLOm217rqwQJ9uE+ZmK7V1rQBrXobfMyV
         qjntKLPPViyAqH2OtVzentFhqatEhzXeUw7/rnDumADbj50La+6fMVDaO194Rp3gEQgi
         9jMD7pkEX7esJxE8gwoqUxWhA+fclXSfJfb2kKbugN3v8vH0JmjhfDp7PHSn1HZ7hVLI
         rzkcKRyDhwzZ44T311i4KcVCYMexrXp+CdJbGPTQvvRhLDXaMfvuki1jlftGgxvrJ9jf
         hXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736481837; x=1737086637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9Bo1wufBfvDp17xEGdBsgVq8YY1KmqG+B+4M+rmsTk=;
        b=bBnOSF/6Rpx30FlzBxlwz+SovREVuI+804AABFaAiXmXbyWlG7NHQg0NHM620FOl5B
         A0W/Q3AYeZ+5XPGhPNH/uJo77dZmMm7iZTwYX69KMQcxFrBjaOFoRpQ0mFEI5klc950u
         jy6y3dX45Dtg6qUkf+cqOBUfIARBmU9C+KXWw48vdK2oUqe8f6bQ9rec6AXbB/ezi+Vc
         cvGnUsfN4LTnwLPpVaj4LQ2b8OPy6sW2HmMQqy8qgKKbHdWBAV8337vy7RBGAhNL2REj
         sNWbAgFE4knOEEEdptf3Hp2yqkygtRaULZb7GGbgoANm2hyQuxLuw/RTKbuUNVIDc2QX
         YKMA==
X-Forwarded-Encrypted: i=1; AJvYcCV1g92LCrDrRAu6bl2SWwKcbZznubyzKtZhWQUK38wo2h30RLzm3Rb/HV4FtAgWQOZHzoiX6DuoBkEHTR23@lists.infradead.org
X-Gm-Message-State: AOJu0YwLKvcrXpF2yPEKsCySyxfS66sFI/mUQ5mzPedaAObgyeux6GOn
	HN7F2j5LHWAu0rrQNU/AYBiZUdEbzeKcDShkjvTplCOeyljWoB6COYyGNQ==
X-Gm-Gg: ASbGnctGtyW88yMUUeLkeyji0v3rX5AY2YNjfOu7cXZZ9ciYkb2o1m7fkUq3ZXWmdXp
	qRzru4xwrFjbGZMAZcgKB/gkuy++eRlec6YjD4l9ewGt27kdzr64Tq+0XMDbdnZifsbhym6a2iy
	VqE3eavuJKx7cU2D4KvLJ6xAabkcvpYzm/AsQ0I5mdDEZeR5XWiKBIbc5cA7QVcSiytBOXUo86J
	eAVru95DPXvU5j8c/EctO+WNxC/0Js+r423qfTpIpR+4hHKyo2wZnEywHnctA==
X-Google-Smtp-Source: AGHT+IHiy+F2Jl4v5xbpj+sHo2KV7tlexhqY548aspvjHj4DdDRLp+zVYDo51bSm0OoUyQn9/eyrcw==
X-Received: by 2002:adf:b1dc:0:b0:38a:88bc:ace1 with SMTP id ffacd0b85a97d-38a88bcadc9mr5438179f8f.34.1736481836597;
        Thu, 09 Jan 2025 20:03:56 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e37d69sm38686505e9.30.2025.01.09.20.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 20:03:56 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] board: amlogic: odroid-n2: remove amlogic prefix from fdtdir path
Date: Fri, 10 Jan 2025 04:03:53 +0000
Message-Id: <20250110040353.3424412-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_200359_126928_5FEEDE6F 
X-CRM114-Status: GOOD (  10.31  )
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

Commit 834e7c8136c6 ("dts: meson-g12a: Switch to using upstream DT")
changed Amlogic configs to contain the default /amlogic device-tree
path prefix, e.g. for odroid-n2:

CONFIG_DEFAULT_DEVICE_TREE="amlogic/meson-g12b-odroid-n2"

The board files also prefix amlogic when using fdtdir resulting in
an /amlogic/amlogic/meson-g12b-odroid-n2.dtb path which is invalid
with most distro packaging. Drop the prefix here to align with the
board configs. This resolves fdtdir boot on Odroid N2/C4/HC4.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 board/amlogic/odroid-n2/odroid-n2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/amlogic/odroid-n2/odroid-n2.c b/board/amlogic/odroid-n2/odroid-n2.c
index ae953d0e4ba..e98580631ec 100644
--- a/board/amlogic/odroid-n2/odroid-n2.c
+++ b/board/amlogic/odroid-n2/odroid-n2.c
@@ -62,7 +62,7 @@ static void odroid_set_fdtfile(char *soc, char *variant)
 {
 	char s[128];
 
-	snprintf(s, sizeof(s), "amlogic/meson-%s-odroid-%s.dtb", soc, variant);
+	snprintf(s, sizeof(s), "meson-%s-odroid-%s.dtb", soc, variant);
 	env_set("fdtfile", s);
 }
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
