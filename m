Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6569BCD1284
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2024 21:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gg9tHXQkfw2otLHJkl8CvlH8Pz8eiYgfwCVeXNBPm3M=; b=RHvjP6Dp6pKrd0
	l4z+931yAPR+YrXZJTo7JjLFJYC7rMQMlo9G9TLrl7AyqTkpJsDVYEjAG6m/Q+H+wKut3CVBbSwLv
	lw0JNxqTJ900ZX3MWn7T/WZa+mcrd2CLz4Bc2zB5yo0d1ES9x3yDSi0Wdv20nInqN5k2ol1+yjjLE
	Z5LOjU1CSl5zoHboUSbscHRw2vzsQGAWtb8R3tbAvlwBaQ69rusJIkvYOWgEPV3X0giBf/oRbbLVy
	uTLqwXn2qQ+l1SptMgxwLRmlOM+PJHac+Ul7CfYwiUMzmCIPAA/bUnmiMHoJTbTNzLT+W6rCZI12k
	eZoGIa3HsrIrbe3v6Q2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr2lA-00000006LT8-0oim;
	Sun, 31 Mar 2024 21:30:36 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr2l6-00000006LRz-1uKp;
	Sun, 31 Mar 2024 21:30:34 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2a242528948so9710a91.3;
        Sun, 31 Mar 2024 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1711920631; x=1712525431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjG8SPTf/rr2h+XjqAzsDGTKdabLcLfs23sxMbjwxxw=;
        b=MsmPPPoStRjcw8qzagS0/EkkRdptg5OtnOaNVAG2BOom7cLVnwj2l6g3pXokqp76up
         a0RoTvX20fO5JPP9bFO0QPvQWpI4rRcKYLeX6+DmYb8FaOZmZoD/OQuWefuLaIjZLvBC
         HxI43dFIvpagUzN8+JjPK5fXG3C3dO6Mwr9pokgDniEQDQGiR6ZPz5ln07wKPX2TMUhT
         nsWeQHGbEsvBP04BJBkb2nGTZnW3/lJLAJESOnGgSKLy9w69mb59ViLGSqUgoWRrG1YH
         jKbN70VDK8cbPmZxCSrOIvUxJAU2NmN3phdOFPbnfjWBZq/SJMKfFXPyv8LKg5S0K8Ts
         YT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711920631; x=1712525431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjG8SPTf/rr2h+XjqAzsDGTKdabLcLfs23sxMbjwxxw=;
        b=fKH/Euu4lq4QDJsMOFfhxM981j/C7tNwyCe2ajIkfB5v+PY0iPPmemGfpYc0B3ycuW
         hIIr8d0sCOREijalIB7FxuopJ//527FIS4ku76JtQWuTzFf7cinOMXv0T18nKFCIAAxM
         nmnkgWmP6UIBNR2u7B9dKh5e0avTENWUaCNRktaPjn8gm1h8BsjCckBRnaf/0uFWCTds
         cId1mznl7ZZBxVQm25c+Rx5pZGCWKf88B6JnmYsMTkbL8CsNc0h4iUpUkMr4iRp6pcjz
         ZiHfs3Jw4PztDM8+1q8/CRCUFvBs0qvjj9+BCJLq3HH+noJhgpgixsCwlY37jwlZcXeM
         jhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVukutWhp6tARYulnOUAtt0MokeX8spxIU6cxH5rvm8Z2qCBCQzZOiCLqDTxCuzPjJZX/t6P0WhriUgR9Z+dz3Tvor9outs0h+29S8wmyNO3TY=
X-Gm-Message-State: AOJu0YyDv1fr1xZIT+igSnKG4CKLg4gTKNfNA37dxfFsXkXqb6k85W0R
	Vsij8GBjNlYUewrf6WP/sWrtCBiLcVU0e/t4fRTdbhhdiHXrsIXyZ3b+nRq65giywhAyG0MjrkT
	3sdVZ5dGtktCQVSd4GyGRmZIfct0=
X-Google-Smtp-Source: AGHT+IFOl2eQUDEKSEnuYYa47BveettHtGVprWDJLdBW4K9i5zx/xcE0zrtkjZI3CKVRZqZEktcJne+RnreB2oNwZmc=
X-Received: by 2002:a17:903:2986:b0:1e0:b8b5:5037 with SMTP id
 lm6-20020a170903298600b001e0b8b55037mr10243634plb.69.1711920630781; Sun, 31
 Mar 2024 14:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240323231309.415425-1-martin.blumenstingl@googlemail.com>
 <20240323231309.415425-2-martin.blumenstingl@googlemail.com> <117365b8-ece1-4bc0-93f1-3e8c2861758d@salutedevices.com>
In-Reply-To: <117365b8-ece1-4bc0-93f1-3e8c2861758d@salutedevices.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 31 Mar 2024 23:30:19 +0200
Message-ID: <CAFBinCD3Uuchp7ezuML2c5DSuq+OdxG=mk7mjJk2YhetPk63bg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] iio: adc: meson: fix voltage reference selection
 field name typo
To: George Stark <gnstark@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	neil.armstrong@linaro.org, lars@metafoo.de, jic23@kernel.org, 
	linux-amlogic@lists.infradead.org, 
	"kernel@salutedevices.com" <kernel@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_143032_708169_62931EEC 
X-CRM114-Status: UNSURE (   8.72  )
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

SGkgR2VvcmdlLAoKT24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgMTI6NDXigK9BTSBHZW9yZ2UgU3Rh
cmsgPGduc3RhcmtAc2FsdXRlZGV2aWNlcy5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gTWFydGluCj4K
PiBUaGFua3MgZm9yIHRoZSBwYXRjaAp5b3UncmUgd2VsY29tZQoKPiBTaG91bGQgdGhlIHRhZwo+
IEZpeGVzOiA5MGM2MjQxODYwYmYgKCJpaW86IGFkYzogbWVzb246IGluaXQgdm9sdGFnZSBjb250
cm9sIGJpdHMiKQo+IGJlIGFkZGVkPwpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgIkZpeGVzIiBp
cyBmb3IgYWN0dWFsIGJ1Z2ZpeGVzLiBUaGVyZSdzIG5vCmhhcm0gZG9uZSBieSBhIHR5cGUgdGhh
dCdzIG9ubHkgdmlzaWJsZSBpbiB0aGUgZHJpdmVyIHNvdXJjZSAoaXQncyBub3QKZXhwb3NlZCB0
byBEVCwgdXNlcnNwYWNlIG9yIGVsc2V3aGVyZSkuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
