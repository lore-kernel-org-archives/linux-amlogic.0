Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A07D606A339
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m08eawZK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IEsGBBWo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxhPYmoGSQq9mTfyZWhv45x0jWX1GjFGbwGBjl1Td2g=; b=m08eawZKllmNeB1Z5uVT6ErdLu
	h0bPYvXNtuNfVg1B/dnayjRxu3b/BPVSDrexlLHUo6wztOufmrtyXXfpWiP/wO425UMW+ilJvJNLU
	iMrwUeVV7729U4H3DVWhXOZEwP0QxsPdhSGJxJi7n7J3VMyWBrMKWfO5XYv/seuy2+14zswVxGvgk
	Vem+TQVKKvEVVCV+Br8hfhfTUrcEJYwVScSJBYJ5LYyEs1+zU3dajUwB+B9tWJ4BwBLq5SsX8TM6u
	+FMcQIvKHeI3jiJVwpw24yUwLfTVVQ4zY3/7besc+LuWQtGBmonGuAsdicC3VKVZSvVPvZ6t73bQe
	UfiNQGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9k-0000000EuPV-2tmQ;
	Thu, 22 Oct 2026 20:12:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9d-0000000EuKR-1qvU
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e04773687so54942f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699967; x=1793304767; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=IEsGBBWobD2vl81B2XeJ59yUS5y5pS2Ww9n+QFOhYXy/zRdFTJy0tBWJkU3yRx3qz8
         FfJ6WmOF131MFbQ6A5cj5t9//G7ZmIML4l6iIl8UTRAtnPItunszc3EY+BEKJnC94mg4
         ooZaqFSJ3/DwangrAJxLGq0hUEDRKU26FSp3cjrq0xgeTd+NBXqUwSjtrsFe89x4476g
         nfID+vN6pRem/rxrWE3X08PmGYc4Y7zbRoIytW+Me+RgClfxkvHCrWxnuzxXHZThxQ84
         Ah1wG4ifznxmZhAAQvtQT8BpU1Zm/Kaz4pDHnGSLk6lsLXeSu5kxaRkh0DY9HmDkQ4AT
         Dfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699967; x=1793304767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=qB7Kl55EQeY/yxLa+BUVY/VJlapojOdlsD4jlDlOrLVh7nvSB7QxLGqMLbkOGdIV1M
         mVAtt8DeJW442JlpTq+ZHrCfw/xtPAWQXgSjR5oTpRZ0aArn1XQ+4T49M1g3J8uyNiy7
         IHb5SfCtzLOGtOEh76BJcWCJZyJ/rI2f3jIaXFu0znZa8VhhtcLTYOoV+Dz8Aib4ay4y
         3A+DQtVDBNVafjAF7G+64YPiI/4uVTnyMtXahNxQB3dcBylalpV+Mohrh3Mubi4ITOWR
         xbypk8Wg7Ga1dbLJ+d339558cAbavT3weUm6yXsEzYX3qwiJywN1PY5E/nH/ygcrupv6
         crxQ==
X-Gm-Message-State: AFq9FYJ8/kP+fb810b40YUcKsjxgAvkNX1bbDUYBRB0tzmQsW15C4e/A
	Ycm7LNC9ar99pN90VcbeY+t4MyJKB4CHKjvweaK3AXpOuZBYkOfHCTG/99ax1qvDbHM=
X-Gm-Gg: AYBFou1OhBHHJW/UJLVtgVHaxINmbjLjR6+9qoMXyxJBlGEf1xdkf9RRqO429HdL6xA
	W+zooCeccEdleLD7s9ILS5FpCd9Yq8GXpvBcW5kM0brnidFe5AOJ0Dq/hQ4rtmGqew5MoGG4cnp
	lccINfJyG6YqBABv0aYZlqX1YK85um8oNl5TUYk/fX9wXAzxcZZyBYkrJ92WlueDzQwOr+qIk2p
	F6opA/l0FTXgCSI7vPVBD6PKiWr8FBe20sm4Y576GYvT3SGSJc7mjg8iTa3fYzNUI4akqHoELJK
	+tFtd8qW3Lp+EVIMu3WJzFUHBrtOtrAYzpmjZsz3ivgkkKLGLpwuglzJBW9CeoBpFlxcYz/Qkpv
	uEnUOD7MzVBPIo2Tlvvq25WZx4lbqEjJ5yxzm/oZ5DUorMHKs3dDeDOLS8bKNE3Ax7higBdMyhC
	VOeaJZji+N8oXi19F+9lRPg8e2KI/egMN0UM2H96HdLfMRKAjXRHiHBgDX/7xr3xFvOrWHi3xJx
	ex3KGmnb++im728ySx0w3R3n9RE3ntR+8f/VIGWj1Wfli5pXeUPygRl9M//oMbmnu9ZT2Ek/8X4
	ZRW0YQpkQNIIkUA0apvlckZDs9KkjDmcIkMCg+c7F/ywU+YQisnItid8GZJMq7c=
X-Received: by 2002:a05:6000:230e:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e2649fb43mr12340934f8f.40.1792699967520;
        Thu, 22 Oct 2026 13:12:47 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:32 +0200
Subject: [PATCH 1/3] clk: meson: gxbb: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-1-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_131249_618489_60B4FD48 
X-CRM114-Status: UNSURE (   9.73  )
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

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905X datasheet revision 0.2, page 70.

Fixes: a8080f247bcd ("clk: meson-gxbb: Add video clocks")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..b483164955b9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2370,7 +2370,7 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
