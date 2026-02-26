Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0874FD9E15
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Feb 2026 21:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rg/UISEjgrCCGuiL4d2m44mjdEK/HHe8E6flXK2gmh8=; b=gr03J+HegmiyT9
	KXrFXlGXg4RzpzQ3RYNopYvFYcGPqiCKu7wq4e7QVA22LVvTpEcGyjmL1l8kKWVyuJ49O2n369Vt/
	Z+izYfNzoN9LWne4cvgOr6IUQLXDSnS9bE2pPXjLpt+m0foJ/p6a20QqwlFjDlxV1d/brcQYEESsx
	x+1F+lSdbKHgErEDxbL3bvRN3orcZQXuII82grI8fpm19rmjreN3w1UlgFv3Lr0Oc1yVnFRRe6kiE
	bNoO1cmBwBDUWU1zpH5qTwkGcPPFc2+AsIRcnYCfV9KC709om/3MjtbI+L1Zokw8Ry6Uh4ogGFakF
	LpG7rtXL+XbFpNx5M7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviys-00000007Frx-3goa;
	Thu, 26 Feb 2026 21:33:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vviyq-00000007Fqs-19Pr
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Feb 2026 21:33:09 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2aaecf9c325so8762035ad.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Feb 2026 13:33:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772141587; cv=none;
        d=google.com; s=arc-20240605;
        b=XI6fQ6CT4rk0Io3IJs+6524KTNyd5q8I5Ghusw0MEq9m7LAn4DJcsSyu0cp86PGaE9
         ZPoGWA4+F2k9q61ESm5vG3pkYhd4LpOga4589oPxmE25VjrHdRGiGzBgwEIaMut2Syg5
         FnVhWr051eIEoYzsV5nSf2CSQmZHG+OHnmayWjeD8zYPyOXE2orJqH2po4PPaKFMbiJk
         FxY8eUPe++ScCGRxKxkdIMBQkDUdmmU30w5DYUfUIaiRnd1cK3n6u5gY6eRjMIYuKIw4
         5Bpz+vbm85k280NnnMgtDk1Pe7c67VRU57QL2se5s7A1mE013dKKeFMq/HQJzIjSxOOK
         XrrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=;
        fh=SG9yaHVwC2FCwHRClAvcuWkKyqSl307ATFQHvhMH7N4=;
        b=EjZtBFtAi7w5mhvf+QCIJbftcyC1wFhnzyHC6q9sXjkF24OOiOiWpuezfC+f2JSVx0
         uQDhJ1YxgUJKnDHx91xXxNIHHzyDppXBA4JqOZIqxOrn03UzfJT5HZTjpe3VeZwcmV+L
         +xanp2wIKTm/W3MfjXsQlZ0iKqfmpbetEJOiKpWC5PBfB4UqkBVsBq+XlkCo7cZf+WmC
         OJj9kinTXpHDNb2cpw7IbP/3d5QAimaRZ+dB304phDo5I7Je/5lg6u6cYjKt9Dw5QEJH
         5BQhgwPjZBNb2CCtPwIus8oM+nEg4ixrSMLogtasCCJoXZaELO4G848ehx4LKAKge0AP
         /R/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772141587; x=1772746387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=;
        b=BUF3X99tz3xdqULW+wjUxk6qxMh+UJay9x/emqizt+UnEf9tzHwCKfZhPMDez8cmDV
         42vdUL/bASiGM2R0boKoO3hWGEt3vYmoEdL59ecccNuBikoodtp8sYalIK1DZcnkAKP9
         kwT5h8gAEsHnxVhoB3TtzoP1HH8L8BUBavUYyjH5m5JNylgxC7E5ZFdeKf5VUMVI8xL1
         7ZY0mgxUdzi9xlY5uJCqLWZcmuGduDFoStNjtRVMBMxh5hXGa6yjNHzlIW3lyuik8L58
         qhcVVH12hVgTovrtBx4H9hs4KkDuZQhGELPaa3GitYn8pM3g31XbrD/w1G32boLiG0YZ
         PU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772141587; x=1772746387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3KSzDZH5WcI3naCdA20D7hQPLm9fLJpZnjg0HtC5mU=;
        b=FK7Df1oRqaG4m5/blZ0uAgmrBe3HgIX+K5dF58PuWimwoR1VF/1SS4Ma5ek1CnLLrE
         6Nbuj96rNdU0Okr3YLPeB5Z6izUqia0PYf0LYg+W8cUo6dHmdxB20rpugoX96U4853cT
         SwNH06gs+wKAtWUmPDW2Iht/fawQIznE8Nx0FiBVOZ8D9jKyOO76ClmVSkyzkxpoBCzv
         EuG5NLqdZEQNdd0ZAh32MaMTayJdplbLYYVCKfMaNJm3LltcoSngGhX5sMZz8kMZw1Pm
         oIuweGmVWTcAKwGp1E7nz1m84Z3P0qbKS4ILfhasENbCFPBBahywVFj26UHa94dIv8Jz
         5Jvg==
X-Forwarded-Encrypted: i=1; AJvYcCUrbuS22iXgZt9tn0E9JGOCPOm4/QhcmxrbF818KBmpj/bbntygblxLxSHb4UxT8toGQ1ajyGB/Aie2d8xC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/tdR7AGFnp3qaF/1y7N7xJ3BLMlwEK5i6d5RDqVBgzcmtbM06
	Toc2pdYjnXotrfVw3mOE5cmWa8mUJAHs7abIeHUDKyzJw2NDpXj/zHzXDbFROnk7L+8YUbr6Hos
	hPcEoe/RHjf8YB9pL6SPc2XWYXyj4R4c=
X-Gm-Gg: ATEYQzxFa4nzYZy3yq/QqNSA1GPwdj2o9oXOQnpo0kEOUXLM5VsJTL2UKG19TpfUNKX
	hGEGNWnNa/2UpIdFMdzqvlGky1jULxadFRTbrHIQDloTc2e8aN9PH+58uWws0KcEi9ulpqzLfF5
	iZ0ogqUyOLecm/TILpxKNu+E35L12K/9zccDL9DtrRIYZ/rcFDmMrXgSmwolcsB2j3kexH8ctWx
	5qz1kxQwSULBt2NmbLLcuP/AyXkwoXB7dvrJ/sNCGArQnQXDUgJ3xpcomaoH/X63Jo12FmWJP+C
	GOc57JDM3xNs+zGIe2tJS6GaBUCRvpLp4m2rcc5lKz5YvHSNco4=
X-Received: by 2002:a17:903:4b07:b0:2a7:8c6f:939b with SMTP id
 d9443c01a7336-2ae2bce58eemr4336975ad.27.1772141587391; Thu, 26 Feb 2026
 13:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-5-nick@khadas.com>
In-Reply-To: <20260123022258.136448-5-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:32:56 +0100
X-Gm-Features: AaiRm51PyRfiLatDzwSiR5eluGOKGQK9uyO4t3-kfB8JjH98-aVUutjpr9phvHI
Message-ID: <CAFBinCABMXTGZ8A6LPN3N-4TcJH5DrxWcnVAoCzE954KgnEpeA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add POWER key support
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_133308_311652_77659096 
X-CRM114-Status: UNSURE (   9.60  )
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

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMzoyM+KAr0FNIE5pY2sgWGllIDxuaWNrQGtoYWRhcy5j
b20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBncGlvLWtleXMtcG9sbGVkIG5vZGUgdG8gc3VwcG9ydCB0
aGUgUG93ZXIgYnV0dG9uIGZvdW5kIG9uIHRoZQo+IEtoYWRhcyBWSU0xUyBib2FyZC4gVGhlIGJ1
dHRvbiBpcyBjb25uZWN0ZWQgdG8gdGhlIEdQSU9EXzggcGluLgo+Cj4gVXNlIHBvbGxlZCBtb2Rl
IGluc3RlYWQgb2YgZ3Bpby1rZXlzIGJlY2F1c2UgdGhlIEdQSU8gaW50ZXJydXB0Cj4gY29udHJv
bGxlciBzdXBwb3J0IGZvciBNZXNvbiBTNCBTb0MgaXMgbm90IHlldCBhdmFpbGFibGUgdXBzdHJl
YW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFhpZSA8bmlja0BraGFkYXMuY29tPgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
