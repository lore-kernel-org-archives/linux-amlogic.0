Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EDDEB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jun 2023 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0OuU3kQhmV61GF3aUF+RmYMXLORZKkyN5fdwoMQ/2w=; b=lV75dmjLnYoNyN
	BmzRavbT0a7l2+G0L8Qftsbk6zNQa3dLRJzI+OvNuOpPETZm0l7puYwHGIV+v+FAxdjg5UVIidoJ4
	9f1UkMSXP+2fqRQ8vf+qxw8N/fYWFyfiwBwHH5wUlfpKFkr9K8dLzFcAHrTPs7C0c/wK5Z6EaUfoL
	Db2qvNnPXiRxi9mBtmvJgIkoHCcwt327nKroCINE/a9rLab3s9f847P7UmNL09dsXzwGtHPaM6Piw
	1vPrnvmvYsVE4a53Mja8SnLsE0FCPHetl/ShfAUgWBhGtFkzrLfpseHfdnA71H8svmx2C8r+zPxeW
	ssNrcuB2lyeze9zUtQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKuL-009M9l-1w;
	Mon, 19 Jun 2023 19:51:25 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBKuI-009M8d-2C;
	Mon, 19 Jun 2023 19:51:24 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5186a157b85so5470704a12.0;
        Mon, 19 Jun 2023 12:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687204279; x=1689796279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd0Z4QXfggzwHtnXjPLZAClg5L7keAUm3VKoUQTaD/E=;
        b=EJ4G6ji/n65WTVFd+8fUKpKE/pPADTSbANE84/FVL/5xaqN9lrz6hUYxCruKjB00T3
         A+PzuCjKDLHT/NHQBzW77tyuTB/iOEdzUo5QQoHANdWUOMYd80KyJtTl8KnusjARFyRY
         P2Dq86RDh4y69k3YOc4/sWJMnCzw3f6PBs+45PAHWzERKRIuN0osGyfLtDbjMFYffkNL
         y16PhKmWZm42f2MUP9VOa+W2O3RPpB7FkwOFxbxbG2lw2CDrtIRT8xLrVvOWI4kv0nOf
         ag7kxQF7Tfqx9QJWbEq6cfwBXoU/ZfvRMu27Y9+ttAESU2F7kuB0gnH4TL1efzIPyEFL
         9SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687204279; x=1689796279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sd0Z4QXfggzwHtnXjPLZAClg5L7keAUm3VKoUQTaD/E=;
        b=QvOZnek0xBgyrNc7/z+qCAE72PQpQyMcnGwcHPb+CFwOGHYeTAAotpQ9NKSTgOKnpF
         rlVd1oWD7o9LxSuQrolLsj1g74UY3ZvWCSsEbJ4WYZld4lS8ZWDwkHoPnyfS8qyuBHc8
         2MuPy3cUaIyawbpcs7iLbJGZm3QhNBOcvjG2scWtm/YYhcBba/AgxtiRj/Jxzxr/KrJS
         GLbz2IwatTI3DlwatArF509M7nsRQd1jQX2Z6GhplfFJJGKdWDGn6CejuVw5b9M0OTro
         BfVXQGFdPSLnf3YbMax3RKRiT/G9pk/kT8TuiEiskX64TTBjDcwKDo3yL+L/lBWAlz07
         XLXw==
X-Gm-Message-State: AC+VfDwoyed/7Z3KDLrsKIVskjJtHpq9XtEyIZyxGJdKUkNjzyqQAuty
	PScLEfiCvlowpNr7Rp1tGBH8f4wy1M+BBRlJYHc=
X-Google-Smtp-Source: ACHHUZ63TBsrxqGLzHLhPqGvnsA2IbglzQC0C14yaOFsZ83BWmNwv/AKD9ZicJVSWO/8KUat6yXXiS0uTl+xZQU81/M=
X-Received: by 2002:a17:907:7faa:b0:988:2111:bb2d with SMTP id
 qk42-20020a1709077faa00b009882111bb2dmr7590179ejc.7.1687204279367; Mon, 19
 Jun 2023 12:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
In-Reply-To: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 19 Jun 2023 21:51:08 +0200
Message-ID: <CAFBinCAJ1E6JKmFTuaJwGpd_MBzHMZ0mMj-1AE3TNeB2_72nZA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Ziyang Huang <hzyitc@outlook.com>
Cc: ulf.hansson@linaro.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_125122_720109_4CB84DA9 
X-CRM114-Status: GOOD (  15.10  )
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

SGVsbG8sCgpmaXJzdCBvZiBhbGw6IHRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCEKCk9uIE1vbiwg
SnVuIDE5LCAyMDIzIGF0IDc6MzbigK9QTSBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29rLmNv
bT4gd3JvdGU6Cj4KPiBDb21taXQgNGJjMzFlZGViZGU1ICgibW1jOiBjb3JlOiBTZXQgSFMgY2xv
Y2sgc3BlZWQgYmVmb3JlIHNlbmRpbmcKPiBIUyBDTUQxMyIpIHNldCBIUyBjbG9jayAoNTJNSHop
IGJlZm9yZSBzd2l0Y2hpbmcgdG8gSFMgbW9kZS4gRm9yIHRoaXMKPiBmcmVxLCBGQ0xLX0RJVjUg
d2lsbCBiZSBzZWxlY3RlZCBhbmQgZGl2IHZhbHVlIGlzIDEwIChyZWcgdmFsdWUgaXMgOSkuCj4g
VGhlbiB3ZSBzZXQgcnhfY2xrX3BoYXNlIHRvIDExIG9yIDE1IHdoaWNoIGlzIG91dCBvZiByYW5n
ZSBhbmQgbWFrZQo+IGhhcmR3YXJlIGZyb3plbi4gQWZ0ZXIgd2Ugc2VuZCBjb21tYW5kIHJlcXVl
c3QsIG5vIGlycSB3aWxsIGJlCj4gaW50ZXJydXB0ZWQgYW5kIHRoZSBtbWMgZHJpdmVyIHdpbGwg
a2VlcCB0byB3YWl0IGZvciByZXF1ZXN0IGZpbmlzaGVkLAo+IGV2ZW4gZHVybmluZyByZWJvb3Rp
bmcuCkkgdGhpbmsgdGhpcyBpcyB0aGUgZXhhY3Qgc2FtZSBwcm9ibGVtIEkgcmVwb3J0ZWQgc29t
ZSBkYXlzIGFnbzogWzBdClVsZiBpcyBxdWVzdGlvbmluZyB3aGV0aGVyIHdlIHByb3Blcmx5IHN1
cHBvcnQgNTJNSHogY2xvY2tzIGNvcnJlY3RseSwKc28gSSB0aGluayB5b3UncmUgb250byBzb21l
dGhpbmchCgpTbyB0aGlzIGlzIGFuIGV4Y2VsbGVudCBmaW5kaW5nISBJIGNhbiBjb25maXJtIHRo
YXQgdXNpbmcgcnhfY2xrX3BoYXNlCm9mIDEgbWFrZXMgbXkgT2Ryb2lkLUMxIGVNTUMgd29yayBh
Z2FpbiA6LSkKCj4gU28gbGV0J3Mgc2V0IGEgY29tbW9uIHZhbHVlIC0gMSBqdXN0IGZvciBpbml0
aWFsaXphdGlvbi4gVGhlbiBsZXQKPiBtZXNvbl9teF9zZGhjX2V4ZWN1dGVfdHVuaW5nKCkgdG8g
ZmluZCB0aGUgYWNjdXJhdGUgdmFsdWUgZm9yIGRhdGEKPiB0cmFuc2Zlci4KQXMgZmFyIGFzIEkg
a25vdyB1bmNvbmRpdGlvbmFsbHkgdXNpbmcgdmFsdWUgMSBjYW4gbmVnYXRpdmVseSBhZmZlY3QK
b3RoZXIgZGV2aWNlcy4KSSdtIGFzc3VtaW5nIHRoYXQgeW91J3JlIHRlc3Rpbmcgb24gYW4gT2Ry
b2lkLUMxIG9yIHNpbWlsYXIgYm9hcmQgd2l0aApIUzIwMCBlTU1DOgpPbiB0aG9zZSBTb0MgKyBl
TU1DIGNvbWJpbmF0aW9ucyB3ZSBkbyBzdXBwb3J0LiBCdXQgb24gb3RoZXIgYm9hcmRzCihmb3Ig
ZXhhbXBsZSBNZXNvbjhiIEVDLTEwMCAvIEVuZGxlc3MgTWluaSkgdGhlcmUncyBubyBIUzIwMCBz
dXBwb3J0CmJlY2F1c2UgdGhlIGVNTUMgaXMgY29ubmVjdGVkIHdpdGggMy4zViBJTyBsaW5lcy4g
U28gdHVuaW5nIGlzIG5vdApleGVjdXRlZCB0aGVyZSAoaWYgSSByZWNhbGwgY29ycmVjdGx5KS4K
CldoYXQgZG8geW91IHRoaW5rIGFib3V0IGFkZGluZyBhIHNwZWNpYWwgY2FzZSBmb3IgdGhlIDUx
TUh6ICJhY3R1YWwKY2xvY2sgcmF0ZSIgYW5kIGFkZGluZyBhIGNvbW1lbnQgdGhhdCBpdCB3YXMg
Zm91bmQgYnkgbWFudWFsIHRlc3Rpbmc/CkZvciBzb21lIHJlYXNvbiAodGhhdCBJIGRvbid0IHVu
ZGVyc3RhbmQpIEFtbG9naWMncyB2ZW5kb3IgZHJpdmVyCm1heGVzIG91dCBhdCA0Ny4yMk1IeiAo
cHJlc3VtYWJseSBiZWNhdXNlIHRoZXkgbGltaXQgdGhlbXNlbHZlcyB0bwp1c2luZyBGQ0xLX0RJ
VjMgYXMgaW5wdXQgb25seSAtIGJ1dCBJIGRvbid0IGdldCB3aHkuLi4pLgoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvQ0FG
QmluQ0QwUlQwcC1qazg2VzBKdU1UM3Vmb2hSaDFScVdDY00zNURLWkpwdWMxMEhRQG1haWwuZ21h
aWwuY29tLwpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy9DQVBEeUtG
cFMtVXdpYVJQTXFTcFgwbU5QclM1cD15Snp1M2cwPXBHeUNrV0hTWXlxV2dAbWFpbC5nbWFpbC5j
b20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
