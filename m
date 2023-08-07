Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52411C04A6A
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Aug 2023 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVl3FtUbHbbQ5BOD+5J4AXDp/Six0igA0a1GpeqzT4I=; b=nAS1dtWkEyoZHw
	tVUS5mhdok/ANyGNS2Rz3mjS+wHPU3ExEebuP5j0Zvh0GnM1PohyzkMYk9r8aVGGobcYSuWrVFVVo
	PqXOFrPv3dfJ2hvElW3JbOwTCHP4OdHlxYEtHsMYhUJIuFM0OcCbvWQz3lSICCW2xP1s4CPs7XElU
	0o6BUimWSxSBhLbH8rviaokxFwcv7d9zMeB691+JF5Nu8Yvq2VptNOUKZL4SxLeC9yWB4BmwoFgJv
	VwzZQzlrSVinOY3LfC0twCcs8yZ71KTEajBoNWHOkVeKS3zL5vNKdzErACDaQ03/wuqK1uizhAB4j
	vgE5VyPz5QjVBEfJ35nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Qo-00HPZH-2a;
	Mon, 07 Aug 2023 13:37:58 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0Ql-00HPYX-1R
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Aug 2023 13:37:56 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d43930354bcso2300644276.3
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Aug 2023 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691415474; x=1692020274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whejdASkJGYmLZxS+FlOqF2f/J1Rdm5EDe6V5ST3LuQ=;
        b=gZ+36WDDT3vFYnLcSlRKa/NuShCqLSSyXuRIKuBCcK2PB75SwhpLFE5DGSxZtR3+GQ
         MWZ9PJtesN4mNZjrT3daZc6cH+e6gL+BYTJKIjTCg4n1uJf1Qe/y/4FDjHr19M2fiDXw
         btkW4xbEeiAXJuuLmeNCwl4FV89XQRUsnGARA2nH2TkNpUwOFAWQXPzuZIM7YNjPS0Sp
         9+apZXATVERqCRT4T+sJcS7UArh2Kzsq8gcplqQxBivztk9N5AvMLC5hFea2wA6Q4vXO
         dHK5qEpjuCPIjMHzBqgUoiYsPkyBk2sf5uPz6/tSmJkg8yqAK7fkhNXcjLPZhlVx/lFh
         UUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415474; x=1692020274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whejdASkJGYmLZxS+FlOqF2f/J1Rdm5EDe6V5ST3LuQ=;
        b=a9AcQL4oIcrh5/k69WdB9835Mr5UX72C73EfcOJDJ4wFuiEVxeA5Tl8K9HItCO6RmC
         nKiTVhhLiXM8eTuqlo6Xvkv4I8rmkFPfAp4uvdkJWlnomwmkJshIJCXYIldw2DkMREgR
         zNPz2RK50i+uCI5LHXZR2f2idsI64pfdrW9xlbf/2eUxbZRMtA0RbL/SDZINFunCfsqR
         BwEqU6AVhw7JtLU8aRd6cqzQGQ9IHQWfyuz2IsJpFnv9OQnl2yGoHXEsyMfr8swb70UB
         RGdVNYcpjClJ7IrxfkU2e3s0iIwquYs/zLD2oFE7H5xQx8Fu5J4zN8HQjuGBkHdL86uS
         O4fg==
X-Gm-Message-State: AOJu0YwiiOnU+LrLDNQY3G+qI4WMNN+NQiDwyIKALZvpZ8hm9IHg/+Fv
	OB3rW234X6RX632XEas9P/6HawvH2o2Ib/nJ8TS4vQ==
X-Google-Smtp-Source: AGHT+IF8qFOkXRjcLVqPSJs0Dcjy+XexfZt9JpoPqlbfN68UupareNNAKBdj08K5cz1GN8sYL8dyB/+6maviIRw0lVg=
X-Received: by 2002:a25:4256:0:b0:d0a:fa7f:2fbf with SMTP id
 p83-20020a254256000000b00d0afa7f2fbfmr7826923yba.48.1691415474298; Mon, 07
 Aug 2023 06:37:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
In-Reply-To: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 15:37:43 +0200
Message-ID: <CACRpkdafAWgt9A8km1zLZF9UawXkdqBOEVnMHiRjaF=2SeyhgA@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] Add binding header file for GPIO interrupt of
 Amlogic Meson-G12A
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_063755_506208_653BD37B 
X-CRM114-Status: GOOD (  11.00  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgODowMuKAr0FNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cgo+IEFmdGVyIGFkZGluZyB0aGlzIGJpbmRpbmcgaGVhZGVy
IGZpbGUsIHlvdSBjYW4gaW50dWl0aXZlbHkgZmluZAo+IHRoZSBpbnRlcnJ1cHQgbnVtYmVyIGNv
cnJlc3BvbmRpbmcgdG8gZWFjaCBHUElPLCBhbmQgYXBwbHkgaXQKPiBpbiB0aGUgZm9ybWF0IG9m
IElSUUlEX1hYWCB3aGVyZSBpdCBuZWVkcyB0byBiZSB1c2VkLgooLi4uKQoKPiBIdXFpYW5nIFFp
biAoMyk6Cj4gICBkdC1iaW5kaW5nczogaW50ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBoZWFkZXIg
ZmlsZSBmb3IgQW1sb2dpYwo+ICAgICBNZXNvbi1HMTJBIFNvQ3MKPiAgIHBpbmN0cmw6IFJlcGxh
Y2UgdGhlIElSUSBudW1iZXIgaW4gdGhlIGRyaXZlciB3aXRoIHRoZSBJUlFJRCBtYWNybwo+ICAg
ICBkZWZpbml0aW9uCj4gICBhcm02NDogZHRzOiBSZXBsYWNlIHRoZSBJUlEgbnVtYmVyIHdpdGgg
dGhlIElSUUlEIG1hY3JvIGRlZmluaXRpb24KCk5laWwgd3JvdGU6Cj4gV2hhdCdzIHRoZSBiZXN0
IHdheSB0byBhcHBseSB0aGlzIHBhdGNoc2V0ID8KCkkganVzdCBhcHBsaWVkIGFsbCB0aHJlZSB0
byB0aGUgcGluIGNvbnRyb2wgdHJlZS4KCkkgY291bGQgaGF2ZSBhcHBsaWVkIGp1c3QgdGhlIHR3
byBmaXJzdCBhbmQgdGhlbiBvZmZlcmVkIGFuCmltbXV0YWJsZSBicmFuY2guIEJ1dCBlaC4uLiB0
b28gbXVjaCB3b3JrIGZvciB0b28gbG93IHJpc2suCkJldHRlciB0byBqdXN0IGFwcGx5IGl0IGFu
ZCBob3BlIGFsbCB3b3JrcyBvdXQuIElmIGl0IGV4cGxvZGVzCkkganVzdCBiYWNrIG91dCBhbmQg
ZmlndXJlIHNvbWV0aGluZyBsaWtlIHRoZSBhYm92ZS4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
