Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117DCC43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:03:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A9520673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ml5p291j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sVjb13m/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A9520673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fw8TTa2Agc/y4tz+ncp1vAW085lTZRV2pIvmshsGX9Q=; b=Ml5p291jTkrAsa
	Qoqahdb0dfQFwkWYGov9DhhZnAwT+aA/buH0meYmokzSZk45sST3uVuPVBhOTDjf0jsrwBmC+gSgt
	P95qaJIRb/FQbQUg1wpNG2C95ZPGSDfBHJB9iO8HMfBCt5al2dYL8saFwsST8vMA/fUs8j9LTREH8
	r+6ANWeGNnn+vxQIJEMfHdnl4Ur9wgXR9Rc71hjvOHhSmAakLOOXdjbhxEI3hLH0qBY8vXLj3DB23
	RAGhCWseYRSl2WAJErJg4I7MHEqH+P7tBSaqfk4L4he9TrUagkp6nvyqh52l8vwoGblafkb1j5O2x
	LYVzr4Zotd1uTRMc77Tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdyaW-0004hZ-W1; Thu, 20 Jun 2019 15:02:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyY6-0003DL-3N
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:27 +0000
Received: by mail-wm1-x341.google.com with SMTP id g135so3389348wme.4
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTgzDGLM/ROVQf5F0ngjAOq0Ibk1O1YBIUhnq8jWYwo=;
 b=sVjb13m/4Abjxcelx9dk0B2n0Gz48wNUKtEvFQSB6xjURfrJ8rVJunYzemrjIso0+O
 w1nuS/IZOyrwLZjCU/rKMeGAmxQNp35eHQcKJ4WmO8fHr0xXb4hkFZxWbWAa0yyS02Sj
 LubycPz4gZcpi6SRA+gvfvmvLemvvjHI/OQK9g8H5FLFwO6XfIDRKtml019xxHEv1iDK
 4YDCXsWc+bscbSaOySuV/XfMZobok6vF5h9JuKY43v9AC+RymMy+mStnpkUqOMalExwk
 Hcuz1qHDK8vh8koQP3omgI0YxWklCijA3BABZFVBnjpZjLUVwxnN1nHEzuzL42GfNpuQ
 +PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTgzDGLM/ROVQf5F0ngjAOq0Ibk1O1YBIUhnq8jWYwo=;
 b=bpCvnXXgC+9hDnC2XlTfRC9ibii4xYJPJV1UCM4bBopzGYFBfQwL2Ve39UdiPP41Qz
 pRf+eLFgMgr/Ru7NohlKs7tW6qeyt0YKNNdwGT/YbgkO9frYVQWY7k8ARQwbt9cVSjBt
 QUleMk4Cp2sWr6TeuhIq44WAia9sRckJLj2sL/nCtuDvmh77yy0rBeJ1rBkGCvFF7N/c
 Kdm1T8L1VatQpXITmpf46UNuFjEn0AmDWciYCpo75dxL9i1qAfMHm9kYzbEeS3nYL2nr
 TAs4d0pYDGUWb91UlOV1wEVqD3kU5scYmoOy0P5YGOuROWB5IubUdVh/APzI/N5x26mw
 pD1A==
X-Gm-Message-State: APjAAAV0xgbmABl1nIQckHUoZ5MuClQZFQ8XJP3NohKjbWCWio5MIfd2
 cZk9pmMdB2jm/hlFukqCLyOKIQ==
X-Google-Smtp-Source: APXvYqzMhLhcvV17323ZfwIYU4iAPa4KaU3gRalLKZq0KpBFZBYD+bml5U5CtROED7DHXD+AIE9uOg==
X-Received: by 2002:a1c:a952:: with SMTP id s79mr85112wme.28.1561042824707;
 Thu, 20 Jun 2019 08:00:24 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 04/14] clk: meson: eeclk: add setup callback
Date: Thu, 20 Jun 2019 17:00:03 +0200
Message-Id: <20190620150013.13462-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080026_165240_DB9F9575 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a setup() callback in the eeclk structure, to call an optional
call() function at end of eeclk probe to setup clocks.

It's used for the G12A clock controller to setup the CPU clock notifiers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/meson-eeclk.c | 6 ++++++
 drivers/clk/meson/meson-eeclk.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 6ba2094be257..81fd2abcd173 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (data->setup) {
+		ret = data->setup(pdev);
+		if (ret)
+			return ret;
+	}
+
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					   data->hw_onecell_data);
 }
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 9ab5d6fa7ccb..c22b57781e3e 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -20,6 +20,7 @@ struct meson_eeclkc_data {
 	const struct reg_sequence	*init_regs;
 	unsigned int			init_count;
 	struct clk_hw_onecell_data	*hw_onecell_data;
+	int				(*setup)(struct platform_device *pdev); 
 };
 
 int meson_eeclkc_probe(struct platform_device *pdev);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
