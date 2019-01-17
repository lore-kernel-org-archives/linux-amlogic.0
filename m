Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFCDC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:26:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2336C20855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYUle8aC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sm7t9lIL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2336C20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZEePAcaB+BBMFZhVivT4jhYuO5pbdGtPqUiLTVq4hU=; b=iYUle8aCxUK2+8
	TWDwD3LeQkt/UAMD6m8INIv+YKPN+YP3vuCMZat6cC9Tg+Rao1Pu7N3nXC+W5icCXzMUoFt8wCqCJ
	NPhVfbSRn8e1PI9Jt3gW2pUJ50hNMysUAzBTrgU7UXNhKy5mlJJ8/h5KswXxV/SLjvwevliG8oYEn
	XEtUrwIQcMj/QUbMiBc/6zdP27vuApOunKZqvVbho0nOMI7ag/3r4j9Vcn/vvnHeRflMWlN+6roc0
	gA/HGNzC8ooD79LJwhbXqcq+6rY0LVD04y+w9TzXehB1WIhzH2W6GIO7Sr9UpxHsAhCdkdkuPo0JU
	vhsG7xYv9R4J3KYckcmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkEFU-0005eK-Bs; Thu, 17 Jan 2019 20:26:48 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkEFR-0005dk-5g
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:26:46 +0000
Received: by mail-pf1-x443.google.com with SMTP id h3so5388829pfg.1
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dgb4VW0Ul58s8MyWXSs249GWJprD5ro58w3NPDfmjNA=;
 b=sm7t9lILpfHGDoH6FZ2FqKJl9AdXh4ZBUSdy7Fwy1mxxNiavjjCHYWh+qWqX0Ey3W7
 NLVKquGLdKK4dQT2hYfXGnbTAFnSyfDf2pEQn/QXycZctLSGgyUFoKYpr17Ie8u0ZvCr
 E7l3Yxpyt87S4G0stRdo5UvnGc1s4nKCRmnpgwLakOPwglggcoDnfBr/FgjGIY37RfDy
 QloJSqibqyANUTxcpMVDzLv4hnZ+7GVh4WcJIWIWrKwxs9a1fdw6hWwR0ieUny+vnCNc
 sL+KGGnAkmZ1OPGPOd3L6hACPSjFKfP45F8oC64vPNWOYPuaSlJnz1VswxcrwRQdMiOQ
 9YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dgb4VW0Ul58s8MyWXSs249GWJprD5ro58w3NPDfmjNA=;
 b=R2gVdnaw5oftfbXMZ8IyTTLCkfHUmUC9M0EyVUBiAFjByEliEFg6BZWq+08TZlL6Q4
 YRBnaJ9PjrlLhrQ+BfzNP5s6n6S268ZXYMJz4//rKG0P7h8q0M9U6EttSdk37AbAyMrW
 65qKbnjX3Fu7xWtOTPbvv/a6v4rEfuCMz8HonZ57M84i6qi8Bc65Uy2NEAQYsXQGDMw8
 zuNRlu+lbex/kKml2xJzE3TtzIc/wiMz/sUVI0choZH5+c8NVVTuUCD5qjGALpFuPLUk
 YTuUQyB6ykJoijoWcqGdmj9wUFPP3oDhmQjq/Pafy/mNCinsI/Iyfg+K7kthM8ZLOytv
 ktXA==
X-Gm-Message-State: AJcUukd1iRyNxYUsZ9/ARvAjgw0oM0xhillEH6lkhrKeEBgIA0tTmA52
 zC68It93ANPSq6N/8RdX7RHodQ==
X-Google-Smtp-Source: ALg8bN5QBAp8fzkqP7nx/W+gJh9cftmm+X6nLFux9XqY5hQMkkxaQTnlWDTIckHKheSNgVZEq7WZwA==
X-Received: by 2002:a65:4049:: with SMTP id h9mr14588858pgp.304.1547756803526; 
 Thu, 17 Jan 2019 12:26:43 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id k191sm3128446pgd.9.2019.01.17.12.26.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:26:42 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/6] ARM: dts: meson: chip temperature (hwmon) support
In-Reply-To: <20190112130649.23838-1-martin.blumenstingl@googlemail.com>
References: <20190112130649.23838-1-martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 12:26:42 -0800
Message-ID: <7hk1j3av3x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_122645_211489_F7076360 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Now that the Meson SAR ADC driver can get the chip temperature on
> Meson8, Meson8b and Meson8m2 (see [0]) we can add the missing bits to
> the .dts{,i} and enable iio-hwmon for all boards where this could be
> tested successfully.
>
> This was successfully tested on multiple boards:
> - Meson8b Odroid-C1 (me)
> - Meson8b EC-100 (me)
> - Meson8m2 M8S (not upstream yet, me)
> - Meson8m2 MXIII-Plus (an earlier version of this series, Oleg Ivanov)
>
> compile-time dependencies:
> - none

This seems to depend on your HHI series, which I held off on last cycle
and you said you were planning to resend.  

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
