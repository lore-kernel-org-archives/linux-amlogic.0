Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3400C46478
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0302146E
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 09:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZozhCUf3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="X3BPQb1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB0302146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiZ1QLFS/FEupaTnm1g6T13dHP0SCCMB1tjNRtqbeFI=; b=ZozhCUf3crF2D6
	OD95s+0rNKIVPT9Y72Yw6hn/0GSTQD53VfhDc7xrTF96ZJFenGy6Hnlv7QXTBNklhIbFlnhi6WRPZ
	8mht3sKOK8im1UvKPVZt98Ieshemq2wYCcw9y4Wdt60ipwSRdKmnsCqskJjccN1zDZPG/E9KZPd08
	X4Vgh61VxWDat/6AwN4h9K3PnF/7l2qu89rS7QekIa8gsRjWyHFKdW2HuD7FKG1mcpCpaSZKB2LGb
	a7PQUL20q7hP0hjx3pKkZ14F8T/YeHwO/a7ubl6qCfNOmlHyQGQWaMIL/ApNyuaGbzzWuUR70RlMS
	N/wShWkC7Bk3un5c4o8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhsP1-0005gF-CF; Mon, 01 Jul 2019 09:15:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhsNA-0003Fl-CG
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 09:13:18 +0000
Received: by mail-wm1-x343.google.com with SMTP id g135so15014120wme.4
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
 b=X3BPQb1oIV2x3Nt6jna67Clm8NfVyqvfwFA5grXCGNefyz+/yhFp29J7UxF350H1uB
 2A/KSsEjBPVrHmtNTaeVwZfi+LVJYzfdusQbg1SMyERh2CMHUewA7njbMAKXXbEWXqnw
 YIaqY4q70csEqv/5ucwnlOpRGHKzNggjQFQX+Ji4MMkG4ldiTmX1OrmmWnIQBZh5z6uT
 B+9B133Dk9rtO6vSMAUSlpAOf/XFsJ3J6I1Y4ikwsbti/NHvU/FmVHpxXmSEQATSrXd7
 9SiMeOTc34vpOtnfAoYiIJUANQXu3JyxsRXxVI3DG0fs4fqdic/CDqMSb3RxGpbKj8EQ
 gElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
 b=mwaysXZPRlMqbV9B1rZCbmt3sHtuAerz/8/WHrH307ued2CmuwphegCzOe2ovHSfAF
 06mkqY4GSr8KC2kBfseKeD4BPjJJSphftzAy3YrSKe9vIh2y/JuwYGBIRJoblxU/wCoc
 53dclf96ct3yDJOHqsNzjByB2KdlS9imsGttm/zosHivnW3MrEeFT6JlMtN3gJBfW9tS
 pSUqDv/AJJSQZDr0Yz8ya6SwcgI9QaDLS+HHQK0bxYn+PPF+1DnHUYDFvkR4xowVbNPS
 e1fhkrQ6Fkkz2x7t3CdKmFDic56XMj583jojMUP+UeFUcbW4mJTME6cn9phd3ZhauKdG
 /Fpg==
X-Gm-Message-State: APjAAAW5WXxsT0t2FCShS6uMq5VZA6mpwxGKkMFOgtxExuZX1pjAAfiA
 qnpWmddcb6J5eivvugLT5Zm2EQ==
X-Google-Smtp-Source: APXvYqxo5Z8WiwiSIqfSVLsBg4/Fz465U9hGUrecgfM0bpcIhpYoQ8Z0JjUAK9SoDzeRMVjsViWAzA==
X-Received: by 2002:a05:600c:254b:: with SMTP id
 e11mr15128659wma.171.1561972394998; 
 Mon, 01 Jul 2019 02:13:14 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id i16sm6305659wrm.37.2019.07.01.02.13.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 02:13:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
Date: Mon,  1 Jul 2019 11:12:48 +0200
Message-Id: <20190701091258.3870-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701091258.3870-1-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_021316_496008_65E8DEE3 
X-CRM114-Status: GOOD (  11.79  )
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
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
index 9ab5d6fa7ccb..7fdf424f71a6 100644
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
