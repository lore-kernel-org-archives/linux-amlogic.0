Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE37AC76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 21:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCnVuy74vo4hXFAsyeYKkI20xUxiB5McJ8553/09O+s=; b=Odef4a9t9GgMQh
	Qes1/nPtAP8nDjAKaZZV4lI8a3fciNZy9fwBtNwcreJo/5IzU7vpYrAPM2/XHr7EerjHOyldupDhP
	4+RrG/BVzLQ6K7PNF/seiST+XsooMc66emkHZzO9eYu44pI6v3eEvsS52d5B9rtxvCOC0oMml8I4y
	4Ydy02/V5aEnKUSxvIAhl/Mh5A8PvhCbgjQgTZeAt/YEMGvXnxArtMt4hiZ2kOLBulq0VARTKN+8J
	x0fmpvKoiDdIt4qqC73pSI6RDfYu+S24+BN53lc3yJf61ctE7Tdzjy1ysSWgXOBe5ThWXYGI7zlBt
	OSFgrmNILh17r2wwwKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjRzk-00Gxm4-2C;
	Mon, 03 Apr 2023 21:45:44 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQzf-00GhPC-2A;
	Mon, 03 Apr 2023 20:41:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ek18so122386961edb.6;
        Mon, 03 Apr 2023 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=Kbu5MgByDTndcn6H3Aws06CMNmcOMzFALbLovTUHnI0Uev2htF7/kn5JTlkB6lrnau
         8tOqQjvKLhh+Hwa8uihkDI3GowEmwWGHHYTzZcSWIRUXNZGdvLjFyWBUHQqHOlxpp2Tb
         trrmVl6kZdUqhiUs02PWNjITiVchtI2OuDaqbY4A/xRwU4p3Oss4JKlVuIbUCm8yR8A1
         QecmQh3pkUZQpAYdmhG9SsKi8+GabL+P4AGWWysn5iL7zJdWtIUHBcYBJVJewexz8KiA
         gaby47c8HaV6KYJUnC/PjVSAUheAR4Vdr35lLcsRPkSgGze62tHhnYH9i/99BS46YPYH
         tVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=Hk456WumN7nr9CPkklJVQ8wshdR9qK+y2RgdITt9nlGqW2IdtHUieqo8FQ0RUtWKO/
         qYl2HdliwML6iLQojg1ccSPcr8F3yQ3yUt2/j1azIYL/0RmQvWrD/2lfEoavgq4ETNtW
         HAfS9/vB/TqVjtQQ8YWrbRSqYlutUUH1ZOI6cHxKDjZeJu7tFd1a+8xo7mEW7VyxiQ8X
         Oarllpur4KSit7T9/ldemGAuyQqTANEtqDgMrWGnJM6qTRcnHCz8jhJBZ4VjI5oTb35v
         CcOLM+j4/EDrKLpALRvLO3CnnTvTZQKN/XtsHohF+2IvGTVrczI3HG9Gw63P0OeVntiN
         FucQ==
X-Gm-Message-State: AAQBX9fbT03zMlqt0LkAtZvfY8ATTYj7G/zyhUkuCwDMu+G7dJJ9/KNG
	EiM267S0oqcTOhpzxlahdqgZTAdq8VGim70q+BM=
X-Google-Smtp-Source: AKy350Z8ucav5p+k2KypfUKA+RgsmB4zKBLSEuRb0SRzMNTxwzpo+JJYtwQqWaWP7Z26TaIRkKjw+6MMEanVvGAlftc=
X-Received: by 2002:a17:907:742:b0:92f:41e4:e48b with SMTP id
 xc2-20020a170907074200b0092f41e4e48bmr2768ejb.6.1680554493114; Mon, 03 Apr
 2023 13:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-110-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-110-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:41:21 +0200
Message-ID: <CAFBinCAWqafhJKh=W-WoLodzNeAf7o3GFhcfO4bVFA5UygLGGA@mail.gmail.com>
Subject: Re: [PATCH 107/117] media: meson-ir: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_134135_708831_A02E8832 
X-CRM114-Status: GOOD (  11.63  )
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

T24gU3VuLCBNYXIgMjYsIDIwMjMgYXQgNDozMuKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIC5yZW1vdmUoKSBjYWxs
YmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBt
YW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJy
b3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFs
dWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1
bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0
IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0
ZXAgb2YgdGhpcwo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9u
ZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMKPiB2b2lkLgo+Cj4gVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KUmV2aWV3
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
