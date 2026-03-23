Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E587D58CBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/EyZOqBq4E5lb34QXFJfnxoVmce62JmrnWfi5HXf2JQ=; b=gs8Jmi3wghkGC7
	r6GUaZdO66DIUIEE/714i5PbzmEpuwzBI6ftzJLvfp/J5IxnX0gduMAQ+lWNRhgThWBynCd3Ogr+w
	s0C4ao96XWcetfw6HzasEim3B8AVNo38iqrKaXuFAwqYBrurTZFDU/xL9ap2jmbeLqg0rWCuT9L2B
	uDeosfsnwi7oTMYei3t3AxkuJp1Mb7WdQdtI03jyxESKufpfKGgGxt5VUupwPnUNxdSgnseoz9m18
	i2UaJDwXcgY78vJFJnWAPtWiBoJfoMgsBk1mPViUTfKVfFP6VN82e54XkV8F6p00xAOSM7wthBX0d
	QMm9OAIgJ2ZDrhGuUygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n08-000000001l9-0Txi;
	Mon, 23 Mar 2026 21:39:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n04-000000001kN-414J
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Mar 2026 21:39:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b04b4974abso6093735ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2026 14:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774301991; cv=none;
        d=google.com; s=arc-20240605;
        b=ibWk4tdLExT5W6hG17OCuzcGlBZtNmtEsx7bo50liUbts8L/jlggspIEslpnhk8XdK
         +MRoWO4bRK2qJvkad1CLF3CuYCKXeOLoCBZKFbaNvAjkmGWlCz7rzr6xzmPrGfd8yjCU
         lMIJ9zs4Bhk4RFB37TCp2KwQM58csi8e961YP6SRMBBsSybhXiLLS1kmw7qySHKABqQH
         oZzGvxv6Te/HwzKSmbye6YEAOqCxFCZ2NBxitYo599fNlWXyENW5EBblFfVNVHZVig8n
         7RGq/vjYqTvmPYVj5tnkKflvr9TbtnkNjtJ866yYbue3SCfBmoOoLy8TjGzNA9an/0JW
         +CPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        fh=ieUR1mSU81IDX7oZRVp15O7OMIozkfzy4Le18cjc6F0=;
        b=E7HvEl3LXHFaZfQ982YF5ArAvRkiN0I9SqUH66Yv/VefHEhoFdO9OWwTBwtPy3Ct21
         4g2zqDDuxOHrjwCgGiSZ0pO2YANTGUa/DUC55wl73EcrNGPrnpIRek1dH4TfJ2uXAH8h
         +uRrdlI7ZPW2WlgXm/7l6bRG8mFyGMRbvCRdOXzWGfjYS+ztvnW64gmZInWtKBmXEFee
         DhONaBtqy9zaDlQCF95Pmx7izknp0L3VpN9lLCUVM9veGTfuwjGVLiTyFh+y2j7DbSWk
         rACh4nlxo+n0Qq12TLL8FL6uWfmwLjvsVqrWcE7RA7PWXAUcMtcEaGqdOHUxHmPTSifo
         EY3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1774301991; x=1774906791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        b=lFb2abUCrBBzFk+KPpyGjebpRvtTlbj9imlpZBp5E6KBJ5EBcSGbTSVYn0m0UqChki
         HNqAhLaO1Cn+zHhyMcNNJcSWcfIy7bjFDxQKJTS9onclVjLz1YiyNWuu1CQyfhMyaSrO
         yCEx7OdC64fUiRRRQfD6ZYUkLsN9HzdHfG+ogvHRxbt/sj1/wuYxc+3wU1YHV2cJIspY
         bw87StTdSm9woOeehHTn91poH4Yjjjpj/qNiQzyX07zcaqQY48O3wLelV5r0k4u7hETO
         18ulVkGoaAOOimrlPUYvHyDBYVVaPzwTXqivrDVPJlyFc+tzbz+arpfH0eE3Obt47D3t
         ujHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774301991; x=1774906791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6yc22CdzcKPHhtv1K0lLqEnKtQNK1gApls0Ms/xK9XA=;
        b=BJ2uKWMCBSWVKLU3IxyG8Inl+GDgI1TIanqClw90LCvALeBSyUKJEbVv9MB/VcSCG3
         p8viUJAwX4YkEgB+s3RtD3L2OFcNbKasf6NfhULzk1aA0c195GTh8EYTuTeh5GKGTVME
         +2X/p8LOSvyBvHHIYYsdF8iTsZzNvKiIUbgZF+j9cQLblnOlAsVP7tjt/GvZhBol5WQy
         v2x97MP2cs/PlOqWNmWUXaNZnel5Pk984m7+pah9ccVxsqo6Ae/w/avP0a+1DgCJtg5j
         3hZ4Zbi0au2kFGJ2hHhHkiPeo07muaZiRyLAXs7/ShEzkRdvkf1AZzNn5m91TFOJRcaH
         a2nA==
X-Forwarded-Encrypted: i=1; AJvYcCUicpJeEQEHUCLK/fS+VYTGLUuMNpZ6E169pv1BhGrHZ0sypiD7zVPZG8ZhdxXhDm5HcLLeEJauDrgXWNuk@lists.infradead.org
X-Gm-Message-State: AOJu0YwPb5qQyOprx9dDJL7IfcmZea0rc94LkAF+x/fEnYyiu1VAWr4X
	vj42GzQtp4evpMpDFvdqnVj84xanq6++gQ+yftUJzmIRbGNNrZewDhbH19H+heXbtXJFY6EpGmH
	4moABgFiWApYD3ioEk/WoaT10xdmO/PU=
X-Gm-Gg: ATEYQzxBWrG7YMQdRBGmduM+Z4wyjwJI05D9grn3iGMvP5ri1A1bMNt4mQ/4VscvgE1
	ebH7tm7nhuLtxK9DVZpaHhqUU/w9uklInQjXa/93iJZRJzSigxRD3NHNQ477F/u7ifYoNNnJtHt
	sVVIaW858hK6nmPa3d5JWuJgUQ5Iewvvrl8EhvIKf61FhY6aMVHwMRE210htMYw9C/zrpWOD2Y+
	usfj3f9Ywe0R7BrGP7wiEXOc4w3bH6KgFrUXr0v3NV+PvU9XkI47YXMLrNjgdwzrBLQeni3E45N
	pfGY5J6re4RHJ1iQRCqrMvI/WHxwKmIF9454sQgC
X-Received: by 2002:a17:903:283:b0:2b0:5bfc:8af4 with SMTP id
 d9443c01a7336-2b0827a4001mr128486395ad.34.1774301991602; Mon, 23 Mar 2026
 14:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260323013408.429701-1-nick@khadas.com> <20260323013408.429701-2-nick@khadas.com>
 <20260323-saffron-cobra-of-perfection-731c8d@quoll>
In-Reply-To: <20260323-saffron-cobra-of-perfection-731c8d@quoll>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 23 Mar 2026 22:39:40 +0100
X-Gm-Features: AQROBzBHwpJgqdryfoMYgGeaKe0N_FLrFJ0DYVE2fe5meqjo8yYkKZdDC7I4VPA
Message-ID: <CAFBinCARQWQCjDFVyy3XOsae00KhcO2qpgLjH_r85cVxST6xtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_143953_004870_4FF424DF 
X-CRM114-Status: GOOD (  13.96  )
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

T24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgODo1M+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAyMywgMjAyNiBhdCAwOTozNDow
NUFNICswODAwLCBOaWNrIFhpZSB3cm90ZToKPiA+IEFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcg
Zm9yIHRoZSBTQVJBREMgKFN1Y2Nlc3NpdmUgQXBwcm94aW1hdGlvbgo+ID4gUmVnaXN0ZXIgQURD
KSBJUCBibG9jayBmb3VuZCBpbiB0aGUgQW1sb2dpYyBNZXNvbiBTNCBTb0MuCj4gPgo+ID4gVGhl
cmUgYXJlIG5vIGtub3duIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIFNBUkFEQyBvbiBTNCBhbmQg
dGhlIG9uZQo+ID4gb24gRzEyQS4gVGhlcmVmb3JlLCBpdCB1c2VzICJhbWxvZ2ljLG1lc29uLWcx
MmEtc2FyYWRjIiBhcyBhIHByb3Blcgo+ID4gc3BlY2lmaWMgZmFsbGJhY2suCj4KPiBZb3Ugc2hv
dWxkIGV4cGxhaW4gaGVyZSB3aHkgeW91IGFyZSBhZGRpbmcgdGhhdCBjb21tZW50LgpXaGF0IGRv
IHlvdSB0aGluayBhYm91dDoKQWxzbyBhZGQgYSBjb21tZW50IGluZGljYXRpbmcgdGhhdCAiYW1s
b2dpYyxtZXNvbi1zYXJhZGMiIG11c3Qgbm90IGJlCnVzZWQgZm9yIG5ldyBkZXZpY2VzLiBJdCdz
IGEgbWFkZSB1cCBjb21wYXRpYmxlIHN0cmluZyB0aGF0IGRvZXMgbm90CmNvcnJlc3BvbmQgdG8g
YSBzcGVjaWZpYyBoYXJkd2FyZSBnZW5lcmF0aW9uIGFuZCBpcyBub3QgdXNlZCB0byBtYXRjaAph
bnkgZHJpdmVyLiBGb3Igb2xkIGRldmljZXMgd2Uga2VlcCBpdCBhcyBpdCdzIHBhcnQgb2YgdGhl
IEFCSS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
