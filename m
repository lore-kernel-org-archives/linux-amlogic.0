Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A74C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5E9EP1L+AJ1gP42KVjsyvvEyrmimrV+1IwUl1POQqt4=; b=P9KEL0SJqb1f7D
	OLKBvrdTLJfQTTaySE1cv26NUpAXe5/XDBbnBWjvLbajZertDWExNy3QQT+A+8yuxoQYskXub3PoD
	42qDomWiZPzjfFTvm9tWE+SgLGXoR/gloYOabuHRjqNHOQmuwP9m9jJuGpViYcH0SUxJsITKoxrYl
	Kni7gsjk4uTHjxHTHPf+JBV1aXx++3Djm1lHEah5GM6pr3h4GIUcW4/5g07fFyQMRYwDWv6r0OENu
	tal/ZwWRxrijBlg/OQT0O8ocKCG8Mv3JfrCwAEMMYmpngS0UVcbSzsh9KZXiBbEP9MfGG0LukgI4f
	ORXMTg4vrZ7RFdY1YYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuJY-005pYa-2e;
	Tue, 16 May 2023 13:02:04 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyuJV-005pWx-2e
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 13:02:03 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-b9daef8681fso12140952276.1
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684242119; x=1686834119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Sc2K84pfstCjboanjbniGfPzmMFGM13VBIVkXcnFxo=;
        b=kkhA6X93jXE0QOkWXeaNCjt+xYmw1ynoYM/E43vX77feqRNp/+tuNphUB99f+3kI5U
         jvAL8UusJC6ap2jilpR1/Mr9Gqdx3Ibc5zUWBIhOGCvPZsyF+SDyfwEIcmh0w7Aj69YR
         kEe0+paiUUUEfhscTjd5G+bYtA4pMzrMXYy4hbFSY0GKgI5gbgNg7GOA1mXYwSlZGIYO
         p9XVn4PZvKDNEPV/bYiSEOe5nzVEwb9Kkz/0EntiNtHvOtenxzApN0OSV7UThu40OAEK
         xu4UHaERnptKx0kpGekYkgXYPXENRJ4x4LrOhI2rPNq30z/oCg6XmtMuNhl1kZr36Kil
         hFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684242119; x=1686834119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Sc2K84pfstCjboanjbniGfPzmMFGM13VBIVkXcnFxo=;
        b=Vv1r14I9KDwWBSd+40bdqajfUevE3RKEK9BW7QypU6pkoAKfBrodJNRyufghnMJXqd
         /QBXKVdBCQP6iabCw0A0AGpAgVFvxdWPgFwGcJudsSO9dT48P6jXvZHQYYQFUmoyzEp5
         d3ZWkvBlXf/nHI3wHqscjLx/5JpBnxviTD9T3yalNms0Sal3uidFNayX4WF52yDlp1ww
         t3cQniF+QqQ9Hp1IpQE8RTck9x2uD2TCqdc+m6I2ixbZ5E+UbDglcfWZnW+bhTCAHHRk
         DJ3V1o/6zoflOB/I+BrCXI4zuoIHOHgu5ztBL+L1//DQ3xOeYHG2Y6SCBDWF3rUmUgjt
         TfEQ==
X-Gm-Message-State: AC+VfDzTRAQDZUr/wOaEVFB1cS6TDrOjDYCDFTTkjpgqtTuCjk6snr09
	Rrxfp7Jtl26KopY3ASrNhk1lBoo3qTeAtNDD1Dr1uw==
X-Google-Smtp-Source: ACHHUZ70HnhjnzfnxzsrdJCOY9zjN8osMO4g94aw2jZK8YfrVM4k7BPGrbNplNGvVqzOvuvWLgJ7QJieP0BKKAqNKrU=
X-Received: by 2002:a25:888:0:b0:b92:3f59:26e with SMTP id 130-20020a250888000000b00b923f59026emr30221472ybi.41.1684242119121;
 Tue, 16 May 2023 06:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230512064925.133516-1-martin@geanix.com>
In-Reply-To: <20230512064925.133516-1-martin@geanix.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 May 2023 15:01:48 +0200
Message-ID: <CACRpkdbbCTGcLarqvzZ11oCrciCWVDs5SwAbf0E9N1M7xm==BA@mail.gmail.com>
Subject: Re: [PATCH RESEND] pinctrl: meson-axg: add missing GPIOA_18 gpio group
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Xingyu Chen <xingyu.chen@amlogic.com>, 
	Yixun Lan <yixun.lan@amlogic.com>, stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_060201_861533_3B051FD6 
X-CRM114-Status: UNSURE (   7.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgODo0OeKAr0FNIE1hcnRpbiBIdW5kZWLDuGxsIDxtYXJ0
aW5AZ2Vhbml4LmNvbT4gd3JvdGU6Cgo+IFdpdGhvdXQgdGhpcywgdGhlIGdwaW8gY2Fubm90IGJl
IGV4cGxpY2l0bHkgbXV4J2VkIHRvIGl0cyBncGlvIGZ1bmN0aW9uLgo+Cj4gRml4ZXM6IDgzYzU2
NjgwNmE2OGEgKCJwaW5jdHJsOiBtZXNvbi1heGc6IEFkZCBuZXcgcGluY3RybCBkcml2ZXIgZm9y
IE1lc29uIEFYRyBTb0MiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9m
Zi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgoKUGF0Y2ggYXBwbGll
ZCBmb3IgZml4ZXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
