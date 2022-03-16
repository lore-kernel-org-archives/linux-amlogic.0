Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4301DC4167E
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Mar 2022 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxjIqiI9IykxPFm/ep3o+g4AmBSxqrex/cF/qPXk/k8=; b=mC3cR7YOw06O+R
	43WwG2lwWx5t+PU/qWj99u/HI684pD9H/1GwFiIfw5Wrx86nPD92YQ+Xf+eTaweHQ9H+Xl72yJkMN
	XAahK/0wFGy8tFWEXMz8/Y0UwQi84TVyLz1U5Pydg4++LsvA8xW+dYbXSJLwCz3x7/quns+3e8I/x
	0OLJND0yjVt/EGF4uo//F/EVuAFwTROMiMcJv42uAqQpL5izowv0C1HyZ1zPkUfn6Zgom/cLqdmlL
	Gc18cGH9mpTI0P5yaoyvH/HdHifCGpEKfIOt+GK/9bkXIljAdI087R2FXct7uvyWZx7z50NT0GFO6
	TEMhTGvbZWSXrR09Ar8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUbsp-00EPkX-PY; Wed, 16 Mar 2022 22:12:43 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUbsl-00EPi8-KO
 for linux-amlogic@lists.infradead.org; Wed, 16 Mar 2022 22:12:40 +0000
Received: by mail-ej1-x634.google.com with SMTP id pv16so7153410ejb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Mar 2022 15:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=t5YisPtzsM0C7fd6A1oY9SJVrPbbN9Fr5lieyUuqkfc=;
 b=fmwiNl0r6a9JRcS3K6o1ySAskAiVMhvrq5sSCwGp48vGBkIgjJD6xTFBQYnvXpXA2m
 1/xpsLio6KIPNZCdMBc5KwTo6RsiXcsr5HzJe4ENqMzvxhz9EDbQ/hU2ZJFAen97UZ2e
 FWt3ez8jRkkikqWznF+OSUKDyM4D7bplgNxJoFmde1pCmwNie37Y8YPoelj6GcKaLC0s
 plswckazIaqMYeUuVu1Q7phBIrMTB/apcw8VCCIdCKiAZu+DogUoTgPSB83DvnI7m38K
 jic7aTyWzC4uNDQ9HSXMYw8maMB+FjngeebxVqUYRQV+1fzqe72kUYxPOUbzJBadx9FI
 JnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=t5YisPtzsM0C7fd6A1oY9SJVrPbbN9Fr5lieyUuqkfc=;
 b=qd454d6uuA/N1j9gvOdd9nIoO4AJLon90NmV0m2C50dBe1U2FM+KJjeYIXOvAMNBdw
 tOOjZTikwW4PXww8FGIFGGNa3fHfk+CtSBrI1FxUHPiXG+dAmoAfg5j5ooTMfKY6CHPX
 eiCwfq6+yjbf1YUmUGXVc2rleAZtYq2bu8th+JGyEt6TyfokMk5KZ5+Zf6slXoXE71J/
 Ccdixd8Yg0h26882OraLVVzBm1231IJZEyAgOQ8IWLStsiV763ndQ0vpIrPusT+ylhOB
 CX2kI+IY6Fcc3t5RfglYte+4R/F8eDnPQ3pzbFhSUf1uuLwhAJiTr7IJ0ViyGgY1TnkH
 tbGg==
X-Gm-Message-State: AOAM530tw+6gjxZk9W1+//fikQu+iwrZOCvBBRRDTZst+UE/uZh1lI+m
 HrCqel850HMYvw1EDp9RJjY=
X-Google-Smtp-Source: ABdhPJxrjkgQZHXfQI57DVw/cpw3kGWhJM8+A2NW/BrvO9HS075CCoUCmKco4qeyPPLf3EiNGtJfFQ==
X-Received: by 2002:a17:906:c053:b0:6b5:fde8:af2 with SMTP id
 bm19-20020a170906c05300b006b5fde80af2mr1739626ejb.642.1647468758296; 
 Wed, 16 Mar 2022 15:12:38 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66?
 (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de.
 [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
 by smtp.googlemail.com with ESMTPSA id
 v5-20020a50c405000000b004161123bf7asm1609613edf.67.2022.03.16.15.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 15:12:37 -0700 (PDT)
Message-ID: <4667c495-56d0-c53d-2c2d-3280e8a6ae13@gmail.com>
Date: Wed, 16 Mar 2022 23:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 5/5] usb: host: xhci-plat: omit shared hcd if either root
 hub has no ports
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alan Stern <stern@rowland.harvard.edu>, Jack Pham <quic_jackp@quicinc.com>,
 Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_151239_710985_F5619645 
X-CRM114-Status: GOOD (  10.97  )
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

Activate the just added extension for xhci-plat and omit the shared
hcd if either of the root hubs has no ports.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c512ec214..044855818 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -245,6 +245,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	xhci = hcd_to_xhci(hcd);
 
+	xhci->allow_single_roothub = 1;
+
 	/*
 	 * Not all platforms have clks so it is not an error if the
 	 * clock do not exist.
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
