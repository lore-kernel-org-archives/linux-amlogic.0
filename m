Return-Path: <SRS0=8H3P=I5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DB1C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Mar 2021 21:35:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC2F60FE4
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Mar 2021 21:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AC2F60FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o3xr/Y6x45mybjYahEjg+D7mXC7FerAkBKhb+I2tE8U=; b=UZ5F6VpQRdjwpL1Y5xJjOsWOV
	482b/QIBU3NZNErfkiNZ/Pv2pOdOnFCPcefpWTcP4zp+ZTWl8mgm7Kvh+IRy2q6vf30u6F+YtK1qQ
	0hlM3A8dxRDlD5jlcXQZUtSCl2TB0xdUuluOBT+pvhWxWYj+AIVKcz1SzvWL1pMMMIL2oFW1o+j+R
	4M4w/coDcjrqgigLJr/yiy9ZhB1FCu/iJq9gtKzZrNLjTPZ+PBBItfryeg563EPbgegIVVNVUlEH4
	27Rcunw2lFBZ95vsWtRQyb5lXPn5b/TQV90JkgPcRUCYL7tEWdI/ga5aapU/gOAbRINnJdWcMJKIl
	3sD5H5Z4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRiUW-007hai-7R; Wed, 31 Mar 2021 21:35:08 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRiSV-007gnP-Au
 for linux-amlogic@lists.infradead.org; Wed, 31 Mar 2021 21:33:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id q10so232444pgj.2
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Mar 2021 14:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rk5hGcPQBnN1SN2dx/HkSBbBGNgs3jWmWn+abQ5G2Y8=;
 b=ZID5pYwBKnZsdQnnwpRR2fq/yxgzUjbWR+eMz0HyUAl33Yvno2whFZuIsSHGMN+AAA
 qFLI2n3BFzRa+Z1vjUFK6kLBYR5s43ZTXFok6gry+JBW8sQksfbhRMiAgRo1lGOHpCNK
 Nv0yE7bohpDU39HXuT4qxc3nOPg++9fcDhZxReFSiIonZpp+HsgDhEkRaWwNwxaxIy4n
 T6zCeSidKutLH7vemClxuFCSL2/Pz+bwpIoR3j4U3G6Z83Fl1xYI7bMwLri3ZcTXP9FH
 oGQdlc0B/Ixc5T6baouEL6TBK88YWVOjCV+tqdXjZRXRHSHSKBPy2aK+2g2a15jmSprN
 Mcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rk5hGcPQBnN1SN2dx/HkSBbBGNgs3jWmWn+abQ5G2Y8=;
 b=c8iRjhOaBFK/6zapa54UClB+DbJKtbSBRM8MtPwUvGLzAj4hfrX0J4PFNGZ7N5BC14
 v2NN+Q1Keoq87EAeEzbAyUehQ5vlmrFdJdQQiz1IWkH/0EHAkcRsoopMqukrzXHAufmE
 kUa0qN81FyAmo9kJ63NlzRjQnoQnggRQT4FIY2aTnQGmRQuPDxa0rfJTavBjAngxCIO7
 tPnHV8j7aOMvc8oBjNG/bkkKYWl6PsSINvz5d3JvNXf8W7C/VvLsf9qPaK63v8je8RLF
 EfEPqKb4/opT4bjqgrnC5PVbnFqEHqPInaYO+7E4pEqfpPzAFIahv5dSNze1CyErPgR2
 2ErQ==
X-Gm-Message-State: AOAM5325LGPfnhkkjNG9C00+lunhfrB3ejjI2Iwo42ZM8q+YB9znzJGa
 y8U53iRiO/Qy+r6jToykOkUoRA==
X-Google-Smtp-Source: ABdhPJwRaTBqO5x1qiRNai5Zvd2mJUmOrhI1W6j8wTIptF68N5rP1lqmo+HXIilbqYcec1BfNjCPyw==
X-Received: by 2002:aa7:860f:0:b029:200:851:1bff with SMTP id
 p15-20020aa7860f0000b029020008511bffmr4789806pfn.64.1617226380862; 
 Wed, 31 Mar 2021 14:33:00 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a21sm3121545pfk.83.2021.03.31.14.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 14:33:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>, Hyeonki Hong
 <hhk7734@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add GPIO line names to ODROID
 N2/N2+
In-Reply-To: <20210329161256.31171-4-christianshewitt@gmail.com>
References: <20210329161256.31171-1-christianshewitt@gmail.com>
 <20210329161256.31171-4-christianshewitt@gmail.com>
Date: Wed, 31 Mar 2021 14:32:59 -0700
Message-ID: <7h35wbc8l0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_223304_041465_E04C181E 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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

Hi Christian,

Christian Hewitt <christianshewitt@gmail.com> writes:

> From: Hyeonki Hong <hhk7734@gmail.com>
>
> Add GPIO line-name identifiers to the ODROID N2/N2+ common dtsi.
>
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>

You need to add your SoB here also.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
