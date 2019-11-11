Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC70C17445
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 14:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D7221655
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 14:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcAfHcxl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NTMOinJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D7221655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5i5rbIxk8rXwZP6dZPD4BcICLhn/MLylkCQvBsr7bY=; b=RcAfHcxlBDP+2p
	/UAbNCXZvhmBnYJ+xQtrWnPr8FsPM+1du5ft/w0iPAUQx6ymilI8ezWtx9MtV8ADr5+xb+NI9TaV/
	9fJ7wFQB/4BqplWaAiGR+8DowyBfU7efV0vf7N2VWB4zIKWV0lPzw/dNO+8NikCx/WIe27kvWtyd9
	RQseCW0NDMHk9q6kiV7I7WntohWkcXocHJr9R9v3vE0xYto59kgF5k7jRx2vGJwV05z2v1qj8+rBE
	J6IF996F0UY6VOkoTL53/1G/PmtqJdTK/A0pF4kXFpZgWl+tFYF0ddJxHGvFUPPh4mhb6m1BR5od5
	YhgA2UJWg9uUuebwF1lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUAwa-00068X-Uh; Mon, 11 Nov 2019 14:45:28 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUAvR-0003pC-7i
 for linux-amlogic@lists.infradead.org; Mon, 11 Nov 2019 14:44:20 +0000
Received: by mail-pf1-x443.google.com with SMTP id z4so10801634pfn.12
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Nov 2019 06:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=LU8AMzMDy4OOUqnFmi5XN0F2ODrVM91j32IqE/77mHI=;
 b=NTMOinJQKgGx9JbjTBpaKVajY1gfGsX1WblOyp3NBFsN8p75WfacP6UqvvXptVTVId
 xN5qz61ZGXzP9BO1kdYSvUOKp39Fbhf66yDAtZWO5BKFue22crRdtliWAHS4kz2fTSfn
 76wXnu2Gctwypqjj2Ju18XWXFc/3dzXGUwRIqHNjdCmv1mmK1k7ayrSQh4xKVlXgR3iY
 NYRa8Ad7h162TBo7EYx3gGgD3fsHCxv0IT2DFhME9aROh7ybGMZsLX7HKJHvJ9G/lY2d
 PN7HPgDwPADieUk7aqhYEFA5qnheSRp14/hszYvfmRF7NBno4Ps/bJO3zF5v9m0oeLr6
 w6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=LU8AMzMDy4OOUqnFmi5XN0F2ODrVM91j32IqE/77mHI=;
 b=amDeYpNQlrBT7b3IaPdVaEJdnG4JK5/GEW+Xv1AOuNGJ/yvEx9d9Z1wcr8Ls4jWqAF
 rTd6XGQfDJ8xgs0IN0qvIAnctXcPZQ9AXZfHRn4sEGOrKItKgvdV0qsLge0UQdrnqA5x
 qWEUKlod5h5/GS1WSgGaw1L0y4vf/Bt2QwQrPxENaMm6jD6RQ1NKGC9V9qu17quxKdWY
 I4UuwsVHELQEWS1eXBuORcq1yMr7gT4wsbN82gc3OFkjqPbyTyoVXQ5xLMGYqbGaLVNP
 bjgZrAG4HPD9nVpJcg8ANwUJbaNcG7oJSemW6GF1J2OWIoFhXTiLsYWYtakG+fXSog/T
 Gv+g==
X-Gm-Message-State: APjAAAWh3YLadkiDS8vGYaWq7zkPDXJGUgPD79lhPuL0AhZI07MQpUPI
 /KKT0F8Wty7naogL5kQKYB6xeA==
X-Google-Smtp-Source: APXvYqx0YKzHjeIhgnYjvdDvP29Rz7Fr9hL8YrdKueSuJN1eULz6g6R0rM2MwrtthHa/AXMwwqvLnw==
X-Received: by 2002:a63:7210:: with SMTP id n16mr27806220pgc.397.1573483454953; 
 Mon, 11 Nov 2019 06:44:14 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:dd5e:2cce:fe26:7bc6])
 by smtp.gmail.com with ESMTPSA id q126sm2117762pfb.42.2019.11.11.06.44.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Nov 2019 06:44:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 3/4] soc: amlogic: Add support for Secure power domains
 controller
In-Reply-To: <57b9c706-c341-c7cf-698a-66335b34442b@amlogic.com>
References: <1572868028-73076-1-git-send-email-jianxin.pan@amlogic.com>
 <1572868028-73076-4-git-send-email-jianxin.pan@amlogic.com>
 <7hmud4stfo.fsf@baylibre.com>
 <57b9c706-c341-c7cf-698a-66335b34442b@amlogic.com>
Date: Mon, 11 Nov 2019 06:44:13 -0800
Message-ID: <7h36eucw1u.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_064417_320102_019B10EF 
X-CRM114-Status: UNSURE (   5.73  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, linux-pm@vger.kernel.org, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> writes:

[...]

>>> +	SEC_PD(RAMB,	GENPD_FLAG_ALWAYS_ON),
>>> +	SEC_PD(IR,	0),
>>> +	SEC_PD(SPICC,	0),
>>> +	SEC_PD(SPIFC,	0),
>>> +	SEC_PD(USB,	0),
>>> +	/* NIC is for NIC400, and should be always on */
>> 
>> Why?
>> 
> NIC domain is for ARM CoreLink NIC-400 Network Interconnect, and should be always on since bootloader.

OK, makes sense.  I suggest a minor change to the comment to remind that
this is an interconnect:

   /* NIC is for the Arm NIC-400 interconnect, and should be always on */

Thanks,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
