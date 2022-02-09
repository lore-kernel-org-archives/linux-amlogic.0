Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89E6C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Feb 2022 20:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ASspFugNfbf1SWfTGGW8Te6VN2WQYv0O3LbiCv06w0=; b=z8gUjc9HOTAqw4
	GichO4uT0ZTt4XzzGri9GI9yn3HPfI2VfPKztO8sdyC0GyHc2FcvaQxUZQmE/9kTJZWWIFx4ngE6J
	UruXF6UIk5wUG5ml9s9Hd+LgKP85IjLHwinoyBnJ6ywsNVnv4DrHmS2UznJ7B9uB6p1Osz1VjNqTU
	rGElPzc3JeBmyqm+MlK/Lk+/S6/PxKWKcgPpeHkwq1wZkxRtNWeU8iB3hvsSLh0MCJH1f3FFoli8m
	cI0hvntI6gR5YJcC9iVLh8GhhFeNudxHUle5gFwh+t5sRVNfKq91sbIDP3+IDWndZuIjxzgY+73JR
	qn4aw8Jf4BWeMzbH50rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHtcD-001ZCU-ML; Wed, 09 Feb 2022 20:31:01 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHtcA-001ZAz-90
 for linux-amlogic@lists.infradead.org; Wed, 09 Feb 2022 20:31:00 +0000
Received: by mail-pf1-x430.google.com with SMTP id l19so571026pfu.2
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Feb 2022 12:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=H8UvkuaPa9oG6MBcN88+EFcgU6RwUy+XLZ3L+fuvwWs=;
 b=jLSqHONTNlyEU0X36UjWm1OP1joipm2nCVWebcdjjAetYBRag2vvSJpPamuNKix4yP
 rwNNjw1RlAYXs2IL0B2gDrPemV4PSFexAl7LW4k/P83PpiO5dN+gxwb4Sgv+8t56Fa5i
 8JaSKqWn+o/nkY2XIM+I2sBbvBFeL1MGcxdBNvYaOCU8YMQqtKpPPXc2VZmdawXxmy0S
 LJ2iCFCbGYdY+JVuIDZGIZ4SWKk7VLbnBFMyEooeL2WFWVKf30pucY+hBWoZcYcfTvor
 296JPhFbIryEeulXN9SjrmIFNcQXBZf5goMqiW0G/5tE7Fu0gUSt4OOfY/492CjnIkzh
 IyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=H8UvkuaPa9oG6MBcN88+EFcgU6RwUy+XLZ3L+fuvwWs=;
 b=mQgNGdp9EecsJatkB9o9obD8XiFBjZMcfo1o3lB0AWmwgMzRkpPiwJ4cBZkHvKcLWw
 xM1JqtreXFHpIl8Dju5lrYyaTapYrgVJQirNHf2ehIVQwGytXKes9a1TohQSjPIXxT0y
 D1+kN2ISY7/sQHSjBFCfbgqcvMLPVyz91yWSfFVh58n8XCLVqi3hytH+eaiR3s8R+yTy
 sIJwlSRGI3ug33yZUu5LognOhu66iv0PAZ1H0ZMRdvIlyqfdH7v2wm4KmAPXxcKeMjsR
 2PVlrmN1TcBmzuqy5zzgQ8ydrspuLX2st2d6rAyXv73dLQnSvk2Edsdegu0Qp2JA94mC
 sq+w==
X-Gm-Message-State: AOAM5339uFliiNafPRYRLHvWb6jPOZymWKwy+H/6MRp3cFtzsq0wRn91
 ADUG4JZW85aEBCIDlT95CUcsQA==
X-Google-Smtp-Source: ABdhPJy424vIOl7jQpbzE1qFJbQKb1wuakkXY166U9x9NY98U7JPd35QgGjJclqbpBouDlTQZCmKtQ==
X-Received: by 2002:a63:844a:: with SMTP id k71mr3226964pgd.559.1644438656578; 
 Wed, 09 Feb 2022 12:30:56 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d10sm20577340pfl.16.2022.02.09.12.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:30:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: "shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, jbrunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "jianxin.pan"
 <jianxin.pan@amlogic.com>
Subject: Re: Re: [PATCH 2/2] soc: s4: Add support for power domains controller
In-Reply-To: <202202091001287547451@amlogic.com>
References: <20220126061018.705338-1-shunzhou.jiang@amlogic.com>
 <20220126061018.705338-3-shunzhou.jiang@amlogic.com>
 <7hzgnal5yu.fsf@baylibre.com> <202202091001287547451@amlogic.com>
Date: Wed, 09 Feb 2022 12:30:55 -0800
Message-ID: <7hee4bok8w.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_123058_405365_CBAFD67E 
X-CRM114-Status: GOOD (  10.41  )
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

"shunzhou.jiang@amlogic.com" <shunzhou.jiang@amlogic.com> writes:

> Hi  Kevin:
> Thanks your reply.
> Please refer to below comment,
>> S4_VPU_HDMI:  for vpu domain,  this domain provide power to many moudles(osd, vpp, hdr, dv, di), if close, will cause system crash
>> S4_USB_COMB domain: for usb, if not always on,  all usb status will clear to 0, that's not right status for usb

Yes, I understand, this is teh same as for other SoCs (e.g. A1.)   The
solution is not to set the domain to always on.  The solution is for the
drivers for the devices in these domains use runtime PM so that when the
drivers are active, the power domain does not get shut off.

>> S4_ETH: for ethernet online wakeup, and if power down, status also not right

OK, this one makes sense for "always on" since it used by firmware for
wakeup.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
