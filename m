Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA3EC4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 07:24:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075D860EFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 07:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 075D860EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJIJH56r42kQ0CZYa+Tc02QEgaaGjEMkzLgm0V9vcZU=; b=tmO/qiwjTSfB+8
	s+mLB0SD31u9eO2b3FH8ynkjk83hG6Yy9FL8Vb3CnXevq9bDTZ2EzTfYVRq7meor/nO1Tfm7gqILr
	cij++4PO1g+eT6rlvD8SzhweImwc4iF7Mp8CX2kPaeM6LxAhftOQBknQZbFi0RqZzMZhlrPmzoKTe
	eiDl0OFDPUBeZ13ly3JX11MJ08yVu40QDdJ+m3SiqTwWOfdm6IYoutDWAZznTzUSI5W57MrU4g3P3
	qLGUPXOAd1xTUYfEZ8obz4Z4wOY3MHLipqH9UqoRC3aXx0I1oC2YboqRsIeuKp5nnoXngjVZW7LMh
	l+vh3RDTQx7WZzZvEOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtSH-001JEb-42; Tue, 17 Aug 2021 07:24:13 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtSB-001JDf-Eg
 for linux-amlogic@lists.infradead.org; Tue, 17 Aug 2021 07:24:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso1182926wmj.0
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Aug 2021 00:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=k1CgOPIa4n8DhcaJK9nsG7rytL7vIVlLDzs67n6AWoM=;
 b=ESxuGmoejql+KJqudW71YmXAVcpivN8iG3xoY7CrTrTtal9GvssW6TT4vJqxDquKPS
 ZbpXdNqcJBBLIl6MtVdwC9a/llh3K/FZKm/UPFaPXrA7YUWGKH4PKir9bAOVkidGxVXY
 KZgb5s5zpGWR+rnCKZWAixf2rB1d64//WrzKKijRZuzN0RDP9gx57b6SvEBgRT4pdvXD
 X1kSzbupbe/G5T8TEIKJRcKMjhZo3ew5OFpQzcgJ6Q3gCVZIJJfitLrSY1xRLI8EBk0q
 J2uri7ShGkd+SeV+XM/koxWEK/wKimiUptIJZ14WxLHZYijyn68CW4sxB/4vSV8jlFF4
 f/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=k1CgOPIa4n8DhcaJK9nsG7rytL7vIVlLDzs67n6AWoM=;
 b=RvulFu+3f7viUl7WhHPGVRLMoYjnErgaa79K/uw/waoXhttWIDLVQOUlpgogOgEUAm
 TEbJwJevHS8MQolKol3viUErUrxZXH8DdKkeLK3XoL/nENBH0DMWb2sumV5e7Vj/eUZo
 0usrBvYJ+qYUwBl7K+r6s/95JU7jifWTy0yH8u8B3Nxs4tSjRKm2JmqmLZqfp0ypRQST
 46PXz5PkBwMzWuNi/PxkwCBJtnGwNIMfmnj+h+jlrKDRobNqBrWy5pi4ksggA9TIoq7n
 PNb85hOwiVYdTXaf2zYQTQbnUO4DzNbGI8jqJEZDUL8d8xSLC6krx0JKVsuSvtYo47eY
 32LA==
X-Gm-Message-State: AOAM532WyB6Ejm+W1sZYOf8oomFyt1aPFJo04EsVutHFFL/Kd434GKcc
 Xn0qG6Pjm37Si/rchN7y5jgYvw==
X-Google-Smtp-Source: ABdhPJw+7IS45rZ/FJaVYS7tOUDstHuyiASXa0q8qpIY9XfIiWi2zJdF0dx4HuJt2hC+0aOuKnl8SA==
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr1880371wmk.144.1629185045975; 
 Tue, 17 Aug 2021 00:24:05 -0700 (PDT)
Received: from google.com ([2.31.167.59])
 by smtp.gmail.com with ESMTPSA id v1sm1282927wrt.93.2021.08.17.00.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:24:05 -0700 (PDT)
Date: Tue, 17 Aug 2021 08:24:03 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build
 as a module
Message-ID: <YRtkE62O+4EiyzF9@google.com>
References: <87r1hwwier.wl-maz@kernel.org> <7h7diwgjup.fsf@baylibre.com>
 <87im0m277h.wl-maz@kernel.org>
 <CAGETcx9OukoWM_qprMse9aXdzCE=GFUgFEkfhhNjg44YYsOQLw@mail.gmail.com>
 <87sfzpwq4f.wl-maz@kernel.org>
 <CAGETcx95kHrv8wA-O+-JtfH7H9biJEGJtijuPVN0V5dUKUAB3A@mail.gmail.com>
 <CAGETcx8bpWQEnkpJ0YW9GqX8WE0ewT45zqkbWWdZ0ktJBhG4yQ@mail.gmail.com>
 <YQuZ2cKVE+3Os25Z@google.com> <YRpeVLf18Z+1R7WE@google.com>
 <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGETcx-gSJD0Ra=U_55k3Anps11N_3Ev9gEQV6NaXOvqwP0J3g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_002407_555225_CB4FA379 
X-CRM114-Status: GOOD (  15.71  )
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

T24gTW9uLCAxNiBBdWcgMjAyMSwgU2FyYXZhbmEgS2FubmFuIHdyb3RlOgo+ID4gPiA+IEkgc2Vu
dCBvdXQgdGhlIHByb3BlciBmaXggYXMgYSBzZXJpZXM6Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDIxMDgwNDIxNDMzMy45Mjc5ODUtMS1zYXJhdmFuYWtAZ29vZ2xlLmNv
bS9ULyN0Cj4gPiA+ID4KPiA+ID4gPiBNYXJjLCBjYW4geW91IGdpdmUgaXQgYSBzaG90IHBsZWFz
ZT8KPiA+ID4gPgo+ID4gPiA+IC1TYXJhdmFuYQo+ID4gPgo+ID4gPiBTdXBlcnN0YXIhICBUaGFu
a3MgZm9yIHRha2luZyB0aGUgdGltZSB0byByZWN0aWZ5IHRoaXMgZm9yIGFsbCBvZiB1cy4KPiA+
Cj4gPiBKdXN0IHRvIGNsYXJpZnk6Cj4gPgo+ID4gICBBcmUgd2Ugd2FpdGluZyBvbiBhIHN1YnNl
cXVlbnQgcGF0Y2ggc3VibWlzc2lvbiBhdCB0aGlzIHBvaW50Pwo+IAo+IE5vdCB0aGF0IEknbSBh
d2FyZSBvZi4gQW5kcmV3IGFkZGVkIGEgIlJldmlld2VkLWJ5IiB0byBhbGwgMyBvZiBteQo+IHBy
b3BlciBmaXggcGF0Y2hlcy4gSSBkaWRuJ3QgdGhpbmsgSSBuZWVkZWQgdG8gc2VuZCBhbnkgbmV3
ZXIgcGF0Y2hlcy4KPiBJcyB0aGVyZSBzb21lIHJlYXNvbiB5b3UgdGhhdCBJIG5lZWRlZCB0bz8K
CkFjdHVhbGx5LCBJIG1lYW50ICp0aGlzKiBwYXRjaC4KCkJ1dCBoYXBweSB0byBoYXZlIHVubG9j
a2VkIHlvdXIgcGF0Y2hlcyBhbHNvLiA6KQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
