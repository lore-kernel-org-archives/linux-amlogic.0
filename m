Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06202C77B73
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADEomTIiQWKegq2TykfxO9CxNbuyuMFcXX3Y4lCYukM=; b=RRZtqrqqPHx4ub
	raI4ddIW8kySS0jyTzLi1ycUgLamL9OSKcEV0aQD/WDOajBaR4PcUsA6B+6E759/Qk8IqJ3dGtvSH
	hwxew0ZCF9/tkm1yKgWGca/7mD8Vel4GNZLoJNsraqcsPXoIkoC5FUtG7cyA63r4cXsiXdlKyXGHS
	qK+FNjEZEZpAWlB8+GEd0iqKLZCT+xibpSkvbB3xERv/4FXXjP+5yawUCLDzJGMTOw4UOl1wBru3b
	vEodQY/H6a50Sh6z4K7IXlQ2l6sCcoLQQGGx1EFApzWFLnVtBWuhkeap3pYMZIvq/pWaEc5UAN4jc
	rgPb43JoaHYL8iEykTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptTky-00G5Aq-0Z;
	Mon, 01 May 2023 13:39:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptTku-00G5AH-0V;
	Mon, 01 May 2023 13:39:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f1950f5628so24082275e9.3;
        Mon, 01 May 2023 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682948389; x=1685540389;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tlhw3R1Et9Ige2ykqVvApm57kkVujOZ5DEuJEE6AOc0=;
        b=YDREZu/Bm+VSwBEMJ/BTbU7Z7S4jzPjNbubNRvsoRJMO23Xy3AzcROpIdYZEK7PteC
         TvFYX6bWVi+IEqeoq4M0qLmGjpR4m1S757qx3VQBmMmaL7y2fIKj9LYhQA8i4IXI/EsD
         xFgsoocSOCzobnZB+UdUZOlcdRr/MqN+obcP7Iol2Af13TYxpe2/dfK2ubF3OoYzKmW0
         rT92W7UXo6bvr8a2j0FxFkFU7SiMWQiT2roDa7ZNDze8wGKaJvf6yp1VY4vYYrcZ83iu
         dia3VaKueAv0D3hZ83j0fzQ4xCpW4iieALe5gzq4x2IcE50Wp9/Qa1clBRzAG/biMm0j
         jGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682948389; x=1685540389;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlhw3R1Et9Ige2ykqVvApm57kkVujOZ5DEuJEE6AOc0=;
        b=hruCAc19+kB9xjbUOpEjC/HPAwVdl2bOCC8fAVf8IF/XuXkD58NaLil8WkvoQF6njy
         ki4x0Mh/ejj/g0aLZReea9v1UYhg7Afk/kxtuh3c+Bd93/8k/NSb7oo/cLBB5fOb7R6d
         6SiycNFyHXKfBAWfDEgyDaG2/j4pPOSp8JrPB4CGPHOBHbjQLTVk6Uo7gRAtWYhsJ2Cr
         ww/OW8ewwpFxvKtjgQisgrMASEK1fiK3vfxXNf8iHD2Y++PF46ZWaI5iYfyxPzKcYnuk
         lNI3YSNAp88ZQmkIVCrHhXwR9gdf5T55uLC3WYaYPtp8e9v1s1L7MxIwSYCezTqsXpOY
         D7YQ==
X-Gm-Message-State: AC+VfDz+PXT4YV1Qy46Ahg004iTiNhgpvVJlQ1cG7GbzKgqIWuhQMpbg
	H6JQhmGRaE3y0qlVK4/LRJ8=
X-Google-Smtp-Source: ACHHUZ6wXgWBbnI/BnI9hDArcOeffNTl2MwnkytVZA2jcyW+uh+BfttVKQeL0+wUUoe2i4z5VN7cqA==
X-Received: by 2002:a7b:c008:0:b0:3f1:7a18:942e with SMTP id c8-20020a7bc008000000b003f17a18942emr10254471wmb.6.1682948388871;
        Mon, 01 May 2023 06:39:48 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9bd:5800:60ec:422b:628c:6ca5? (dynamic-2a01-0c23-b9bd-5800-60ec-422b-628c-6ca5.c23.pool.telefonica.de. [2a01:c23:b9bd:5800:60ec:422b:628c:6ca5])
        by smtp.googlemail.com with ESMTPSA id x8-20020a05600c21c800b003f2390bdd0csm23781162wmj.32.2023.05.01.06.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 06:39:47 -0700 (PDT)
Message-ID: <7cacf0f4-099c-766d-5757-cc3813ec09a8@gmail.com>
Date: Mon, 1 May 2023 15:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: neil.armstrong@linaro.org, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org
References: <9faca2e6-b7a1-4748-7eb0-48f8064e323e@gmail.com>
 <cb79d313-c7a2-42e9-639a-63cb5366521a@gmail.com>
 <ca531c1a-3c62-5fb1-6765-68ec1e541483@linaro.org>
 <73a52391-b380-e491-0e96-5c51c7be487c@gmail.com>
 <22b6f870-8dfd-c01b-a7cd-383a9d9ece20@linaro.org>
 <872b3270-8319-6b4d-9d52-1da0b58d4e19@gmail.com>
 <229e20ef-6e99-6d52-b0e6-a357a184b6af@linaro.org>
 <87f14a9d-f341-d694-f567-7f9e78666b5d@gmail.com>
 <CAFBinCAF4oc+FoG8CtQhpSHSAkODQFXGbt5OvtprGSb4s+fWqg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v4 4/4] pwm: meson: make full use of common clock
 framework
In-Reply-To: <CAFBinCAF4oc+FoG8CtQhpSHSAkODQFXGbt5OvtprGSb4s+fWqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_063952_218413_1C444935 
X-CRM114-Status: GOOD (  17.45  )
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

T24gMjMuMDQuMjAyMyAyMjo1OCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBXZWQs
IEFwciAxOSwgMjAyMyBhdCA5OjU44oCvUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4+IFRoaXMgaXMgYSBoYWNrIGJhc2VkIG9uIGN1cnJl
bnQgY2xvY2sgdmFsdWVzLCBlaXRoZXIgZXhwbGljaXRseSBzdXBwb3J0IGEgY29kZSBwYXRoCj4+
PiB3aGVyZSBwcmVfZGl2ID0gMCBvciBpZiB5b3UgY2FuJ3QgZG8gdGhhdCB3aXRoIENDRiBpbXBs
ZW1lbnQgdGhlIHBpbmN0cmwgd2F5IHRvIGhhbmRsZSB0aGlzLAo+Pj4gd2hpY2ggaXMgdGhlIGNs
ZWFuZXN0Lgo+Pj4KPj4gVG8gbWFrZSBpdCBleHBsaWNpdCB3ZSBjb3VsZCByZXF1ZXN0IFVMT05H
X01BWCBhcyByYXRlIGluc3RlYWQgb2YgMUdIeiwgdGhpcyB3b3VsZCBpbXBseQo+PiBjaG9vc2lu
ZyBtdXggcGFyZW50IHdpdGggaGlnaGVzdCByYXRlIGFuZCBwcmVfZGl2ID0gMC4gVXAgdG8geW91
IHdoZXRoZXIgdGhpcyB3b3VsZCBiZQo+PiBhY2NlcHRhYmxlLgo+IEkgbGlrZSB0aGUgaWRlYSBv
ZiB1c2luZyBVTE9OR19NQVggYXMgSSBmaXJzdCBoYWQgdG8gdGhpbmsgYWJvdXQgd2h5Cj4geW91
IGNob3NlIDFHSHogaW4gdGhlIGRyaXZlci4KPiAKPj4gQUZBSUNTIHBpbmN0cmwgd291bGQgbmVl
ZCBxdWl0ZSBzb21lIERUUyBjaGFuZ2VzLCBhbmQgaXQncyBub3QgbXkgYXJlYSBvZiBleHBlcnRp
c2UuCj4+IFNvIGl0IHdvdWxkIGJlIG9wZW4gd2hvIGNhbiBpbXBsZW1lbnQgdGhpcy4KPiBNeSBv
cGluaW9uIGlzIHRoYXQgdGhpcyBjYW4gYmUgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLiBXZSBu
ZWVkIHRvCj4gd29yayBvbiB0aGlzIHdob2xlIHRoaW5nIGFueXdheXMgYXMgeW91IG1lbnRpb25l
ZCB0aGF0IG5ld2VyIFNvQ3MKPiAoZnJvbSB3aGF0IEkgdW5kZXJzdGFuZDogRzEyQSBvbndhcmRz
KSBoYXZlIGEgZGVkaWNhdGVkICJjb25zdGFudAo+IG91dHB1dCIgYml0IHdoaWNoIHdpbGwgbWFr
ZSB0aGUgcGluY3RybCBzb2x1dGlvbiB1bm5lY2Vzc2FyeSAoYXQgbGVhc3QKPiBiYXNlZCBvbiBo
b3cgSSB1bmRlcnN0YW5kIGl0KS4KPiAKQWdyZWUuCk15IHVuZGVyc3RhbmRpbmcgb2YgdGhlICJj
b25zdGFudCBvdXRwdXQiIGJpdCBpcywgYmFzZWQgb24gdGhlIHZlbmRvciBkcml2ZXI6ClcvbyB0
aGlzIGJpdCB0aGUgY2hpcCBpbnRlcm5hbGx5IGluY3JlbWVudHMgdGhlIGxvIGFuZCBoaSB2YWx1
ZS4gTm90IHN1cmUgYnkgdGhlIHdheQpob3cgdGhlIGNoaXAgaGFuZGxlcyB2YWx1ZSAweGZmZmYs
IHdoZXRoZXIgaXQgb21pdHMgdGhlIGluY3JlbWVudCBpbiB0aGlzIGNhc2UuClcvIHRoaXMgYml0
IHNldCB0aGUgY2hpcCBkb2Vzbid0IGluY3JlbWVudCB0aGUgdmFsdWVzLCB0aGVyZWZvcmUgbG8g
LyBoaSBjYW4gYmUKZWZmZWN0aXZlbHkgemVyby4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRp
bgoKSGVpbmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
