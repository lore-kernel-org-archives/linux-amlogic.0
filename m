Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAAAC77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WEbDZHqwO42b7Efvp8EC58wf3aNdIlin6ejixZrSps=; b=fbMyRNpoaGWtGV
	YV5AYxam2IuhQk/57x/Zy5f49L503VDvT6RwiJfHCnqTvqjXZOtvj72SJ9BZFvpm9WluS48OAwbmd
	09z1YhjV2r6fKU554TziJLW/qgbJNtWnQPaRUsMQZ9d7Ui1XELNHT5usyBgqXgkJ1KhpoSPbwavii
	PadYwaP5EgASW0EG2LPnKHFeZE3BK5zNfwTsRQcX4eBFppU3hQ8zsIATn5wi5IikgVO/pS/1KYDg6
	NHkhO7XS47cSABUW9YSKIK+R5tUpDTyMcrhflfYmqUYH/HYtNo5GK5FN7IMqsS2QoAJC/1t/xeXJi
	RP4fINrkyumFbecViSrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhHF-004HjB-1u;
	Wed, 12 Apr 2023 20:41:13 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhHB-004HiK-2P;
	Wed, 12 Apr 2023 20:41:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id ud9so31856676ejc.7;
        Wed, 12 Apr 2023 13:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681332065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmTn4okX9LMhUGLjcx12BLMMUvyQdi4ru6Z/q3wv2Tk=;
        b=Sjn1n/CrAAUqzuv5Z7X9Ev8IWeRw48fAxiNlHB0Yu/kVgOBLrQUMQ/k+d5HPTNfumR
         T5ngVBkmNjYXw2QhwlHnqSS2DpSYirS9TPc+YL4FKR8aJylPdQ8WIjT7I63bWGPfcA1V
         GIx88SgstrOhXGbMGR1L7CPUs9cpgYO9mstBqb8hwfXcHiQ03lF3FBjBLG55BLXTX6M6
         20pi09Lr70zyRFQ07QyfN7qYwF+K8jjuFwVs0tjH3Gr1UXvwqvI7xBInJ/tGaMDohMkD
         gIwYv+ptbgM80VrB1EW/XuktLkbN8Z6v1ZLi+UNBrBRYRA/LwRKrME44z7Jhxbnz/mNX
         slZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681332065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmTn4okX9LMhUGLjcx12BLMMUvyQdi4ru6Z/q3wv2Tk=;
        b=P2/imLZ4stc0wIVV90Yf5tupQIL6FecFsHGjyiinupqUHAFJzMW0SBQ+mNYeJtCSyk
         bA69TnO3A0SUdFku4kzXBMIW9M0lENvQN12JN9coEph9LcgxQzCwoi2nroJW0tHncS/s
         NYU5zN7NFzFKHNtL5loVhXvH/r8p92UL3faKrF6mjj44+CoWVaDGe0gzpJjjvUC4ImMf
         gCBPExyNb93tVYyJykoFPd1xVoSO8HMGuD+W7Uw5Ntkx5mqaeyqh6l9cKU2V0vG6r36B
         ariMzjK22iRjeB4xIDdDh1UFuHS7ORD9K96og4zeelb8W5QjfXhCEM8vl83O6C19I2n6
         8Eog==
X-Gm-Message-State: AAQBX9do3YM9FxAmb7WM2zU/oh3hZ3v5lYobo6cSGIY4bZA6i3/CwEaZ
	R9FV2XB89E9ytaOITCp4wbYblJguihKZDYvgGCI=
X-Google-Smtp-Source: AKy350Z2waaCpe8fjeWSSCCYhqnrAMpxatTSIzNcDu+s0HdyG+P1/z5s9D8e1V8Wxr/6pA/CEwjIwKTV+frQ6jWSgPQ=
X-Received: by 2002:a17:907:160c:b0:92f:cbfe:1635 with SMTP id
 hb12-20020a170907160c00b0092fcbfe1635mr118333ejc.6.1681332064761; Wed, 12 Apr
 2023 13:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com> <8a7c067d-b121-3bd0-b587-f53861b52bd5@gmail.com>
In-Reply-To: <8a7c067d-b121-3bd0-b587-f53861b52bd5@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 12 Apr 2023 22:40:53 +0200
Message-ID: <CAFBinCDMXT-a+XkmbmAsS3Tijv90KyFut=cUzj3L3r_XQbABBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pwm: meson: switch to using struct clk_parent_data
 for mux parents
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_134109_804476_4EE39DE3 
X-CRM114-Status: UNSURE (   7.83  )
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

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgOToyM+KAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gV2UnbGwgdXNlIHN0cnVjdCBjbGtfcGFyZW50X2Rh
dGEgZm9yIG11eC9kaXYvZ2F0ZSBpbml0aWFsaXphdGlvbiBpbiB0aGUKPiBmb2xsb3ctdXAgcGF0
Y2hlcy4gQXMgYSBmaXJzdCBzdGVwIHN3aXRjaCB0aGUgbXV4IGZyb20gdXNpbmcKPiBwYXJlbnRf
bmFtZXMgdG8gY2xrX3BhcmVudF9kYXRhLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpU
ZXN0ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xl
bWFpbC5jb20+ICMKbWVzb244Yi1vZHJvaWRjMSwgc20xLXg5Ni1haXIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
