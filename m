Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3F606A329
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YclxVKrJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cPOpoIF+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vwJiJY3roii16VrneE1FHb4Tb/tIsBH1IW9OUx2ON7c=; b=YclxVKrJ+gz3GU2Eksl5a/hzoC
	vZ4VilSZcw0fEkEdIdfdE6eKCRW/yNkHN4mqwCx3YMBd1UdEwfC5R9R3ww2lOJGMHo2jdkAtwpqxj
	i4rhWiqNU9KUt1Z7cElRC1hsPp5FPnX3jDLIbICpLuj3qWwSugaRdas1rANmEs2RWOkF/j8aIjdYq
	b1t7dudn25FArUvprQwvqa96L2N3NyEkIv0VGZpoOCKUbufH8l+q3b9vWjXQyZPC0ZMoujOoyl4gb
	Zexu1bjg7WFLfprKopJoaTMd/A/eHLuLmX6Lu/XzJ9NpdQVV6KEA8BCp+CtzF4y4hm6sPmzyjn8SS
	blol1eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKm6-00000002bJy-2ICN;
	Mon, 26 Oct 2026 13:30:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlw-00000002bFb-1C2Q
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 13:29:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso23760145e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021394; x=1793626194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=cPOpoIF+RrqjFPTvcJKE5jAit3ZnZgbOyrft0Buh8bI55/f7NtEdMuc+1bVfv+nviS
         1ED39CAFqt+oc5NKKn4lznQqHYPn2wHEY0zbMJJkq5OP7ECF9ML2siDJl95B1g514e6E
         ld0Ut5jUGI7RlCDTnW18/1ixsTznKsvk26/biDQqKalq+lV8rJ3oe/JT3X6Sf1WdWlFa
         VBhdYbse6vhshjvrkU/Z+5BO71JFuluns3W46wY9kn4FuYEjOx9U/Ogw5sZ0iIeGB7Wt
         c5SLcFK8sMIGL3UxOYtAntrDbPQ6gBpHLiZdCzmUXz3E2vR4is91paX/y+9wn4uo7389
         oFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021394; x=1793626194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=INpoWuy7vXnXGF/DeiwfUWrxMcbjR/2GxPAeGRKc9mkuRmMkoUyr/Ag7sriAhE2y2+
         ZopcL5Mr4OKvE6BlJiwK0zsHX1Doq6Y8oQ0gTLD9Mz1ay9GkpslfLnCj6UDlg2+kzVbX
         wPXehbkad65IQbZ+5+5/bBLyde4ZmOU+Yph1/pHXjYAqepRKtspI72FKjOYHymPMJArl
         6R6VL0C72k+dQBQrs2qwfSXyvJEikXA/AQUKZ77gcO3nl8/5TClSHy/0TGwTpVC8LW8X
         7scADxDXXKU3Uj61Oxwz0oLrr9S2MECtB6eJWfTd08qAufCk6W4fyd9VK26OJ6yoPp9n
         Jy9Q==
X-Gm-Message-State: AFq9FYIsIF1TDdaZoQ8OWN1MtKcRiRwSGu6zNhydrMwqjhjV0BYETOCY
	ClXCUjRX7462LUou0oVJsuxhznUzR2T3k2wpVC3sh28CXinA9XNbO5ywtB3xhqwJw/M=
X-Gm-Gg: AYBFou1qUlt99HLi5DJEjtIEp0DTwd8f8gdSoK53wUf0kR+8WK1EULZCbjFDnwfn26s
	DwpIcRciZARdQL2UktOtIU89Os1JK56birjgs3bG4RSnMC/eD6m+s4K7X2yCOak+V+5VXW0qUxR
	viCW8pGw0mopPUIP5Gur826HR7ij8ad6pqHtid1FOfRmVOtImWvzp/u8ahQAcQNAD23PQ5xHLvd
	6mMai9qnDcmw5eiu9ByGxrHOVDWkuLc+mSMCbJdaDbEYA0TUxTmXk3vzGvikSf1jfOiZA1+9Kt/
	O1Qj/DCLtxdpMZ2QpIQk36WZReeERiijl7pMdp+DMQgxclAexbDPoAlXGex5LpeOLe6cs+GHoVh
	wrWE/q9CI2sdpBFnSD9+H9YJ3TQ7UF35JVAx+nT45iAj0BFMtjZ4AsOC6CAqc3xh2ec7jqp8owz
	WC/POmJhkrjCXsXcLTTHuUWGXBqQVk8u5pyNMWXM9yS0KdMJYP1jx9zp3fl0+u36pr4f6TlRHKd
	YP6hDHhvoUkGfelZF6nL+TFhyGnydxwI9xgECf/025C5g2tl4osvnMzo4BhGSG4J7mlFg4Qyn+E
	eS/dJNmZSFZwIz4gYkQx0+7pEQiI2v3ga9R/bnE7CjNd5xPeI/aUMzn4omv+I66cvZPA97E6
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr121212915e9.7.1793021394320;
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:44 +0100
Subject: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_062956_338658_6082E55A 
X-CRM114-Status: GOOD (  12.16  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
only value 2 is listed in the tables. Reading value 3 therefore gives
an unknown divisor and an incorrect clock rate.

Add value 3 to both tables. This also avoids a division by zero when
the read-only rate-rounding helper uses the value read from hardware.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 drivers/clk/meson/gxbb.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..b23b9514fa91 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 
 /*
  * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
