Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B91CA9EB5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 05:06:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45B12064B
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 05:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKddJyDO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uNPXEVPO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45B12064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gn3uAffp5Eaayg7/oa+x3A08+A3AEiH9ck3XcB0FscA=; b=MKd
	dJyDO1016w03a2GhH5KA9Z6xZ58eqvNV3RypEwWd8c993LrbLSxbBCLO37wA854JMT5N3t3OE/cAW
	7QBXx9odk/Hm1UAIRc9W+zz2e+eAFa2InLRM9m7RMFujYKXOoolnlFmmXgrL6dGaUYclomDfwEHSy
	O3WTnJUuRw9I8ItVwtgmYoZZvo9MH9pSt9eQ/ymhiyJtU+/7M5f0av8J8y72sckrygZnmrd9qOVGc
	UwFEXH+nb9p4VZCLDvWDzHB//d1ZzIrFRPUTvB+23abk38OzhE9CUlzGaG5ySfEgIAURM8O/FxWEC
	jtvgaAd7AuMg71EydYnemsFehLo6P/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMPtN-0001YD-HM; Mon, 21 Oct 2019 05:06:05 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMPtD-0001PM-Pz; Mon, 21 Oct 2019 05:05:57 +0000
Received: by mail-pf1-x442.google.com with SMTP id 205so7631794pfw.2;
 Sun, 20 Oct 2019 22:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Pxy+SjxJxYfLUhAFsu0Nbm4mmirWGbXqhMNfG1rN5fc=;
 b=uNPXEVPOhc7PtyHvjnTOr9Tw37fVORVAovKWrb9mkg1g5++6EKEnlZDnc7iOZJ9eXJ
 jzDVZkD1sFNTDkJPYgvOY2QBJEWbRj45nvsRwXqY3Nlk/vLaZcpjhGVRsW99sHaKGcLW
 GakTy01QtnKQRDi+JMaaxT8Xv2cPE/KnCMB57/fuArbOZ1+D/hNl3w17duJl7njCPF7j
 PeIoqIcRGGdUhP37YmBcbQF/e8G8EBWo0Kmo5iVsDMx2fymFWZMuwduY1J1lz2Vu85GP
 c4WEBsOBYHjiCTk6AQbPZ439y5u7tQ1FP+cVkWPEnpoVQxqeHdJDvLpeDEY8kxbe0opV
 8JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Pxy+SjxJxYfLUhAFsu0Nbm4mmirWGbXqhMNfG1rN5fc=;
 b=SoI+Gwa+S4L7JEML84hvoaC1h12gJ+tVF6oz3OysemhvOsq59VBI3lEUemsMMphLOi
 2M37+o2kg+ObwbThbrW+Ubv80lj8Ek6ttxew7GN6ZNQsEUU/eU4W5KTJlafAIsz9CjIf
 D68QCNJmmAyUoTGsdFuPVI2//7AIXb+SywW/RDzHBNuvA9f2sThy+DL81LlBI9eCZRtv
 skuaJAVtgDjnpyzZdSISllbcZiYNy5/eooGQId+fbtAteRMCBws4MoMmYCqmCIjJQqot
 kLSXjpzJn6Hnjn0RbZPfk1ya8Gon4YPTyPs/z22wmRQ9sRTAps6zW19gnfSfVDK5eVLW
 7dwQ==
X-Gm-Message-State: APjAAAU7BjdAA5hcBzGJK1hWJQYuLLvql8uIj8OyQvs/4xvTqH9IPzXp
 fbyOhtdkZxwWCEnEBlruZ5Y=
X-Google-Smtp-Source: APXvYqzkDit0WXzbdvh8WzqFu4bucecX6K6NFb7w5V7MWhpjim8QXFo8+etuqfs/ce9dWcE9Io86Sg==
X-Received: by 2002:a17:90a:8002:: with SMTP id b2mr404997pjn.39.1571634353641; 
 Sun, 20 Oct 2019 22:05:53 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id 127sm13611191pfy.56.2019.10.20.22.05.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 20 Oct 2019 22:05:52 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] soc: amlogic: meson-gx-socinfo: Fix S905D3 ID for VIM3L
Date: Mon, 21 Oct 2019 09:04:55 +0400
Message-Id: <1571634295-20154-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_220555_842827_0B129310 
X-CRM114-Status: GOOD (  11.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Chip on the board is S905D3 not S905X3.

Fixes: 1d7c541b8a5b ("soc: amlogic: meson-gx-socinfo: Add S905X3 ID for VIM3L")

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 87ed558..e612dae 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -69,7 +69,7 @@ static const struct meson_gx_package_id {
 	{ "S922X", 0x29, 0x40, 0xf0 },
 	{ "A311D", 0x29, 0x10, 0xf0 },
 	{ "S905X3", 0x2b, 0x5, 0xf },
-	{ "S905X3", 0x2b, 0xb0, 0xf2 },
+	{ "S905D3", 0x2b, 0xb0, 0xf2 },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
 };
 
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
