Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41750C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:43:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1128421874
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sEzykGoe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1128421874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UKVdcza6RMie9X1eRDE1l1pLAaliRwo1KoKMcsvZHis=; b=sEzykGoeD54izhcqDA1z/lzmwv
	S1L+9Yc53GIvfLfvLRussH3PthGB3o3oRdroWHyLEbJ0ifErz0Gfp7mWUwJNxbseHIQvatUgiyRa8
	etOlOpJBZnzda6QC3k/eo7MvdWMtj8F8VfH33ZvWk8SKZnTwIKuTdTFpZ0fh0ZvbImPfzU/gujkPD
	dpRW7Wmrf6Bhgn8hQI2Ls17KjV5DChBSIJMR9S+MYj+vzTJPfdgl2qZDDtEfN3MjzulPsC07rlpQo
	/EfX846OBvrxlaZ1AokC4S5/rpbCVTEhlNOwigCsHj0ADsT23BTR48wMbbq0q9YPbAyxZsN1bbvh7
	k2yab3UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUBI-0001QT-31; Sun, 31 Mar 2019 06:43:00 +0000
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAUA8-0008Iq-0e; Sun, 31 Mar 2019 06:41:56 +0000
Received: by mail-pl1-f193.google.com with SMTP id ck15so1729266plb.3;
 Sat, 30 Mar 2019 23:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=8stkG2HqfVF6xNg5tRXaJQ0/Dizn3Nd32xCs772cOZM=;
 b=uj2AriQAhC7eM1hhLsyM1lAypL7ZVQ6H+Zy/0xf7TsDp7VTrsMsPej9eMGWwKXSF3Y
 +3H5tBnhVCEgAII6Xvo5893vYPG+uw0KXHm4p1lbX81aNcpddyDNOZy3yySAnP1epCCd
 fRbnGxBHFdLaOa2NqOw7Rz5ON2ND1yw9uo/+kqYnwpll6L0OtClSR4XVHjbRdUVNnNsU
 G4RfJCs129qI0xbWvcXAJ6O1pdxofU8dW9C7zPutX5xnd03mmAB08Ru6XwlEecz+BN4g
 BvNqCr5fspC6MsbRAqL47BXZtXQUW1POmwuYbPSuIG4hASCPxQLbXY0/lFv3I0E3Vace
 YWzA==
X-Gm-Message-State: APjAAAXxutjG1o++Jos+M2x+LCVavf9YiVo1bbMt7eV7scw5dyKSrDjd
 YK20izw0/7gsFFc/pltPVw==
X-Google-Smtp-Source: APXvYqwozQYVPk8Fkon4b0p7OOBNRJwyFfHtg+jtrtreLRfwY6SYj9oAyrmTrA4+ZgN6aDWZfE+d8w==
X-Received: by 2002:a17:902:2947:: with SMTP id
 g65mr57595543plb.258.1554014507452; 
 Sat, 30 Mar 2019 23:41:47 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id j6sm8593798pfe.107.2019.03.30.23.41.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:41:46 -0700 (PDT)
Message-ID: <5ca0612a.1c69fb81.9bbef.7249@mx.google.com>
Date: Sun, 31 Mar 2019 01:41:45 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: meson8b: export the VPU clock
References: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
 <20190324151104.18397-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190324151104.18397-2-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234148_799972_F363F0E6 
X-CRM114-Status: UNSURE (   8.10  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 24 Mar 2019 16:11:01 +0100, Martin Blumenstingl wrote:
> The VPU clock is an input the the "VPU" (Video Processing Unit), which is
> one of the components of the display controller.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
