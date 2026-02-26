Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3210FFD9E12
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 21:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4wUnDAzoiaeN4kc+XduAPhyJEeKSivpEzgVrJqH++I=; b=feSIHeW+BpvsF2
	lTOc7RIfJFdvuyyt5BUJUT4B96pWv7p3ov8sul4K1R75u35wvUImszksn5fR2paAM1aWBO7DMH7u7
	n4ybE0KXfezJ3PArk43igItirjA6mXiq0AjSPXlWaKPCTWv/gM3Pu9Z6R6CQlrH8ajvlQHDkeczjl
	UxCD7OdWCfj6iRjb8CDrhIdEwodt4DmY5wDxJmPLZAQvgYJ2EXfnpWv2PzvCYBxr5Jj9dOVtMAg7j
	CiV4mLvZQNaSdNlUbJR4OKNxZxsq6FATaNFGIuCvXIJ0usZjK/YxDaLKIEL4aH/KQ7HE/KkrpQToC
	f38mfjk3GAtEjbfwoSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvish-00000007EzD-30JR;
	Thu, 26 Feb 2026 21:26:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvise-00000007EyE-1ifn
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 21:26:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aaed195901so6715515ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 13:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141203; cv=none;
        d=google.com; s=arc-20240605;
        b=KKyntCL9om/U86Z6/KQpcUl7jwjAiE77B0L5r4j6uykAJEmr5STFwbxIKS1JY4bKcF
         KzMlWGKybgM7J4sN5T5/Cnkbvkf84TwrnemXdRLR8f2NGnY/JWzoD4TpgzAxN6J/PXeA
         mzLrOPJcbLXzrYOlykU4fLY1KUxSJzgRXBiIDGpM04U02ju88MEa4W98mgGlRerCAFCH
         15+EPruIldfGF+0fkF/dr8DI/pZ6PhvmFkrscPG/aMIGBmlMtC/+vb/Ph+4362pS68KY
         tYnK/wBrw1p00TTEXFT45HW9VsqQ3S4Zzfd1/JT9rEaNCYkHgJzwJZyewb8gaw8wMLbV
         XZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=;
        fh=4Xbl4aEGuc+mdrMsN4Gr+0WtUdqcD+taP+WrKIaFvsE=;
        b=Nnbm92YDpk03dEraNDNXomGO1KODCCup7Sni4Nx6B2TZW7qB2uCIGGqEashr7NVRpM
         /a6btXhOKtjyLJnQ/Vgxp5CPwd4tY35nwHGdKLDjYqfgolNZnWcq92itfgRqHcYMf5Q6
         QCuix5grWOZ4hQqBBvOohsrAXArxy7ZgOgrXuzKUhj0VcMiPVBGVnmSkB/Mf3m7khFsB
         cAanp5m4/HdNyG69DOyTF6gW2z0fFxUgsWB7qkFa9ApVIBaUaDwXz+W77QcN58H0ydhf
         AiKE3DFHj+33DBM82Uf+zIv1XyhJ7XbiO1FuX+Ibwly8AC2IEyq8Zh839dnU5wbt/gwc
         xQnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141203; x=1772746003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=;
        b=SU78ggHl4MawWgNoQis/YiFYurcstI+9cj4+pExKGXxVOw6qIhl9X8rFjih0I4i2c+
         k/gvKFSSIh+wMQDbVHrWOFPJjZK8GMgX8r7Z/xA61hs3LuS1btGnxjmGgD5DHNdhLwiA
         A3ZL/wmkkm8F7tdZ6Z6td2lRga77wEj7cKKQG2pubk0lca/EV+d8uFCYbKFx6A2R8VlF
         03wJl5UfcT3ww9XxEGcnMdzPltaUphotQ28gUBdxGF65dfRA9p147HYZ+pBVJ92IFMwd
         2vzL/S4HBxt/wolS2xXoeCPrtPy181ClF6ftpyXNlrWclCn9gCdnjTsZZemoS6BxBBZr
         iZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141203; x=1772746003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dAcGgVbCS/bj1DBocFVYHa5Tyjmk+gWFmhBNeyBNcQQ=;
        b=JdfNDlxLcAkmb3tmtR6aVILntI/UalSKcC/j7Ru+LpxD6UsGGgbTf3bU+xwuCDwmXf
         fNqyXJ0tVAJqKtTjNU2sqo6Lur1rxa6g1Mlmb2Mp8bsH+s3MVM0iOEdmDBruuK97koPR
         +kEzEYjcIjkCCH1grm3EymdRXlWW4VjNFYGRBwaExrhVzxhJC7XtbWkDpZJKs54KeEQc
         gVAkQXEiHX48dXejxdRvCeNmSAUZdzKxE+pM9l1tJvdMGyNT7v/BTiqJq4KVLqzfSYaz
         LVxG8zDMz+B+WO5fAJ4A/T7gUPL3438kTVNrNvHrGgqOqeaD+3UIrbujFTTLl7yBw1f7
         azRg==
X-Forwarded-Encrypted: i=1; AJvYcCXPj8Rka/+BPym1t/oTC+CAlch2N2wLzWCbRitbfB1be5H+qFWbayILJBisS9n8U0qa3h4PijZRTyvvguuL@lists.infradead.org
X-Gm-Message-State: AOJu0YxnYCBtWvwx3JGrSB7lpi0e6fBrv9EOwVM1nLq+nkEISeAIdO0L
	EitQY1i316GNV5SnjNNgi8PQ51t2knh44vYXrdvEYzuCwRmyBQeTzDzB3kNAIJ+1wJK2EyDmziq
	4vxeuLQRPID6zznObkhqmyxxZdJ/R1ayTlMYM
X-Gm-Gg: ATEYQzy8XY6EavwBbOX+DGWE6/6SBACACh6DWsJC2njYLmzFpO7855Jf/itk9BWqysf
	s126qL7Eq2cxtR2BlIEyQUDrJEz2HaTNGSGW7xc0+gOB5hoz81iOhxThdLiY91Bz+1dCtqukttv
	sYYhh9k0CkxUQTV+slWJX+w2D0HCq888vTv//q4JGDdqORi/5wwIiOn8zDjhmczpl2f3SI4dehU
	lTQqZ6EzRONA0c2fm0pCREA1fr8UtVolEWumFe8CIuiC8P7UzBiP/FGQFV3uYbSB5aRhTg3V1F2
	IBAIe3ZFEMQbNIe8y+d4I2FLU2Uoeu9YrKNGfxwQ
X-Received: by 2002:a17:902:d592:b0:2ab:230d:2d96 with SMTP id
 d9443c01a7336-2ae2e3ce58bmr3604695ad.11.1772141202912; Thu, 26 Feb 2026
 13:26:42 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-2-nick@khadas.com>
In-Reply-To: <20260123022258.136448-2-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:26:31 +0100
X-Gm-Features: AaiRm510mQz5OMzE6LAMHDV7opdj7qiogaLj9z0r4G-Q4maIhZU0npcoFSphQrM
Message-ID: <CAFBinCBvwhvOwMJYuvVyubCi2KSGaRq3+RdX2fcj=7zLhSX+tQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: amlogic: meson-s4: add UART_A node
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_132644_458197_CD6EAA32 
X-CRM114-Status: GOOD (  10.54  )
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

SGkgTmljaywKCk9uIEZyaSwgSmFuIDIzLCAyMDI2IGF0IDM6MjPigK9BTSBOaWNrIFhpZSA8bmlj
a0BraGFkYXMuY29tPiB3cm90ZToKWy4uLl0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGFfdWFydF9waW5zOiBhX3VhcnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtdXggewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGdyb3VwcyA9ICJ1YXJ0X2FfdHgiLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidWFydF9hX3J4IiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInVhcnRfYV9jdHMi
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAidWFydF9hX3J0cyI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZnVuY3Rpb24gPSAidWFydF9hIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07CkNh
biB3ZSBwbGVhc2Uga2VlcCB0aGUgc3BsaXQgYmV0d2VlbiByeC90eCBhbmQgcnRzL2N0cyBwaW5z
IChhcyB3ZQpoYXZlIGl0IG9uIG90aGVyIFNvQ3MpPwpJdCBpcyBsaWtlbHkgdGhhdCBtYW55IGJv
YXJkcyBmb2xsb3cgdGhlIHNhbWUgcGF0aCBhcyBLaGFkYXMgVklNMVMKKGFuZCBBbWxvZ2ljJ3Mg
cmVmZXJlbmNlIGRlc2lnbikuIEZvciB0aG9zZSBib2FyZHMgdGhhdCBhcmVuJ3QgaXQKd291bGQg
YmUgZ3JlYXQgaWYgdGhleSBkb24ndCBoYXZlIHRvIHVwZGF0ZSBtZXNvbi1zNC5kdHNpLgoKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGkyYzBfcGluczE6IGkyYzAtcGluczEgewo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXggewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdyb3VwcyA9ICJpMmMwX3Nk
YSIsCj4gQEAgLTgxNCw2ICs4MjQsMTggQEAgbWRpbzA6IG1kaW8gewo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIH07Cj4gICAgICAgICAgICAgICAgIH07Cj4KPiArICAgICAgICAgICAgICAgdWFy
dF9hOiBzZXJpYWxAZmUwNzgwMDAgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiYW1sb2dpYyxtZXNvbi1zNC11YXJ0IiwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImFtbG9naWMsbWVzb24tYW8tdWFydCI7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MCAweGZlMDc4MDAwIDB4MCAweDE4PjsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTY4IElSUV9UWVBFX0VER0VfUklTSU5HPjsK
PiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jnh0YWw+LCA8JmNsa2NfcGVyaXBo
cyBDTEtJRF9VQVJUX0E+LCA8Jnh0YWw+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gInh0YWwiLCAicGNsayIsICJiYXVkIjsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBp
bmN0cmwtMCA9IDwmYV91YXJ0X3BpbnM+OwpGb3IgY29uc2lzdGVuY3kgSSBhbHNvIHByZWZlciBp
ZiB5b3UgY291bGQgbW92ZSB0aGlzIHRvCm1lc29uLXM0LXM5MDV5NC1raGFkYXMtdmltMXMuZHRz
IChwYXRjaCAyKQoKClRoYW5rIHlvdSEKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
