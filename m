Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6DED64061
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 23:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZSrqRs5neBDT2cYIxQ2OW6eq2vw3K1mqgsf78ue3UI=; b=yr7EJDxikj7SSb
	gNNwzz6yPiPURQ8by6kGifCEP3dTAetT8DpjFEXjBDYQrqg+8SoDFVBqMwRiOdBWH5Alc0vVRFWIf
	GCkEJYB6hFpSW9p7bZVzrd7D5+yAHZNbA7BAIn6j7JoETsVlhayL0I+hKrVeEF1ntuHAV/6KX0+JO
	LhrwjB8f1ZgBQwYydChJd9pCoK3WN05CZO60IuAtU+qqmNssyjuPi5TuvLKoZyyz9E6e1ha57iI11
	eV4XwjGQhjvG5mxjUS93DmuaH8QmiSQRZFl6oxGeWoRicUEaclFoClUlj/J1sOBurIfw1Pf0SsQYi
	0ev/UT+ctWrVpwIMK0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVei3-00000005xKn-39gO;
	Tue, 16 Dec 2025 23:44:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVehy-00000005xJx-45Pt
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 23:44:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0eaf55d58so212185ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Dec 2025 15:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1765928637; x=1766533437; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=;
        b=aj+mufqQEvaiJ8+31b4kMCGAukHpJi2tPnVQyu7JvEdFEOS7a7M2DLyYcO+ys9qzMt
         Zwf2JLxaiWXj3rT/24zS3GvlFSCOv+AOckgD9Axo5M/XKCHX3Rokfxuwt7gLSjxHOPvt
         d+0CZIdQxgXpQqBaHmKp+s0eqdvHpSK+h4KCk4qbxJhNKUCE3LllBn9N4qwMQWrt7+oW
         wSvnRQtgn7FJGeDZ49HVqsGgGIUQXEv5reYnXDVod7y+L22hZX+OP2kc1H+azYH1eNPs
         amfcbkoWylni8y0Pp76VIIvSU8crP1XxuSgNGdWIX5aIwxcMqqmIGFoKm9MfyPhDxAcr
         Sh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765928637; x=1766533437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dWQpmZhuHByTsu+CQ3E5sInryvyWTTB+7XX4Qh+8PmQ=;
        b=JJpTjJqOjPPSZ3+wdk5V+t4SqO+Q6vGnVygrlixnquadMn5VedZ3qg4qoi/IwkUeMd
         p/X2W5LvpCepm0nhjyU7yJNQcqIqw/lu+4zB3EVerz7xll0PWChT13q2SRJYD8Inc2bt
         Tg1JJSpB50UpiLQiAERSVhxpegDLrxwfHgKoKFYXvhGz9YCPWd93jpNmtJnkBtAcGLrq
         oDxXJKFBDbAWb6YjUoabAgGorQi75HzqgZEpxabBs/rwP801s9PiC0qopzbkKn34l6E4
         IqdyME6Rm6iUcVrtJBorM3gA3ulknCpd8XY00K6Z0CjNXcbS5K85YEzqU0ElRLud4RuH
         lO4g==
X-Forwarded-Encrypted: i=1; AJvYcCVgqgwqS+bO3gbmTX58Lukc0QOX0rzWJsMBeCwhjPQnSf5sloPuymJ9r4uManeATgplZpdYizdXb3OEC7o9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa1K/EAhBnlNo7sROQO512N017PQZM+I/I97mlsp+dngd7YNpG
	+0Tw9l7sYsJLRgMBDSzu35vbN9Chn8sSXudNIx0qRNOxJfUqj5wg44+9tLu7ippqpzmx/zWfHdo
	/2yHnkUl7p43wApHTzd8t8fQf2b2kPc4=
X-Gm-Gg: AY/fxX72j04KEuRnzJauFPKSODoojeXQ7tPUsJnTlK6ZzvAyeKMC/+deKeZnFuTrXl1
	GQCWNbUQGg5qSIDA2SHDGPsnrQ7+CMvOx7/1qPJ48uuOQqwxZVCaQ6AQYGDyk5o9nLpU58m+wFq
	0DZ/FNXEuDlS4gBemnR2Qgii5mecS8GVL+ZRcHffYHA7IMN3gyl/A5OcKgWi91CIosAeGrrpjVw
	bkRumHe2aqDJ+gt143ONhGG8AExooeMpMOIsf2aMvbcfccjI3NI2a0qQu8qsXRa6w5RkPibmklg
	4XuQrdw1hri0bE2PggOFX72B5cg=
X-Google-Smtp-Source: AGHT+IFc4SCik6/1a5fdyPdRb57GPQbLhG29WfQBheDtYpWyCEZoAD+X3T4jtRgWy08tQ0KGPuBzfaLM7RFqA70zbTo=
X-Received: by 2002:a17:903:f8d:b0:294:f6e5:b91a with SMTP id
 d9443c01a7336-29eeea26dadmr221641465ad.13.1765928637355; Tue, 16 Dec 2025
 15:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com> <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
In-Reply-To: <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 17 Dec 2025 00:43:46 +0100
X-Gm-Features: AQt7F2q9zUscAc9aUQp2kvq265usXhzgFIJqV1vpvmNAc7x3-P140_1z3fSbVp4
Message-ID: <CAFBinCDO5UWVEtbOOdMn9vy=0H2Q1hJDKhH+X7i0nMsSsw=wbg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video decoder
To: zhentao.guo@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_154359_004929_7BBFDCDA 
X-CRM114-Status: GOOD (  21.61  )
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

SGksCgpPbiBNb24sIE5vdiAyNCwgMjAyNSBhdCA0OjMy4oCvQU0gWmhlbnRhbyBHdW8gdmlhIEI0
IFJlbGF5CjxkZXZudWxsK3poZW50YW8uZ3VvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gRnJvbTogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+Cj4gRGVz
Y3JpYmUgdGhlIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIFY0TDIgc3RhdGVsZXNzIHZpZGVvIGRl
Y29kZXIKPiBkcml2ZXIgdXNlZCB3aXRoIHRoZSBBbWxvZ2ljIFM0IChTODA1WDIpIHBsYXRmb3Jt
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29t
Pgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwg
ICAgICB8IDg3ICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDg3IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxzNC12Y29kZWMtZGVjLnlhbWwKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDAxYTVhMzI5MDJlCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9hbWxvZ2ljLHM0LXZjb2RlYy1kZWMueWFtbAo+IEBAIC0wLDAgKzEsODcgQEAKPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyMg
Q29weXJpZ2h0IChDKSAyMDI1IEFtbG9naWMsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZAo+ICsl
WUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVk
aWEvYW1sb2dpYyx2Y29kZWMtZGVjLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IEFtbG9naWMgVmlkZW8g
RGVjb2RlIEFjY2VsZXJhdG9yCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIFpoZW50YW8gR3Vv
IDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4KPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoZSBW
aWRlbyBEZWNvZGVyIEFjY2VsZXJhdG9yIHByZXNlbnQgb24gQW1sb2dpYyBTT0NzLgo+ICsgIEl0
IHN1cHBvcnRzIHN0YXRlbGVzcyBoMjY0IGRlY29kaW5nLgo+ICsKPiArcHJvcGVydGllczoKPiAr
ICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IGFtbG9naWMsczQtdmNvZGVjLWRlYwo+ICsKPiAr
ICByZWc6Cj4gKyAgICBtYXhJdGVtczogMgo+ICsKPiArICByZWctbmFtZXM6Cj4gKyAgICBpdGVt
czoKPiArICAgICAgLSBjb25zdDogZG9zCj4gKyAgICAgIC0gY29uc3Q6IGRtYwpOZWlsIGhhcyBj
b21tZW50ZWQgb24gdGhlIGRyaXZlciBwYXRjaCAoaW4gdjEpIHRvIHVzZSB0aGUgZXhpc3RpbmcK
Y2FudmFzIGRyaXZlci4KVGhlIHNhbWUgYXBwbGllcyB0byB0aGUgYmluZGluZzogeW91IGNhbiBy
ZXBsYWNlIHRoZSB3aG9sZSAiZG1jIgpyZWdpc3RlcnMgd2l0aCBhbiAiYW1sb2dpYyxjYW52YXMi
IHByb3BlcnR5IChzZWUKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YW1sb2dpYyxtZXNvbi12cHUueWFtbCBmb3IKYW4gZXhhbXBsZSkuCgpbLi4uXQo+ICtyZXF1aXJl
ZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gcmVnLW5hbWVzCj4gKyAgLSBp
bnRlcnJ1cHRzCj4gKyAgLSBjbG9ja3MKPiArICAtIGNsb2NrLW5hbWVzCj4gKyAgLSBwb3dlci1k
b21haW5zCj4gKyAgLSBwb3dlci1kb21haW4tbmFtZXMKSSBkaWQgYSBxdWljazoKJCBnaXQgZ3Jl
cCBSRVNFVF9ET1MKe2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxhcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvfSouaAotPiB0aGF0IGxpc3RzIERPUyByZXNldCBsaW5lcyBmb3Ig
bW9zdCAoYWxsPykgU29DcyB0aGF0IHdlcmUgc3VwcG9ydGVkCmJ5IHRoZSBvbGQgdmRlYyBkcml2
ZXIgYXMgd2VsbCBhcyBET1MgcmVzZXQgbGluZXMgZm9yIHRoZSBTNCBTb0MgKGZvcgp3aGljaCB5
b3UncmUgYWRkaW5nIHN1cHBvcnQgaGVyZSkuCklmIHNvbWUgb2YgdGhvc2UgcmVzZXQgbGluZXMg
YXJlIHdpcmVkIGluIGhhcmR3YXJlIHRvIHRoZSBET1MgcmVnaW9uCnRoZW4geW91IHNob3VsZCBp
bmNsdWRlIHRoZW0gaW4gdGhlIGJpbmRpbmcuCkZvciByZWZlcmVuY2UgaW4gY2FzZSB5b3UgYXJl
IG5vdCBhbHJlYWR5IGZhbWlsaWFyIHdpdGggaXQ6IFswXSAiWy4uLl0KbWFrZSBiaW5kaW5ncyBj
b21wbGV0ZSBldmVuIGlmIGEgZHJpdmVyIGRvZXNu4oCZdCBzdXBwb3J0IHNvbWUgZmVhdHVyZXMu
CkZvciBleGFtcGxlLCBpZiBhIGRldmljZSBoYXMgYW4gaW50ZXJydXB0LCB0aGVuIGluY2x1ZGUg
dGhlCuKAmGludGVycnVwdHPigJkgcHJvcGVydHkgZXZlbiBpZiB0aGUgZHJpdmVyIGlzIG9ubHkg
cG9sbGVkIG1vZGUiLgoodGhlIHNhbWUgYWxzbyBhcHBsaWVzIHRvIGFueSBhZGRpdGlvbmFsIGNs
b2NrcyBvciBwb3dlci1kb21haW5zIHRoYXQKYXJlIHdpcmVkIGFzIGlucHV0cyBpbnRvIHRoZSBo
YXJkd2FyZSB3aGljaCB5b3UgaGF2ZSBub3QgbGlzdGVkIHlldCBhcwp0aGV5IGFyZSBub3QgbmVl
ZGVkIGZvciB0aGUgaW5pdGlhbGx5IHN1cHBvcnRlZCBjb2RlY3MpCgoKQmVzdCByZWdhcmRzLApN
YXJ0aW4KCgpbMF0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZGV2aWNldHJlZS9iaW5kaW5ncy93
cml0aW5nLWJpbmRpbmdzLmh0bWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
