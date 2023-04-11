Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20F4C77B6F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWvqiP4+37WBrsMUIk3/h6yNApUOtcWuLsCfmm1op0o=; b=zJKtc1rS1g4W7B
	5ta6bWSGr3wchWoYrHAxcfYMqC+qvXDNPRIBFWE79UdUop2AOAcpxZsg5Y2+vEbHFUy05tJC5gw19
	FHSaX+auNMMnu6Q77dtaazpRJ+slic+LmRWRj6CZ4nR9S6BplGqW2hJPXtZaTlDYIBXqMocyUlivm
	UqNFOjy3PtzVZs/qwBYfsEBPA28WeLTAuvF4lqrhAjQtD0WSWOJIAV29axT8rCP6HUkCa/lOmWr48
	+9qUSuinwNfH5htxVfHA/Kx4uGFUbvWSjRFVFebd/IoYJUSBg5qoLYvUlds7nDK2c5LqAv6HyUa9C
	osPa8gWeOPPFEpCwAZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHTa-000fVI-1S;
	Tue, 11 Apr 2023 17:08:14 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHTW-000fUb-18;
	Tue, 11 Apr 2023 17:08:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id j17so12511816ejs.5;
        Tue, 11 Apr 2023 10:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681232886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzSl70X4YWjLhFqxAPO4qw0JhRZO9Hie8h66AogpZTo=;
        b=TF9tqyaYEXBXP0nk+sLsW0brnEmnJQJF8yxmr/hlOND1lFDtun1Zg7heGe5lW79E7G
         qB9jrh1ESqk24Gm99U2lrOodPAWjxLDTx2Fgn/azX/udiw6HHtjHh3Y54PslbO2bDbGd
         ooIRmsm1N9ebyDX5ZCH79U0eN0D6e3I7ZQNn16+3S1SGwyWzHMH6mN+rfHmF3SPed35R
         nfZdra0KiCLvDzOuAFffkTMAe7C0lH5nM5qXoSFMNn5GzqNJCNoI12VlAMlef1Z4wB0L
         +Zc7jY/63+I3NfIns7sRxV6O11GmVUkH+vchRUguGTyOKFTOFqYTWsw7KHkvIJ9t3wjT
         2naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681232886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzSl70X4YWjLhFqxAPO4qw0JhRZO9Hie8h66AogpZTo=;
        b=J/oTiwzYaUsIf2mW5TJrCX8XWMQ2XgcPXPMhVM2ZeGKQQHZf7Z1r/1SBziRatRy83u
         Nmu8BQZZBvRqQHdEuuCo9o4w6VdJtO4DmhhXgwTXG/UdndrjoQv1bUbt6F3m6KRY9ES8
         G2kFfs5NKVz3a7Ht5wNymGVqeIvYDgccuEM1u+yVof216HfxYltn6Cx++iLGvkO0o/QL
         V1UL1DwTfAqvaO99wi9UoQ4uOLogQbDXUx25o0VD37tq5c0du1wyomAZH1hP/KIKhOa7
         jvajc78l48naq0ecFv2LsXU4Va66D+TFlkWfy9I6cqwXMvx5MFxIvbrgAGPWuVEbZJml
         I9fA==
X-Gm-Message-State: AAQBX9dKb6mBHkUcgQHJE6m6hZecm/DMima6S2ZGl4fwHXXB6lUCHhOV
	2RzeqIiOLBP8Us2UXBrwlT82E1T9WdHst3Z9gSA=
X-Google-Smtp-Source: AKy350ZjjRIVM6lJnoAgG3clDzfLdY+ssQ2Qkee1eQd3GIFHW0sOGBgGO42RE48P9zUQ7OQpVsO9bERyoM2zgigF2KY=
X-Received: by 2002:a17:906:a982:b0:92f:cbfe:1635 with SMTP id
 jr2-20020a170906a98200b0092fcbfe1635mr1755453ejb.6.1681232886368; Tue, 11 Apr
 2023 10:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <b53af028-28df-105a-eb50-21a1ed4e15b5@gmail.com>
In-Reply-To: <b53af028-28df-105a-eb50-21a1ed4e15b5@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 19:07:55 +0200
Message-ID: <CAFBinCBY7iH5zTKSNn5seqryfwjc2OTckwVjLJ7dxiUfSZDAGA@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: fix g12a ao clk81 name
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org, 
	Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_100810_409979_F8733B2D 
X-CRM114-Status: UNSURE (   8.85  )
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

T24gVHVlLCBBcHIgMTEsIDIwMjMgYXQgNzozNOKAr0FNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRml4IHRoZSBuYW1lIG9mIHRoZSBhb2NsazgxIGNs
b2NrLiBBcHBhcmVudGx5IG5hbWUgYW9jbGs4MSBhcyB1c2VkIGJ5Cj4gdGhlIHZlbmRvciBkcml2
ZXIgd2FzIGNoYW5nZWQgd2hlbiBtYWlubGluaW5nIHRoZSBnMTJhIGNsb2NrIGRyaXZlci4KPgo+
IEZpeGVzOiBmNDFlZmNlYjQ2ZTYgKCJwd206IG1lc29uOiBBZGQgY2xvY2sgc291cmNlIGNvbmZp
Z3VyYXRpb24gZm9yIE1lc29uIEcxMkEiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4g
U2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KUmV2
aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
