Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865DDC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:25:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DDBE206A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DUe1xJCN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hw80V/In"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DDBE206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tksqFwWoKxNXDggR8Ff4iMxOHxCyLnWSQ1HswlsuIMQ=; b=DUe1xJCNJ8FMrT
	JZEEXZQ0WMxfUwipAdmXKvsfDWMXXNdYA3h5/OThjtqXgqIr926jqsj2SeAaTSHIfPDURN/mduf1r
	wVrY8XGjVa6JUac8y4UKvvR7B+ASxeKPBCWrLRJzUntlHoqhBMP9Kd1tYIEGt6YtnelNqhHOaZsoO
	UR8ODF/gvOzWlQK/w+UT2k9ssQIygY1ec0ayqG2ANaPxqzbAvU2LYcwMYvs5uuVqtSlwOBlmLLdG1
	muTJkvXGeDHqSCpOhUFBrXqF9K3BXzuuJGs1ahPGDHS7qrXT32nkjiqZBJpZ10xx4mdWz2MZRW82x
	UqM4dGRi/aoZsSEveiEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsjvR-0006mE-QH; Wed, 31 Jul 2019 08:25:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsjuD-0004kd-UN
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 08:24:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id p74so59752533wme.4
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 01:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0irTfRWSZ70qNvhsiExUstYrNfb3pdmbXdiGXd5JhF8=;
 b=hw80V/InTiJxJH2AH3UWZZ4CUq7Pa/utyGT/q458WHSiUT2ppY7hAAw3/vbHpL2pzL
 K0BuME0L2K/rO30XimBliuprG32Q4+ZOf4s5RxXy0T+VJe5ykeJSwd2MS9ikYUYv9uAg
 YPnUxK1ctCQ5m0Q9iDqG/FMWHMg32KRn5i5hAwe3pg46DMGw+U1N/L0AJOlNEE+q1WBU
 muZlxc7aLEeWLAuGYeFCKYKWZQRK7cfze8F/Yaiu3vEDbdd4S/srnmdzYUV4oCfWLMib
 BIXuCS8AbzXqdNTb7jTfQk2XIiI3mNuPtp+cxw1FRgLlrqskcyfFM9JbohIGDBbKHj+i
 c9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0irTfRWSZ70qNvhsiExUstYrNfb3pdmbXdiGXd5JhF8=;
 b=l3kNJbWojNNbecAFTopVI3gTUWoWWP01R+Q9BW7Xwsk5sF32zgltbEIWQ3gh/BIyiS
 HH+AZF3s2xO7BvnG07ZPXTX/jM5EkqNBs+IW0EMgkv6LWADv9BXyh4m1pf9qPbwR5Enm
 6gIZ8cWd9l2WWbAXz4wCoEZo+p4Wh+KFIlOj/G59Q8jDzr76+DtJfiGkcDrIpA0/rhDP
 DvQxuCvqsK00oQC4n/AIqCZ32eP3H2Pl517HUcq3+rgePrUIqHloZQQd3URANWgh0y+c
 MdHuIOXjIj2jrQSE12K61GqJOP8LnnmOhSpP4TBIwdRsbDAhByLOtjAz+kcGYyBi3Dub
 sU1A==
X-Gm-Message-State: APjAAAVgZbGjdNYXGhQFoP3zLKMLrhskqesMl7B8UKFP1eIZxG8iqXS0
 zW01GprMGdx4d+DrkzGl+DVkK36N1bU=
X-Google-Smtp-Source: APXvYqxwqKJLeF0A9W2Qb4n3Ft9qKIilrEwYAsvkxn4OL2mk5QQMea6ic1fnLlRUSXtJ0oMq56TBkw==
X-Received: by 2002:a1c:f90f:: with SMTP id x15mr32073741wmh.69.1564561456060; 
 Wed, 31 Jul 2019 01:24:16 -0700 (PDT)
Received: from localhost.localdomain ([185.49.42.196])
 by smtp.gmail.com with ESMTPSA id o3sm54597664wrs.59.2019.07.31.01.24.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:24:15 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] firmware: meson_sm: Mark chip struct as static const
Date: Wed, 31 Jul 2019 09:23:36 +0100
Message-Id: <20190731082339.20163-2-ccaione@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731082339.20163-1-ccaione@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_012418_179289_C4FE1CE4 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

No need to be a global struct.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/firmware/meson/meson_sm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 8d908a8e0d20..772ca6726e7b 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -35,7 +35,7 @@ struct meson_sm_chip {
 	struct meson_sm_cmd cmd[];
 };
 
-struct meson_sm_chip gxbb_chip = {
+static const struct meson_sm_chip gxbb_chip = {
 	.shmem_size		= SZ_4K,
 	.cmd_shmem_in_base	= 0x82000020,
 	.cmd_shmem_out_base	= 0x82000021,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
