Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AF6C04EB9
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 15:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B767220834
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Dec 2018 15:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9+tTAdG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LcEikyD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B767220834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T5dE4CrWjnr7RWpH9eSyFFk3E9ccyndZLjfRmyMdV+U=; b=S9+tTAdGhIyqg2
	SEhKGen5V4nqb6A7QPhiDxJLP16gGEL2lzaAI/pf6lOpAlAsr8cL/LMxZZ2mwVr9Q0+NlhNiMnEN7
	Q9gd6vyU0xF6U3aHUa/zn/R6282oxPiU/5ESQy0bvherdJIJEBddngyNJ7bSmQ493Lr8ChmBpc1OF
	IeIRnPvHkxu81SckaAt5iOKpgtkiz60ONegDXr5dzMTFS/vxGgQoT1O2i4B0I4Mui/AS0Uv+YKyxJ
	X04d85cvULtjQOtYaFxfacGmV2eZ6frkFFG9bXYkfehvwgpT9ps/uU2hHcAIX+/Hd4LTVemrSA8+I
	EEKUTc0P1kJr132JasSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gT721-0002ie-Nf; Sat, 01 Dec 2018 15:18:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gT71y-0002hd-VV
 for linux-amlogic@lists.infradead.org; Sat, 01 Dec 2018 15:18:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id v6so7950972wrr.12
 for <linux-amlogic@lists.infradead.org>; Sat, 01 Dec 2018 07:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g+uc0CQJwcttduqsonucjxD/sSZykRQ6+JEeGQ7Ro2M=;
 b=LcEikyD7iUx/vTbTyJ0cBln7RZQtesi+WRvDUMNmIoKwK9VfRbmjCWp6ZGEJDY/2iB
 qN/kDTHaGlPS7uN56YC8dfC3crP5wUMS+YLSMJI8Wa15ZKte9XcPOLXxUxvkfp7ZRCFT
 cn8BpXfUyPxkEUZsdf4pSjK7JB3iD4VDFWkhhh66kB6Ev1iDRJTaLsEPSxDylQA1vQTN
 4UEm2t8dSfH54jknGyuCp2u0PA5dZyaDPtpTX4Zg+qwfe8+gTWEhmmIb4ArjqG8amb7T
 3yVOGAj9ElO/+qOQ3qqO0LX0+cfzKlzmxd3QluAOiMYQEox4gJ4BZVAcmnW+AOSvFgoq
 GfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g+uc0CQJwcttduqsonucjxD/sSZykRQ6+JEeGQ7Ro2M=;
 b=EmVvk6fh5TiwJdFgGcsXanhnST7YZtt+l+Q57pGRCIjKhRtW4JJKeTWADnphS6I3YW
 x45jq6Nxko4PeasUULQClPJew3m0WyhOkW7G2n5oabbcO/5YFW7wtp1Z3KCbpnOQZXgm
 YB5lP3bMI+czubv+1Hid2VxNjDn9rW8bSS3SZBMbP3qOOK4Ujbklsm7hUF+Jt5vFojjr
 ck7OKJ/f2z4mrQag8H4iONN2rA4YF6UE//GljDHJn1EbjhzkbqzhjUpzUHMZuFuhi5PF
 VlruI2cUHCFgi/Xczpip4kp1vUg4+72HpxJRsx44ZN6Xm2ENz/UFJXmnUxV/tVEqu0Xb
 VGoQ==
X-Gm-Message-State: AA+aEWb3+6JDGdhztTU883Ce48zGSTqHOCtp9NSchUjSos7VW8/40d96
 OhZSDk7PHhPfzd6m0w6xkkgkYZBqfTQA2tW/
X-Google-Smtp-Source: AFSGD/VhTmlHV4gqJ1FLY4LR/Y7yODovB+xdiLX4KUzAz342eFm8IanP+104spVi7aygC+eCg6cCJg==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr8641729wru.45.1543677474224;
 Sat, 01 Dec 2018 07:17:54 -0800 (PST)
Received: from localhost.localdomain ([104.207.76.73])
 by smtp.gmail.com with ESMTPSA id m4sm5712663wmi.3.2018.12.01.07.17.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Dec 2018 07:17:53 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com
Subject: [PATCH] MAINTAINERS: Remove myself from the list
Date: Sat,  1 Dec 2018 15:17:49 +0000
Message-Id: <20181201151749.10932-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181201_071807_010052_F54322DC 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Kevin is basically doing all the work. Remove my name as co-maintainer.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01645edc2388..63a2ad093524 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1297,7 +1297,6 @@ F:	include/dt-bindings/clock/gxbb*
 F:	Documentation/devicetree/bindings/clock/amlogic*
 
 ARM/Amlogic Meson SoC support
-M:	Carlo Caione <carlo@caione.org>
 M:	Kevin Hilman <khilman@baylibre.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-amlogic@lists.infradead.org
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
