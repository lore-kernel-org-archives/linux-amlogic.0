Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F91C4360D
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8F120C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YfErBGYJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CcvR8pSU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8F120C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUR88vlFj9fPErZfdLwdTqEdH+3gbXD6lpemd5ooHBk=; b=YfErBGYJEnjU7V
	tSTQQKMdeqlwL2d9k7585emXXZ6k391+HVsZdK3Vig/m7j9Ks6zQFEza0wujnHru0QH7Bmbf+JFBa
	K5onlSK2ReIl1iYd2YfyPxLZjaW6lsuDzZy+KpgfPl0BWF3sUrM63UGHbTQdk6BL0CYwt2j8wlb7t
	DZXEhWM0yxT1UVHdA3bQSkdxCPKYeXpz4sIYcbTi7BOt5NVuxcfXQPXpnej2NLkCxOte8D9s+a5jU
	LysQ31jo+fWpMvrls1LaOM8xWqNhUAQvhJTRe//TKnAtAXXiyeX3QP/ru7ASpHpkBp263HQ5FY1fb
	O4AkTmOoIsBdkQBIaH2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBhAd-0002iz-PB; Sat, 21 Sep 2019 15:19:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh9w-00026D-Pe; Sat, 21 Sep 2019 15:18:55 +0000
Received: by mail-wm1-x341.google.com with SMTP id x2so5390949wmj.2;
 Sat, 21 Sep 2019 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sYgvwAlg3z2NoNGVW6A6jmGOMPpzZ3tKhXpaeUm/O6Q=;
 b=CcvR8pSUPE/CqoIlscC6HHjjbhJBRA6cR9rHqe2tXclN/aDu6ORrc9GbOHt2shnNDw
 X8o92SZ279Ko7roD9VfxYfLnfiCRmnOclYH1rCYuz74nLUNWoJoLp05p1mNvOxcPzDus
 nUThR2EC83Mg0L2YYSGgRhE9T9JUP9ck2uOXjklXYVCi7I3WbJ+gr7bFDkYk5DZ9Am6M
 tHm/tBRkGjF5twCXQrVrrROqe0gSvW7V5JGfUnBQZGe8qW4DIID7y6NoLFBifg3U8wHh
 GjW5SsOvTiB4h7M4mds6WpQcuhvm1Yro3evPpjFzRh+/rY2Ja3XXIW19MiBtB46s2PIv
 UJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sYgvwAlg3z2NoNGVW6A6jmGOMPpzZ3tKhXpaeUm/O6Q=;
 b=UqnMLfWMGgPR/SzuYfZ0oGyhwAe0qrLZU/Cgapjod6E3n4btdvGRz4IQfzrMYxPdyv
 t8nB9f/jNzW9frVhmS/vgchP/Kf6121hgl5jVYxVPwofsL/5wz0vRGBomyZO818qrkTO
 9slM0ivofnXym4I9Y1/cgpgh8xQL/JvkVq9jDc+I7JnTDT2Jc86NWpr3DG1aVvR/YNdY
 9VAEQdDlajWXm8jn4wDvKqNgTrVRg+u5ZiGWGYuAPSn1nG4trkuGkKXTqiTwJ9CANGky
 0BaB+r6HoYQSJTW31sNsA9mGCXjot4MOpHBwL2wR/+wf8Z27RWP6qWE9SbUbQeGag5YX
 DKMA==
X-Gm-Message-State: APjAAAUZ8QiP+p/f1RA+tGESzMeewwcGvoI+rZ38ojk0G7w8d3IdTXKr
 d/+nIadbTkrmt2H5K4jViC0=
X-Google-Smtp-Source: APXvYqy+KMsgdqfL9HstYrcK547RRLoZc2AyZT4uPxQ821/58EolgipnHxjUr/qst/LC5Kh4PrlJzg==
X-Received: by 2002:a7b:cb4e:: with SMTP id v14mr7303964wmj.159.1569079131119; 
 Sat, 21 Sep 2019 08:18:51 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id c6sm6003120wrb.60.2019.09.21.08.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:18:50 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 3/6] clk: meson: meson8b: use of_clk_hw_register to register
 the clocks
Date: Sat, 21 Sep 2019 17:18:32 +0200
Message-Id: <20190921151835.770263-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081852_847275_809F7B18 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Switch from clk_hw_register to of_clk_hw_register so we can use
clk_parent_data.fw_name. This will be used to get the "xtal", "ddr_pll"
and possibly others from the .dtb.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 15ec14fde2a0..fefb4b7185d0 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3696,7 +3696,7 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		if (!clk_hw_onecell_data->hws[i])
 			continue;
 
-		ret = clk_hw_register(NULL, clk_hw_onecell_data->hws[i]);
+		ret = of_clk_hw_register(np, clk_hw_onecell_data->hws[i]);
 		if (ret)
 			return;
 	}
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
