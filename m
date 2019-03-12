Return-Path: <SRS0=5XDc=RQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943A0C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E14520449
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Mar 2019 10:26:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nDv9++n0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CBsovrUr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E14520449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmBBnoPZ/Krxq0d7Qrc1waqAWj85UYrie8NoBbp9RTg=; b=nDv9++n0o/bhY7
	JlimVHXNEzjJZq6NVpnqvwW0SzEFC9NpEatY07ULnoRD1ilkiSfN65o46Q1VMQBi24+6Wm+43uHnu
	8WnhtSNVSm+tTwcXboeBjMyOV2U3ufOh2/St8HlHLn+TTVWxlaO3cT1y9tICMEYC+l2WoUfXGQ8aw
	aKt8i4BV+fUWRxId/U19OwuxWDPEX612fq/4fg9ZgeHItiqgJtxyL0rq3g46CweqlTy2gVlMmzdUJ
	TvRo5uV7kBfWtMFLYu+6uKyJuEEmkrnxbhtzK2ubHXW43yzrz0Q+4vOqPJXgYA47LHFhxWNYSEnwn
	jPa4XTpGwdKE1kvs+ySQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h415c-0006H6-SY; Wed, 13 Mar 2019 10:26:24 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40yY-0004v9-Gg
 for linux-amlogic@lists.infradead.org; Wed, 13 Mar 2019 10:19:08 +0000
Received: by mail-pg1-x542.google.com with SMTP id u9so1184152pgo.7
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Mar 2019 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=LSAL76ZaBISCmftacvftLCPdC0tuQThkmwcBczJW1Rg=;
 b=CBsovrUr5CkyQCnm9kWg+yPSbXQiHTmNnbMI89eHxW3PnJ5YA3lGozCwvqE16v7gOr
 n/1O+Al5PYLywIOtGl4oaDYqttC/E9cS69Ly+LUKQ7FZ9O5N0yEuUvbOnVMf/+fH3q8v
 /EfqVRFQILkyjYlntdBbXXHkKH3E5rU6ae5zOsy6l+E9Q3bTvGAy2ugqT+515eOfGi1t
 JOnMX21kUDH//SgsKpOwywp8njLu88nIdCGwlwsGG+wPWCPDvvOuv1tg62dKo4DdL+MS
 trqFggP+zTe72KX9AS7Q/dRqD2C+mcxU+jtCSggZ78Aege4D5kNYsCdmUCqgqpejnpa9
 t1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LSAL76ZaBISCmftacvftLCPdC0tuQThkmwcBczJW1Rg=;
 b=cYFWTe8PJspQSJPKY7I+2ljRop/6iD8uvaRMmHzrdLvL7/MOpnBjRMHtNtwpBjUIQ4
 D8hAqHG321bJ/X5FoUJ8bnCilWWojtQApyj10bLMqqfU2RDB8wzvaPzZO5FHZJHk76wn
 jc19jNszx8eC2FPhHlhYfB4Nwcd6Z4fqHF4Nbcn7Vb87aNHxKhfYsAzSTAX77LnG50He
 e6tu/iuItt/Jd9Qpq/+C8+om792aBvblaZhXKU2M0bPM/o/V7Ib1xY5uNowQjE2jhNjh
 2Srp8li5RGX0C8FRn2AktulvwHiDXX+6FKAbAJk9oHJxcwcBRGRJ0/kqZ92IOlVpsl1W
 xqcw==
X-Gm-Message-State: APjAAAVUsyPSXcJes+r+47uJ6lGayxCtzkMHflLZNxVqQT0IHru5F3jE
 IiXfpQLpRj12G4Roi+VZU4UgItPFEOdEeg==
X-Google-Smtp-Source: APXvYqzZED7QLtXOpujudJakoPtjS2S6V/2RlKyZGx5+WxIxPG09Wckf3mLR5T0+PD9nMmfAG8DnWw==
X-Received: by 2002:a65:614a:: with SMTP id o10mr36701640pgv.51.1552422523088; 
 Tue, 12 Mar 2019 13:28:43 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:1daf:3f96:9f7f:33ba])
 by smtp.googlemail.com with ESMTPSA id w17sm13308688pfn.63.2019.03.12.13.28.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Mar 2019 13:28:42 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: [PATCH 09/12] meson-gx-socinfo: add missing of_node_put after
 of_device_is_available
In-Reply-To: <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
Date: Tue, 12 Mar 2019 13:28:41 -0700
Message-ID: <7hh8c7u9ae.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_031906_709575_762C0DA4 
X-CRM114-Status: UNSURE (   5.07  )
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
Cc: linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> Add an of_node_put when a tested device node is not available.

[...] 
]

> Fixes: a9daaba2965e8 ("soc: Add Amlogic SoC Information driver")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
