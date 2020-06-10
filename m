Return-Path: <SRS0=LORm=7X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C50C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 08:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D181A2064C
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2020 08:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPEXdVqV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DTECFQ0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D181A2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNLbDHjoh4W89D86yHS1rZidr/MkwkjQjoyiQBTql+0=; b=dPEXdVqVo+bjjG
	pJBo8cyFi3QPOqh/A98Xw5sg9OVu5qJ1CRSXgtkzxFqCde8LFzQZUbmdD5MM7at7Sj/ve/bSB+IsA
	cB34AnWRvUZeWnxd7Emz0tNXAukdEOFydpr1QCdyzzwz+hiOaQ+JuDw4d5tOR0USdfYI7OfNVBqQE
	J+1HYGs/wL6W+aPdnezfuB3qomu3v/3Va1sGeeW4elCxpB9DYMy2rLZDCmgxZcu22zk4Tkwa2vOdm
	SwPLtmYp8tioXiLScMzk9DoKgBh51EWtFsOX4PI5MO4fNU3pJD8eCAeWFMQavWkhulCQNAx8d1Evs
	JNXC3YugC4sAm0K63DrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiw8H-000361-A2; Wed, 10 Jun 2020 08:30:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiw7m-0002dc-K9
 for linux-amlogic@lists.infradead.org; Wed, 10 Jun 2020 08:30:20 +0000
Received: by mail-wr1-x441.google.com with SMTP id r7so1251339wro.1
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2020 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ig0Wg2PIvyajjV/Y8eTgJWpGeC/XcG4G3xO3aXfG82k=;
 b=DTECFQ0bjRfKJQiLq6V7fYnNYoGstQHaivOezI/tvE4vNkfVsM5E+kOKCoYZrkWQ8E
 07GF1OJ5g89l8Y6gsIetG5pftx0NdqTjpqPtKZKz/6k2dNaBn0Z2SZK7FL8znkkPohpW
 HS4BhLMugMY/q8R5tJQpq/MO5S9ZvJufVJS7ly/CpFL8AcdC+V1rLVnb2QYsa9abzIq/
 /pkQXuimNoTYoAIT9Am96pH2sY5EGmV8T+apfWzqDUUqtOuPKCoL8mz5V4Bj00tV3YWn
 euzCn5ZW9BftwIV05sEavFlk+ntT59KS5ZrP/UDs3u+URzOGKPukGgvjcQyNePbfNKO/
 pM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ig0Wg2PIvyajjV/Y8eTgJWpGeC/XcG4G3xO3aXfG82k=;
 b=ULxtLBSSIkJ8a7Uk1e7kS1V9vEZobGm9y+mVET5LRNvsbHjSjQKnoS4mkarvqBVudb
 OCud7sjcna5KgHZzdQF3+RjDpWs0A7YNSDUdRPT8Z9b/POTyE25LBQLA8e1xar7M2/Xs
 2NhrOr1qwDYfbmcT+5i5A11Za2flj6luJnbW4CrvnrIjCMMGApbDwAXx7um5/nfvRW4t
 euz0ahq4E56UL2I/HM5W8ghz7YktSZZUdnqveFKVcW9GgZEx+p27mNxxwg3t1IikMvJ8
 +RkKzzy5mXD9N17qBB0lgg8LOpKjBfqxJt+dZLA6ZS4T1yPo+/j5U7IbzRhFF5kIa42r
 ORug==
X-Gm-Message-State: AOAM533ni+2qT7O0zvpT+wboWUMLfn/tm+ot48ued/e9eRjl6Wdt2bQw
 KGkWw+xRoENMeNJ5yazve3MTYQ==
X-Google-Smtp-Source: ABdhPJxEeONnboKWlWlksQ0crqvdegr2mYAnJsEUGnJkTWBViWL1BgmpvfotRC7sgx0kvGovhCXAgA==
X-Received: by 2002:adf:ea11:: with SMTP id q17mr2261311wrm.75.1591777817239; 
 Wed, 10 Jun 2020 01:30:17 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 u13sm6958974wrp.53.2020.06.10.01.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 01:30:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: Add NNA CLK Source clock IDs
Date: Wed, 10 Jun 2020 10:30:11 +0200
Message-Id: <20200610083012.5024-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200610083012.5024-1-narmstrong@baylibre.com>
References: <20200610083012.5024-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_013018_675117_32B64997 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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
Cc: Dmitry Shmidt <dimitrysh@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Dmitry Shmidt <dimitrysh@google.com>

This adds the Neural Network Accelerator IP source clocks.

Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index b0d65d73db96..40d49940d8a8 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -145,5 +145,7 @@
 #define CLKID_CPU3_CLK				255
 #define CLKID_SPICC0_SCLK			258
 #define CLKID_SPICC1_SCLK			261
+#define CLKID_NNA_AXI_CLK			264
+#define CLKID_NNA_CORE_CLK			267
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
