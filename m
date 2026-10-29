Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA61606A329
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=exLH3LyY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aSront95
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kYPpZmwVk3uzXMdiZlkbk8K+c72CdOOmxADIGKzerUA=; b=exLH3LyY/D/FgOzHCigCh/FJ3y
	s3s8SCbkxDlxjAFdWgujdlIoefuYJXLCaWKXg4y7KYUDHGHjqz1lZPtYJ7Yk8d4jPwMGP1fQQRd2n
	hAQ9Jy7WBWGW4w+rJjH5FCNZooye/qa7MOwuqKyk4FuTBdq54cNat59E16cTUB94n6WIkPl/k8CA8
	OYM0PQWpJkgr/Lrtq51JukurfM2/8dfqRnvQcaoXFW9EC4/yEPtFk0jxoz3x/OKh+U+pqXWrLN/Sk
	zCZ3WqyGvXoSIC29gPfF+TemJnKyw/EZajuFQP9tj4tFIa4AcUqfSaJyOm6S+oLJh1DchTiqWKFW4
	tgZH7YuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0e-0000000A7lW-3saf;
	Thu, 29 Oct 2026 18:37:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0a-0000000A7jX-3dxP
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:55 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so12616385e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299070; x=1793903870; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=aSront95VFK6YF893jZjPM4tIrSInqBYZJLlaMyRTJ79/Mo8RPDivvfjjrcNTLoK6C
         R/pfqnqKM+y9rp97tAx+eDNXMX/ApgatVj9Z8AkA7E9dR6zZJdz7E5cvv9FELUut1ilb
         /2omkbKJ4/WuYmqAg3IMbRM5LB7PMoL6G+AL5N4KyIomPnoH0YdNdSQZVOzeQdDED42K
         l6q9zUHFbc54QPxtDoemAGHMcPhLonxmKwlGkJBX3qjd5FU5gkGZKWnt9nGkcgqqOCrI
         sYlBRy7eIMrYS3sbB1NCtc64p6mGIU/F3Q4E+eWPTOnJywuIP9gL9UYTdqiyEvURijkk
         ZkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299070; x=1793903870;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nVY7nEkvfjZeMrMmcTQRnsGrPkGC9OILvfF4knw9Fgs=;
        b=s8TnrWvoirqfV8ctlsSPr/bz60xT3qwYy4Yi9N79Kyno66I8o91v/XzxpL2m7QRTi9
         d3l9qC62PfU8GwhSAiyBhMcdGDm95HzMHgYSz9NeHwmGGrnsX0exTvXUYPfVAMJUOkhG
         kGHwmWIEJ/JXG9DIzRBH2I5q08nVtkP2KRsKSt0/ybY0wVcdWgAImpniMy4q/yAVtK0U
         NZdc6FRzwrU+Bm0Q1syUJ1zdZ9MjDhCmiM5BP+9Z6W7g0o7L+HGP0nUPThTH0JvmbiWn
         ueMSlp/pevWmgQhv5XeyafTJ6RPlo2GcCEhF6bLpuVLG8gOjue8MWxch8wUz+U0SyELW
         ZA+Q==
X-Gm-Message-State: AFq9FYKQNEs4/Y1MVjlCuFLZ3HRcwBARELdlVm07ZvwLcw6C+UgN8nmP
	wdpG7qgNPjdODxUQ6r+878NqmIyqtDUaZbFNma/GdqfqObqgZW5oj1BOCVagHKCSjiw=
X-Gm-Gg: AYBFou3uF6540VheNZIZjfTS4HmWSw/e5W3wgL7iKvNP2Ho9O8qElpsniQc3lmnreac
	vhtLCf2c7buAk4aPgi4/hilhubxLfydJNebX0egiSC32JNDfevVxthYYe1WyOnar8oaDaW5IZni
	dhYZPrOoOADXI1TFfdAEiPh7Jjmljga1mrBBaReLwUZURtfkSLJxd3hxPwGSyOVq/UUKvG07CuY
	3mhsxZWrbfrALWlCBXXpsEJGJoDFI/jLZnlpxOfptbfMQaCyRdPF+iBNSLnsKdNTG23ykBnOC22
	3fDmH4TyAu6fts1B05x68C06nQigTwRuzmNYq1UefsgR9bGwaRAYV1kAJqMyqsqFsba2KhSW1Um
	GnlJ48hVPcYRA16lCiJMVYLnqkowkeTxm45VPwtVJ+OBoHOEv9v+MH06gyFktgV4iViUu61qwss
	yAF+qnr8ogASPwijgit9hGzAWFxzJkYYtYP2SntbpCx+kD+weURU2ZmGLY4wDkZ0UoMXLvzy7ms
	+PRbIXicw/ohZOd83kXGQZ06MgYm2gsgMEKIagi+ORI4vTCqUPHOYpkWay2rrbMjLQg5mOQfU4L
	mnEXm5/IZ+o8OYOrZmsXCkyfK46opHW9bKSv+2VqUpPoQUUTYJMcSS7GHjrzRmXzI/Vta5Wukjl
	5IWF6Ccg7lnsUPFEbxA==
X-Received: by 2002:a05:600c:840e:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4a965dd3274mr155468995e9.11.1793299070403;
        Thu, 29 Oct 2026 11:37:50 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:49 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A and
 S4
Date: Thu, 29 Oct 2026 19:37:33 +0100
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6CMBQAr0K69pm2GCGuvIdh0ZZXecqn6StEQ
 ri7gBdwOclkZhGMkZDFLVtExImYhn4DfcqEa0z/RKB6Y6GlviqpNYyBU0TTgWvfgL0LwNgCN+Q
 T+BoL43JbOizEVggRPX2O+qP6MY/2hS7tyd1oiNMQ52M/qd377zQpkOCVVaikyevycrdmbslGP
 LuhE9W6rl9nsblj2wAAAA==
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113752_924361_8A0A86FD 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GXBB, G12A and S4 clock drivers place the ENCP clock select at
VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Reword the S4 commit message and the cover letter: S4 has no ENCT
  encoder (Chuan, Jerome)
- Add Chuan's Reviewed-by to the S4 patch
- Link to v1: https://patch.msgid.link/20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com

---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
