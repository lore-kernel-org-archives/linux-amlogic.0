Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D96C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D367207C4
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:09:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ouSRSXB6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WVsgcgCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D367207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQgmhVo2kiyyQa3EF275xzNOuqWA+76zCJGNgZyqgVY=; b=ouSRSXB6kxfYpa
	9+ORkn9YN3kZeEbNXgcbaeEvfgDVhhM0sV0PHAsDBsl/JorDZ3NRAk6uqRo7xlPGzte6fHjsUSXnd
	CoN2bO394SXvnyMFgIvbme1Tqv5iFaYyFTXsNlKkjS0QSzvqLnSjKIG9XE2Opk54g2kTKIeuUmzUp
	AYzTRJQ3qHeSrHhGSLCaBxyHnyg88CHOqywgHzaKZbyBaFEkVUJtvfWmiDbGkExjubMcjR7bNac+q
	Sv05Hk5ixkE7QU/DNB8nRs2iWbuRQBCcOGCxPEexCGK3MU7lo3iGNXBKBGjaUk83FQ6qfTezfzGjh
	wl+DGKFw8qFvyAPiBrFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCI5-0001Xg-19; Wed, 20 May 2020 00:08:57 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCH5-0000g3-76
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:07:57 +0000
Received: by mail-pj1-x1042.google.com with SMTP id cx22so432175pjb.1
 for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2020 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OA6qojCM4dL1ZDG6HQpUSV9SSGjjyRfMb9hw1jALO0=;
 b=WVsgcgCNQtJKJlbMEdp7w81j7Nm4YgeKnV3hBNnr2syOwz5DeApI1RIoXsQ59LoX63
 UY2V0GnOOpscuwrDUIKdjfOccPjKFYNBrx6WwinSe0uALV9xqI4hb32/gERjn6v03kT9
 88RMzTiz2P6Kc5j6b9eSUdiiITnenAyFko0xZuusJ9PKBv+22iSTpQwetNCnQ2mXLQrl
 gEcW6QAiB8RA+CWjieoN2uYCT65WXXbdXyjnLNVcWQCkulr5kwSMoopJ7fXaQkP4u97h
 bT2iGKpFMCaPXKBUV7vdESsycvExKYcPZijw21Lp42FW2IB3AC8AfUzMhIdMk7uGC54E
 TPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OA6qojCM4dL1ZDG6HQpUSV9SSGjjyRfMb9hw1jALO0=;
 b=tgXZOChXIRx3+smrlnAY4JAQ5mMK6vkUnboqzcY5pVMwrHn8tnVDrXcGAsP/nGD6Uf
 mPG7AkOz44OZFtjc210YVgQnvMNgxRY+VeQYOCe4j1IGn4zYczJHLY6GuftY/M5oEAAr
 F5+65kToA6eMnE4ARE4ws9VNbfytr8Cv6b08hwl1HVvQ3Ss8eFG6Qz4MBJBp/xxjpO/1
 kEAMVKepxuGj8g7xr+PP6aQa8LR2/k9eeRx7NmwADjnODG6AqMiR/5U1aaqEtUqFIy5L
 10iUti0suZiQ3MX2+ycJGqwrplXfuOTZvOp3+KCE4+AQch7ZgcSg3XiOwXZUb5VA9pB9
 t8bw==
X-Gm-Message-State: AOAM530l30VABrWRwQD8fc0ZAKlkxX5SAGAvFQmbilmFUCmfKO+XGGrP
 wExc+SHivv20kCwGJa7zBQZtZBFng0F5cA==
X-Google-Smtp-Source: ABdhPJwtCswXSbkUSw9C97SOK8vFMtT5eKKDm0rsNrlGrcNSvzzkVB3d8v+6JdpLRZlhXKPaZGOWpg==
X-Received: by 2002:a17:90a:3201:: with SMTP id
 k1mr2111805pjb.202.1589933273730; 
 Tue, 19 May 2020 17:07:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w19sm490543pfc.95.2020.05.19.17.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 17:07:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH for-5.8 v1 1/1] ARM: dts: meson8m2: Use the Meson8m2
 specific USB2 PHY compatible
Date: Tue, 19 May 2020 17:07:47 -0700
Message-Id: <158993320300.34448.17484160743878386596.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515202520.1487514-1-martin.blumenstingl@googlemail.com>
References: <20200515202520.1487514-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170755_581588_11F6F2F9 
X-CRM114-Status: UNSURE (   5.91  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 15 May 2020 22:25:20 +0200, Martin Blumenstingl wrote:
> Use the Meson8m2 specific USB2 PHY compatible string. The 3.10 vendor
> kernel has at least one known difference between Meson8 and Meson8m2:
> Meson8m2 sets the ACA_ENABLE bit while Meson8 doesn't.

Applied, thanks!

[1/1] ARM: dts: meson8m2: Use the Meson8m2 specific USB2 PHY compatible
      commit: f5a7382d6f176e29e4fd9d733b93d5b93771a7e4

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
