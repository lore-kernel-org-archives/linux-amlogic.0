Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266E0C48BD6
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A222054F
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YN7QIB3T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OI251nww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A222054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiZ1QLFS/FEupaTnm1g6T13dHP0SCCMB1tjNRtqbeFI=; b=YN7QIB3TIzuNrn
	hMxiqrHLupJ19Wu5JF3iMUBDQOjoRIyBW0jPARii95Uz4ZfdaD2mHUR2Mrhv7gHL6Q7k437ziBhev
	SNauzUTUsmjnJHoAaQbb0hoqfLg+/wd9EvfbKk0CsZmCeDKA3O3kVfgSZFqswS6sajuW/d+t9RT0D
	5X7xLAd4UXE+sFcafTJIp4K4a3yevkUVDOThs+cLKVhOaIwz6IlgceYFLWx70u9RWu3QTYfDdaqDG
	JGutbDvvssO+MUI6Zk/fYKV1ssn65EMmqleW+SwQH8+JcXOLWmvRUOQ7fNTM+f+OUayPn/Vsv2T46
	+IIbxQhRnHYq6lYJKwKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3v5-0003sC-64; Wed, 26 Jun 2019 09:08:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3t4-0002ZO-Nv
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 09:06:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id f15so1807755wrp.2
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 02:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
 b=OI251nwwamcbJiqoK+UB/Xvd/6flu0o1NsCNHXMNnGjCJucGdtYeU2BAOR5pxbDyIf
 3pcHb7SWZ7lgPOjn1NIwpQYiA7oY+GdaCy6w/RtniLVSjwqYJ5cEFwjlahGpDEOakzRp
 HojdXsl4mFeJdV8ZNlbA6T0vu90xrCXQbrOlfVFNH4oBIt7JPA9v1saJYXvJx+/PtD2E
 MC0CU7+d0AYzSPCQ1tTqW5c8DYy437GAzhZxBp4YLmEvRW9MPhLqvd1wbk6SvPNkE/Eh
 6GEhofow4tZR9QuXfCR3+WMeVfmXi2KdOOKX3T/LxYMsFKsELkXaDRSxvQIm3Bm66Esk
 MM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YLGRK88mV5vZE4LqM30CD7m71X58sUA87fhljEjqxY=;
 b=dEpj7nqxVd7fwQVXIrTr4j9j2hru1fRGJ4yRmctv8kipOd4gFqwaYMNZNYB+GxeXys
 odw+8EzXUp+Vl/XTRC4W0GsnNbxdDzPUyaNn+we0viYkW2kaT2Xob/2kxW9J3T64pxa4
 V2Bdw6gEp0u5w/Vj99AjZ/4pr1kof5ZCHOX2dv7yOeydCIUa3Y7jjVXlV/1bemjnBWah
 r6gGQ+Ise2TLeCEIsMLD+5mnO9XqXb0+j9nkDacMgDAhnEuozPXBBPfjfhIoMKLEnfLU
 90o0lxHvWV3q0KUuPffW/j/Z3ZudndUnQ5inrL3P3NPSWzxbSeVjrrxeRd+JrrAKVT/f
 t4xA==
X-Gm-Message-State: APjAAAUombXNb96iSu5DvWep9nCSHqa5CrjwhzxHGTUT4Y0o4RL12hSx
 U3UVK5AL1QsBoMQ/X3NCg2aoNg==
X-Google-Smtp-Source: APXvYqz3vdyXnAtP1SpNLPKWrEQyz94x72h+b+vO8Fr71mlivyvfBRlVQGi5Jlk1VZVxT9rHkUqXTA==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr2735671wrv.322.1561540001249; 
 Wed, 26 Jun 2019 02:06:41 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 02:06:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v2 04/14] clk: meson: eeclk: add setup callback
Date: Wed, 26 Jun 2019 11:06:22 +0200
Message-Id: <20190626090632.7540-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_020643_003033_3ACF68D3 
X-CRM114-Status: GOOD (  11.07  )
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
