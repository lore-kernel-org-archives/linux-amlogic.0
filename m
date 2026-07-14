Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF30EC44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 05:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AUv0AEfLHiMHrx2NaRC3V8Mim6Meo+L8tSsvUCjUCjc=; b=rbMsHbCBk/SiS6
	bRgzS2rHTNKXxSXfg8EjYEG9Lbjfv31qkOipRqEEJsJ3katFhxm7XK4rruhSFxDkZV/1cKFMA0p+R
	kQEimQmcrMDv1O7YdjBo8t8MKKE2QjT+8j/gEizI/cIeJ9lLQFEgk776c6wd8tNKZBnbtFvs0emcs
	1VD+Au8DhL84mOB945pDexYaVnQDu3a1op3lfXqFDpS7QYldui57HTsKheIlHvzmlmk4JQuGVN9pw
	sI9HQiy1nCkxzxMUlMJe5bPJRKuZVBwON7vclWUeQy80Zyq603EW+izdwR8gDYk+nKdfB5SF4w0jr
	ouxN7NsSDJy1Sx9iP9CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVRr-0000000Auua-28Fs;
	Tue, 14 Jul 2026 05:12:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVRo-0000000Autc-2sCA
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 05:12:51 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c7c61b5292so7774055ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 22:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784005967; cv=none;
        d=google.com; s=arc-20260327;
        b=STjUXkVya8DyMwHbyTMJeRBx6nrTEqdSBnfKVHIM0Z69EEWqR4WYWr3jUBZuvFa940
         IUnEvEX8c/8QCPTmFZS/gmNLZAC0bhEpwcBZMVuW+wDTcqTa4cFOLtL9+zEwBPUv9XW2
         5eE6a0DIKOjuqGXusEeAFNl2MW3MBtFaqXKC785PkqH/7jQUYO3wU3jeE89Xg+Y6CLyE
         hMTY2EdB7Wt+tVMsqC2p+Til+/HPOEsQpgHlvccxHzxg7cTstQDkThKTRPdtYh9kLa/k
         mavW6a8wHR72wiNxHhMkHp6fSI1yV80UbWOluzQIbI0dIj9AfriKfW7P7SV227hgk/ki
         C+Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        fh=TXXa1neLIUClCN+keU8ShwMnzZoGqKG0DDUyqLCrIxw=;
        b=bb4NgfhTEQMOKOqdWKRG0jsXfMQSqtdPwSKvSe9TjXb7Oz+yidAKYrN1GPdNfBlmlk
         ZWQKNG1aKtQyg4Dp3zGXsVb8+HClNu2NxXnlImRCZmtGg6+z7ZnkPKlEY1aw4GfBuZYq
         ifbTJ5netRYX+Rmr6mnLIxELNf6FbhWXYlb7T7bGjLj/sxqJc/WGlMAiNGtqybZZW68M
         G8KJKxSaJ9aiIpzgCLduL7SdQfrudvneYTQKNXAdJyKoaqKFPLtJcq13GMjqtbRc/flI
         pcbxiFe4XV8V6nYndX5tild4/VbmtGDneEIKhs8g1G8q+rUvFYgV5suIIiYa3RBgtV46
         bQiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1784005967; x=1784610767; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        b=iGVftMIr+tTBYN2du5/fLRRhdz/nECJdHhpQxlahfo/p8lNu569ggeJTub1nRXNnH/
         cHzhrdUHy5Jw9wf6rrtXOR1JVHYNcASMefexy+dNGThDzlsdxkvKdv8CCbJSMfg5BhKT
         3zHH+P7iEO3ga9iE8efAAThGFRvJEclHUU9HQ4mKGzeC1BpWrfJf7iFZmmecZYKC8AKJ
         8jpl7GMZurTVU0pND2cDoDwHn7HOVSb4ovGBJU6Mdbb+aEU3sEdFHWbgqwCbC/xDmGtK
         SUc6/nEV94W9pcB05gaC01GjXfgZTrnLomcom/rhpDYc01WdYO/AK/LZmaJiYYdG1PzB
         OPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005967; x=1784610767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        b=rrljI66Gz3ZCWWpP8iPaFmUWflPl+d8xnp2QkalAHEwWYtV5jw4xVDVR5aV+S3byl7
         ZQIODQtAxIqFm4vm0FXiUaZTbxVV9Xs8BfKP8Q06FItLLCKAWCkcNAP4F1IebFs4A7Rj
         MOivFPoiahqek6+TZ1e6TTQbZCOPajImv2jev9tVquVooYA4hvLxgjraJhEe5AQAZcW8
         Hj082QMg8D+yDKRtJ4u6crCmjvhO5kseD59mJypTaXJdfdNDptOi5pmOM3VLWzEjXOEQ
         PpGWr5ER+1L5qfSU7vae1DRUefjRdDueM/LYfO16GqOvjtDEvvdBYxalpCpVo8hK+muK
         cXDg==
X-Forwarded-Encrypted: i=1; AHgh+RrF5OYaBbvvbO04vSAqhQXGJz9x6zSQ2wpWPDFeDcYCILb6RPHmF1m4qQ4x+ZnP/qW4VL4gwbTC+SopjDI+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw84PWftVH/hUKjhQvhVXfvtY3J9Jp8YHxCBFMd5wTpBaT5r7dt
	D1pRx3b9PuQafvFa4AGK5vqipZiEPFjj2tK4kYxZc2FKjYu9ra1QzcobsaWRJgf/LVySEejPbgA
	aBOHdOGgaOOk56/pT2mD62LPf8lFH31lY8vAr
X-Gm-Gg: AfdE7cn3YQqgtnxkAtyasDTrpryZJyG3Ge1KoPjhPP2M41Ctx4zmey9Gl2hgsqwYohE
	UYQ1M6WYXmMoeo59CPvii3YWYZp1XIM0Hd4JCOV64cXe0tW5nvIdNKaZtTeCsYfOqRGEzc2kAa3
	ibz/h46BY5JDiRsL/JG/jjeL5Swt47vla6jTViYDXFNGRj+70WdiY1aXAvo1LO+Ha3zJtl0MWAS
	nVOVEn+xu3XoI1EGzx3O9W0RALiWeCCticiWprKEXgZ1cUQrPAdeLEhO38p0WuwMJLEtGQerriY
	EqL7xTEC62pjXqY22cDK31SgRIbAVw==
X-Received: by 2002:a17:903:198e:b0:2ca:d31e:ac50 with SMTP id
 d9443c01a7336-2ce9e99f4e8mr126780235ad.17.1784005967396; Mon, 13 Jul 2026
 22:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783977550.git.sean@mess.org> <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
In-Reply-To: <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Jul 2026 07:12:36 +0200
X-Gm-Features: AUfX_mx73l8ozq7YHB6NRGb7mR2H4Zdd5n4XL3gFzVk0yaPWxB0D4BDTcsu54Og
Message-ID: <CAFBinCBqhBXuMdx0JaAhe9B+z6xEX8eSaT4HbDEHq+FpRLH-cw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] media: meson-ir-tx: Ensure probe error is propagated
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_221248_727459_D517D351 
X-CRM114-Status: UNSURE (   8.13  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMTE6MzHigK9QTSBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mu
b3JnPiB3cm90ZToKPgo+IGRldm1fY2xrX2dldF9lbmFibGVkKCkgbWF5IHJldHVybiAtRVBST0JF
X0RFRkVSIHdoaWNoIG5lZWRzIHRvIGJlCj4gcHJvcGFnYXRlZCBlbHNlIHRoZSBwcm9iZSB3aWxs
IG5vdCBiZSBkZWZlcnJlZCwgaXQgd2lsbCBmYWlsIGluc3RlYWQuCj4KPiBGaXhlczogNDliZTFj
NzhkNTc1ICgibWVkaWE6IHJjOiBpbnRyb2R1Y2UgTWVzb24gSVIgVFggZHJpdmVyIikKPiBTaWdu
ZWQtb2ZmLWJ5OiBTZWFuIFlvdW5nIDxzZWFuQG1lc3Mub3JnPgpSZXZpZXdlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KClRoYW5r
IHlvdSBmb3IgaW5jbHVkaW5nIHRoaXMgb25lIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
