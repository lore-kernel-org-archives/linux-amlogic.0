Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77677C38142
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Jan 2023 16:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gHGyvLnEuLByhNMnRAh+G6AhHYVxumLV5zN9bf8O+k=; b=3U/K68mZt0Q8ky
	WTrKJHddvczpZ5qi5O/wMgzOYU/D50S2w6txq3Q40N9aWShnwsT5Yb7V2/ta1zlk4YTykqZicpZls
	ZwtGqj3E/iS7BVZ6LrUxo0aAflSGggKmZzuI2WA9rv1VdxREpY7Sz9bACt198fEwnZ2kKdJXMQebJ
	7h09GQX6lyKPkwknh8FTwChQVXjszvCexkTG9nfTmyGVo+xFuHwxoT78L7nR3PUDnjGJPMt3/2PIr
	X2gVybOhGdJSYWX8T0h2LAdO1Chgz5yIGMX6jzQ0lUcK4oyRFk22bkMXgJa54/Ae606JNhosN+ldL
	J0GPAsAE4ERd5Jutsh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJdKz-00FXnY-GG; Sun, 22 Jan 2023 16:36:57 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJdKx-00FXnE-1C
	for linux-amlogic@lists.infradead.org; Sun, 22 Jan 2023 16:36:56 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id i82so4892264vki.8
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Jan 2023 08:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJWD9fNRql4r+FdNClPuXwTSq8NL9dnNAjk5Zb3ZbRU=;
        b=m7xNlFGXPSZEaGfwwArDy6FFm5xr7yfDh+LSyAaFeyBp3dbJtpmjP0tLRB8YThJz+a
         yhR2C2KD8vQqJ09vATyRkSoGCxowNW2ayVMGSKzTiQogEaRqbvcbDhC0zOamiV2qhYj3
         flA+OXVjaBF1qae+mzBtIjJOU0cG9UlZdK5m2nt6HtnzDvHAMdDs6eFDTP/wqgbLJ7TY
         YA8/QZFkGqxPqyOcZtlLihG9c/MWDm4+X2jy6ZVEtNOqxvmHdH25edqeqhp9BfSHLnfg
         piLaKFDuJILiFAO6FI2/0vfvSt5pMGkaydUnJH0Mn4qBJDlDB7wP2nMNRIPaVp5bYYIB
         gSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJWD9fNRql4r+FdNClPuXwTSq8NL9dnNAjk5Zb3ZbRU=;
        b=1oCaYsYC0yxWbaoijAZv9vM/IiTKCDnZ3SLKbuCLJaO54bF6Wr5bkGXXnXRxzFi3Pq
         kTU/pvk19qYhJ9XxS5j1kxdrS3a0XKW50IzocKadT2XV5N2+jycIDXTI1lMzfXV/74Ht
         m8eeDKr9Jj3eDI6LQQWr1m6qqgMLZOPfemdh1qcg98uFA2ApkXkBjJl41bEWwROxfCfL
         DYvDZD83T4KseQrx8pJSaNYyYeqHF02gu++cVkclyLVWD4g80nTGLvpmcaIUjczb1xHn
         a1MECi4y7ipbfEobCa+FDJt7RGzGWR6D82T2swhvvyw9kFzsUcOnQPwhr+ZShnU4znJ6
         z5EQ==
X-Gm-Message-State: AFqh2kofMst72Nwf68TAmU7AyftbYCHCul9KNiwj7QuTrIIWx+ZTlo1J
	Yfk/hlRUfsSfEs6jHe+DPH82qiFLelX4n+XHt0s=
X-Google-Smtp-Source: AMrXdXv2ySl5qSksPTYwfo405NsCWqpKz/AdfQR1Y7/ZjlbCB1tST0atKbOm8aqBh+PL29l/5hW9kavKDDW2cxDeiVw=
X-Received: by 2002:ac5:c917:0:b0:3d5:542b:7857 with SMTP id
 t23-20020ac5c917000000b003d5542b7857mr2965545vkl.29.1674405413458; Sun, 22
 Jan 2023 08:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20230121175639.12818-1-linux.amoon@gmail.com> <665b1349-531b-2c6b-8711-1300ecd42b7f@linaro.org>
In-Reply-To: <665b1349-531b-2c6b-8711-1300ecd42b7f@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 22 Jan 2023 22:06:38 +0530
Message-ID: <CANAwSgQXQZkBoK0N693Rgf5mZexhA-1GK8DEosr_AaEsLp=5kw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Used onboard HUB to reset and add power to hub
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Johan Hovold <johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_083655_114224_812ABCEF 
X-CRM114-Status: GOOD (  15.16  )
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

SGkgTmVpbCwKCk9uIFN1biwgMjIgSmFuIDIwMjMgYXQgMTU6NTcsIE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhpIEFuYW5kLAo+Cj4gTGUgMjEv
MDEvMjAyMyDDoCAxODo1NiwgQW5hbmQgTW9vbiBhIMOpY3JpdCA6Cj4gPiBBbWxvZ2ljIGJvYXJk
IHVzZSBncGlvLWhvZyB0byByZXNldCB0aGUgVVNCIGh1Yi4KPiA+IHNvIHVzaW5nIG9uYm9hcmQg
aHViIHdlIGNvdWxkIHJlc2V0IHRoZSBVU0IgaHViIGFuZAo+ID4gYWxzbyBlbmFibGUgcG93ZXIg
dG8gdGhlIFVTQiBodWIuCj4gPiB2MzogRml4IHNvbWUgc21hbGwgY2hhbmdlcyBpbiAkc3ViamVj
dAo+ID4gICAgICBhZGRyZXNzIHRoZSBpbnB1dCBmcm9tIE5laWwKPiA+ICAgICAgZml4IHRoZSB2
aWFsYWIgZGV2aWNlIHRyZWUgYmluZGluZyBhcyBwZXIgS3J6eXN6dG9mIGlucHV0cy4KPiA+Cj4g
PiB2MjogT2Ryb2lkIEMxIC8gQzIgOiB1c2IgaHViIHJlc2V0IHdvcmtpbmcgYXMgZXhwZWN0ZWQu
Cj4gPiAgICAgIE9kcm9pZCBOMiA6IGRyb3BwZWQgdXNiIGh1YiBjaGFuZ2VzLCBzaW5jZSBteSBi
b2FyZCBVU0IgaHViCj4gPiAgICAgICAgICAgICAgICAgIGlzIGhpdHRpbmcgcmVncmVzc2lvbi4K
PiA+ICAgICAgT2Ryb2lkIEM0IDogRml4IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGFuZCB1c2Vk
IHBlZXItaHViIGZvcgo+ID4gICAgICAgICAgICAgICAgICB1c2IyLjAgYW5kIHVzYjMuMCBodWIu
Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMTE4MDQ0NDE4Ljg3NS0x
MC1saW51eC5hbW9vbkBnbWFpbC5jb20KPiA+Cj4gPiB2MTogT2Ryb2lkIEMxIC8gQzIgOiB3ZXJl
IG5vdCB3b3JraW5nIGFzIGV4cGVjdGVkLgo+ID4gICAgICBPZHJvaWQgTjIgOiB1c2VkIHNpbmds
ZSBVU0IgMy4wIGh1YiByZXNldC4KPiA+ICAgICAgT2Ryb2lkIEM0IDogdXNlZCBzaW5nbGUgVVNC
IDMuMCBodWIgcmVzZXQuCj4gPgo+ID4gWzBdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1hbWxvZ2ljL2xpc3QvP3Nlcmllcz03MDcyOTIKPiA+Cj4gPiBBbnkgaW5w
dXRzIGZvciB0aGVzZSBjaGFuZ2VzID8KPgo+IE1vc3Qgb2YgdGhlIHBhdGNoZXMgaGF2ZSBiZWVu
IGFwcGxpZWQgYnkgR3JlZywgc28gcmViYXNlIHRoaXMgc2VyaWUgb24KPiB0aGUgbGFzdGVzdCBs
aW51eC1uZXh0IGFuZCBzZW5kIG9ubHkgdGhlIHJlbWFpbmluZyBwYXRjaGVzLgo+Cj4gTmVpbAo+
CgpPay4gVGhhbmtzCi1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
