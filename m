Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE29EC28CF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SzGUZ3B22xkif9gUUd8ZGaiWHNFc0sLlDFS6Q8fEH2U=; b=azCSCeZ604RhZa
	ylYPQFMuwek11sNIYozgCzls8/mcAMHoTB8FpsYZ7WZ/iMYnD2YXwsIBBR3x5HBWFdhXqL4YSlibT
	O7C4rF/s/VECz74vKkCEyhMovkhbF7Bv3PNt3AxcAx2GpAbqbaKPGKSBkcC1wd2ySXh9ZGa4jjDSr
	VBhKPm1Tso2/GMnEKeY9IyhutiY/aIUpCFyS5BYUoGd66zCNlpbBrZYF/4ILpc6vHVOvT9d50Rtta
	yPKe6Rl68F8rvBUhkNuU6/X1lW3FxZOjye6frU8O5rbXp2YsJcdSfc8glBDI6ukv4DpADxz5dA8JX
	d8VyoYqq2W+mPK8YOoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCcUX-00ARgG-EE; Wed, 26 Jan 2022 07:13:17 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCcU5-00ARXA-Hd; Wed, 26 Jan 2022 07:12:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id c192so1637948wma.4;
 Tue, 25 Jan 2022 23:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=i+HVMxrypTyMaGZCN3z001LVFWdR0I2CYQt+CsmsXOc=;
 b=mNNb1LZUqPHra8cELYyxO5HimHGitkdix9YzKqSQ5kkzq5Kb8WczBTETAheDVvjP6g
 67csd1jcv0RTsStqqgRD6AoLOVGzFJiB6xtpaVf/nGI5thaW5/5HcobbAO60E6VsZ8Yy
 rcTTXE3zgU0CNH8wCnxgk/xjOcrTi3PA/S/2M3i6BtxP0OPm8duQAVTC0z7W9ewGVcRR
 LgsUAH9LZxvfGKvofGLu/OsHPMGQDWEnT3EUP+/pLWmQrh/VAlq+EE3ZW2TC6sR4DpQE
 6lt6kPst+WJEHTMZuhJxupsSLmgdzo8KAt7vefKfG3ok4xJS6TPDbWM+19iGxTcrUNsP
 opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=i+HVMxrypTyMaGZCN3z001LVFWdR0I2CYQt+CsmsXOc=;
 b=yKtCEZTbGujkbivkJ2VJs2gHqIQtAV21RN4FhPu4JP3O3x5QCl7ANnIj2Mt7B60/gl
 ++kDQ7iY47snLiU2HwbqtOObhqSAv3BvrhglO3lgFIPJklBtPgxQUUzOE9lija5XjC4t
 wpqBOx6WTPsWLviR+usl2SR64jJGa4jWTztAqs3vYdKGhBN61MlE4AutShVVfKPmoRBP
 5CB7KpH86rf2CXWPb+4oraFuWNOxw/UruHXGRYgWtSWnn3ahrnsL1YU7WAL+T9b4xJmZ
 NTpjTNzsICQALSIo4bl6nWDWINlsdt0MMpWlManmF1kIQatZkYOUNmomekxJeypB22+K
 UyAg==
X-Gm-Message-State: AOAM533ZjEQ/VjzdYNDJjU1nTUxeNSD8njqVTWNkWzmls4X0iQ+KAE1H
 docfIBtblVODbRMrxP63KYU=
X-Google-Smtp-Source: ABdhPJxfeZUAnN3Ct6WVyIovMDjWsCGrqeTETF2j03Acpcu+o5RVPZ9EUe1wmn1htFvuwv1pjb6l2A==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr6237694wmo.13.1643181166272; 
 Tue, 25 Jan 2022 23:12:46 -0800 (PST)
Received: from smtpclient.apple ([167.99.200.149])
 by smtp.gmail.com with ESMTPSA id z1sm2374825wma.20.2022.01.25.23.12.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jan 2022 23:12:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/3] arm64: dts: meson-gx: add ATF BL32 reserved-memory
 region
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <a279c365-0615-1c7f-5596-dec9ad1c8229@lexina.in>
Date: Wed, 26 Jan 2022 11:12:42 +0400
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <343C247D-4F10-4E88-B971-5A1F41A2C892@gmail.com>
References: <20220126044954.19069-1-christianshewitt@gmail.com>
 <20220126044954.19069-2-christianshewitt@gmail.com>
 <a279c365-0615-1c7f-5596-dec9ad1c8229@lexina.in>
To: Vyacheslav <adeep@lexina.in>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_231249_630898_1D264513 
X-CRM114-Status: GOOD (  13.87  )
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

Cj4gT24gMjYgSmFuIDIwMjIsIGF0IDk6MzUgYW0sIFZ5YWNoZXNsYXYgPGFkZWVwQGxleGluYS5p
bj4gd3JvdGU6Cj4gCj4gSGkhCj4gCj4gMjYuMDEuMjAyMiAwNzo0OSwgQ2hyaXN0aWFuIEhld2l0
dCB3cm90ZToKPj4gQWRkIGFuIGFkZGl0aW9uYWwgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbiBmb3Ig
dGhlIEJMMzIgdHJ1c3RlZCBmaXJtd2FyZQo+PiBwcmVzZW50IGluIG1hbnkgZGV2aWNlcyB0aGF0
IGJvb3QgZnJvbSBBbWxvZ2ljIHZlbmRvciB1LWJvb3QuCj4+IFN1Z2dlc3RlZC1ieTogTWF0ZXVz
eiBLcnphayA8a3N6YXF1aXR0b0BnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+PiAtLS0KPj4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpIHwgNiArKysrKysKPj4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21l
c29uLWd4LmR0c2kKPj4gaW5kZXggNmI0NTdiMmMzMGE0Li5hYTE0ZWEwMTdhNjEgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCj4+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neC5kdHNpCj4+IEBAIC00OSw2ICs0
OSwxMiBAQAo+PiAgCQkJbm8tbWFwOwo+PiAgCQl9Owo+PiAgKwkJLyogMzIgTWlCIHJlc2VydmVk
IGZvciBBUk0gVHJ1c3RlZCBGaXJtd2FyZSAoQkwzMikgKi8KPj4gKwkJc2VjbW9uX3Jlc2VydmVk
X2JsMzI6IHNlY21vbkA1MzAwMDAwIHsKPj4gKwkJCXJlZyA9IDwweDAgMHgwNTMwMDAwMCAweDAg
MHgyMDAwMDAwPjsKPj4gKwkJCW5vLW1hcDsKPj4gKwkJfTsKPj4gKwo+IEhvdyBkbyBJIGNoZWNr
IGlmIHdlIG5lZWQgYSBzaW1pbGFyIHBhdGNoIGZvciBheGcgYm9hcmRzPwoKQXJlIHRoZXkgYm9v
dGluZyB1c2luZyBBbWxvZ2ljICh2ZW5kb3IpIHUtYm9vdCBzb3VyY2VzIHRoYXQKaW5jbHVkZSBi
bDMyLmltZyBpbiB0aGUgRklQIHNpZ25pbmcgcmVjaXBlPwoKSWYgYm9vdGluZyBmcm9tIHVwc3Ry
ZWFtIHUtYm9vdCwgbGlrZSBKZXRIb21lIGJvYXJkcywgaXTigJlzCm5vdGhpbmcgdG8gd29ycnkg
YWJvdXQuCgpDaHJpc3RpYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
