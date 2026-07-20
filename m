Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A2EC4451B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 09:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWHtfiMmNuXzp/K0utUQzNKyImetDzO0VghNkqkCZ/k=; b=VY1Wn12rEeqLL4
	icD2csHqRvh1ozsRfYFKnIzd/yA8zziBEBJ+DU1oT+XTy0RWV8QtHGB9xV+IfQobpPFU5/+zmg/9z
	Ji+08FifzA9QyK5JFffekexAYq7GgFNDdBoX38wzeZwHNaYisoaM96tGiwR8UzQc1mbd4pBWVdYc8
	tgytRA9asEr6THdtwfBkTrYHc/0chHtw9cRoewERcIMyqcR9Xf39xzIzq9tPAqWGatD7z+d3yMEtA
	bCXQdzrUc8Yl4eV9kWXJIqypA2qTsU8UYesY8+14oXf+hqirFEttBKw+pSxPAIcBQNZaLvBObMQ19
	ipJM6WKyF5DTp/WBjc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBP-00000006HyT-0rf6;
	Mon, 20 Jul 2026 09:21:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkBM-00000006Hwv-216l
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 09:21:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487b7b3fc7so3738951b3a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 02:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784539263; cv=none;
        d=google.com; s=arc-20260327;
        b=UlID57Dr+2PEa5Ov1Y3GoGLeKVLsTX0GBXrnYhFPON24OjImnBL7jMOMHqSlwZu/Ce
         xP5+C0o9P2bq6R0oFvyKtSAowT61jO4XljJMr1VGRX7thgDCR9i6HF53+IeJrYpimS5i
         PapPEYeKn0t+d2wxIO2DsgBH/tEm1FVngweVogoatgPhiRdgkLNEdWZPlmpBg0TRfXNv
         2UDjZ/a4wo1ImQjlaLmrR86tu+QkBCgLq7owqeze90aL7NfjAu0bKHA1QZ/7G0c0K6zp
         XZGc7sI4X2vPrlANACGX7WiSXxqFH4Nx8k3iEeInITFUW6X4mTz5wiuU1jkZ1xvvKPF1
         1Uvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        fh=Vnzyj4A7B32C8VYy4FfB05r1Tjke8rK+tJ7GCRECOEc=;
        b=jlW5+mVcvmh/hhBMbhu5KBcnL5JeqLtbHjicYuwePD8ifMd0qc6DDgfocLFyNE4Xu6
         rGEqakL8U2Y8iLx2uQA551xzpYNS+lfH1r7dEw60R0Qjn6aFBhvo1/dyL5A+85Yyt08S
         ixEv+W9PJJcInJZbz9VQeldhjOnnyOJyy5FX8TvIAsyfwn2Lb4NWlmxhRuan3lXe1cWq
         PVxFBkkCc5bmP8/y9n6KyH7Pn+mz2nJXHSu0a6fPub3pcns1ZfGCydthI5MtsnaqCSzT
         ysNW3LZ6IZO8WqOu7SN+MHV2sVQz9ksWf5C1/p0v/0Pwprp+kxBpw/7alOB0PiN765WJ
         jV2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784539263; x=1785144063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        b=Mt916OKL4kVOC4pFGF7tByeATa/YmemQ5rKFAA6NyeXycCSUhJAfUUr+qv4erKmqQv
         DKp0e/WfhIfQgEBsYFAxdtkGppyQxe54UVoTp4bL/Ma/HxU+RDX8mh4LVoNZTkt203jE
         xe+Nlc0/RgWYesqyFiBWwFnLPTZS+yYJSYnkrv3n67aXCDNeYNuVTw0t0cCRroDTAaIX
         3BDX6zffpUEbXJWYuD3+LNvu2h7do8hdQXJcT40texQSbuKh+/C9eTrFAfEWNwJL+p5O
         gCJXuc5rYyxcLA3nXnGJ4ilOAx04C8iYaxqweXuzGD+diykwfx7nUyKAR/oEiHu4a8Wc
         y+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539263; x=1785144063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFQlNZKrCEhOc+6aXOTGSVDcwURJmp18SbzxbmbgH5Q=;
        b=R+teXT9T9nqNPN7ZBSyPdK1O4ZbpPwUTiddyx9arYRS99FM35pcQC+L5nahxzLIK5D
         pQ45fvn/xx3TmaKVq3JMTFoiAN2P6Y+rxKxStbdbJ5GgJovsY8DlX5STvK0SGgCbJ6bD
         kbyGiboUg2VQwvBvFFPPjflXFw9n2GkHIgdLlSDPduGdHH4D+zLZNlRi8I2orVBE/5T9
         MdESbbsEbjT6YkFx2yvsNz1ai72hgSFo654ZZA9V1tLO1BdBeuXabc8W0pJPOYTJXd1g
         Ekzvdq9iJJcmjHPnvvoVAcvKRSErITyhVgfNoVMp8miwiinf4o36p5gTaumu3/1ATk3b
         HFqg==
X-Forwarded-Encrypted: i=1; AHgh+RpEhwDuDv8JVsFLFb7nGxtdD8vz1jxm9trnFJ1ZfUwoGrI4gfLXSTFKq4WUIzsplROParcsnWwX5B9k8XCc@lists.infradead.org
X-Gm-Message-State: AOJu0YzkyvRhKGkiAqyhTTlEbBzsuEy/otB2kFNoZijQ7nFVuib5GJU4
	eAXPwAex6tmrM3rVZgHgYG+RYGGYymfcdypBt3eJyuXZ1oIRC3wivyj+N2ucED6QtbESU8WvBAo
	Kb1T7QeIShxFmeJAtZxB586wcVgOaBGXWmE59xVIRZw==
X-Gm-Gg: AfdE7cnJqmp3ByKft+FJJpwlLq7kE+oh6C+t/CxCZVDj0G+xHHtCR7Cy8gK5sVDMqDy
	CMi1yDzyg48oW28jqucLvh3fS9qPhg1YoQD9/R/EW5pDTDcwbZqQItuFrTAmjp6JjdjE5XeAU1T
	55an3lfSRKWxkpGVIk5cv9yn7IbAOzm9UbQ2Wo+43D7f6A3q28mET4sdUFsJSMupFbt0RwSXRVu
	qj42IS+1Ymb9elSLWyrP66ozFth8RlhY59Qp+UScRctSEiypDSRUd00gDWa1ro=
X-Received: by 2002:a05:6a00:3d4b:b0:848:7784:37d6 with SMTP id
 d2e1a72fcca58-84c295526eemr13782465b3a.58.1784539263267; Mon, 20 Jul 2026
 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260717-pwm_meson_convert_to_waveform_api-v1-1-d7dbdae1318d@baylibre.com>
 <20260717192735.3E71E1F000E9@smtp.kernel.org>
In-Reply-To: <20260717192735.3E71E1F000E9@smtp.kernel.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 20 Jul 2026 11:20:50 +0200
X-Gm-Features: AUfX_myvcar7qwuq7Xpd8sJoS8D_uPqo1YRJ3UYnt0Ec3GkeZR_OjanqrOWTVXw
Message-ID: <CAFGrd9rnPVAhiTJi964t0AH=1S8sjDWhy1U2iBs3aaQ=zk+85A@mail.gmail.com>
Subject: Re: [PATCH] pwm: meson: Convert to waveform API
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022104_532299_03DAC155 
X-CRM114-Status: GOOD (  22.23  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgOToyN+KAr1BNIDxzYXNoaWtvLWJvdEBrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkg
cmV2aWV3IGZvdW5kIDIgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hd
IFRydW5jYXRpb24gZXJyb3IgaW4gaGFyZHdhcmUgd2F2ZWZvcm0gcXVhbnRpemF0aW9uIGJyZWFr
cyBsZWdhY3kgcG9sYXJpdHkgaW52ZXJzaW9uLgo+IC0gW01lZGl1bV0gSW5kZXBlbmRlbnQgcm91
bmRpbmcgaW4gd2F2ZWZvcm0gcmVhZGJhY2sgcHJvZHVjZXMgYW4gaW52YWxpZCBzdGF0ZSB3aGVy
ZSBkdXR5ICsgb2Zmc2V0ID4gcGVyaW9kLgo+IC0tCi4uLgo+ID4gKyAgICAgaWYgKG1lc29uLT5k
YXRhLT5oYXNfcG9sYXJpdHkgJiYgZHV0eV9jbnQpIHsKPiA+ICsgICAgICAgICAgICAgdTY0IG9m
ZnNldF9jbnQgPSBtdWxfdTY0X3U2NF9kaXZfdTY0KGZpbl9mcmVxLCB3Zi0+ZHV0eV9vZmZzZXRf
bnMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBOU0VDX1BFUl9TRUMpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAg
ICAgICAgKiBXYXZlZm9ybXMgd2l0aCBkdXR5X29mZnNldF9ucyArIGR1dHlfbGVuZ3RoX25zID09
Cj4gPiArICAgICAgICAgICAgICAqIHBlcmlvZF9sZW5ndGhfbnMgYXJlIGltcGxlbWVudGVkIGJ5
IGludmVydGluZyB0aGUgb3V0cHV0Ogo+ID4gKyAgICAgICAgICAgICAgKiBUaGUgc2lnbmFsIHRo
ZW4gaXMgbG93IGZvciBoaSBjb3VudHMgKHRoZSBvZmZzZXQpIGZvbGxvd2VkCj4gPiArICAgICAg
ICAgICAgICAqIGJ5IGhpZ2ggZm9yIGxvIGNvdW50cyAodGhlIGR1dHkgY3ljbGUpLiBPdGhlciBu
b256ZXJvCj4gPiArICAgICAgICAgICAgICAqIGR1dHlfb2Zmc2V0X25zIHZhbHVlcyBhcmUgcm91
bmRlZCBkb3duIHRvIDAuCj4gPiArICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICBp
ZiAob2Zmc2V0X2NudCAmJiBkdXR5X2NudCArIG9mZnNldF9jbnQgPj0gY250KSB7Cj4KPiBbU2V2
ZXJpdHk6IEhpZ2hdCj4gQ291bGQgaW50ZWdlciBkaXZpc2lvbiB0cnVuY2F0aW9uIGNhdXNlIHRo
aXMgY2hlY2sgdG8gZmFpbCBmb3IgaW52ZXJ0ZWQKPiB3YXZlZm9ybXM/Cj4KPiBJZiBkdXR5X2Nu
dCBhbmQgb2Zmc2V0X2NudCBhcmUgY2FsY3VsYXRlZCB3aXRoIGluZGVwZW5kZW50IHRydW5jYXRp
b24sIHRoZWlyCj4gc3VtIG1pZ2h0IGVuZCB1cCBzdHJpY3RseSBsZXNzIHRoYW4gY250IGV2ZW4g
d2hlbiB0aGUgb3JpZ2luYWwgbGVuZ3RocyBzdW0gdG8KPiB0aGUgcGVyaW9kLgo+Cj4gV291bGQg
dGhpcyBjYXVzZSB0aGUgZHJpdmVyIHRvIGluY29ycmVjdGx5IGZhbGwgYmFjayB0byBub3JtYWwg
cG9sYXJpdHkgd2l0aCBhCj4gemVybyBvZmZzZXQ/Cj4KCkF0IGEgc3ViLWNvdW50IGJvdW5kYXJ5
IGZsb29yKGR1dHkpICsgZmxvb3Iob2Zmc2V0KSBjYW4gYmUgY250IC0gMSBpbnN0ZWFkIG9mCmNu
dCwgc28gYW4gaW52ZXJ0ZWQgcmVxdWVzdCBjYW4gaW5kZWVkIGZhbGwgYmFjayB0byBhIG5vbi1p
bnZlcnRlZCBzZXR0aW5nIHdpdGgKZHV0eV9vZmZzZXQgcm91bmRlZCBkb3duIHRvIDAuIFRoYXQg
aXMgYSB2YWxpZCByZXN1bHQsIG5vdCBhIGZhaWx1cmU6Ci5yb3VuZF93YXZlZm9ybV90b2h3KCkg
bXVzdCByb3VuZCBldmVyeSBxdWFudGl0eSBkb3duIGFuZCBvbmx5IGhhcyB0byByZXR1cm4gYQp3
YXZlZm9ybSBub3QgZXhjZWVkaW5nIHRoZSByZXF1ZXN0IChzZWUgdGhlIGNvbnRyYWN0IGFib3Zl
CnB3bV9zZXRfd2F2ZWZvcm1fbWlnaHRfc2xlZXAoKSBhbmQgcHdtX2NoZWNrX3JvdW5kaW5nKCkg
aW4gZHJpdmVycy9wd20vY29yZS5jKS4KZHV0eV9vZmZzZXQgMCA8PSByZXF1ZXN0ZWQgZHV0eV9v
ZmZzZXQsIHNvIHRoZSByZXN1bHQgc3RheXMgd2l0aGluIHRoZSBjb250cmFjdAphbmQgQ09ORklH
X1BXTV9ERUJVRyBhY2NlcHRzIGl0LgoKVGhlIHNhbWUgY291bnQtYmFzZWQgdGVzdCBpcyB1c2Vk
IGJ5IHB3bS1zdG0zMi5jIChkdXR5X3RpY2tzICsgb2Zmc2V0X3RpY2tzID49CmFyciArIDEpLiBT
byB0aGUgY29uc2VydmF0aXZlIGNvdW50LWJhc2VkIGNoZWNrIGlzIGludGVudGlvbmFsLiBObyBj
aGFuZ2UuCgo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIHdmaHctPmhpIGFuZCB3Zmh3LT5sbyBh
cmUgdTE2LCBzbyB0aGVpciBzdW0gZG9lc24ndCBvdmVyZmxvdyBhbmQKPiA+ICsgICAgICAqIE5T
RUNfUEVSX1NFQyAqIChoaSArIGxvKSBmaXRzIGludG8gdGhlIHU2NCBkaXZpZGVuZCBpbgo+ID4g
KyAgICAgICogbWVzb25fcHdtX2NudF90b19ucygpLgo+ID4gKyAgICAgICovCj4gPiArICAgICB3
Zi0+cGVyaW9kX2xlbmd0aF9ucyA9IG1lc29uX3B3bV9jbnRfdG9fbnMod2Zody0+cmF0ZSwgd2Zo
dy0+aGkgKyB3Zmh3LT5sbyk7Cj4gPiArCj4gPiArICAgICBpZiAod2Zody0+aW52ZXJ0ZWQgJiYg
d2Zody0+bG8gPT0gMCkgewo+ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAg
KiBUaGUgb3V0cHV0IGlzIGNvbnN0YW50IGxvdy4gUmVwb3J0IGEgbm9ybWFsIGNvbnN0YW50LWxv
dwo+ID4gKyAgICAgICAgICAgICAgKiB3YXZlZm9ybSBpbnN0ZWFkIG9mIGR1dHlfb2Zmc2V0X25z
ID09IHBlcmlvZF9sZW5ndGhfbnMKPiA+ICsgICAgICAgICAgICAgICogd2hpY2ggd291bGRuJ3Qg
YmUgYSB2YWxpZCB3YXZlZm9ybSBkZXNjcmlwdGlvbi4gVGhpcwo+ID4gKyAgICAgICAgICAgICAg
KiBzZXR0aW5nIGlzIG9ubHkgcmVhY2hhYmxlIHdoZW4gdGhlIGhhcmR3YXJlIHdhcyBwcm9ncmFt
bWVkCj4gPiArICAgICAgICAgICAgICAqIGJ5IHRoZSBib290bG9hZGVyIGFzIC5yb3VuZF93YXZl
Zm9ybV90b2h3KCkgbmV2ZXIgcHJvZHVjZXMKPiA+ICsgICAgICAgICAgICAgICogaXQuCj4gPiAr
ICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICB3Zi0+ZHV0eV9sZW5ndGhfbnMgPSAw
Owo+ID4gKyAgICAgICAgICAgICB3Zi0+ZHV0eV9vZmZzZXRfbnMgPSAwOwo+ID4gKyAgICAgfSBl
bHNlIGlmICh3Zmh3LT5pbnZlcnRlZCkgewo+ID4gKyAgICAgICAgICAgICB3Zi0+ZHV0eV9sZW5n
dGhfbnMgPSBtZXNvbl9wd21fY250X3RvX25zKHdmaHctPnJhdGUsIHdmaHctPmxvKTsKPiA+ICsg
ICAgICAgICAgICAgd2YtPmR1dHlfb2Zmc2V0X25zID0gbWVzb25fcHdtX2NudF90b19ucyh3Zmh3
LT5yYXRlLCB3Zmh3LT5oaSk7Cj4KPiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiBTaW5jZSBtZXNvbl9w
d21fY250X3RvX25zKCkgZXhwbGljaXRseSByb3VuZHMgdXAsIGNhbiByb3VuZGluZyBkdXR5X2xl
bmd0aF9ucwo+IGFuZCBkdXR5X29mZnNldF9ucyBpbmRlcGVuZGVudGx5IHJlc3VsdCBpbiB0aGVp
ciBzdW0gZXhjZWVkaW5nCj4gcGVyaW9kX2xlbmd0aF9ucz8KPgo+IEZvciBleGFtcGxlLCBpZiBy
YXRlIGlzIDMzMzMzMzMzMyBIeiBhbmQgYm90aCBoaSBhbmQgbG8gY291bnRzIGFyZSAxLAo+IHBl
cmlvZF9sZW5ndGhfbnMgcm91bmRzIHVwIHRvIDcgbnMsIHdoaWxlIGR1dHlfbGVuZ3RoX25zIGFu
ZCBkdXR5X29mZnNldF9ucwo+IHdvdWxkIGVhY2ggcm91bmQgdXAgdG8gNCBucy4gVGhlaXIgc3Vt
ICg4IG5zKSB3b3VsZCBleGNlZWQgdGhlIHBlcmlvZCBsZW5ndGgsCj4gcG90ZW50aWFsbHkgbGVh
ZGluZyB0byBpbnRlZ2VyIHVuZGVyZmxvdyBpbiBjb25zdW1lcnMgYXR0ZW1wdGluZyB0byBjYWxj
dWxhdGUKPiB0aGUgcmVtYWluaW5nIHBlcmlvZCB0aW1lLgoKZHV0eV9vZmZzZXRfbnMgKyBkdXR5
X2xlbmd0aF9ucyA+IHBlcmlvZF9sZW5ndGhfbnMgaXMgbm90IGFuIGludmFsaWQgd2F2ZWZvcm0u
ClRoZSB3YXZlZm9ybSBBUEkgcmVxdWlyZXMgb25seSBkdXR5X2xlbmd0aF9ucyA8PSBwZXJpb2Rf
bGVuZ3RoX25zIGFuZApkdXR5X29mZnNldF9ucyA8IHBlcmlvZF9sZW5ndGhfbnMgKHB3bV93Zl92
YWxpZCgpIGluIGRyaXZlcnMvcHdtL2NvcmUuYyk7IHRoZQpzdW0gaXMgZGVsaWJlcmF0ZWx5IGFs
bG93ZWQgdG8gZXhjZWVkIHRoZSBwZXJpb2QgYW5kIHJlcHJlc2VudHMgdGhlIGhpZ2ggcGhhc2UK
d3JhcHBpbmcgcGFzdCB0aGUgcGVyaW9kIGVuZCwgaS5lLiBpbnZlcnRlZCBwb2xhcml0eSAoc2Vl
IHRoZSBrZXJuZWxkb2Mgb24Kc3RydWN0IHB3bV93YXZlZm9ybSBpbiBpbmNsdWRlL2xpbnV4L3B3
bS5oKS4gRm9yIHRoZSBleGFtcGxlIHtwZXJpb2QgNywgZHV0eSA0LApvZmZzZXQgNH0gYm90aCBp
bnZhcmlhbnRzIGhvbGQgKDQgPD0gNywgNCA8IDcpLCBzbyBpdCBpcyB2YWxpZC4KClRoZSBjb3Jl
IGhhbmRsZXMgaXQgZXhwbGljaXRseTogcHdtX3dmMnN0YXRlKCkgbWFwcwpkdXR5X2xlbmd0aCAr
IGR1dHlfb2Zmc2V0ID49IHBlcmlvZCB0byBQV01fUE9MQVJJVFlfSU5WRVJTRUQgd2l0aApkdXR5
X2N5Y2xlID0gcGVyaW9kIC0gZHV0eV9sZW5ndGggPSAzIG5zLCBzbyB0aGVyZSBpcyBubyB1bmRl
cmZsb3cuIFJvdW5kaW5nCmVhY2ggcmVwb3J0ZWQgdmFsdWUgdXAgaW5kZXBlbmRlbnRseSBpcyB3
aGF0IHB3bS1zdG0zMi5jLCBwd21fdGgxNTIwLnJzIGFuZApwd20tYXhpLXB3bWdlbi5jIGRvIGFz
IHdlbGw7IGl0IGlzIHJlcXVpcmVkIHNvIHRoYXQgZmVlZGluZyB0aGUgcmVwb3J0ZWQKd2F2ZWZv
cm0gYmFjayB0aHJvdWdoIC5yb3VuZF93YXZlZm9ybV90b2h3KCkgcmVwcm9kdWNlcyB0aGUgc2Ft
ZSBjb3VudGVycy4KTm8gY2hhbmdlLgoKQWxleGFuZHJlIE1lcmduYXQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
