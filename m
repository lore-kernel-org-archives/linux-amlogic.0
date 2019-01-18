Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBEAC43444
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005E42087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GqrCjZKF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eCZWO6rH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005E42087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Prx8NOiB7ExGwyMhMYmw0LIX4sgQozl7ACu/67lWXdQ=; b=GqrCjZKFYXuRpe
	6IkLQL9HOVT3S4JZeatsdV3jlKnFq5HJg4Tu+VRKlnBZvqKEQh3KgcCM3fBIAHjpQ76Q8LFdnUPj8
	HDZmadFgSTycQiVm0HfwxTRlHKIpKIZts2XeeAMW5otM0wvlSpmlY4Dv1KoomMMYorVdSK1opP0tm
	02ZiAYbZ3CMJkHHG6nOch8sewfXnL0FT4HUuc7+hJGdEFeEpY/COFkOuxIaPgIcNb7Rcg9M7+DI5g
	3YdWEQB9LSvWEmjtSMa3T9P12ckjScmtjtFG4coxGe4YYFZvqOS0CkoTxUTc7Z2T7EVP6g7zxmTlM
	lUMldSKEPiy0TBgJm05A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkRU2-0007iv-GS; Fri, 18 Jan 2019 10:34:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkRTz-0007hU-5I
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:34:40 +0000
Received: by mail-wr1-x442.google.com with SMTP id v13so14426123wrw.5
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J19q6XdK6LukgFHT/iRLr1xXTdkoFW905MZs5kCf7/Y=;
 b=eCZWO6rHH72af+VdL5LwDKyZbSgPO2gBTQGiGbgpuF208XE0Ju9jIeA/cfzIOHN6kC
 hjo8teM6DQSUfZ38WCEgmvtBeAl0rsJfrU/2OFLtr5ezu03G/oE2+788/cWstIrMISA0
 CUrBZ9NrE/KowsrXxbgLPGRjnvXlMWDcQhHiqzM08sLhEwX62Nw27FyKIUX4O0uKdq/S
 qrd4uRA+fjggEXVZIW146BUdAvszXrFzy261u0LFvhyzKT3pfHezpICJwyZFzTVSTX5A
 /evBNqmWmjKTX+0aSB2nVgwhYTlmWE9qeOd308eYtT2jYFZTfbW46e3W0UAg4KYSpRUa
 yZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J19q6XdK6LukgFHT/iRLr1xXTdkoFW905MZs5kCf7/Y=;
 b=Z5GBP3QZASGAPEqlUwjxGMvAJQeAuo+SOtWSHfPv82ubjFBSKOB3PXlKvQ30WSHr+y
 gyDr2rNVDnobly4Y/SeRH8jfxADW++znegneR5rpg7VjnLnqluYajmTXBznZqJcDjELl
 /ihDjxeOAp2eGaxw3UGK4rOovRN+ujN9Od9YrgovuHvm7LdDnDliN9iB/8iyhOacidi9
 7JiClK6isg6MH4UJO0PuEd8f/5Z822h9JzAk+9cZuNXvMiaoJoQUH++fWffC32DuGNR/
 O0yf/9imd0yAYISfkLNvvUMTE6+yup1sc89ZJiXeLvd8x7Othi+pwBzuciVbaZvp710g
 Ls7Q==
X-Gm-Message-State: AJcUukebGyZrtoQntr5SjAG4TMYy3uj774xTzNZgrhF3NCuhqK17mOiE
 HZm670UbR7gqCSEKdZJa0y/mCA==
X-Google-Smtp-Source: ALg8bN4DKcq+60K1ZCDVPEdmFXS15/3bRbfCEQ0QaKGf9VQ9JmogJMOI9zCueNZTgaaJGyjy33LNlg==
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr14996128wrs.196.1547807677748; 
 Fri, 18 Jan 2019 02:34:37 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s16sm67066247wrt.77.2019.01.18.02.34.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 02:34:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: amlogic: add new compatible devices to
 clk_measure
Date: Fri, 18 Jan 2019 11:34:20 +0100
Message-Id: <20190118103423.15075-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118103423.15075-1-jbrunet@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_023439_195112_0CE25740 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the axg and g12a SoC family compatible to the clock measure bindings

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
index 205a54bcd7c7..6bf6b43f8dd8 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -9,6 +9,8 @@ Required properties:
 			"amlogic,meson-gx-clk-measure" for GX SoCs
 			"amlogic,meson8-clk-measure" for Meson8 SoCs
 			"amlogic,meson8b-clk-measure" for Meson8b SoCs
+			"amlogic,meson-axg-clk-measure" for AXG SoCs
+			"amlogic,meson-g12a-clk-measure" for G12a SoCs
 - reg: base address and size of the Clock Measurer register space.
 
 Example:
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
