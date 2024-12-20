Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7AEE7718C
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Dec 2024 17:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ/wCYVyObmBTxZl2oEwGCm1Lxc3jbT+norzCcq04g0=; b=zKylYzwJrxAH1a
	hpCA768VPtuXL6rehm6Ts8qcNqfrhjuN8wCBgZA+fXU2M5hdhbPkIFDVbrME04ayeVOkzaqqDM4EZ
	tzDk4H9cxI0w41RmTP3ntr6x8kblQmLXEA41x29lmLpOAYWSuFn1m8jP9w3rFZGSAxkSiVa7074Ej
	yCLZkLjdafv059wdIw0mDk4wIVtnZrdZROkVYzhsFvWY9g3DngVKiepgLI04JlqRb+hJcYs8ZmARk
	jarxl+pRUW42YBxZO3Ab3EybePzDEekY7Ix9gXqs1rlbwQKqlenPDEyB/NHA9ZwDwp/m+oZ9RSMPI
	IFasGkuyWHI9cwawfD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgvX-00000005f5d-2aLp;
	Fri, 20 Dec 2024 17:36:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgdN-00000005bVV-1oCX
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Dec 2024 17:17:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385e2880606so1699524f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Dec 2024 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715071; x=1735319871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBrk8IHiCPUAUjirIi3a2N/h2yY5LVz9whBiDVWucEc=;
        b=uddbNn6X7ukobMfj4rX2p7czF21+5x1FnI69b9G5KKIeVAUStaFOHe60ec6PEMIS4P
         slFoPKZqwbwPsSNj25nHaGVSB3sC6kLQPt2209b+6IZMeWPyJ6c2dvbRHxeRzfCZkESv
         P7ABNdcieivXYJjk4aBQUpIvqn87UAn79pDjeZRHAnRdVB/CPbNt3bXIsUwTC3kjE4fO
         HGV4c8NXPx4kxkwbhCB3PzE+8IgjVuux/3RWu/o82uXAbpbmlci8+bAXoBygWC/z2GVf
         +SJbceDWZflof7HOCKRZJJ1DmjiAmXxa21Wxa6kilpDYYamdE2Z4WJd5dfkbxpTd4TUV
         zO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715071; x=1735319871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBrk8IHiCPUAUjirIi3a2N/h2yY5LVz9whBiDVWucEc=;
        b=Gfsas1KCXAxxKaxRjRE4hjKBR4LuG9g6eDqw7hen9grQO3i8ow1boHgvZV0evea1I/
         VNCj8P71iaN9eXLFUIl08q7hcBeZWPvD5VgmxwJ/LXONu3CQyBrjGLJm72mvbvSgQdxq
         0XLbWxyTBZDeRj0D0SEkUkz43LZn6ACvJiafHYJujkbaCb1ZMK23af8HvieR+OEhp0+K
         qFNB7XhEQPvF7xxC5iWaxpf8y77VGjZkvpTQCpMkXdrz19veIx6LpWuLbaedT+/FODy6
         Cc+JNG+11C8Ydov9jpiFNReXcktH3oyR9tS/qb2q+/3uVzqVBsI+e4qZiCMH43fYEGcJ
         xysg==
X-Forwarded-Encrypted: i=1; AJvYcCVjTlc8l8BwIboCweeldwpvqeqBnRup88u6xpIWlQMe2OaNQZvCbUx3lLR9YC1SgGhHA9MJu5xaIChh4Uqg@lists.infradead.org
X-Gm-Message-State: AOJu0YzXkinQoctUpQjdLKiI1zCDYHS1uAL6+xmMNd+c5o5Yu3ENAPRF
	mpOlvmzbibpfFQacSqB0ql8RaYYXgVwjZqsUVX+XzyIFrmoAU9Lfy+qZ58G929c=
X-Gm-Gg: ASbGncsqAyuoEmWXgdLR8ssEv1w1QcuN3KwXEm/i2RiUFmVg4jXzC8K7tttNSso6Aea
	tVwH3JJoy0lBfLYZ6DgGqZknPSljxC2+q3QLRaUJ32/zbX+jbvId1apNYCoIgeL2dHpUNv5wgSs
	xxCjCnOO9AmX1i5itVuL8Tg11jHaJ2K4w30ovbgvk/MfVDR9wVXpaaWKrdvk/61m8eCEwQpfSY2
	uuby/eFo8S/O9xQBWLAT6YRjwPtixhjpbzLsovk34DPNIyT0ZR8AgLEIFzXFOSAZ6zu9wE=
X-Google-Smtp-Source: AGHT+IGYjIQWS975xDwK6uARayIsF+UuvzRGZ0ACwFZ7y0KZUKYksnNLhFqF0wvPuasDTYVMf4jEjw==
X-Received: by 2002:a05:6000:78d:b0:386:31a9:31ea with SMTP id ffacd0b85a97d-38a221faa71mr4933719f8f.33.1734715071561;
        Fri, 20 Dec 2024 09:17:51 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Dec 2024 18:17:42 +0100
Subject: [PATCH 1/3] clk: add a clk_hw helper to get the associate device
 structure
MIME-Version: 1.0
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-1-96dd657cbfbd@baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
In-Reply-To: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=lzI6hgL1Uto5BUE1A5yvsC6KtlJXJ2Z6oRUTIPtisw4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa7wUNcjmvWe7ugM4KUNzU9JqGgsDgAGcF28
 Ubg1wb0XhqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmuwAKCRDm/A8cN/La
 hUvpD/41vPeL2vy9n9wB3yHNzP/lOE6YCfj6USZRqALCjhWtxSbswP8WZCyBuUIXKdG07CRxR5d
 paOxLsunCkYbhW7KSaCfpJMygtwE3DEfub5JufG8ga7DUa+275WRN/c4LfncMx69NBFf0rORpyx
 chnAJpZVgJ7/5ZCQ5+wFuUqOwTAEucgYAHigQhuZRzVV87u7AV7pblaov709S8DBLYNAXlicu00
 ew+n+ztIFXtNeZDmTlOGvCiAAsBloAIP4+o0DkFqEBvjFANliLxfsqgj1lpOrFKX6CwpwsL92bs
 ogLSJtIpkqDS8NSrTDXzbeYQa9nFG3pOjlLuDVIdoaMC1Ep5o9mgIiIpZzkUYMXorv4wz26ESpW
 TihG0xXFARXKABPiOG7HhyWWNWjtMcmKwK+i6fcay3Zzi4eEWIrqPaI67wI1CMmVyeS4vQx8bww
 GtC0JI8SFLRXaky9FEprQ7cZOUXHmWFrEJLyYJCWPpgKCJ//TLvko5QSyINOxI7ksNqb4yuQF71
 NIjzjUjaYO5ocsfRAcvTUeGQ+zknlBoZelumy8x2vQkQM+eDsFA0GKN0lm54KZIqX9Hfb99yKnH
 j/9BM94Vx/txhYZ5A8FQ/xa7gSgNAXFIi50ORgPYBsM98oyGgvPj6O03/Y3WZy2UVeX4FvaAjye
 ek8VxEQIotKHbrg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091753_476380_1B1EFED9 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Add an helper function to get the 'struct device' associated with
an a 'clk_hw'. This can be used by clock drivers to access various
device related functionnalities such as devres, dev_ prints, etc ...

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9b45fa005030f56e1478b9742715ebcde898133f..7e734d2955978cafd77d911562a26f1646684ec2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -365,6 +365,12 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+struct device *clk_hw_get_dev(const struct clk_hw *hw)
+{
+	return hw->core->dev;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_dev);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..e5f111dce6ae26c1103f5ff60bebbdb2fa230060 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1360,6 +1360,7 @@ void clk_hw_unregister(struct clk_hw *hw);
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+struct device *clk_hw_get_dev(const struct clk_hw *hw);
 #ifdef CONFIG_COMMON_CLK
 struct clk_hw *__clk_get_hw(struct clk *clk);
 #else

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
