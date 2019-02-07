Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AE2C282C4
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:54:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32DD52175B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:54:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QFF39qrg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MimCXGW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32DD52175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bIxvirPURf1kkkStPl2xJwpa0Hj8EElmZoHT9DH9ys=; b=QFF39qrg5ZHUiX
	XOxYFDlCF463ojy4J92hk7yUMmIZal6HINoupc+NWhwH1Rl2JucHCaDT7UHAd8359h9PGE+guvbJT
	vDnErC9cZSByGSYk9O0AJCiuVdIARdCUVqpe/GxqMOCK8t+hYf7FvQ44NKja4Y6hzoU603Nm4V/Ls
	btS1CffkZshWh5YV/QmVLMXIfmujkp6qazgmmKJhsM5fw2LF88uStNcFw8ADO03pK8hSyaM1cDIY1
	acfQMCy56wSMB3pX59IsJEnTFRZMmkAzsibgP46TLnQhABRJA4G56BhAxcVtKIDPbQKD6h1jPMzLS
	I4tfBFTsAzkX815RXODw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grald-0003Mu-TP; Thu, 07 Feb 2019 03:54:25 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grala-0003MG-K4
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:54:24 +0000
Received: by mail-pg1-x542.google.com with SMTP id z11so3936597pgu.0
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dzXRzhNeAJaEDDw2bDa7ru6nYvSSdEcmyz9Bav3YOBU=;
 b=MimCXGW0Zu7FeWTSBR9d1/YF9E7VPhv36ttKdTrQaqDHEbHFsoysktz5aHAAUGMXYJ
 /2/oDvpnfjxcMKyQKw14aSa6rKxUbQedk2Wjk/J4PARs2y5LdKQM0yYN7T9lah6SaCqc
 Y6/EqGrAmZPBka4qczbSkvPOOXVK2vc28xDSBMQn+5Klx/p+fPtXsmOj6pMLN/RtgdLu
 4utt1CO3kzBRchYjNnnbd8LSe2et8Ye+jbM5KnsWbxxet6I4NkZqr9/Uax1YjoQCtNrM
 ZNsfXL7W4m5lqeknrJP/oXvjZym6zfla0cgjpvKR/4Oa0m6rSvRXmuL/0Y74tsr65l7F
 ErMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dzXRzhNeAJaEDDw2bDa7ru6nYvSSdEcmyz9Bav3YOBU=;
 b=IEkCJ0lJHY6gNgr/ImweeQ6CPpGZJF01yK8mzB6HHJEBzLXQQKixSg4TMXh4px2Wg5
 JMRzroDucbRpvYwV2YjcRD59CeezEs0+1zAW8ge05V4tFJwjJ+ZZwwVBAu7Q1KnRAtSz
 8nt9Lk7RZMnRgM0Xg+oJUxWZUNdeZ9kuYWp8glUp6VFSK3d8IcHcIKO4DpfJ5051rQTI
 GZTreaJfkWilNISqRAK6TBD5N9DbX2UrE+KfbqPLQflYfdmESkLdO3FJVxKdHbcBfJli
 5um460xGHO6UO6CLsQef8K38/KYLjKlE8tXIhxC3F2zrt4V2gk2cwiQeNYfJ6wS1nsn1
 KAiA==
X-Gm-Message-State: AHQUAuY0NeLsJo84yy0h04QI8vQtgpKiWi/p+7irKk7Sv4h9S9EH9+fk
 3OUiEfnLAvCOMmZ63MUQyT6FCQ==
X-Google-Smtp-Source: AHgI3IZlRGwVgh2CPfMev7H+GxPlpUtK2D9w1DvuR8UVW0yabk9i1txXo7EmDTCJQLHIK4+xYu4BSg==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr8369118pgv.427.1549511662023; 
 Wed, 06 Feb 2019 19:54:22 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id l70sm10201707pgd.20.2019.02.06.19.54.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:54:21 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] ARM: meson: do not select COMMON_CLK_AMLOGIC
In-Reply-To: <20190128182252.32589-1-jbrunet@baylibre.com>
References: <20190128182252.32589-1-jbrunet@baylibre.com>
Date: Wed, 06 Feb 2019 19:54:19 -0800
Message-ID: <7himxwgsno.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_195422_659415_EACDD781 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The patchset remove the selection of CONFIG_COMMON_CLK_AMLOGIC.
> This CONFIG symbol:
> * Is already selected by controller driver which requires it.
> * Is being removed by this changeset [0]
>
> Whether or not series [0] is merged, selecting CONFIG_COMMON_CLK_AMLOGIC
> is not necessary and it is safe to remove it.
>
> [0]: https://lkml.kernel.org/r/20190128180430.28689-1-jbrunet@baylibre.com

Queued for v5.1 (branch: v5.1/soc)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
