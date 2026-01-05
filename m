Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AF4CD0401
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 20:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BaNA2K2s8jXlczHwMuQA+0VWopspFfUZvLlu8n4gns=; b=opM01oXAPiIMuO
	Fg4vp+QtbiCJsT9cL8rBRmXFIFeJ8f2PtvfILKb18y+Lq/QWurY9bcKCtG1ndR6r9yXghBI0FhxM3
	OAdJqNWtx3l1wsA54ICsaC3YByPCR9/Ub8jY2UyBV48mCU+NtTd1N0Oj16qftTUmim3AAsnVz9jru
	br6sth9ringdQuVFuG+kaBdJvwtJP1yzSj0Kgd3VVCey4RERUrj9+SWjTWYa/uPPxRLADN0TJPdRh
	Nh9AZq7zjviJ0TSWk97YyAtf9w61BJsdQzpTGAveBMLpyyJXGmhKwL9aUA2i0xy5fFH61piaRQks5
	3AA19B/pKjJ8sCfPwHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUN-0000000C4Vr-1ni6;
	Mon, 05 Jan 2026 20:47:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrUK-0000000C4Rm-3eEx
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 20:47:41 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so447864a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 12:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767646059; x=1768250859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=;
        b=kexDJhvpGvuIdjL5nPB41W1qD4PaIO4tu88OlY8wwHcJIHmnDF6qL/43yP6emE1XAy
         DT6zHWlbdeBku8ywCeRiPogoabaQ4KIjhFWMzcNo9ehkwW4EnLpoj3KeZPOP94uzgQnr
         UPjiMpXR9YVX/KpCd/7EGCEAvy8TFBzhQ8jIwt9Hyuo8UccVj2rba/bpSoqHhhK7QUAz
         NqOzOrzzoeveTtCNh+gKOadf/T8ovN8oS4rI4db/mC+ZSuipbXaVA/zYfCzDU+AATspE
         FjqLvUIq5QjgUNGis26y4uXG075nItGUsRyXXzmFXuaYs7CDbKzDOW3wpnUgwFRVEgdK
         VT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767646059; x=1768250859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=751CuOfDHWCSCZjhCuc+hswoKKu5SgRYZYXOY8EmB64=;
        b=qjq4KemkjDqXjcrCtefeKr34cSwGQo+0HCd4cz5Wc2Bose7aPp368oMURnZo5tCuLL
         IGzlu6xV6GR0ePOZod/BROJ6w1uUhcx6bRrH+s371oN0k57nJwX9z9AGOTZGd6D7jrjk
         Es+w42axN9u+qIGLXEUk9c6/V/m23vP8HheQQVo6oSEvS8Rz39jDWOf8u9jLFQV4tGyg
         geCzetSCOQfDhMdTFOg2TXwJqmTbQgk33K7Z4CX2QI7k587Dg7BRTWqmx5B/yrOytQH4
         cSEPdidUDQVtAGC0ASE6EInkQ9gzFJFmV6YNExbwsCljLJcRMVtaAN8spBhIil5GYs2Q
         qx3A==
X-Gm-Message-State: AOJu0YxkDtKZABJjr7PQcoiYvx4QMVMgHra9fFj9XccdB/4I3I8TPIDI
	Ul9mZk1W0406gZK6epceBNG9L2OxCX5K+iBe9EKJ6WiGQMw9M0C7JBVDfLctuA==
X-Gm-Gg: AY/fxX4mSqH0077tk0h+MqKgqEaKLb3Bk9bSe8P4i3TdCpUkTt9MCPYKo7eXIzWArtj
	/MgHSRaq6O+VrTrLPDBhlzMjpGQzBJlr1gSUAbY+4Q+dmzifmaY23H5IE5xXfuCrAgwJ3beOu4X
	YDPKUrGXxss7MtWzFTRr9iCGqgwyFuMQ14Nz4DjUVONaEddV3zi6YKmWXvQallteo4SQgus6rww
	O0UKWW0Ht5nFelvQSv4Xw2GTN+Vl5fX0yTcSA1K8MHuRBlXazbaexigtpT6dCn1MvsG/3yc7qAh
	xGv+PzgYNgJLP40/+ErKZZy2BYDKM6u7wspeJs1C2CWei8VjvrSj358eHj5LJT1+SguTwfigEy2
	M7wScDR0bNr6MZhKjRJjmJ4kCbFh8ZYPRX1GP2Golv7yALZ+yuwEHSX1sSkDLRUxQ5PteTh39Rw
	YZADcZsIXnQV1tZ16oa91pMslSoqt/UQjnBBmS4koK0WB/jkl4wNiOYF41E28+GUcD4b5nx/j6K
	rC3x436lFkHYa/Tor3ugk4MufphNIKSZzIlwv1/OA==
X-Google-Smtp-Source: AGHT+IHscVxlfHz208YtyaMmjqXOYh5awKkGUsfs0wVHVO6V3dthos7Mjn3E5Y2bxNVyJyfpmXuwsw==
X-Received: by 2002:a17:907:2d8c:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b8426bf1761mr111212866b.47.1767646058523;
        Mon, 05 Jan 2026 12:47:38 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a8ad-5500-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a8ad:5500:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a233ef3sm26240566b.1.2026.01.05.12.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:47:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jian.hu@amlogic.com,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/3] clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro
Date: Mon,  5 Jan 2026 21:47:10 +0100
Message-ID: <20260105204710.447779-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_124740_918839_D9D8BF38 
X-CRM114-Status: GOOD (  12.81  )
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

There's no need to calculate HHI_HDMI_PLL_CNTL + 8 when we have a
HHI_HDMI_PLL_CNTL3 macro that has the correct offset already. No
functional changes, this makes it easier to compare the driver with the
datasheets.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/gxbb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 0788b9b1ed21..0900f4e44764 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -358,7 +358,7 @@ static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 
 static struct clk_regmap gxl_hdmi_pll_od = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 21,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
@@ -376,7 +376,7 @@ static struct clk_regmap gxl_hdmi_pll_od = {
 
 static struct clk_regmap gxl_hdmi_pll_od2 = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 23,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
@@ -394,7 +394,7 @@ static struct clk_regmap gxl_hdmi_pll_od2 = {
 
 static struct clk_regmap gxl_hdmi_pll = {
 	.data = &(struct clk_regmap_div_data){
-		.offset = HHI_HDMI_PLL_CNTL + 8,
+		.offset = HHI_HDMI_PLL_CNTL3,
 		.shift = 19,
 		.width = 2,
 		.table = gxl_hdmi_pll_od_div_table,
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
