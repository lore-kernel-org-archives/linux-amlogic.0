Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3114C7619A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THnP9DqXzwv9BX/2nTuwkEorb+tYKGvgT4iTRvwSrpo=; b=T9r3KE5G1PPdYq
	wGdYn4LA511a9PoPmAf2vpNJazVrDZTXcgN0wZRoE5ackA3ikT+Vk6x170v3Arozdi7Iah02RFeD7
	88Ei+U3/XBcFz+jYas4E8yDQ4ayHSHWNk+1Ypmkus5ulVEg3K52Jp/lVBYExYPVHbmErmXaVNQULZ
	3j8DKDF32luq+BLnTBVZPX6iSDwXNFFc/lbhMJMP2OTeLvYx7R+pgAbPxZOFoKzsgAq+6F+JmKBkF
	/6/I2EfL6JyCse3MDuA62z4+mUaKbGk/tvmobSRg8ztdVTDQA1f5IRijkB2wUQRowj5FZl2EEtcSy
	FKu50OakFgJlYEqNS18w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peJOH-009zdt-1z;
	Mon, 20 Mar 2023 17:33:49 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peJOC-009zcf-2V;
	Mon, 20 Mar 2023 17:33:47 +0000
Received: by mail-qt1-x82a.google.com with SMTP id t9so13999909qtx.8;
        Mon, 20 Mar 2023 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679333623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXSaEMxO//xDb01VhLRcgIDibiMarrc3dSvt5NdkJdk=;
        b=Kv5O7eIYUIDVR1s/OUCYMPA67AOmbDwCMPW0O4e90AdOPO0+oekkFaxAkBefI5cuEm
         3zyligDdaCZlwPmHNd3akg0tEbJpX7hHrAC7UaHrji+dxnB5u/OyPBJ2wwmSuD5+Cbt8
         M6441juL/ehm7FA/5Bz0D+LE4z6k6o631pVcb4E3UmUfo2ZifeHYCVnqQWOdjajDsoA8
         d/xkeOykvmiBpbU+ZUISmMAlwm6r97b63UqHZT+UkZLbKxcaC5QD8Cxe0fiWJ6vnDVVz
         RWxZFKPeAEk73TZe2P5CGyxQXISGwq2dsuwiUymMElviLHGzMokQBnB2mCLILaAI6oqO
         s0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679333623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXSaEMxO//xDb01VhLRcgIDibiMarrc3dSvt5NdkJdk=;
        b=ci9Rxf1HE7CdkSTbrrGty2CUHU253ouytXS7lreValsaAizzqA+/015kcKnIbs1duy
         xqo8WLkQKWdmM/r8KYlIH2dTENtc9/0CdR/7G0mh7bZRFbvnCMWEDYTe2x0CrhXKs+VR
         4ZvpmIgH1rFyUSFPyCWM6vFXbzQrH7lAaFk4MSEKXGvmTOZO8WkXcmEH6fXaWFre16L0
         8jV2nX1oHe3cdMLinRsT2iiTkMafT0kOc37GPOMZn3MXKCCkH9mlkyYMItQfOMmoZP8g
         NzH3DkfOUEY9xK6oF2wzcT92IZ8Zo5SqoJ0ZJlxz3G+TiHuL1LbPuQT2RwNnw9AfwciI
         j3qg==
X-Gm-Message-State: AO0yUKWk+CSonm+yvLAxIw9R93z/oBK3osGm8m21x4GupFYc+prr4T1o
	pu1A2HHmJk2UMA6Yopth7LZna6vLHb0Rzyzzt2I=
X-Google-Smtp-Source: AK7set8ybB+yy9E+1k2ql34NPcikwbSTX8j9oUU8GxCOtZAtNaYCnwvNLfHydJ7hbUAxnjgUe9NAOG/viPwP99Jg60E=
X-Received: by 2002:ac8:5612:0:b0:3bf:b844:ffc7 with SMTP id
 18-20020ac85612000000b003bfb844ffc7mr5062924qtr.12.1679333622758; Mon, 20 Mar
 2023 10:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
 <192db694-5bda-513c-31c5-96ec3b2425d9@gmail.com> <CAFXsbZo-pdP+b3iWyQwPe4FA4Pdxr-HO5-4rHB-ZLJApZyJ3DQ@mail.gmail.com>
 <bee01edc-b49a-427a-9ea2-cc194488a0f8@lunn.ch>
In-Reply-To: <bee01edc-b49a-427a-9ea2-cc194488a0f8@lunn.ch>
From: Chris Healy <cphealy@gmail.com>
Date: Mon, 20 Mar 2023 10:33:31 -0700
Message-ID: <CAFXsbZrkVQOL2ERa3TMTpOLdLJdRfh2kANohtN=oOHcXXMHjZQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: phy: smsc: export functions for use by
 meson-gxl PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, David Miller <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_103344_849241_0A380628 
X-CRM114-Status: GOOD (  12.29  )
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgNToxN+KAr0FNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1hciAxOSwgMjAyMyBhdCAwNTozOTo1MVBNIC0wNzAw
LCBDaHJpcyBIZWFseSB3cm90ZToKPiA+IE9uIGEgZGV2IGJvYXJkIHdpdGggU01TQyBMQU44NzIw
LCB0aGlzIGNoYW5nZSB3YXMgdGVzdGVkIGFuZCBjb25maXJtZWQKPiA+IHRvIHN0aWxsIG9wZXJh
dGUgbm9ybWFsbHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgSGVhbHkgPGhlYWx5Y2hA
YW1hem9uLmNvbT4KPgo+IEhpIENocmlzCj4KPiBUaGF0IHNob3VsZCBiZSBUZXN0ZWQtQnk6Cj4K
PiAgICAgIEFuZHJldwoKWW91IGFyZSBjb3JyZWN0LiAgVGhpcyB3YXMgYSBtaXN0YWtlIG9uIG15
IHBhcnQuICBJIHNob3VsZCBoYXZlIHN0YXRlZAoiVGVzdGVkLWJ5IiBpbnN0ZWFkIG9mIFNPQi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
