Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20C8C88E66
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Sep 2026 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkIY2rpytM16IMkm7vSai/mieY/paS9T0mi3HhZ0LDw=; b=zEHKwRqcm6/uir
	RXAbxJhCKT9+JOaMYFImZfE38ZQdm+Kwp2KKFTpP/BVD1+qBpgTdci8F9s2HJ9zGgekGSrGAw6Bhe
	n1mFHEx031cQaFkrW2aj1F9Kj4BzN7NbPYOxFCFN0psPkca5wrexskkCQLJFMvs73/C9O5yoRc0gW
	wOmZLVLWAiNqjDdTR2ZmWmuFhP7RO0XnxuSB46fDw5iJewBajljbAqpsGoKKZhNYtjyW5VBxLqLT+
	ZKh2r/ZX69BP6toBllzQLA3QuCFQPWRpGsiHe6cXHfnsV4oKOV61i3SsiUM44fF6pqxVxnc6hGD+w
	CJ1v6talhtaLfUv6EqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x647D-00000003Adr-1yWR;
	Mon, 14 Sep 2026 10:40:49 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x647A-00000003AcV-0eaj
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Sep 2026 10:40:45 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab2029eso1592364d50.1
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Sep 2026 03:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382441; cv=none;
        d=google.com; s=arc-20260327;
        b=TFik2Isr5GCSDpR3mjKZSQ302CMobuXTmcGBsmtAJ8tbGZaEkyEGQB2jynw56ApBnz
         4LluMwuuFgihu0GqVUbNtkSi9sn1ae+niIMN5aQMaRAd/g3jKxufDU0voZ2ndaAf2z/u
         sRY7AUj501i6UWacUOqoLzfadwffh+TpGLL42u4buYoDEbhZ+yzgloXUFNREbjiHlpwe
         sQfdu9aiR96q+HdUIDjmq/7Dp3AlxAtUcIRVjtdS65scMd3Im6GH0TkjyvWJHN3MANxJ
         RUsp52L7PUGnUU3rS/wKyrvF2bLRp1reh/Pw7vFpYed2WxyNnornA1vxTwXUc6gdKiNU
         ftzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        fh=MFpTC70Ei2EabUBC7UaCrPF0pqeqjN5I97OWBIIhYVU=;
        b=nBhjjZevbeiH6Ii/6qLZ5snWQidXBeqEW2rhqEy0ZB6jobAgtD9T51QN8lPJcIyfvR
         DgmoANZdIZMwFKLdDi75K/kGN/MUL2uoaXP9nrPvh+EN0xwdE8kLgJdxL0ndiuI2rSh1
         J1fiZoF8HKaztIms5n8yXlr3NtR/LQFSLyhcu6nXGz4dQX940KkxPcpHiHgtvK3AcypQ
         DcAYm/r48gm3klJQl557DRmiwkJoXjKD7Mrt7Rg7cAsE2NCn9/1k5XqLycHenbb242VI
         UI+MZiZObfIfUGmQ5OA08W1p/8eNiIa8m7mMzXvzvZbWpubvCSupzibYCjtOfXjOJvWg
         TXnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789382441; x=1789987241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        b=Fac4DNo3YrhEbM+CiKpp9iY2Az6uGf+y+jzL/n7SHpXipNxRf/5WLtKQBIBAV4HxCd
         c9oVyxtK66hYGuCtqwku7/1x2AmeDyeOCPwB07QP99pUDkGorb0kblo3fGfzvyj9O+gg
         tjVMlMVqtKTK0BeOKIXdIxgUkihz+O9mq7Mikvgk4cELCmuCxsaegJcRtyhnwdVWYRij
         8JDhMnCzPpkm3TbQlXOCvhqlSM2Ruj0stpeb56A7TaTfvQehrromCGA3u6HqYmqkxsKr
         xT2IqUqN03txtvscoiLdmypXC6AFWqvDqQ2ZWNV8y8dLlp5hJiT17FCL616z4MFphIsO
         9qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382441; x=1789987241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZXlPdTEAeBHj839T4HU9cpkm6eNyjon46e+njHBZo4=;
        b=VWYw3zUFpZ+KQz/ManAFdlLp8L8mk+D49HoqsXYjCzeu8QAnRqheiE4mqi/sIqcCrB
         UNC9ykHGiy6lcEI0i1gX25ac1QxxzgEuoGBCviL5IFflvG9c9SDarIX9OxA/tKKKAM7Q
         Sk9VRlLIIZ6qelZBCRlHyeoK0i37l0w2apENKTbXFfy/+bqPN5Zv1UDkh69GXLKdggqT
         V4uYxJUlMHRM+H8C5KUMgUNtvYembcmaMKR+B8rnscTF50ZB1fsNvxiUM++RTrfsQtz8
         7SrFdaviaA0fg/K2lBeXMi/hnFjh2TYXW5LLp/Lg68WzvG12lYaG/jAEWNFeB5Hn/4zU
         5gyg==
X-Forwarded-Encrypted: i=1; AKwUvByn8QaMHMOHn3VJfBnAxdBqBlkU0/Rj2eb/Tyw3YMNQZyskTkK102CKw9khlNgHMap1yVRLwteagRJtOC2j@lists.infradead.org
X-Gm-Message-State: AFuF++mc2tBd9I9TFvxoX372EGbGZKyoheRYIT2L0KJfW0Ip8hPC2o6W
	hVLK7BwzxhrMgNn4BI8P+G1OErd1U+DaxQiZ2hYJWrn9cQnnex8P4ujSiSIw3z3pDQ63UUtCSR7
	Fe87gVqNc/AvXoP/gZzsN2y5BcNiNASU55mbcgiQ=
X-Gm-Gg: AYBFou0UKW3YqU4KM58odiidrSV//4MoMxS6/zc+PL7uWMcdOrtGhG4nTlJfdHScX8U
	SW9eKFLV7Iv6RiPMHOPpFy4lBsu5A3UssX4m3rk3M7EDVrw3JM88h7IjfhG9/U6NWK3z5J/RdPJ
	HRzAI2NVUgwR5mgruyMTlECmWd+226KsYgqwqZriFRLSS6dHfWSHKs1Ge8WnlMMna5zaYgtYFl+
	j3xNSMDY8M+xHPbt9wePaBvD6GMP3rJbcK+0g14v/6X7olIPrSMiTMR3O1rm76RigrcKOoD1Ypy
	xCvGA2u1yjpacElOoaRuf2u07ExSImpp1oNZW07JEA8GMcHXzLFjoKWE29CZaY9JeuUtspQ19CL
	kdbieIqd0R3TKkFJEeq8ifU1B
X-Received: by 2002:a05:690e:144f:b0:671:1bc2:7f83 with SMTP id
 956f58d0204a3-6714e19664emr414645d50.75.1789382441505; Mon, 14 Sep 2026
 03:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
In-Reply-To: <20260914-a9-pwr-eth-v1-1-752005131135@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 14 Sep 2026 12:40:30 +0200
X-Gm-Features: AcwNN1WaZUZ01X5-U4jB8BOoolJJHZrM3FcxWuEUtBzFbxVHcUoB7XaLZqR-tLg
Message-ID: <CAFBinCCgvMbM5zf8OXFhjNRWjDMTjAVPu_BBJf1GRKp7JPqk=A@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: amlogic: Keep Amlogic A9 ETH domain always on
To: xianwei.zhao@amlogic.com
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Qingpeng Yang <qingpeng.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_034044_195581_9653E1ED 
X-CRM114-Status: UNSURE (   8.53  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMTA6NTbigK9BTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Pgo+IEZyb206IFFpbmdwZW5nIFlhbmcgPHFpbmdwZW5nLnlhbmdAYW1sb2dpYy5jb20+Cj4KPiBN
YXJrIHRoZSBBOSBldGhlcm5ldCBwb3dlciBkb21haW4gYXMgYWx3YXlzLW9uIHNpbmNlIGl0IGlz
IHJlcXVpcmVkCj4gZm9yIGV0aGVybmV0IG9ubGluZSB3YWtldXAgYW5kIG11c3Qgbm90IGJlIHBv
d2VyZWQgZG93bi4KSXMgIm9ubGluZSB3YWtldXAiIGEgd2FrZSB1cCBmcm9tIHN1c3BlbmQ/Cklm
IHNvOiBpcyB0aGUgRXRoZXJuZXQgY29udHJvbGxlciBsaXN0ZWQgd2l0aCB0aGUgIndha2V1cC1z
b3VyY2UiIGZsYWcKaW4gLmR0c3ssaX0/CkknbSB3b25kZXJpbmcgaWYgdGhlIHBtZG9tYWluIGFu
ZC9vciBwb3dlciAod2FrZXVwKSBmcmFtZXdvcmtzIGluCkxpbnV4IGhhdmUgb3RoZXIgd2F5cyBv
ZiBtYW5hZ2luZyB0aGlzIGNhc2UgKGUuZy4gb25seSBrZWVwaW5nIHRoZQpwb3dlciBkb21haW4g
YWN0aXZlIGlmIG5lZWRlZCkuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
